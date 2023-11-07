package kr.or.ddit.service.head.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.OfficeLetterMapper;
import kr.or.ddit.service.head.IOfficeService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;

@Service
public class OfficeServiceImpl implements IOfficeService {

	@Inject
	private OfficeLetterMapper officeLetterMapper;
	
	@Override
	public List<OfficeLetterVO> selectLetterList(HeadPaginationInfoVO<OfficeLetterVO> pagingVO) {
		return officeLetterMapper.selectLetterList(pagingVO);
	}

	@Override
	public int selectLetterCount(HeadPaginationInfoVO<OfficeLetterVO> pagingVO) {
		return officeLetterMapper.selectLetterCount(pagingVO);
	}

	@Override
	public List<FranchiseVO> getFrcsName() {
		return officeLetterMapper.getFrcsName();
	}

	@Override
	public void officeLetterRegister(HttpServletRequest req, OfficeLetterVO officeLetterVO) {
		officeLetterMapper.officeLetterRegister(officeLetterVO);
		
	    List<AttachVO> officeLetterFileList = officeLetterVO.getOfficeLetterFileList(); // AttachVO 리스트 가져오기
	    
	    String savePath = "/resources/upload/file/";
	    
	    int count = 1;
	    
	    if (officeLetterFileList != null && !officeLetterFileList.isEmpty()) {
	    	
	    	String saveLocate = req.getServletContext().getRealPath(savePath);
	    	File fileSaveLocate = new File(saveLocate);
	    	if(!fileSaveLocate.exists()) {
	    		fileSaveLocate.mkdirs();
	    	}
	    	
	        for (AttachVO attachVO : officeLetterFileList) {
	            // 파일 업로드 처리 시작
	            String saveName = UUID.randomUUID().toString(); // UUID의 랜덤 파일명 생성
	            saveName = saveName + "_" + attachVO.getAttachOrgname().replaceAll(" ", "_"); // 공백일 때 _로 전부 바꿔준다.
	            
	            attachVO.setTablePk(String.valueOf(officeLetterVO.getHdLtno()));
	            attachVO.setFileNo(count++);
	            attachVO.setAttachSavename(savePath + saveName); // 파일명 설정

	            File realUploadFile = new File(fileSaveLocate + "/" + saveName);
	            try {
					attachVO.getItem().transferTo(realUploadFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	            
	            officeLetterMapper.officeLetterAttachRegister(attachVO);
	        }
	    }
	}

	@Override
	public void officeLetterDelete(int hdLtno) {
		officeLetterMapper.officeLetterDelete(hdLtno);
		
	}

	@Override
	public void officeLetterUpdate(List<OfficeLetterVO> requestBody) {
		for(int i = 0; i<requestBody.size(); i++) {
			String hdLtreciever = requestBody.get(i).getHdLtreciever();
			int hdLtno = requestBody.get(i).getHdLtno();
			
			OfficeLetterVO officeLetterVO = new OfficeLetterVO();
			officeLetterVO.setHdLtno(hdLtno);
			officeLetterVO.setHdLtreciever(hdLtreciever);
			officeLetterMapper.officeLetterUpdate(officeLetterVO);
		}
	}
}	
