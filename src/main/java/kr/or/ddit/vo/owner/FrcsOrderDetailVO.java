package kr.or.ddit.vo.owner;

import java.util.Date;

import lombok.Data;

@Data
public class FrcsOrderDetailVO {

	private String frcsOrderNo;	// 발주번호
	private String vdprodCd;	// 제품명 코드
	private int frcsOrderQy;	// 주문수량
	private int hdforwardPrice;	// 발주당시 출고단가
	private String frcsId;
	private String vdprodName; // 제품명
	
	private int totalPrice;	// 통계를 위한 전체 금액
	
	private String thisMonth;
	
}
