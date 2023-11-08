package kr.or.ddit.vo.member;

import java.util.Date;

import lombok.Data;

@Data
public class PayVO {
	
	private String resvNo;
	private String memId;
	private String payNo;
	private int payPrice;
	private Date payDate;
	private String payYn;
	private String resvState;
	private Date payCancle;
}
