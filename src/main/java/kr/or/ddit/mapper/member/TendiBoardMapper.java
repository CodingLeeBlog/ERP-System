package kr.or.ddit.mapper.member;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HdBoardAnswerVO;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;


public interface TendiBoardMapper {

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);

	public BoardVO Board(int tableNo);

	public void incrementHit(int tableNo);

	public int insertBoard(BoardVO boardVO);

	public BoardVO selectBoard(int tableNo);

	public int deleteBoard(int tableNo);

	public int updateBoard(BoardVO boardVO);

	public HdBoardAnswerVO selectBoardAnswer(int tableNo);

	//게시글 등록 알림 데이터 넣기
	public void insertTendiAlarm(AlarmVO alarmVO);

	public String getReceiveMemId(int tableNo);

	
}
