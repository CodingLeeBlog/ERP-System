package kr.or.ddit.mapper.member;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.ReviewVO;

public interface MemberReviewMapper {

	public int create(ReviewVO reviewVO);

	public List<ReviewVO> myReviewList(String memId);

	public void insertMemberReviewAlarm(AlarmVO alarmVO);

	public int selectMemberReviewAlarm(String memId);

	public List<AlarmVO> selectMemberReviewAlarmList(String memId);
	
	public String selectMember(String memId);

	public void updateMemberReviewAlarm(int alarmNo);

	public int deleteMemberReviewAlarm(int alarmNo);

	public int deleteclearAllAlarm(String ansId);

}
