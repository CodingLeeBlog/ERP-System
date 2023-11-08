package kr.or.ddit.vo.member;

import java.util.Date;

import lombok.Data;

@Data
public class MyCouponVO {

	private int memcpnId;
	private Date memcpnGetdate;
	private Date memcpnEnddate;
	private String memcpnYn;
	private String memId;
	private String cpnCd;
	private String cpnName;
	private String cpnContent;
	private Date cpnStdate;
	private Date cpnEnddate;
	
	// 회원별 쿠폰 번호 출력용
	private int rownum;
}
