package kr.or.ddit.service.member;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.member.MyCouponVO;

public interface IMyCouponService {

	public ServiceResult create(MyCouponVO mycouponVO);

	public List<MyCouponVO> myCouponList(String memId);

}
