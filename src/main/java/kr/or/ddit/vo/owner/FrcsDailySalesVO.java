package kr.or.ddit.vo.owner;

import java.sql.Timestamp;
import java.util.Date;


import lombok.Data;

@Data
public class FrcsDailySalesVO {
	
	private String selngNo;
	private Date selngDate;
	private int selngPrice;
	private int selngQy;	
	private String menuCd;
	private String frcsId;
	private String menuName;
	
	private int totalPrice;	// 조건별 총 금액
	private int totalorderPrice; // 조건별 발주 총 금액
	private int totalResult; // 조건별 결과 금액
	
	private String selngDateStr;	// 날짜데이터 string으로 받아오기
	private Timestamp selngDate2;	// Timestamp 데이터
	
	private String thisMonth;
	
	private int cnt;	
	private String name;
	private int value;
}
