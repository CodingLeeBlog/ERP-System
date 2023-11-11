package kr.or.ddit.vo.owner;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.vo.member.MenuListVO;
import lombok.Data;

@Data
public class FrcsReservationVO {

	private String resvNo;
	private String memId;
	private String resvMcnt;
	private String resvTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date resvDate;
	private String resvYn;
	private String resvState;
	private Date resvAccDate;
	private String resvNote;
	private String seatCd;
	private int resvPrice;
	private String reviewYn;
	
	private List<MenuListVO> resvMenuList;
	
	private String menuCd;
	private String frcsId;
	private String menuCnt;
	private String menuName;
	
	
}
