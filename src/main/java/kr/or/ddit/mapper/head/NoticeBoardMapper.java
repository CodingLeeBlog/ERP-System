package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadBoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;

public interface NoticeBoardMapper {

	public int selectBoardCount(PaginationInfoVO<HeadBoardVO> pagingVO);

	public List<HeadBoardVO> selectBoardList(PaginationInfoVO<HeadBoardVO> pagingVO);

	public HeadBoardVO Board(int boardNo);

	public void incrementHit(int boardNo);

	public int insertBoard(HeadBoardVO headBoardVO);

	public HeadBoardVO selectBoard(int boardNo);

	public int deleteBoard(int boardNo);

	public int updateBoard(HeadBoardVO headBoardVO);

	public void deleteNoticeFileByBoNo(int boardNo);

	public AttachVO selectNoticeFile(Integer integer);

	public void deleteNoticeFile(Integer integer);

	public void insertNoticeFile(AttachVO noticeFileVO);

	public AttachVO selectFileInfo(int attachNo);
}

