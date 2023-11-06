package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class CancleModalVO {

	private String frcsorderNo;			// 발주번호
	private String vdprodCd;			// 제품명코드
	private String vdprodName;			// 제품명
	private String frcsorderQy;			// 주문수량
	private String hdforwardPrice;		// 발주당시출고단가
	private String frcsorderDate;		// 발주일
	private int totalPrice;	// 총액
}
