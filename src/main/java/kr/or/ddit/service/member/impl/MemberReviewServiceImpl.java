package kr.or.ddit.service.member.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.member.MemberReviewMapper;
import kr.or.ddit.service.member.IMemberReviewService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.ReviewVO;

@Service
public class MemberReviewServiceImpl implements IMemberReviewService {

	@Inject
	private MemberReviewMapper memberreviewMapper;
	
	@Override
	public ServiceResult create(ReviewVO reviewVO, AlarmVO alarmVO) {
		
		ServiceResult result = null;
		
		int status = memberreviewMapper.create(reviewVO);
		
		if(status > 0) {
			// 알람데이터 넣기 
			String memId = reviewVO.getMemId(); // 작성자 가져오기 
			int reviewNo = reviewVO.getReviewNo(); //리뷰 번호 
			alarmVO.setReviewNo(reviewNo);
			alarmVO.setMemId(memId);
			
			// 알람데이터 넣기 
			memberreviewMapper.insertMemberReviewAlarm(alarmVO);
			
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<ReviewVO> myReviewList(String memId) {
		return memberreviewMapper.myReviewList(memId);
	}

	@Override
	public int selectMemberReviewAlarm(String memId) {
		int alarmCnt = memberreviewMapper.selectMemberReviewAlarm(memId);
		return alarmCnt;
	}

	@Override
	public List<AlarmVO> selectMemberReviewAlarmList(String memId) {
		return memberreviewMapper.selectMemberReviewAlarmList(memId);
	}

	@Override
	public void updateMemberReviewAlarm(int alarmNo) {
		memberreviewMapper.updateMemberReviewAlarm(alarmNo);
		
	}

	@Override
	public ServiceResult deleteMemberReviewAlarm(int alarmNo) {
		ServiceResult result = null;
		
		int status = memberreviewMapper.deleteMemberReviewAlarm(alarmNo);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult deleteclearAllAlarm(String ansId) {
		ServiceResult result = null;
		
		int status = memberreviewMapper.deleteclearAllAlarm(ansId);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

}
