package kr.or.ddit.service.member.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.member.MemberReviewMapper;
import kr.or.ddit.mapper.member.MyResMapper;
import kr.or.ddit.service.member.IMemberReviewService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.ResVO;
import kr.or.ddit.vo.member.ReviewVO;

@Service
public class MemberReviewServiceImpl implements IMemberReviewService {

	@Inject
	private MemberReviewMapper memberreviewMapper;
	
	@Inject
	private MyResMapper myresMapper;
	
	@Override
	public ServiceResult create(ReviewVO reviewVO, ResVO resVO, AlarmVO alarmVO) {
		
		ServiceResult result = null;
		
		int status = memberreviewMapper.create(reviewVO);
		
		if(status > 0) {
			
			// 알람데이터 넣기 
			String memId = reviewVO.getMemId(); // 작성자 가져오기 
			int reviewNo = reviewVO.getReviewNo(); //리뷰 번호 
			alarmVO.setReviewNo(reviewNo);
			//1) FROM
			alarmVO.setMemId(memId);
			//2) WHAT
			alarmVO.setTblName("REVIEW");
			alarmVO.setTblNo(reviewNo+"");
			//3) TO
			String receiveMemId = this.memberreviewMapper.getReceiveMemId(reviewNo);
			alarmVO.setReceiveMemId(receiveMemId);
			// 알람데이터 넣기 
			memberreviewMapper.insertMemberReviewAlarm(alarmVO);
			
			resVO.setReviewYn("Y");
			myresMapper.myResReviewUpdate(resVO);
			
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

	//일반 홈페이지 알림시작
	@Override
	public List<AlarmVO> selectAlarmList(String memId) {
		return memberreviewMapper.selectAlarmList(memId);
	}

	@Override
	public void updateAlarm(int alarmNo) {
		memberreviewMapper.updateAlarm(alarmNo);
		
	}

	@Override
	public ServiceResult deleteAlarm(int alarmNo) {
		ServiceResult result = null;
		
		int status = memberreviewMapper.deleteAlarm(alarmNo);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult deleteclearAllAlarm(String memId) {
		ServiceResult result = null;
		
		int status = memberreviewMapper.deleteclearAllAlarm(memId);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

}
