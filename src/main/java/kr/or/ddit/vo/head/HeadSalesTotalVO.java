package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class HeadSalesTotalVO {

	// 년도별 총 가격
	private int yearTotalfrcsAmt; 
	private int yearTotalfrcsRowal; 
	private int yearTotalfrcsorderAmt; 
	private int yearTotalselngPrice;
	private int yearTotalpurchasePrice;
	
	// 월별 총 가격
	private String allmonth;
	private int allmonthfrcsAmt;
	private int allmonthfrcsRowal; 
	private int allmonthfrcsorderAmt; 
	private int allmonthselngPrice;
	private int allmonthpurchasePrice;
}
