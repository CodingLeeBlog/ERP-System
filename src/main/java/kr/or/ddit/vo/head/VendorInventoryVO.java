package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class VendorInventoryVO {
	
	private String vdProdCd; // 제품명 코드
	private String vdProdName; // 제품명
	private String vdMaxQy; // 한계 재고량
	private String vdRemainQy; // 잔여 재고량
	
	private String vdOrderQy; // 주문 수량
	private String vdForwardPrice; // 출고 단가
	private String vdprodLifestartday; // 유통기한 시작일
	private String vdprodLifeendday; // 유통기한 종료일
	
	private String vdCode;
	
	private int rnum;
	
}
