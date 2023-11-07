package kr.or.ddit.mapper.member;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.ReviewVO;

public interface MemberReviewMapper {

	public int create(ReviewVO reviewVO);

	public List<ReviewVO> myReviewList(String memId);


	//일반 홈페이지 알림
	public List<AlarmVO> selectAlarmList(String memId);
	
	public void updateAlarm(int alarmNo);

	public int deleteAlarm(int alarmNo);

	public int deleteclearAllAlarm(String ansId);

	//리뷰 등록시 알림 데이터 넣기
	public void insertMemberReviewAlarm(AlarmVO alarmVO);

	public String getReceiveMemId(int reviewNo);

}
