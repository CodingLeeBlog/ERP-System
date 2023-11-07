package kr.or.ddit.mapper.member;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;


public interface CompliBoardMapper {

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);

	public BoardVO Board(int tableNo);

	public void incrementHit(int tableNo);

	public int insertBoard(BoardVO boardVO);

	public BoardVO selectBoard(int tableNo);

	public int deleteBoard(int tableNo);

	public int updateBoard(BoardVO boardVO);

	public List<BoardVO> myBoardList(PaginationInfoVO<BoardVO> pagingVO);

	public int myBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	
}
