package kr.or.ddit.service.member.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.member.MeberPayMapper;
import kr.or.ddit.mapper.member.MyResMapper;
import kr.or.ddit.service.member.IMemberPayService;
import kr.or.ddit.vo.member.PayVO;

@Service
public class MemberPayServiceImpl implements IMemberPayService {

	@Inject
	private MeberPayMapper memberpayMapper;
	
	@Inject
	private MyResMapper myresMapper;
	
	/**
	 * 예약과 동시에 결제 내역 등록 서비스 로직
	 */
	@Override
	public ServiceResult create(PayVO payVO) {
		
		ServiceResult result = null;
		
		int status = memberpayMapper.create(payVO);
		
		if(status > 0) {
			// 예약과 동시에 결제하기로 변경 (주석처리)
			// myresMapper.myResUpdate(payVO);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public ServiceResult delete(PayVO payVO) {
		
		ServiceResult result = null;
		
		int status = memberpayMapper.delete(payVO);
		
		if(status > 0) {
			// 결제 취소시 예약 취소로 변경 (주석처리)
			// myresMapper.myResUpdate(payVO);
			myresMapper.myResDelete(payVO);
			myresMapper.myResMenuDelete(payVO);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

}
