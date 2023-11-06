package kr.or.ddit.vo.owner;

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
	private int totalPrice;	// 일자별 총 금액
	
}
