package kr.or.ddit.service.owner.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsEmployeeMapper;
import kr.or.ddit.service.owner.IFrcsEmployeeService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;
import kr.or.ddit.vo.owner.FrcsInquiryVO;

@Service
public class FrcsEmployeeServiceImpl implements IFrcsEmployeeService {
	
	@Inject
	private FrcsEmployeeMapper mapper;

	@Override
	public List<FrcsEmployeeVO> frcsEmpList(String frcsId) {
		return mapper.frcsEmpList(frcsId);
	}

	@Override
	public ServiceResult frcsEmpInsert(HttpServletRequest req, FrcsEmployeeVO frcsEmpVO) {
		ServiceResult result = null;
		
		int status = mapper.frcsEmpInsert(frcsEmpVO);
		if(status > 0) {
			try {
				if(frcsEmpVO.getBoFile1() != null && !frcsEmpVO.getBoFile1().getOriginalFilename().equals("")) {
					empFileUpload(frcsEmpVO.getBoFile1(), 1, frcsEmpVO.getFrcsEmpCd(), status, req);
				}
				if(frcsEmpVO.getBoFile2() != null && !frcsEmpVO.getBoFile2().getOriginalFilename().equals("")) {
					empFileUpload(frcsEmpVO.getBoFile2(), 2, frcsEmpVO.getFrcsEmpCd(), status, req);
				}
				if(frcsEmpVO.getBoFile3() != null && !frcsEmpVO.getBoFile3().getOriginalFilename().equals("")) {
					empFileUpload(frcsEmpVO.getBoFile3(), 3, frcsEmpVO.getFrcsEmpCd(), status, req);
				}
				if(frcsEmpVO.getBoFile4() != null && !frcsEmpVO.getBoFile4().getOriginalFilename().equals("")) {
					empFileUpload(frcsEmpVO.getBoFile4(), 4, frcsEmpVO.getFrcsEmpCd(), status, req);
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
	
//	private void empProfileUpload(
//			int status, HttpServletRequest req, FrcsEmployeeVO frcsEmpVO,
//			MultipartFile frcsEmpProfileimg) {
//		
//		String uploadPath = req.getServletContext().getRealPath("/resources/upload/file/");
//		File file = new File(uploadPath);
//		if(!file.exists()) {
//			file.mkdirs();
//		}
//		
//		String proFileImg = ""; // 회원정보에 추가될 프로필 이미지 경로
//		try {
//			MultipartFile profileImgFile = frcsEmpVO.getImgFile();
//			
//			if(profileImgFile.getOriginalFilename() != null &&
//					!profileImgFile.getOriginalFilename().equals("")) {
//				String fileName = UUID.randomUUID().toString(); // UUID 파일명 생성
//				fileName += "_" + profileImgFile.getOriginalFilename(); // UUID_원본파일명
//				uploadPath += "/" + fileName; // 최종 업로드하기 위한 파일 경로
//				profileImgFile.transferTo(new File(uploadPath)); // 해당 위치 경로에 파일 복사
//				proFileImg = "/resources/upload/file/" + fileName; // 파일 복사가 일어난 파일의 위치로 접근하기 위한 URI설정
//			} 
//			frcsEmpVO.setFrcsEmpProfileimg(frcsEmpProfileimg);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	private void empFileUpload(
			MultipartFile file, int order, 
			String frcsEmpCd, int status, 
			HttpServletRequest req) throws IllegalStateException, IOException {
		
		String savePath = "/resources/upload/file/";
		
		AttachVO attachVO = new AttachVO();
		String saveName = UUID.randomUUID().toString();	//	UUID의 랜덤 파일명 생성
		saveName = saveName + "_" + file.getOriginalFilename().replaceAll(" ", "_"); // 공백일때 _로 전부 바꿔준다.
		
		String saveLocate = req.getServletContext().getRealPath(savePath + frcsEmpCd);
		File newfile = new File(saveLocate);
		if(!newfile.exists()) {	// 업로드를 하기 위한 폴더 구조가 존재하지 않을 때
			newfile.mkdirs();		// 폴더 생성
		}
		
		// /resources/notice/15/UUID_원본파일명
		saveLocate += "/" + saveName;
		attachVO.setFileNo(order);
		attachVO.setAttachOrgname(file.getOriginalFilename());
		attachVO.setAttachMime(file.getContentType());
		attachVO.setAttachSize(file.getSize());
		attachVO.setTablePk("emp"+frcsEmpCd);// 게시글 번호 설정
		attachVO.setAttachSavename(savePath + frcsEmpCd + "/" + saveName); 		// 파일 업로드 경로 설정
		mapper.insertEmpFile(attachVO);	// 게시글 파일 데이터 추가
		
		File saveFile = new File(saveLocate);
		file.transferTo(saveFile);	// 파일 복사
	}

	@Override
	public ServiceResult empDelete(HttpServletRequest req, String frcsEmpCd) {
		ServiceResult result = null;
		
		// 파일데이터 삭제 준비
		// attachVO.setTablePk("emp"+frcsEmpCd);// 테이블 pk설정
		FrcsEmployeeVO frcsEmpVO = mapper.selectEmp(frcsEmpCd); // 해당 문의 가져오기

		String tablePk = "emp"+frcsEmpCd;
		mapper.deleteEmpFileByEmpCd(tablePk); // 문의번호에 해당하는 파일 데이터 삭제
		
		// 직원 삭제
		int status = mapper.empDelete(frcsEmpCd);
		if(status > 0) {
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
	public ServiceResult empUpdate(HttpServletRequest req, FrcsEmployeeVO frcsEmpVO) {
		ServiceResult result = null;
		int status = mapper.empUpdate(frcsEmpVO);
		if(status > 0) {
			try {
				if(frcsEmpVO.getBoFile1() != null && !frcsEmpVO.getBoFile1().getOriginalFilename().equals("")) {
					mapper.deleteEmpFileCustom("emp"+frcsEmpVO.getFrcsEmpCd(), 1); // 파일번호에 해당하는 파일 삭제
					empFileUpload(frcsEmpVO.getBoFile1(), 1, frcsEmpVO.getFrcsEmpCd(), status, req);
				}
				if(frcsEmpVO.getBoFile2() != null && !frcsEmpVO.getBoFile2().getOriginalFilename().equals("")) {
					mapper.deleteEmpFileCustom("emp"+frcsEmpVO.getFrcsEmpCd(), 2); // 파일번호에 해당하는 파일 삭제
					empFileUpload(frcsEmpVO.getBoFile2(), 2, frcsEmpVO.getFrcsEmpCd(), status, req);
				}
				if(frcsEmpVO.getBoFile3() != null && !frcsEmpVO.getBoFile3().getOriginalFilename().equals("")) {
					mapper.deleteEmpFileCustom("emp"+frcsEmpVO.getFrcsEmpCd(), 3); // 파일번호에 해당하는 파일 삭제
					empFileUpload(frcsEmpVO.getBoFile3(), 3, frcsEmpVO.getFrcsEmpCd(), status, req);
				}
				if(frcsEmpVO.getBoFile4() != null && !frcsEmpVO.getBoFile4().getOriginalFilename().equals("")) {
					mapper.deleteEmpFileCustom("emp"+frcsEmpVO.getFrcsEmpCd(), 4); // 파일번호에 해당하는 파일 삭제
					empFileUpload(frcsEmpVO.getBoFile4(), 4, frcsEmpVO.getFrcsEmpCd(), status, req);
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
	public AttachVO selectFileInfo(int attachNo) {
		return mapper.selectFileInfo(attachNo);
	}

	@Override
	public FrcsEmployeeVO selectEmp(String frcsId) {
		return mapper.selectEmp(frcsId);
	}

	@Override
	public List<FrcsEmployeeVO> frcsEmpFileList(String frcsId) {
		return mapper.frcsEmpFileList(frcsId);
	}
	
}
