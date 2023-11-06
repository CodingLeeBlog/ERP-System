package kr.or.ddit.vo.owner;

import java.util.Date;

import lombok.Data;

@Data
public class FrcsReservationVO {

	private String resvNo;
	private String memId;
	private String resvMcnt;
	private String resvTime;
	private Date resvDate;
	private String resvYn;
	private String resvState;
	private Date resvAccDate;
	private String resvNote;
	private String seatCd;
	private int resvPrice;
	private String reviewYn;
	
	private String menuCd;
	private String frcsId;
	private String menuCnt;
	
	private String menuName;
}
