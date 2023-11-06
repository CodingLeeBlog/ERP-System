package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FrcsReviewVO;

public interface FrcsReviewMapper {

	public List<FrcsReviewVO> frcsReviewList(String frcsId);
	public int reviewAnsInsert(FrcsReviewVO frcsReviewVO);
	public void reviewYnUpdate(FrcsReviewVO frcsReviewVO);
	public FrcsReviewVO frcsReviewAns(String reviewNo);
	public int reviewAnsUpdate(FrcsReviewVO frcsReviewVO);
	public int reviewDelete(String reviewNo);
	public void reviewAnsDelete(String reviewNo);
	public void insertAlarm(AlarmVO alarmVO);
	public int selectAlarm(String frcsId);
	public List<AlarmVO> selectAlarmList(String frcsId);
	public void updateAlarm(int alarmNo);
	public String selectMember(String memId);
	public int clearAllNotifications(String frcsId);

}
