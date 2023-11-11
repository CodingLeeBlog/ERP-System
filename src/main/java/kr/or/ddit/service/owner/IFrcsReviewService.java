package kr.or.ddit.service.owner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FrcsReviewVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsReviewService {

	public List<FrcsReviewVO> frcsReviewList(String frcsId);
	public void reviewYnUpdate(FrcsReviewVO frcsReviewVO);
	public FrcsReviewVO frcsReviewAns(String reviewNo);
	public ServiceResult reviewAnsUpdate(FrcsReviewVO frcsReviewVO);
	public ServiceResult reviewDelete(String reviewNo);
	public void reviewAnsDelete(String reviewNo);
	public ServiceResult reviewAnsInsert(FrcsReviewVO frcsReviewVO, AlarmVO alarmVO);
	public int selectReviewCount(OwnerPaginationInfoVO<FrcsReviewVO> pagingVO);
	public List<FrcsReviewVO> selectReviewList(OwnerPaginationInfoVO<FrcsReviewVO> pagingVO);
	public int selectCount(String frcsId);
	
	//가맹점 알림
	public List<AlarmVO> selectAlarmList(String memId);
	public void updateAlarm(int alarmNo);
	public ServiceResult deleteAlarm(int alarmNo);
	public ServiceResult deleteclearAllAlarm(String memId);

}
