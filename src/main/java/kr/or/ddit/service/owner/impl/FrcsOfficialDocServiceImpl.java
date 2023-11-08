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
import kr.or.ddit.vo.AttachVO;
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
	public ServiceResult ofldcInsert(HttpServletRequest req, FrcsOfficialDocVO frcsOfldcVO) {
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
				attachVO.setTablePk(frcsOfldcNo+"");// 게시글 번호 설정
				attachVO.setAttachSavename(saveLocate); 		// 파일 업로드 경로 설정
				mapper.insertOfldcFile(attachVO);	// 게시글 파일 데이터 추가
				
				File saveFile = new File(saveLocate);
				attachVO.getItem().transferTo(saveFile);	// 파일 복사
			}
		}
	}

}
