package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class FranchiseSalesAnalysisVO {

	// 회원테이블
	private String memId;
	private String memName;
	private String memTel;
	private String memEmail;
	private String ownerId;
	private String frcsId;
	// 가맹점테이블
	private String frcsName;
	private String frcsState;
	private String frcsTel;
	private String frcsPost;
	private String frcsAdd1;
	private String frcsAdd2;
	private String frcsOpdate;
	
	private int rnum;
	private int year;				// 쿼리로 받아온 연도
	private int curMonth;			// 해당 월
	private String yearMonth;		// 서비스로직에서 공과금 구하는 조건
	
	private int totalPrice; 		// 총 매출액
	private int variableCost;		// 판매비와관리비
	private int frcsCost;			// 가맹비
	private int frcsRowal;			// 로얄티
	private int personCost;			// 인건비
	private int publicduesTotal;	// 공과금(수도세 + 전기세 + 가스비 + 월세)
	private int originPrice;		// 매출원가(총매출액 - 매입가)
	private int purchasePrice;		// 매입가(가맹점이 본사에게 발주한금액)
	private int profitPrice;		// 영업이익(매출원가 - 판매비와관리비)
	private int incomePrice;		// 당기순이익(영업이익 - 세금(10%))
	
	// 차트에 월별 총매출 데이터
	private int monthTotal;			
	private int january;			// 1월
	private int february;           // 2월
	private int march;              // 3월
	private int april;              // 4월
	private int may;                // 5월
	private int june;               // 6월
	private int july;               // 7월
	private int august;             // 8월
	private int september;          // 9월
	private int october;            // 10월
	private int november;           // 11월
	private int december;           // 12월
	
	private int oneIncome;			// 당기순이익 1월
	private int twoIncome;			// 당기순이익 2월
	private int threeIncome;        // 당기순이익 3월
	private int fourIncome;         // 당기순이익 4월
	private int fiveIncome;         // 당기순이익 5월
	private int sixIncome;          // 당기순이익 6월
	private int sevenIncome;        // 당기순이익 7월
	private int eightIncome;        // 당기순이익 8월
	private int nineIncome;         // 당기순이익 9월
	private int tenIncome;          // 당기순이익 10월
	private int elevenIncome;       // 당기순이익 11월
	private int twelveIncome;       // 당기순이익 12월
}