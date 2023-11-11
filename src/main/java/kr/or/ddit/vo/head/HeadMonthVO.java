package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class HeadMonthVO {
	
	// 월별 총 가격
	private String month;					// 해당년도 월
	private int monthtotalPrice;			// 해당년도 월별 매출액
	private int monthtotalselngPrice;		// 해당년도 월별 판매액 (가맹점매입가 - 본사매입가)
	private int monthfrcsorderAmt;			// 해당년도 월별 가맹점매입가
	private int monthtotalselngPersonal;	// 해당년도 월별 판매비와 관리비
	private int monthfrcsAmt; 				// 해당년도 월별 총 가맹비
	private int monthfrcsRowal; 			// 해당년도 월별 총 로열티
	private int monthfrcspersonalCost;		// 해당년도 월별 인건비
	private int monthCogs;					// 해당년도 월별 매출원가 (매출액 - 매입가)
	private int monthpurchasePrice;			// 해당년도 월별 본사매입가 (입고단가 * 주문수량(headorder테이블))
	private int monthtotalprofitPrice;		// 해당년도 월별 영업이익 (매출원가 - 인건비)
	private int monthtotalincomePrice;		// 해당년도 당기순이익
	
	// 분기별
	private String quaterstartMonth;
	private String quaterendMonth;
	
	
}
