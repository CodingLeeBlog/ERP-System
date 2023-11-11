package kr.or.ddit.service.head.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.InspectionMapper;
import kr.or.ddit.service.head.IInspectionService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InspectionVO;
import kr.or.ddit.vo.owner.FranchiseVO;

@Service
public class InspectionServiceImpl implements IInspectionService {

	@Inject
	private InspectionMapper inspectionMapper;

	@Override
	public int selectInspectionCount(HeadPaginationInfoVO<InspectionVO> pagingVO) {
		return inspectionMapper.selectInspectionCount(pagingVO);
	}

	@Override
	public List<InspectionVO> selectInspectionList(HeadPaginationInfoVO<InspectionVO> pagingVO) {
		return inspectionMapper.selectInspectionList(pagingVO);
	}

	@Override
	public AttachVO selectFileInfo(int attachNo) {
		return inspectionMapper.selectFileInfo(attachNo);
	}

	@Override
	public void inspectionRegister(HttpServletRequest req, InspectionVO inspectionVO) {
		inspectionMapper.inspectionRegister(inspectionVO);

		List<AttachVO> inspectionFileList = inspectionVO.getInspectionFileList(); // AttachVO 리스트 가져오기

		String savePath = "/resources/upload/file/";
		
		int count = 1;

		if (inspectionFileList != null && !inspectionFileList.isEmpty()) {

			String saveLocate = req.getServletContext().getRealPath(savePath);
			File fileSaveLocate = new File(saveLocate);
			if (!fileSaveLocate.exists()) {
				fileSaveLocate.mkdirs();
			}

			for (AttachVO attachVO : inspectionFileList) {
				// 파일 업로드 처리 시작
				String saveName = UUID.randomUUID().toString(); // UUID의 랜덤 파일명 생성
				saveName = saveName + "_" + attachVO.getAttachOrgname().replaceAll(" ", "_"); // 공백일 때 _로 전부 바꿔준다.

				attachVO.setTablePk(String.valueOf(inspectionVO.getIpCode()));
				attachVO.setFileNo(count++);
				attachVO.setAttachSavename(savePath + saveName); // 파일명 설정

				File realUploadFile = new File(fileSaveLocate + "/" + saveName);
				try {
					attachVO.getItem().transferTo(realUploadFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				inspectionMapper.inspectionAttachRegister(attachVO);
			}
		}
	}

	@Override
	public List<InspectionVO> getDetail(String frcsId) {
	    List<InspectionVO> detailList = inspectionMapper.getDetail(frcsId); 

	    return detailList;
	}

	@Override
	public List<FranchiseVO> getSearch(String searchWord) {
		return inspectionMapper.getSearch(searchWord);
	}

}
