package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class VendorInventoryVO {
	
	private String vdprodCd; // 제품명 코드
	private String vdprodName; // 제품명
	private String vdmaxQy; // 한계 재고량
	private String vdremainQy; // 잔여 재고량
	
	private String vdorderQy; // 주문 수량
	private String vdforwardPrice; // 출고 단가
	private String vdprodLifestartday; // 유통기한 시작일
	private String vdprodLifeendday; // 유통기한 종료일
	
	private String vdCode;
	
	private int rnum;
	
}
