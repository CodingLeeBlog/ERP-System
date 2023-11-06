package kr.or.ddit.mapper.member;

import java.util.List;

import kr.or.ddit.vo.head.CouponVO;
import kr.or.ddit.vo.member.MyCouponVO;

public interface MyCouponMapper {

	public List<MyCouponVO> myCouponList(String memId);

	public void deletemyCoupon(String memcpnId);

}
