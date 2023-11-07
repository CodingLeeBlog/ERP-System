package kr.or.ddit.service.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;


public interface ICompliBoardService {

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);

	public BoardVO selectBoard(int tableNo);

	public ServiceResult deleteBoard(HttpServletRequest req, int tableNo);

	public ServiceResult updateBoard(HttpServletRequest req, BoardVO boardVO);

	public List<BoardVO> myBoardList(PaginationInfoVO<BoardVO> pagingVO);

	public ServiceResult insertBoard(HttpServletRequest req, BoardVO boardVO);

	public int myBoardCount(PaginationInfoVO<BoardVO> pagingVO);
	

}
