package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.CouponMapper;
import kr.or.ddit.service.head.ICouponService;
import kr.or.ddit.vo.head.CouponVO;

@Service
public class CouponServiceImpl implements ICouponService {

	@Inject
	private CouponMapper couponMapper;
	
}
