package kr.or.ddit.service.member.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.member.TendiBoardMapper;
import kr.or.ddit.service.member.ITendiBoardService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HdBoardAnswerVO;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;

@Service
public class TendiBoardServiceImpl implements ITendiBoardService{
	
	@Inject
	private TendiBoardMapper tendiboardMapper;

	@Override
	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
		return tendiboardMapper.selectBoardCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO) {
		return tendiboardMapper.selectBoardList(pagingVO);
	}



	@Override
	public ServiceResult insertBoard(HttpServletRequest req, BoardVO boardVO, AlarmVO alarmVO) {
		ServiceResult result = null;
		int status = tendiboardMapper.insertBoard(boardVO);
		
		if(status > 0) {
			
			// 건의글 등록 알림 데이터 넣기
			String memId = boardVO.getMemId(); // 작성자 가져오기 
			int tableNo = boardVO.getTableNo(); // 게시글 번호
			alarmVO.setTableNo(tableNo);
			//1) FROM
			alarmVO.setMemId(memId);
			//2) WHAT
			alarmVO.setTblName("BOARD");
			alarmVO.setTblNo(tableNo+"");
			//3) TO
			String receiveMemId = this.tendiboardMapper.getReceiveMemId(tableNo);
			alarmVO.setReceiveMemId(receiveMemId);
			
			// 알람데이터 넣기 
			tendiboardMapper.insertTendiAlarm(alarmVO);
						
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
	@Override
	public BoardVO selectBoard(int tableNo) {
		tendiboardMapper.incrementHit(tableNo);
		return tendiboardMapper.selectBoard(tableNo);
	}

	@Override
	public ServiceResult deleteBoard(HttpServletRequest req, int tableNo) {
		ServiceResult result = null;
		BoardVO board = tendiboardMapper.selectBoard(tableNo);	// 게시글 번호에 해당하는 공지사항 게시글 정보 가져오기	
		
		int status = tendiboardMapper.deleteBoard(tableNo);
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
		int status = tendiboardMapper.updateBoard(boardVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	
	//댓글 추가 기능
	@Override
	public HdBoardAnswerVO selectBoardAnswer(int tableNo) {
		return tendiboardMapper.selectBoardAnswer(tableNo);
	}
	

}
