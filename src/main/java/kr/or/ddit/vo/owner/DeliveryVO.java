package kr.or.ddit.vo.owner;

import java.util.Date;

import lombok.Data;

@Data
public class DeliveryVO {

	private Date dlivyDate;		// 출고일자
	private String frcsId;	
	private String vdprodCd;	// 제품명코드
	private int dlivyQy;		// 출고수량
	private int dlivyPrice;		// 출고당시 가격
	
}
