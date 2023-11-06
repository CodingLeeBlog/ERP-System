package kr.or.ddit.service.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.MenuVO;

public interface IMenuService {

	public int selectMenuCount(HeadPaginationInfoVO<MenuVO> pagingVO);
	public List<MenuVO> selectMenuList(HeadPaginationInfoVO<MenuVO> pagingVO);
	public MenuVO menuDetail(String menuCd);
	public void menuRegister(HttpServletRequest req, MenuVO menuVO);
	public void menuDelete(String menuCd);
	public void menuUpdate(MenuVO menuVO);
	public List<MenuVO> getMenuListByCategory(HeadPaginationInfoVO<MenuVO> pagingVO);
	public int selectMemberMenuCount(HeadPaginationInfoVO<MenuVO> pagingVO);
	public AttachVO selectMenuFile(int attachNo);
}
