package kr.or.ddit.mapper.member;

import java.util.List;

import kr.or.ddit.vo.head.CouponVO;
import kr.or.ddit.vo.member.MyCouponVO;

public interface MyCouponMapper {

	public List<MyCouponVO> myCouponList(String memId);

	public void updatemyCoupon(String memcpnId);

	public int mycouponcreate(MyCouponVO mycouponVO);

	public MyCouponVO mycoupon(MyCouponVO mycouponVO);

}
