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
	
	@Override
	public ServiceResult create(PayVO payVO) {
		
		ServiceResult result = null;
		
		int status = memberpayMapper.create(payVO);
		
		if(status > 0) {
			myresMapper.myResUpdate(payVO);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

}
