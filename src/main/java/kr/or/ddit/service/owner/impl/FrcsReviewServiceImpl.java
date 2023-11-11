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
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

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
			// 리뷰 답변 알람데이터 넣기
			String frcsId = frcsReviewVO.getFrcsId(); //답변자의 가맹점 코드
			String ansNo = frcsReviewVO.getAnsNo(); // 답변 번호
			alarmVO.setAnsNo(ansNo);
			//1) FROM
			String memIdfrcs = this.mapper.getMemFrcs(frcsId); //가맹점 코드를 mem_Id로 만들기 위함
			alarmVO.setMemId(memIdfrcs);
			//2) WHAT
			alarmVO.setTblName("REVIEW_ANSWER");
			alarmVO.setTblNo(ansNo);
			//3) TO
			String receiveMemId = this.mapper.getReceiveMemId(ansNo);
			
			alarmVO.setReceiveMemId(receiveMemId);
			
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


	//가맹점 알림 시작
	@Override
	public List<AlarmVO> selectAlarmList(String memId) {
		return mapper.selectAlarmList(memId);
	}

	@Override
	public void updateAlarm(int alarmNo) {
		mapper.updateAlarm(alarmNo);
	}

	//1개 삭제
	@Override
	public ServiceResult deleteAlarm(int alarmNo) {
		ServiceResult result = null;
		
		int status = mapper.deleteAlarm(alarmNo);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
	//전체 삭제
	@Override
	public ServiceResult deleteclearAllAlarm(String memId) {
		ServiceResult result = null;
		
		int status = mapper.deleteclearAllAlarm(memId);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public int selectReviewCount(OwnerPaginationInfoVO<FrcsReviewVO> pagingVO) {
		return mapper.selectReviewCount(pagingVO);
	}

	@Override
	public List<FrcsReviewVO> selectReviewList(OwnerPaginationInfoVO<FrcsReviewVO> pagingVO) {
		return mapper.selectReviewList(pagingVO);
	}

	@Override
	public int selectCount(String frcsId) {
		return mapper.selectCount(frcsId);
	}
}
