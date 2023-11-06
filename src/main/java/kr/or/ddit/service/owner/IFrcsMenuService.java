package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.member.ResVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;

public interface IFrcsMenuService {

	public List<FrcsMenuVO> frcsMenuList(String frcsId);
	public List<FrcsMenuVO> resfrcsMenuList(String frcsId);
	public ServiceResult resRegister(ResVO resVO);
	public void menuUpdate(FrcsMenuVO menu);
	public void headMenuUpdate(FrcsMenuVO frcsMenu);
	public FrcsMenuVO selectMenuImg(String frcsId);
	public void frcsMenuDelete(String frcsId);
	public ServiceResult frcsMenuInsert(FrcsMenuVO frcsMenuVO);

}
