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
	private String alarmUrl;
	private String memId; //보내는 사람 memId
	private String receiveMemId; //받는 사람 memId
	private String tblName;	//테이블명
	private String tblNo;	//그 테이블의 기본키

	//alarm에 넣기 위한 변수
	private int tableNo;
	private int reviewNo;
	private String resvNo;
	private String ansNo;
	
	
}