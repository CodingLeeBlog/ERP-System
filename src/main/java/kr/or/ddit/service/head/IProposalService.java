package kr.or.ddit.service.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.ProposalVO;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;

public interface IProposalService {


	public int selectProposalCount(HeadPaginationInfoVO<ProposalVO> pagingVO);

	public List<ProposalVO> selectProposalList(HeadPaginationInfoVO<ProposalVO> pagingVO);

	public ProposalVO selectProposal(int tableNo);

	public ServiceResult proposalInsert(ProposalVO proposalVO, AlarmVO alarmVO);

	public void ansStateUpdate(ProposalVO proposalVO);

	//본사 알림
	public List<AlarmVO> selectAlarmList(String memId);

	public void updateAlarm(int alarmNo);

	public ServiceResult deleteAlarm(int alarmNo);

	public ServiceResult deleteclearAllAlarm(String memId);


}
