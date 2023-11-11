package kr.or.ddit.vo.head;

import java.util.Date;

import lombok.Data;

@Data
public class OpenPlanVO {

	private String frcsId;
	private String frcsName;
	private Date frcsInsdate;
	private Date frcsInedate;
	private Date frcsOpdate;
	private Date frcsCdate;
	private String fcmgHefc;
	private String fcmgIprgst;
	private String fcmgRemark;
	private int rnum;

}
