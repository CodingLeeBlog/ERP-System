package kr.or.ddit.service.owner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FrcsReviewVO;

public interface IFrcsReviewService {

	public List<FrcsReviewVO> frcsReviewList(String frcsId);
//	public ServiceResult reviewAnsInsert(FrcsReviewVO frcsReviewVO);
	public void reviewYnUpdate(FrcsReviewVO frcsReviewVO);
	public FrcsReviewVO frcsReviewAns(String reviewNo);
	public ServiceResult reviewAnsUpdate(FrcsReviewVO frcsReviewVO);
	public ServiceResult reviewDelete(String reviewNo);
	public void reviewAnsDelete(String reviewNo);
	public ServiceResult reviewAnsInsert(FrcsReviewVO frcsReviewVO, AlarmVO alarmVO);
	public int selectAlarm(String frcsId);
	public List<AlarmVO> selectAlarmList(String frcsId);
	public void updateAlarm(int alarmNo);
	public ServiceResult clearAllNotifications(String frcsId);

}
