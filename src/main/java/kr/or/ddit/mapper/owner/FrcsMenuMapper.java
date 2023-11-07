package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.member.MenuListVO;
import kr.or.ddit.vo.member.ResVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;

public interface FrcsMenuMapper {

	public List<FrcsMenuVO> frcsMenuList(String frcsId);
	public List<FrcsMenuVO> resfrcsMenuList(String frcsId);
	public int resRegister(ResVO resVO);
	public void menuInsert(MenuListVO menuListVO);
	public void menuUpdate(FrcsMenuVO menu);
	public void headMenuUpdate(FrcsMenuVO frcsMenu);
	public FrcsMenuVO selectMenuImg(String frcsId);
	public void frcsMenuDelete(String frcsId);
	public int frcsMenuInsert(FrcsMenuVO frcsMenuVO);
	
	//예약할때 알림 등록
	public void insertResAlarm(AlarmVO alarmVO);
	public String getReceiveMemId(String resvNo);

}
