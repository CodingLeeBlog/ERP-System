package kr.or.ddit.vo.owner;

import lombok.Data;

@Data
public class FrcsRestDayVO {

	private String rstdeNo; //휴무일번호
	private String frcsId; //가맹점 코드
	private String rstdeStymd; //시작날짜
	private String rstdeEnymd; //끝날짜
	private String rstdeTtl; //휴무일, 점검일
	private String rstdeColor; //색상
	
	//비교할 이전 시작 날짜, 끝 날짜
	private String OldRstdeStymd; //이전 시작날짜
	private String OldRstdeEnymd; //이전 끝날짜
	
	
	
}
