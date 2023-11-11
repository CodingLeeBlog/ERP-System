package kr.or.ddit.vo.owner;

import java.util.Date;

import lombok.Data;

@Data
public class TradingVO {

	private String tradNo;	// 트레이딩 번호
	private String frcsId;	// 요청 가맹점
	private String vdprodCd; // 제품명코드
	private String frcsId2;	// 응답 가맹점
	private int tradQy;	// 제품 수량
	private int tradAmt;	// 트레이딩 금액
	private Date tradDate; // 거래일자
	private String tradStts;	// 거래상태
	private String tradRm;	// 비고
	private String vdprodName;	// 제품이름
	
	private String frcsName; // 내 가맹점명?
	private String frcsName2;	// 상대방 가맹점명?
	
	private String thisMonth;

}
