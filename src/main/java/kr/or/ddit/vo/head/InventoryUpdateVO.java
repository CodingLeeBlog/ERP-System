package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class InventoryUpdateVO {
	
	// FRCS_INVENTORY(가맹점 재고)
	private String frcsId; 				// 가맹점코드
	private String vdprodCd;			// 제품명코드
	private int invntryQy; 				// 재고수량
	private String proprtQy;			// 적정재고수량
	private String lastwrhousngDate;	// 최종입고일시
	
	// FRCSORDER_DETAIL(가맹점 주문상세)
	private String frcsorderNo;			// 발주번호
	private int frcsorderQy; 			// 주문수량
	private String hdforwardPrice;		// 발주당시출고단가
	
	// HEAD_INVENTORY(본사 재고)
	private String vdprodName;
	private String hdmaxQy;
	private int hdremainQy;
	private String hdprodlifestartDay;
	private String hdprodlifeendDay;
	private String hdrtrcvPrice;
	private String vdCode;
}
