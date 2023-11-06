package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsInquiryMapper;
import kr.or.ddit.service.owner.IFrcsInquiryService;
import kr.or.ddit.vo.owner.FrcsInquiryVO;

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
//			List<BoardFileVO> boardFileList = boardVO.getBoardFileList();
//			FileUploadUtils.boardFileUpload(boardFileList, boardVO.getBoNo(), req, boardMapper);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public FrcsInquiryVO frcsInqDetail(String inqryNo) {
		return mapper.frcsInqDetail(inqryNo);
	}

	@Override
	public ServiceResult frcsInqUpdate(HttpServletRequest req, FrcsInquiryVO frcsInquiryVO) {
		ServiceResult result = null;
		int status = mapper.frcsInqUpdate(frcsInquiryVO);
		if(status > 0) {
//			List<FrcsInquiryVO> frcsInqList = frcsInquiryVO.
//			try {
//				
//				FileUploadUtils.boardFileUpload(boardFileList, boardVO.getBoNo(), req, boardMapper);
//				
//				Integer[] delBoardNo = boardVO.getDelBoardNo();
//				if(delBoardNo != null) {
//					boardMapper.deleteBoardFileList(delBoardNo);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult frcsInqDelete(String inqryNo) {
		ServiceResult result = null;
//		mapper.frcsInqDelete(inqryNo);
		int status = mapper.frcsInqDelete(inqryNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

}
