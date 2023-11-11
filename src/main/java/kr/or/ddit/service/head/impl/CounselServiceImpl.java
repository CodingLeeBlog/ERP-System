package kr.or.ddit.service.head.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.velocity.runtime.log.Log;
import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.CounselMapper;
import kr.or.ddit.service.head.ICounselService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CounselServiceImpl implements ICounselService {

	@Inject
	private CounselMapper counselMapper;
	
	@Override
	public int selectCounselCount(HeadPaginationInfoVO<OwnerVO> pagingVO) {
		return counselMapper.selectCounselCount(pagingVO);
	}

	@Override
	public List<OwnerVO> selectCounselList(HeadPaginationInfoVO<OwnerVO> pagingVO) {
		return counselMapper.selectCounselList(pagingVO);
	}

	@Override
	public OwnerVO counselDetail(OwnerVO ownerVO) {
		return counselMapper.counselDetail(ownerVO);
		
	}

	@Override
	public void counselUpdate(HttpServletRequest req, OwnerVO ownerVO) {

		counselMapper.counselUpdate(ownerVO);
		//OwnerVO(ownerId=0, ownerNo=0, ownerName=null, ownerBir=null, ownerTel=null, ownerEmail=null, ownerArea=null
		//, ownerDong=null, ownerMoney=null, ownerBuilding=null, ownerBuildingadd=null, ownerExp=null
		//, ownerHopetime=null, ownerInfocontent=null, ownerContentdetail=null, 
		//ownerConst=[object HTMLCollection], ownerTelyn=[object HTMLCollection], ownerYn=null, tableName=null
		//, delBoardNo=null, boFile=[org.springframework.web.multipart.support.Standard..]
		//, counselFileList=[AttachVO(item=org.springframework.web.multipart.support.StandardMultip..
		//, attachNo=null, fileNo=null, attachOrgname=보건증.pdf, attachSavename=null, tableName=null, tablePk=null
		//, attachMime=application/pdf, attachSize=32708, thumbImg=null, attachFancysize=31 KB)])
		log.info("counselUpdate->ownerVO : " + ownerVO);
	    
	    List<AttachVO> counselFileList = ownerVO.getCounselFileList(); // AttachVO 리스트 가져오기
	    
	    String savePath = "/resources/upload/file/";
	    
	    int count = 1;
	    
	    if (counselFileList != null && !counselFileList.isEmpty()) {
	    	
	    	String saveLocate = req.getServletContext().getRealPath(savePath);
	    	File fileSaveLocate = new File(saveLocate);
	    	if(!fileSaveLocate.exists()) {
	    		fileSaveLocate.mkdirs();
	    	}
	    	
	        for (AttachVO attachVO : counselFileList) {
	            // 파일 업로드 처리 시작
	            String saveName = UUID.randomUUID().toString(); // UUID의 랜덤 파일명 생성
	            saveName = saveName + "_" + attachVO.getAttachOrgname().replaceAll(" ", "_"); // 공백일 때 _로 전부 바꿔준다.
	            
	            attachVO.setTablePk(String.valueOf(ownerVO.getOwnerId()));
	            attachVO.setFileNo(count++);
	            attachVO.setAttachSavename(savePath + saveName); // 파일명 설정

	            File realUploadFile = new File(fileSaveLocate + "/" + saveName);
	            try {
					attachVO.getItem().transferTo(realUploadFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	            
	            // AttachVO를 저장
	            //AttachVO(item=org.springframework.web.multipart.support.StandardMul.., attachNo=null
	            //, fileNo=1, attachOrgname=보건증.pdf, attachSavename=/resources/upload/file/3f9fb635-9fa2-41c9-b5a2-d6c7c911f473_보건증.pdf
	            //, tableName=null, tablePk=0, attachMime=application/pdf, attachSize=32708, thumbImg=null, attachFancysize=31 KB)
	            log.info("counselUpdate->attachVO : " + attachVO);
	            counselMapper.counselAttachRegister(attachVO);
	        }
	    }
	}

	@Override
	public ServiceResult frcsCheck(String frcsName) {
		ServiceResult result = null;
		FranchiseVO frcs = counselMapper.frcsCheck(frcsName);
		if(frcs != null) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	 private String lastId = "fr0015"; // 초기 마지막 아이디

    @Override
    public String makeFrcsId() {
        int lastIdNumber = Integer.parseInt(lastId.substring(2));
        int nextIdNumber = lastIdNumber + 1;
        String newFrcsId = String.format("fr%04d", nextIdNumber);

        lastId = newFrcsId; // 다음 호출을 위해 마지막 아이디 업데이트
        return newFrcsId;
    }

	@Override
	public void counselRegister(FranchiseVO frcsVO) {
		counselMapper.counselRegister(frcsVO);
	}

	@Override
	public String getFrcsId(int ownerId) {
		String frcsId = counselMapper.getFrcsId(ownerId);
		return frcsId;
	}

}