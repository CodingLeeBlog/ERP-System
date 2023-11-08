package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class FranchiseSalesAnalysisVO {

	// 회원테이블
	private String memId;
	private String memName;
	private String memTel;
	private String memEmail;
	private String ownerId;
	private String frcsId;
	// 가맹점테이블
	private String frcsName;
	private String frcsState;
	private String frcsTel;
	private String frcsPost;
	private String frcsAdd1;
	private String frcsAdd2;
	private String frcsOpdate;
	
	private int rnum;
}
