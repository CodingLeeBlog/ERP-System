package kr.or.ddit.service.owner.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsOfficialDocMapper;
import kr.or.ddit.service.owner.IFrcsOfficialDocService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsInquiryVO;
import kr.or.ddit.vo.owner.FrcsOfficialDocVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Service
public class FrcsOfficialDocServiceImpl implements IFrcsOfficialDocService {

	@Inject
	private FrcsOfficialDocMapper mapper;
	
	@Override
	public int selectOfldcCount(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO) {
		return mapper.selectOfldcCount(pagingVO);
	}

	@Override
	public List<FrcsOfficialDocVO> selectOfldcList(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO) {
		return mapper.selectOfldcList(pagingVO);
	}

	@Override
	public ServiceResult ofldcInsert(HttpServletRequest req, FrcsOfficialDocVO frcsOfldcVO, AlarmVO alarmVO) {
		ServiceResult result = null;
		int status = mapper.ofldcInsert(frcsOfldcVO);
		if(status > 0) {
			List<AttachVO> ofldcFileList = frcsOfldcVO.getOfldcFileList();
			
			try {
				//  파일 업로드 처리 함수
				ofldcFileUpload(ofldcFileList, frcsOfldcVO.getFrcsOfldcNo(), status, req);
			} catch (IOException e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
			
			// 알람데이터 넣기 
			String frcsId = frcsOfldcVO.getFrcsOfldcSndpty(); //답변자의 가맹점 코드
			String frcsOfldcNo = frcsOfldcVO.getFrcsOfldcNo(); //공문 번호 
			//1) FROM
			String memIdfrcs = this.mapper.getMemFrcs(frcsId); //가맹점 코드를 mem_Id로 만들기 위함
			alarmVO.setMemId(memIdfrcs);
			//2) WHAT
			alarmVO.setTblName("FRCS_OFFICIALDOCUMENT");
			alarmVO.setTblNo(frcsOfldcNo+"");
			//3) TO
			String receiveMemId = this.mapper.getReceiveMemId(frcsOfldcNo);
			alarmVO.setReceiveMemId(receiveMemId);
			// 알람데이터 넣기 
			mapper.insertAlarm(alarmVO);
			
			
			
			
			
			
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	private void ofldcFileUpload(
			List<AttachVO> ofldcFileList, String frcsOfldcNo, 
			int status, HttpServletRequest req) throws IllegalStateException, IOException {
		String savePath = "/resources/upload/file/";
		
		int count = 1;	// 넘겨받은 파일의 갯수가 카운팅 될 변수
		// 넘겨받은 파일 데이터가 존재할 때
		if(ofldcFileList != null && ofldcFileList.size() > 0) {
			for(AttachVO attachVO : ofldcFileList) {
				// 파일 업로드 처리 시작
				String saveName = UUID.randomUUID().toString();	//	UUID의 랜덤 파일명 생성
				saveName = saveName + "_" + attachVO.getAttachOrgname().replaceAll(" ", "_"); // 공백일때 _로 전부 바꿔준다.
				
				String saveLocate = req.getServletContext().getRealPath(savePath + frcsOfldcNo);
				File file = new File(saveLocate);
				if(!file.exists()) {	// 업로드를 하기 위한 폴더 구조가 존재하지 않을 때
					file.mkdirs();		// 폴더 생성
				}
				
				// /resources/notice/15/UUID_원본파일명
				saveLocate += "/" + saveName;
				attachVO.setFileNo(count++);
				attachVO.setTablePk("ofldc"+frcsOfldcNo);// 게시글 번호 설정
				attachVO.setAttachSavename(saveLocate); 		// 파일 업로드 경로 설정
				mapper.insertOfldcFile(attachVO);	// 게시글 파일 데이터 추가
				
				File saveFile = new File(saveLocate);
				attachVO.getItem().transferTo(saveFile);	// 파일 복사
			}
		}
	}

	@Override
	public FrcsOfficialDocVO selectOfldc(String frcsOfldcNo) {
		return mapper.selectOfldc(frcsOfldcNo);
	}

	@Override
	public ServiceResult frcsOfldcDelete(HttpServletRequest req, String frcsOfldcNo) {
		ServiceResult result = null;
		// 파일데이터 삭제 준비
		FrcsOfficialDocVO frcsOfldcVO = mapper.selectOfldc(frcsOfldcNo); // 해당 문의 가져오기
		mapper.deleteOfldcFileByfrcsOfldcNo(frcsOfldcNo); // 문의번호에 해당하는 파일 데이터 삭제
		
		int status = mapper.frcsOfldcDelete(frcsOfldcNo);
		if(status > 0) {
			List<AttachVO> ofldcFileList = frcsOfldcVO.getOfldcFileList(); // 파일목록가져오기
			try {
				if(ofldcFileList != null && ofldcFileList.size() > 0) {
					// [0] = D:\99.Class\02.SPRING2\workspace_spring2\.metadata\...\
					// [1] = a2e2ygadd-a2d3da3f-a23fa3fa-fa3afa3f_원본파일명.jpg
					String[] filePath = ofldcFileList.get(0).getAttachSavename().split("/");
					
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
	public List<FrcsOfficialDocVO> selectHdList(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO) {
		return mapper.selectHdList(pagingVO);
	}

	@Override
	public AttachVO selectFileInfo(int attachNo) {
		return mapper.selectFileInfo(attachNo);
	}


}
