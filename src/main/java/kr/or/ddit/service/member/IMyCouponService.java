package kr.or.ddit.service.member;

import java.util.List;

import kr.or.ddit.vo.member.MyCouponVO;

public interface IMyCouponService {

	public List<MyCouponVO> myCouponList(String memId);

}
