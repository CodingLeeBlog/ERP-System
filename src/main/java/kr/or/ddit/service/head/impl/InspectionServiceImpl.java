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

		List<AttachVO> officeLetterFileList = inspectionVO.getInspectionFileList(); // AttachVO 리스트 가져오기

		String savePath = "/resources/upload/file/";

		int count = 1;

		if (officeLetterFileList != null && !officeLetterFileList.isEmpty()) {

			String saveLocate = req.getServletContext().getRealPath(savePath);
			File fileSaveLocate = new File(saveLocate);
			if (!fileSaveLocate.exists()) {
				fileSaveLocate.mkdirs();
			}

			for (AttachVO attachVO : officeLetterFileList) {
				// 파일 업로드 처리 시작
				String saveName = UUID.randomUUID().toString(); // UUID의 랜덤 파일명 생성
				saveName = saveName + "_" + attachVO.getAttachOrgname().replaceAll(" ", "_"); // 공백일 때 _로 전부 바꿔준다.

				attachVO.setTablePk(String.valueOf(inspectionVO.getFrcsId()));
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
}
