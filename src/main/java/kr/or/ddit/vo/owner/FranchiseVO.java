package kr.or.ddit.vo.owner;

import java.util.Date;

import lombok.Data;

@Data
public class FranchiseVO {
	private String frcsId;
	private String frcsName;
	private String frcsState;
	private String frcsTel;
	private Date frcsStdate;
	private Date frcsEnddate;
	private String frcsPost;
	private String frcsAdd1;
	private String frcsAdd2;
	private String frcsSttime;
	private String frcsEndtime;
	private Date frcsCdate;
	private Date frcsInsdate;
	private Date frcsInedate;
	private Date frcsOpdate;
	private double frcsXmap;
	private double frcsYmap;
	private int frcsStar;
	private int frcsPsncpa;
	
	private int ownerId;
	private String memId;
	private String memPw;
	private String resvNo;
	private String resvYn;
	private String reviewYn;
}
