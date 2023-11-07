package kr.or.ddit.vo.owner;

import java.util.Date;
import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.MenuVO;
import lombok.Data;

@Data
public class FrcsMenuVO {
	private String menuCd;
	private String frcsId;
	private String saleYn;
	
	public String menuName;
	public int menuPrice;
	public String menuDes;
	public String menuCg;
	public String menuState;
	public Date menuRsdate;
	public Date menuDeldate;
	public String tableName;
	
	private String attachOrgname;

	public List<AttachVO> attachList;
	public List<MenuVO> menuList;
	
	private Date selngDate;
}
