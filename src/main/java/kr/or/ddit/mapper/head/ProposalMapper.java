package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.ProposalVO;

public interface ProposalMapper {


	public int selectProposalCount(HeadPaginationInfoVO<ProposalVO> pagingVO);

	public List<ProposalVO> selectProposalList(HeadPaginationInfoVO<ProposalVO> pagingVO);

	public ProposalVO selectProposal(int tableNo);

	public int proposalInsert(ProposalVO proposalVO);

	public void ansStateUpdate(ProposalVO proposalVO);

	//본사 알림
	public void updateAlarm(int alarmNo);

	public List<AlarmVO> selectAlarmList(String memId);

	public int deleteAlarm(int alarmNo);

	public int deleteclearAllAlarm(String memId);

	//게시글 답변 알림 등록
	public void insertProposalAlarm(AlarmVO alarmVO);

	public String getReceiveMemId(int tableNo);
	
	
}
