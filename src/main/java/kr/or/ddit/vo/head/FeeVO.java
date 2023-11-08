package kr.or.ddit.vo.head;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FeeVO {
	
   // 가맹점주
   private String memId;         // 가맹점주ID
   private String memName;         // 가맹점주이름
   private String memTel;         // 가맹점주 연락처
   private String memEmail;      // 가맹점주 이메일

   // 가맹점
   private String frcsName;      // 가맹점명
   
   // 가맹점발주
   private String frcsorderDate;         // 발주일
   
	// 본사 가맹비 총괄
	private String feeCode;					// 청구코드
	private String frcsId;          		// 가맹점코드
	private Date feeDday;           		// 납부기준일
	private int feeTotalpay;        		// 총납부금액 (가맹비 + 로열티 + 제품구입비)
	private String feeStatus;       		// 납부여부
	private Date feeChargedate;     		// 청구일자
	private Date feePaydate;       			 // 납부일자
	private int nonpaymentCount;   // 미납횟수
	private int rnum;            // 순번
	
	private Date thisMonth;	// 오늘 기준 년월
	
	// 가맹비 상세
	private int frcsAmt;            		// 가맹비
	private int frcsRowal;          		// 로열티
	private int orderAmt;           		// 제품 구입비
	private int tradAdd;            		// 트레이딩 추가결제비
	private int tradRedct;          		// 트레이딩 삭감비
	private int frcsNonpayment;     		// 미납금
	private String frcsNonpaydate;    		// 미납연월
	private int frcsbillOverdue;    		// 연체이자
	private Date settleDate;        		// 정산일자
	private String settleAt;        		// 정산여부
	private int nonpayTotal;      // 미납입금총액
	
    private int total;            // 총계
    List<StoreOrderHistoryVO> modalData;   // 미납내역 모달안에 담을 데이터
	// 본사 년도별 매출 분석
	private int yearTotalPrice;				// 년도별 매출액 (가맹비 + 로열티 + 승인된 (가맹점 판매가 - 입고단가)
	private int yearTotalfrcsAmt;           // 년도별 총 가맹비
	private int yearTotalfrcsRowal;			// 년도별 총 로열티 
	private int yearTotalfrcsorderAmt;		// 년도별 총 매입가
	private int yearTotalselngPrice;		// 년도별 총 매입액
	private int yearTotalsalePrice;			// 년도별 총 매출원가
	private int yearTotalpurchasePrice; 	// 년도별 총 매입가 (승인된 본사 주문(입고단가 * 주문수량))
	private int yearTotalprofitPrice; 		// 년도별 총 영업이익 (매출액 - 매입가 - 인건비)
	private int yearTotalincomePrice; 		// 년도별 총 당기순이익 (영업이익 - 세금(10%))

	// 본사 년도별 매출 분석
	private int monthTotalPrice;			// 월별 매출액 (가맹비 + 로열티 + 승인된 (가맹점 판매가 - 입고단가)
	private int monthTotalfrcsAmt;          // 월별 총 가맹비
	private int monthTotalfrcsRowal;		// 월별 총 로열티 
	private int monthTotalfrcsorderAmt;		// 월별 총 매입가
	private int monthTotalselngPrice;		// 월별 총 매입액
	private int monthTotalsalePrice;		// 월별 총 매출원가
	private int monthTotalpurchasePrice; 	// 월별 총 매입가 (승인된 본사 주문(입고단가 * 주문수량))
	private int monthTotalprofitPrice; 		// 월별 총 영업이익 (매출액 - 매입가 - 인건비)
	private int monthTotalincomePrice; 		// 월별 총 당기순이익 (영업이익 - 세금(10%))
}
