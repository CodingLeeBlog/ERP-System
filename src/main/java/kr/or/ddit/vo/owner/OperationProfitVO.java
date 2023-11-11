package kr.or.ddit.vo.owner;

import lombok.Data;

@Data
public class OperationProfitVO {

	private int sales;	//매출액
	private int headCharge; // 본사청구금
	private int pay= 1500000;	// 인건비
	private int publicDues;	//공과금
	private int operationProfit;	// 영업이익
	private int currentIncome;	// 당기순이익
	
	private String frcsId;
	private String thisMonth;
	
}
