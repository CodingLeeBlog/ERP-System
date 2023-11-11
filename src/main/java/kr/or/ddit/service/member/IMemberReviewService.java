package kr.or.ddit.service.member;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.ResVO;
import kr.or.ddit.vo.member.ReviewVO;

public interface IMemberReviewService {

	public ServiceResult create(ReviewVO reviewVO, ResVO resVO, AlarmVO alarmVO);

	public List<ReviewVO> myReviewList(String memId);

	//일반홈페이지 알림
	public List<AlarmVO> selectAlarmList(String memId);

	public void updateAlarm(int alarmNo);

	public ServiceResult deleteAlarm(int alarmNo);

	public ServiceResult deleteclearAllAlarm(String memId);



}
