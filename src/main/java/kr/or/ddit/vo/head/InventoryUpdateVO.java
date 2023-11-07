package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class InventoryUpdateVO {
	
	// FRCS_INVENTORY(가맹점 재고)
	private String frcsId; 
	private String vdprodCd;
	private int invntryQy; 
	private String proprtQy;
	private String lastwrhousngDate;
	
	// FRCSORDER_DETAIL(가맹점 주문상세)
	private String frcsorderNo;
	private int frcsorderQy; 
	private String hdforwardPrice;
	
	// HEAD_INVENTORY(본사 재고)
	private String vdprodName;
	private String hdmaxQy;
	private int hdremainQy;
	private String hdprodlifestartDay;
	private String hdprodlifeendDay;
	private String hdrtrcvPrice;
	private String vdCode;
}
