package kr.or.ddit.service.head.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.NoticeBoardMapper;
import kr.or.ddit.service.head.INoticeBoardService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadBoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;

@Service
public class NoticeBoardServiceImpl implements INoticeBoardService{
		
	@Inject
	private NoticeBoardMapper noticeboardMapper;

	@Override
	public int selectBoardCount(PaginationInfoVO<HeadBoardVO> pagingVO) {
		return noticeboardMapper.selectBoardCount(pagingVO);
	}

	@Override
	public List<HeadBoardVO> selectBoardList(PaginationInfoVO<HeadBoardVO> pagingVO) {
		return noticeboardMapper.selectBoardList(pagingVO);
	}



	@Override
	public ServiceResult insertBoard(HttpServletRequest req, HeadBoardVO headBoardVO) {
		ServiceResult result = null;
		int status = noticeboardMapper.insertBoard(headBoardVO);
		if(status > 0) {
			List<AttachVO> noticeFileList = headBoardVO.getNoticeFileList();
			try {
				// 공지사항 파일 업로드 처리 함수
				// 공통적인 소스가 반복되므로 함수로 모듈화를 진행하여 사용한다.
				// 여러 컨트롤러 메소드에서 사용될 수 있으므로 
				noticeFileUpload(noticeFileList, headBoardVO.getBoardNo(), status, req);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public HeadBoardVO selectBoard(int boardNo) {
		noticeboardMapper.incrementHit(boardNo);
		return noticeboardMapper.selectBoard(boardNo);
	}

	@Override
	public ServiceResult deleteBoard(HttpServletRequest req, int boardNo) {
		ServiceResult result = null;
		//	공지사항 파일 데이터를 삭제하기 위한 준비
		HeadBoardVO headBoardVO = noticeboardMapper.selectBoard(boardNo);	// 게시글 번호에 해당하는 공지사항 게시글 정보 가져오기	
		noticeboardMapper.deleteNoticeFileByBoNo(boardNo);			// 게시글 번호에 해당하는 파일 데이터 삭제
		
		int status = noticeboardMapper.deleteBoard(boardNo);
		if(status > 0) {
			List<AttachVO> noticeFileList = headBoardVO.getNoticeFileList();	// 공지사항 게시글 정보에서 파일 목록 가져오기
			try {
				if(noticeFileList != null && noticeFileList.size() > 0) {
					// [0] = D:\99.Class\02.SPRING2\workspace_spring2\.metadata\...\
					// [1] = a2e2ygadd-a2d3da3f-a23fa3fa-fa3afa3f_원본파일명.jpg
					String[] filePath = noticeFileList.get(0).getAttachSavename().split("/");
					
					String path = filePath[0];
					deleteFolder(req, path);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateBoard(HttpServletRequest req, HeadBoardVO headBoardVO) {
		ServiceResult result = null;
		int status = noticeboardMapper.updateBoard(headBoardVO);
		if(status > 0) {
			List<AttachVO> noticeFileList = headBoardVO.getNoticeFileList();
			try {
				// 공지사항 파일 업로드
				noticeFileUpload(noticeFileList, headBoardVO.getBoardNo(), status, req);
				
				// 기존에 등록되어 있는 파일 목록들 중, 수정하기 위해서 x버튼을 눌러 삭제 처리로 넘겨준 파일 번호들
				Integer[] delNoticeNo = headBoardVO.getDelNoticeNo();
				if(delNoticeNo != null) {
					for(int i = 0; i < delNoticeNo.length; i++) {
						AttachVO attachVO = noticeboardMapper.selectNoticeFile(delNoticeNo[i]);
						noticeboardMapper.deleteNoticeFile(delNoticeNo[i]);	// 파일번호에 해당하는 파일 데이터를 삭제
						File file = new File(attachVO.getAttachSavename());
						file.delete();	// 기존 파일이 업로드 되어 있던 경로에 파일 삭제
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
		
	}
	
	// 내가 작성한 게시글번호만 알면 여러가지 파일들중에 찾을일 없이
		// boNo와 일치하는 파일명이 이 메소드안에 들어있다
		private void noticeFileUpload(
				List<AttachVO> noticeFileList,
				int boardNo, int status, HttpServletRequest req) throws IllegalStateException, IOException {
			// 공지사항 게시판에서 등록된 파일은 기본 '/resources/notice/' 경로로 설정
			String savePath = "/resources/upload/file/";
//			String savePath = "D:\\99.JSP_SPRING\\02.Spring2\\workspace_spring2\\Elemental\\src\\main\\webapp\\resources\\upload\\file";
//			String savePath = "\\\\192.168.144.41\\ddit404\\finalproject\\Elemental\\resources\\upload\\file";
			
			int count = 1;	// 넘겨받은 파일의 갯수가 카운팅 될 변수
			// 넘겨받은 파일 데이터가 존재할 때
			if(noticeFileList != null && noticeFileList.size() > 0) {
				for(AttachVO attachVO : noticeFileList) {
					// 파일 업로드 처리 시작
					String saveName = UUID.randomUUID().toString();	//	UUID의 랜덤 파일명 생성
					saveName = saveName + "_" + attachVO.getAttachOrgname().replaceAll(" ", "_"); // 공백일때 _로 전부 바꿔준다.
//					String endFileName = noticeFileVO.getFileName().split("\\.")[1];	// 디버깅 및 확장자 추출 참고
					
					// .../resources/notice/15 경로
					String saveLocate = req.getServletContext().getRealPath(savePath + boardNo);
//					String saveLocate = savePath + "\\" + boardNo;
					File file = new File(saveLocate);
					if(!file.exists()) {	// 업로드를 하기 위한 폴더 구조가 존재하지 않을 때
						file.mkdirs();		// 폴더 생성
					}
					
					// /resources/notice/15/UUID_원본파일명
					saveLocate += "/" + saveName;
					attachVO.setFileNo(count++);
					attachVO.setTablePk(boardNo+"");// 게시글 번호 설정
					attachVO.setAttachSavename(saveLocate); 		// 파일 업로드 경로 설정
					noticeboardMapper.insertNoticeFile(attachVO);	// 공지사항 게시글 파일 데이터 추가
					
					File saveFile = new File(saveLocate);
					attachVO.getItem().transferTo(saveFile);	// 파일 복사
				}
			}
		}

		private void deleteFolder(HttpServletRequest req, String path) {
			// UUID_원본파일명 전 폴더경로를 folder 파일객체로 잡아준다.
			File folder = new File(path);
			
			try {
				if(folder.exists()) {	//	경로가 존재한다면
					File[] folderList = folder.listFiles(); // 폴더 안에 있는 파일들의 목록을 가져온다.
					
					for(int i = 0; i < folderList.length; i++) {
						if(folderList[i].isFile()) {	// 폴더안의 있는 파일이 파일일때
							folderList[i].delete(); // 폴더 안에 파일을 차례대로 삭제
						}else {
							// 폴더안의 있는 파일이 폴더일때 재귀함수 호출(폴더안으로 들어가서 다시 이행)
							deleteFolder(req, folderList[i].getPath());
						}
					}
					folder.delete();	// 폴더 삭제
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

		@Override
		public AttachVO selectFileInfo(int attachNo) {
			return noticeboardMapper.selectFileInfo(attachNo);
		}


}
