package kr.or.ddit.vo.head;

import java.util.List;

import lombok.Data;

@Data
public class HeadSalesTotalVO {

	// 년도별 총 가격
	private int yearTotalfrcsAmt; 			// 년도별 총 가맹비
	private int yearTotalfrcsRowal; 		// 년도별 총 로열티
	private int yearTotalselngPrice;		// 년도별 판매액
	private int yearTotalpurchasePrice;		// 년도별 매입가
	
	// 해당년도
	private String year;					// 해당년도
	private String startYear;				// 해당년도 1월1
	private String endYear;					// 해당년도 12월31일
	
	// 해당월
	List<HeadMonthVO> month;
}
