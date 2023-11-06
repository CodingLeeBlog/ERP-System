package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.FaqBoardMapper;
import kr.or.ddit.service.head.IFaqBoardService;
import kr.or.ddit.vo.head.HeadBoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;

@Service
public class FaqBoardServiceImpl implements IFaqBoardService{
	
	@Inject
	private FaqBoardMapper faqboardMapper;

	@Override
	public int selectBoardCount(PaginationInfoVO<HeadBoardVO> pagingVO) {
		return faqboardMapper.selectBoardCount(pagingVO);
	}

	@Override
	public List<HeadBoardVO> selectBoardList(PaginationInfoVO<HeadBoardVO> pagingVO) {
		return faqboardMapper.selectBoardList(pagingVO);
	}



	@Override
	public ServiceResult insertBoard(HttpServletRequest req, HeadBoardVO headBoardVO) {
		ServiceResult result = null;
		int status = faqboardMapper.insertBoard(headBoardVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public HeadBoardVO selectBoard(int baordNo) {
		faqboardMapper.incrementHit(baordNo);
		return faqboardMapper.selectBoard(baordNo);
	}

	@Override
	public ServiceResult deleteBoard(HttpServletRequest req, int baordNo) {
		ServiceResult result = null;

		HeadBoardVO headBoardVO = faqboardMapper.selectBoard(baordNo);	// 게시글 번호에 해당하는 공지사항 게시글 정보 가져오기	
		
		int status = faqboardMapper.deleteBoard(baordNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateBoard(HttpServletRequest req, HeadBoardVO headBoardVO) {
		ServiceResult result = null;
		int status = faqboardMapper.updateBoard(headBoardVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}


}
