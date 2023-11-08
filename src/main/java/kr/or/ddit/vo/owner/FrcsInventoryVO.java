package kr.or.ddit.vo.owner;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FrcsInventoryVO {

	private String frcsId;
	private String vdprodCd;
	private int invntryQy;
	private int proprtQy;
	private Date lastwrhousngDate;
	private String vdprodName;
	private int hdforwardPrice;
	private int dlivyQy;	// 월 출고수량
	private int frcsorderQy; 	// 월 입고 수량
	
	private int atorderQy;	// 자동발주
	
	private String frcsName;
	private String frcsAdd1;
	
	private String tradNo;	// 트레이딩 번호
	private int tradQy;	// 트레이딩 수량 
	private String frcsId2;	// 응답할 가맹점(트레이딩 재고 -처리할...)
}
