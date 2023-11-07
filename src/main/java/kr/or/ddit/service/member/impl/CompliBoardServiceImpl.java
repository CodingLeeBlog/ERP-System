package kr.or.ddit.service.member.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.member.CompliBoardMapper;
import kr.or.ddit.service.member.ICompliBoardService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;

@Service
public class CompliBoardServiceImpl implements ICompliBoardService{
	
	@Inject
	private CompliBoardMapper compliboardMapper;

	@Override
	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
		return compliboardMapper.selectBoardCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO) {
		return compliboardMapper.selectBoardList(pagingVO);
	}



	@Override
	public ServiceResult insertBoard(HttpServletRequest req, BoardVO boardVO) {
		ServiceResult result = null;
		
		
		int status = compliboardMapper.insertBoard(boardVO);
		if(status > 0) {			
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public BoardVO selectBoard(int tableNo) {
		compliboardMapper.incrementHit(tableNo);
		return compliboardMapper.selectBoard(tableNo);
	}

	@Override
	public ServiceResult deleteBoard(HttpServletRequest req, int tableNo) {
		ServiceResult result = null;
		BoardVO board = compliboardMapper.selectBoard(tableNo);	// 게시글 번호에 해당하는 공지사항 게시글 정보 가져오기	
		
		
		int status = compliboardMapper.deleteBoard(tableNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateBoard(HttpServletRequest req, BoardVO boardVO) {
		ServiceResult result = null;
		int status = compliboardMapper.updateBoard(boardVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<BoardVO> myBoardList(PaginationInfoVO<BoardVO> pagingVO) {
		return compliboardMapper.myBoardList(pagingVO);
	}
	
	@Override
	public int myBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
		return compliboardMapper.myBoardCount(pagingVO);
		}


}
