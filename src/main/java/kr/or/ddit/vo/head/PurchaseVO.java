package kr.or.ddit.vo.head;

import java.util.Date;

import lombok.Data;

@Data
public class PurchaseVO {
   
   // 본사발주
   private String hdorderNo;         // 본사발주번호
   private String vdCode;            // 거래처코드
   private String hdorderDate;         // 발주일
   private int hdordertotalPrice;      // 총발주금액
   private String hdorderConfm;      // 승인여부
   private Date hdorderconfmDate;      // 승인일시
   private String hdorderReturn;      // 반려사유
   
   // 거래처
   private String vdName;            // 거래처이름
   private String vdPhone;         // 거래처전화번호
   private String vdPost;         // 거래처우편번호
   private String vdAdd1;            // 거래처기본주소
   private String vdAdd2;            // 거래처상세주소
   private String vdManager;      // 거래처담당자
   private String vdEmail;         // 거래처메일
   private String vdCategory;         // 거래처분류
   private String vdEtc;         // 의견
   private int rnum;
   
   // 본사발주상세
   private String vdprodCd;         // 제품명코드
   private String vdprodName;         // 제품명
   private int hdorderQy;            // 수량
   private int hdrcvPrice;            // 입고단가
   
   // 본사입고
   private Date hdrcvinDate;         // 입고일시
   private int hdrcvprodinQy;         // 입고수량
   
   // 거래처재고(VENDOR_INVENTORY)
   private int vdmaxQy;            // 거래처 한계재고량
   private int vdremainQy;            // 거래처 재고잔량
   private int vdforwardPrice;         // 거래처 출고단가
   private String vdprodlifestartDay;   // 거래처 유통기한시작일
   private String vdprodlifeendDay;      // 거래처 유통기한종료일
   private int vdrtrcvPrice;         // 거래처 최종입고단가
   
   // 본사재고(HEAD_INVENTORY)
   private int hdmaxQy;            // 본사한계재고량
   private int hdremainQy;            // 본사재고잔량
   private int hdforwardPrice;         // 본사출고단가
   private String hdprodLifestartday;   // 본사유통기한시작일
   private String hdprodLifeendday;   // 본사유통기한종료일
   private int hdrtrcvPrice;         // 본사최종입고단가
   
   private int thisMonth;          // 금월 총계
   private int thisDay;            // 금일 총계
}