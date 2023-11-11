package kr.or.ddit.vo.head;

import java.util.Date;

import lombok.Data;

@Data
public class HeadLtDetailVO {
	
	private int hdLtno;
	private String hdLtreciever;
	private Date hdLtsddate;
	private String hdLtstate;
	
	private String memId;
	private String admin;
}
