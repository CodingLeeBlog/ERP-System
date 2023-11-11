package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FrcsReviewVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsReviewMapper {

	public List<FrcsReviewVO> frcsReviewList(String frcsId);
	public int reviewAnsInsert(FrcsReviewVO frcsReviewVO);
	public void reviewYnUpdate(FrcsReviewVO frcsReviewVO);
	public FrcsReviewVO frcsReviewAns(String reviewNo);
	public int reviewAnsUpdate(FrcsReviewVO frcsReviewVO);
	public int reviewDelete(String reviewNo);
	public void reviewAnsDelete(String reviewNo);
	public int selectReviewCount(OwnerPaginationInfoVO<FrcsReviewVO> pagingVO);
	public List<FrcsReviewVO> selectReviewList(OwnerPaginationInfoVO<FrcsReviewVO> pagingVO);
	public int selectCount(String frcsId);
	
	//가맹점 알림
	public List<AlarmVO> selectAlarmList(String memId);
	public void updateAlarm(int alarmNo);
	public int deleteAlarm(int alarmNo);
	public int deleteclearAllAlarm(String memId);
	
	//답변 알림
	public void insertAlarm(AlarmVO alarmVO);
	public String getReceiveMemId(String ansNo);
	public String getMemFrcs(String memIdfrcs);
	
}
