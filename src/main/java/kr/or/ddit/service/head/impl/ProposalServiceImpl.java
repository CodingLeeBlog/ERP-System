package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.ProposalMapper;
import kr.or.ddit.service.head.IProposalService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.ProposalVO;

@Service
public class ProposalServiceImpl implements IProposalService {

	@Inject
	private ProposalMapper proposalMapper;

	@Override
	public int selectProposalCount(HeadPaginationInfoVO<ProposalVO> pagingVO) {
		return proposalMapper.selectProposalCount(pagingVO);
	}

	@Override
	public List<ProposalVO> selectProposalList(HeadPaginationInfoVO<ProposalVO> pagingVO) {
		return proposalMapper.selectProposalList(pagingVO);
	}

	@Override
	public ProposalVO selectProposal(int tableNo) {
		return proposalMapper.selectProposal(tableNo);
	}

	@Override
	public ServiceResult proposalInsert(ProposalVO proposalVO, AlarmVO alarmVO) {
		ServiceResult result = null;
		int status = proposalMapper.proposalInsert(proposalVO);
		if(status > 0) {
			// 게시들 답변 알람데이터 넣기
			String ansId = proposalVO.getAnsId(); // 답변자 가져오기 
			int tableNo = proposalVO.getTableNo(); // 답변 테이블 번호
			alarmVO.setTableNo(tableNo);
			//1) FROM
			alarmVO.setMemId(ansId);
			//2) WHAT
			alarmVO.setTblName("HDBOARD_ANSWER");
			alarmVO.setTblNo(tableNo+"");
			//3) TO
			String receiveMemId = this.proposalMapper.getReceiveMemId(tableNo);
			alarmVO.setReceiveMemId(receiveMemId);
			
			// 알람데이터 넣기 
			proposalMapper.insertProposalAlarm(alarmVO);
			
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	@Override
	public void ansStateUpdate(ProposalVO proposalVO) {
		proposalMapper.ansStateUpdate(proposalVO);
	}

	@Override
	public List<AlarmVO> selectAlarmList(String memId) {
		return proposalMapper.selectAlarmList(memId);
	}

	@Override
	public void updateAlarm(int alarmNo) {
		proposalMapper.updateAlarm(alarmNo);
		
	}

	@Override
	public ServiceResult deleteAlarm(int alarmNo) {
	ServiceResult result = null;
		
		int status = proposalMapper.deleteAlarm(alarmNo);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult deleteclearAllAlarm(String memId) {
		ServiceResult result = null;
		
		int status = proposalMapper.deleteclearAllAlarm(memId);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
//	@Override
//	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
//		return proposalMapper.selectBoardCount(pagingVO);
//	}
//
//	@Override
//	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO) {
//		return proposalMapper.selectBoardList(pagingVO);
//	}
//
//	@Override
//	public BoardVO selectBoard(int tableNo) {
//		proposalMapper.incrementHit(tableNo);
//		return proposalMapper.selectBoard(tableNo);
//	}
//
//	@Override
//	public ServiceResult insertBoard(HttpServletRequest req, ProposalVO proposalVO) {
//	    ServiceResult result = null;
//	    int status = proposalMapper.insertBoard(proposalVO);
//	    if(status > 0) {
//	        
//	        result = ServiceResult.OK;
//	    } else {
//	        result = ServiceResult.FAILED;
//	    }
//	    return result;
//	}

}
