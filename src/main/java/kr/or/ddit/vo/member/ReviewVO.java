package kr.or.ddit.vo.member;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewNo;
	private String memId;
	private String resvNo;
	private String reviewContent;
	private int reviewStar;
	private Date reviewRegdate;
	private String reviewYn;
	private String frcsId;
	
	private String ansNo;
	private String ansCn;
	private Date ansYmd;
	private String ansId;
}
