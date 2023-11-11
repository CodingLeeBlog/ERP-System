package kr.or.ddit.vo.owner;

import java.util.Date;

import lombok.Data;

@Data
public class FrcsBillVO {

	private String feeCode;		// 청구코드
	private String frcsId;		// 가맹점코드
	private int frcsAmt = 500000;		// 가맹비
	private int frcsRowal;		// 로열티
	private int orderAmt;		// 제품 구입비
	private int tradAdd;		// 트레이딩 추가결제비
	private int tradRedct;		// 트레이딩 삭감비
	private int frcsNonPayment;	// 미납금
	private String frcsNonPayDate;	// 미납년월
	private int frcsbillOverdue;	// 연체이자
	private Date settleDate;	// 정산일자
	private String settleAt;	// 정산여부
	
	private Date thisMonth;	// 오늘 기준 년월
	private String yearMonth;
	
	private int feeTotalPay; // 총 청구금액
	
}
