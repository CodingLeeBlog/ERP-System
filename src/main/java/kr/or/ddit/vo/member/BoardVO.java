package kr.or.ddit.vo.member;

import java.util.Date;
import java.util.List;

import kr.or.ddit.vo.member.MemberVO;
import lombok.Data;

@Data
public class BoardVO {
	
	private int tableNo;
	private String memId;
	private String field;
	private String boardTitle;
	private String boardContent;
	private int boardCount;
	private Date boardRegdate;
	private String boardState;
	
	//페이징 처리 시 활용
	private int rnum;
	//뷰의 테이블에서 순번으로 활용
	private int rnum2;

}
