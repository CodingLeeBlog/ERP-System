package kr.or.ddit.vo.member;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ResVO {

	private String resvNo;
	private String memId;
	private String resvMcnt;
	private String resvTime;
	private int resvPrice;
	private Date resvDate;
	private String resvYn;
	private String resvState;
	private Date resvAccDate;
	private String resvNote;
	private String reviewYn;
	private String seatCd;
	private String memcpnId;
	
	List<MenuListVO> menuList;
	
	// sql쿼리문 추가부분
	private String frcsId;
	private String frcsName;
}
