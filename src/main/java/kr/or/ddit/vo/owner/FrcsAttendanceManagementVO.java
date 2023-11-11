package kr.or.ddit.vo.owner;

import lombok.Data;

@Data
public class FrcsAttendanceManagementVO {

	private String atndNo; //근태번호
	private String frcsEmpCd; //직원코드
	private String frcsId; //가맹점 코드
	private String atndTy; //근태 유형 휴가/결근/조퇴
	private String atndStymd; //시작날짜
	private String atndEnymd; //끝날짜
	private String atndTtl; //제목
	private String atndCn; //내용
	private String atndColor; //컬러
	
	//비교할 이전 시작 날짜, 끝 날짜
	private String OldAtndStymd; //이전 시작날짜
	private String OldAtndEnymd; //이전 끝날짜
	public String FrcsEmpNm; //직원이름
	
}
