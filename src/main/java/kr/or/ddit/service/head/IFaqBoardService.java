package kr.or.ddit.service.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.head.HeadBoardVO;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;


public interface IFaqBoardService {

	public int selectBoardCount(PaginationInfoVO<HeadBoardVO> pagingVO);

	public List<HeadBoardVO> selectBoardList(PaginationInfoVO<HeadBoardVO> pagingVO);

	public HeadBoardVO selectBoard(int boardNo);

	public ServiceResult insertBoard(HttpServletRequest req, HeadBoardVO headBoardVO);

	public ServiceResult deleteBoard(HttpServletRequest req, int boardNo);

	public ServiceResult updateBoard(HttpServletRequest req, HeadBoardVO headBoardVO);


}
