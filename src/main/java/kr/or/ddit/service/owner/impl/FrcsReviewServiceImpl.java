package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsReviewMapper;
import kr.or.ddit.service.owner.IFrcsReviewService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FrcsReviewVO;

@Service
public class FrcsReviewServiceImpl implements IFrcsReviewService {

	@Inject
	private FrcsReviewMapper mapper;

	@Override
	public List<FrcsReviewVO> frcsReviewList(String frcsId) {
		return mapper.frcsReviewList(frcsId);
	}

	@Override
	public ServiceResult reviewAnsInsert(FrcsReviewVO frcsReviewVO, AlarmVO alarmVO) {
		ServiceResult result = null;
		int status = mapper.reviewAnsInsert(frcsReviewVO);
		if(status > 0) {
			
			// 알람데이터 넣기 
			String memId = frcsReviewVO.getMemId(); // 작성자 가져오기 
			String ansId = frcsReviewVO.getAnsId(); // 답변자 가져오기 
			frcsReviewVO.setMemId(memId);
			frcsReviewVO.setAnsId(ansId);
			
			// 알람데이터 넣기 
			mapper.insertAlarm(alarmVO);
			
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public void reviewYnUpdate(FrcsReviewVO frcsReviewVO) {
		mapper.reviewYnUpdate(frcsReviewVO);
	}

	@Override
	public FrcsReviewVO frcsReviewAns(String reviewNo) {
		return mapper.frcsReviewAns(reviewNo);
	}

	@Override
	public ServiceResult reviewAnsUpdate(FrcsReviewVO frcsReviewVO) {
		ServiceResult result = null;
		int status = mapper.reviewAnsUpdate(frcsReviewVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult reviewDelete(String reviewNo) {
		ServiceResult result = null;
		int status = mapper.reviewDelete(reviewNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public void reviewAnsDelete(String reviewNo) {
		mapper.reviewAnsDelete(reviewNo);
	}


	@Override
	public int selectAlarm(String frcsId) {
		int alarmCnt = mapper.selectAlarm(frcsId);
		return alarmCnt;
	}

	@Override
	public List<AlarmVO> selectAlarmList(String frcsId) {
		return mapper.selectAlarmList(frcsId);
	}

	@Override
	public void updateAlarm(int alarmNo) {
		mapper.updateAlarm(alarmNo);
	}

	@Override
	public ServiceResult clearAllNotifications(String frcsId) {
		ServiceResult result = null;
		
		int status = mapper.clearAllNotifications(frcsId);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
}
