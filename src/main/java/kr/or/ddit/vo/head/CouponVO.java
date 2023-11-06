package kr.or.ddit.vo.head;

import java.util.Date;

import lombok.Data;

@Data
public class CouponVO {

	private String cpnCd;
	private String cpnName;
	private String cpnContent;
	private Date cpnStdate;
	private Date cpnEnddate;
}
