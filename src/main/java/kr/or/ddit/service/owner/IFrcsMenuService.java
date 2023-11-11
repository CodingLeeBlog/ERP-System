package kr.or.ddit.service.owner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.MenuVO;
import kr.or.ddit.vo.member.ResVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;

public interface IFrcsMenuService {

	public List<FrcsMenuVO> frcsMenuList(String frcsId);
	public ServiceResult resRegister(ResVO resVO, AlarmVO alarmVO);
	public ServiceResult menuUpdate(HttpServletRequest req, FrcsMenuVO menu);
	public void headMenuUpdate(FrcsMenuVO frcsMenu);
	public FrcsMenuVO selectMenuImg(String frcsId);
	public ServiceResult frcsMenuDelete(HttpServletRequest req, String frcsId);
	public ServiceResult frcsMenuInsert(HttpServletRequest req, FrcsMenuVO frcsMenuVO);
	public List<MenuVO> selectHeadMenu();
	/**
	 * 매장 페이지 회원 예약 등록 기능
	 *
	 */
	// 새로운 회원이면 메뉴 insert
	public ServiceResult newInsert(FrcsMenuVO frcs);
	public List<FrcsMenuVO> selectFrcsIdList(String frcsId);
	
	public List<FrcsMenuVO> resfrcsMenuList(String frcsId);
	public List<FrcsMenuVO> dryfrcsMenuList(String frcsId);
	public List<FrcsMenuVO> friedfrcsMenuList(String frcsId);
	public List<FrcsMenuVO> mainfrcsMenuList(String frcsId);
	public List<FrcsMenuVO> drinkfrcsMenuList(String frcsId);
	

}
