package kr.or.ddit.service.owner.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsInquiryMapper;
import kr.or.ddit.service.owner.IFrcsInquiryService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsInquiryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Service
public class FrcsInquiryServiceImpl implements IFrcsInquiryService {

	@Inject
	private FrcsInquiryMapper mapper;
	
	@Override
	public List<FrcsInquiryVO> frcsInqList(String frcsId) {
		return mapper.frcsInqList(frcsId);
	}

	@Override
	public ServiceResult inqInsert(HttpServletRequest req, FrcsInquiryVO frcsInqVO) {
		ServiceResult result = null;
		int status = mapper.inqInsert(frcsInqVO);
		if(status > 0) {
			List<AttachVO> inqFileList = frcsInqVO.getInqFileList();
			try {
				//  파일 업로드 처리 함수
				// 공통적인 소스가 반복되므로 함수로 모듈화를 진행하여 사용한다.
				// 여러 컨트롤러 메소드에서 사용될 수 있으므로 
				inqFileUpload(inqFileList, frcsInqVO.getInqryNo(), status, req);
			} catch (IOException e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	
	// inqryNo와 일치하는 파일명이 이 메소드에 들어있음
	private void inqFileUpload(
			List<AttachVO> inqFileList,	String inqryNo, 
			int status,	HttpServletRequest req) throws IllegalStateException, IOException {
		
		String savePath = "/resources/upload/file/";
		
		int count = 1;	// 넘겨받은 파일의 갯수가 카운팅 될 변수
		// 넘겨받은 파일 데이터가 존재할 때
		if(inqFileList != null && inqFileList.size() > 0) {
			for(AttachVO attachVO : inqFileList) {
				// 파일 업로드 처리 시작
				String saveName = UUID.randomUUID().toString();	//	UUID의 랜덤 파일명 생성
				saveName = saveName + "_" + attachVO.getAttachOrgname().replaceAll(" ", "_"); // 공백일때 _로 전부 바꿔준다.
				
				String saveLocate = req.getServletContext().getRealPath(savePath + inqryNo);
				File file = new File(saveLocate);
				if(!file.exists()) {	// 업로드를 하기 위한 폴더 구조가 존재하지 않을 때
					file.mkdirs();		// 폴더 생성
				}
				
				// /resources/notice/15/UUID_원본파일명
				saveLocate += "/" + saveName;
				attachVO.setFileNo(count++);
				attachVO.setTablePk(inqryNo+"");// 게시글 번호 설정
				attachVO.setAttachSavename(saveLocate); 		// 파일 업로드 경로 설정
				mapper.insertInqFile(attachVO);	// 게시글 파일 데이터 추가
				
				File saveFile = new File(saveLocate);
				attachVO.getItem().transferTo(saveFile);	// 파일 복사
			}
		}	
		
	}

	@Override
	public FrcsInquiryVO frcsInqDetail(String inqryNo) {
//		return mapper.frcsInqDetail(inqryNo);
		return mapper.selectInq(inqryNo);
	}

	@Override
	public ServiceResult frcsInqUpdate(HttpServletRequest req, FrcsInquiryVO frcsInquiryVO) {
		ServiceResult result = null;
		int status = mapper.frcsInqUpdate(frcsInquiryVO);
		if(status > 0) {
			List<AttachVO> frcsInqList = frcsInquiryVO.getInqFileList();
			try {
				
				inqFileUpload(frcsInqList, frcsInquiryVO.getInqryNo(), status, req);
				
				// 기존에 등록되어 있는 파일 목록들 중, 수정하기 위해서 x버튼을 눌러 삭제 처리로 넘겨준 파일 번호들
				Integer[] delinqNo = frcsInquiryVO.getDelInqNo();
				if(delinqNo != null) {
					for(int i = 0; i < delinqNo.length; i++) {
						AttachVO attachVO = mapper.selectInqFile(delinqNo[i]);
						mapper.deleteInqFile(delinqNo[i]); // 파일번호에 해당하는 파일 삭제
						File file = new File(attachVO.getAttachSavename());
						file.delete(); // 기존 파일 업로드 경로에 파일 삭제
					}
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
	public ServiceResult frcsInqDelete(HttpServletRequest req, String inqryNo) {
		ServiceResult result = null;
		// 파일데이터 삭제 준비
		FrcsInquiryVO frcsInqVO = mapper.selectInq(inqryNo); // 해당 문의 가져오기
		mapper.deleteInqFileByInqNo(inqryNo); // 문의번호에 해당하는 파일 데이터 삭제
		
		int status = mapper.frcsInqDelete(inqryNo);
		if(status > 0) {
			List<AttachVO> inqFileList = frcsInqVO.getInqFileList(); // 파일목록가져오기
			try {
				if(inqFileList != null && inqFileList.size() > 0) {
					// [0] = D:\99.Class\02.SPRING2\workspace_spring2\.metadata\...\
					// [1] = a2e2ygadd-a2d3da3f-a23fa3fa-fa3afa3f_원본파일명.jpg
					String[] filePath = inqFileList.get(0).getAttachSavename().split("/");
					
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
	public int selectInqCount(OwnerPaginationInfoVO<FrcsInquiryVO> pagingVO) {
		return mapper.selectInqCount(pagingVO);
	}

	@Override
	public List<FrcsInquiryVO> selectInqList(OwnerPaginationInfoVO<FrcsInquiryVO> pagingVO) {
		return mapper.selectInqList(pagingVO);
	}

	@Override
	public AttachVO selectFileInfo(int attachNo) {
		return mapper.selectFileInfo(attachNo);
	}

	@Override
	public FrcsInquiryVO selectInq(String inqryNo) {
		return mapper.selectInq(inqryNo);
	}



}
