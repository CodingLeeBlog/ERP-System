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

	public int countAlarm(String tableNo);

	public int selectAlarm(String memId);

	public List<AlarmVO> selectAlarmList(String memId);

	public void updateAlarm(int alarmNo);

	public String selectMember(String memId);

	public void insertAlarm(AlarmVO alarmVO);

	public int myBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	
}
