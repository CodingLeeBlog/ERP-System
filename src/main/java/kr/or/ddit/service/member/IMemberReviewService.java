package kr.or.ddit.service.member;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.ReviewVO;

public interface IMemberReviewService {

	public ServiceResult create(ReviewVO reviewVO, AlarmVO alarmVO);

	public List<ReviewVO> myReviewList(String memId);

	public int selectMemberReviewAlarm(String ansId);

	public List<AlarmVO> selectMemberReviewAlarmList(String ansId);

	public void updateMemberReviewAlarm(int alarmNo);

	public ServiceResult deleteMemberReviewAlarm(int alarmNo);

	public ServiceResult deleteclearAllAlarm(String ansId);


}
