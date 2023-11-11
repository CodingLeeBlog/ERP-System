package kr.or.ddit.vo.head;

import java.util.List;

import lombok.Data;

@Data
public class StoreOrderHistoryVO {
	
	private String frcsorderNo;			// 발주번호
	private String frcsorderDate;		// 발주일
	private String frcsorderAmt;		// 총발주금액
	private String frcsorderConfm;		// 승인여부
	private String frcsorderConfmdate;	// 승인일시
	private String frcsorderReturn;		// 반려사유
	private String frcsId;				// 가맹점코드
	private String frcsName;			// 가맹점명
	private String frcsPost;			// 우편번호
	private String frcsAdd1;			// 기본주소
	private String frcsAdd2;			// 상세주소
	private String frcsorderName;		// 주문내역 (땅콩 1EA 외 3건)
	
	private String vdprodCd;			// 제품명코드
	private String frcsorderQy;			// 주문수량
	private String hdforwardPrice;		// 발주당시출고단가

	private String vdprodName;			// 제품명
	private String hdmaxQy;				// 한계재고량
	private String hdremainQy;			// 재고잔량
	private String vdprodLifestartday;	// 유통기한시작일
	private String vdprodLifeendday;	// 유통기한종료일
	private String hdrtrcvPrice;		// 최종입고단가
	private String vdCode;				// 거래처코드
	
	private int rnum;
	
	private List<CancleModalVO> dataList;
	
	private int totalPrice;	// 총액
	
	private String storeOrderDetailSearch; // 가맹점주문 상세 가맹점명 검색
	
	private String frcsNonpaydate;					// 미납월
}
