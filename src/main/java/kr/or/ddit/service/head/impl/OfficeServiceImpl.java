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
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadLtDetailVO;
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
	public List<FranchiseVO> getseFrcsName() {
		return officeLetterMapper.getseFrcsName();
	}
	
	@Override
	public List<FranchiseVO> getdjFrcsName() {
		return officeLetterMapper.getdjFrcsName();
	}

	@Override
	public List<FranchiseVO> getbsFrcsName() {
		return officeLetterMapper.getbsFrcsName();
	}
	
	@Override
	public List<FranchiseVO> getdgFrcsName() {
		return officeLetterMapper.getdgFrcsName();
	}
	
	@Override
	public List<FranchiseVO> getgjFrcsName() {
		return officeLetterMapper.getgjFrcsName();
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
	    // 먼저 자식 레코드를 삭제
	    officeLetterMapper.deleteChildRecords(hdLtno);

	    // 그 후 부모 레코드를 삭제
	    officeLetterMapper.officeLetterDelete(hdLtno);
	}

	
	/**
	 * 공문 발송시 공문마다 알림 등록 서비스 로직
	 */
	@Override
	public void officeLtDetailRegister(List<HeadLtDetailVO> requestBody, AlarmVO alarmVO) {
	    for (int i = 0; i < requestBody.size(); i++) {
	        String hdLtreciever = requestBody.get(i).getHdLtreciever();
	        int hdLtno = requestBody.get(i).getHdLtno();
	        
	        String memId = requestBody.get(i).getAdmin();
	        String receiveMemId = requestBody.get(i).getMemId();
	        String tblNo = String.valueOf(hdLtno);

	        HeadLtDetailVO headLtDetailVO = new HeadLtDetailVO();
	        headLtDetailVO.setHdLtno(hdLtno);
	        headLtDetailVO.setHdLtreciever(hdLtreciever);

	        // 1. head_lt_detail 테이블에 데이터 삽입
	        officeLetterMapper.officeLtDetailRegister(headLtDetailVO);

	        // 2. head_letter 테이블의 hd_ltstate를 '완료'로 업데이트
	        officeLetterMapper.updateOfficeLetterState(hdLtno);
	        
	        // 3. 공문 발송 완료시 선택한 가맹점주에게 알림 발송
	        alarmVO.setMemId(memId);
	        alarmVO.setReceiveMemId(receiveMemId);
	        alarmVO.setTblName("HEAD_LT_DETAIL");
	        alarmVO.setTblNo(tblNo);
	        
	        officeLetterMapper.insertAlarm(alarmVO);
	    }
	}


	@Override
	public OfficeLetterVO officeLetterDetail(OfficeLetterVO officeLetterVO) {
		return officeLetterMapper.officeLetterDetail(officeLetterVO);
	}

	@Override
	public void officeLetterUpdate(OfficeLetterVO officeLetterVO) {
		officeLetterMapper.officeLetterUpdate(officeLetterVO);
		
	}

	@Override
	public OfficeLetterVO officeLetterDetail(int hdLtno) {
		return officeLetterMapper.officeLetterDetail(hdLtno);
	}

	@Override
	public AttachVO selectFileInfo(int attachNo) {
		return officeLetterMapper.selectFileInfo(attachNo);
	}
	
	@Override
	public List<FranchiseVO> getAllFrcs() {
		return officeLetterMapper.getAllFrcs();
	}

	@Override
	public int selectCount(String frcsId) {
		return officeLetterMapper.selectCount(frcsId);
	}


}	
