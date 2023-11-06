package kr.or.ddit.service.member.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.member.MyCouponMapper;
import kr.or.ddit.service.member.IMyCouponService;
import kr.or.ddit.vo.member.MyCouponVO;

@Service
public class MyCouponServiceImpl implements IMyCouponService {

	@Inject
	private MyCouponMapper mycouponMapper;
	
	@Override
	public List<MyCouponVO> myCouponList(String memId) {
		return mycouponMapper.myCouponList(memId);
	}

}
