package kr.or.ddit.vo.head;

import java.util.Date;

import lombok.Data;

@Data
public class HeadSalesChartVO {
	
	private String frcsId;
	private String selngNo;
	private String selngDate;
	private int selngPrice;
	private int selngQy;
	private String menuCd;
	private int sales;
	private String type;
	
	private int month;
	private String monthStr;
}
