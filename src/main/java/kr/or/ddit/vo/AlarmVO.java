package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AlarmVO {
	private int alarmNo;
	private int alarmCnt;
	private Date alarmDate;
	private String alarmRead;
	private String alarmContent;
	private String memId;
	private String alarmUrl;
	private String frcsId;
	private String ansId;
	

	//alarmUrl에 넣기 위한 변수
	private int tableNo;
	private int reviewNo;
	
	
}
