package kr.or.ddit.service.owner.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.member.MyCouponMapper;
import kr.or.ddit.mapper.owner.FrcsMenuMapper;
import kr.or.ddit.service.owner.IFrcsMenuService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.MenuVO;
import kr.or.ddit.vo.member.MenuListVO;
import kr.or.ddit.vo.member.ResVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FrcsMenuServiceImpl implements IFrcsMenuService {

	@Inject
	private FrcsMenuMapper frcsmenuMapper;
	
	@Inject
	private MyCouponMapper mycouponMapper;

	@Override
	public List<FrcsMenuVO> frcsMenuList(String frcsId) {
		return frcsmenuMapper.frcsMenuList(frcsId);
	}
	
	@Override
	public List<FrcsMenuVO> resfrcsMenuList(String frcsId) {
		return frcsmenuMapper.resfrcsMenuList(frcsId);
	}
	
	/**
	 * 마른안주 조회 서비스 로직
	 * @param frcsId 가맹점 코드
	 * @return List<FrcsMenuVO> 리스트 리턴
	 */
	@Override
	public List<FrcsMenuVO> dryfrcsMenuList(String frcsId) {
		
		List<FrcsMenuVO> resMenuList = frcsmenuMapper.resfrcsMenuList(frcsId);
		
		List<FrcsMenuVO> dryMenu = new ArrayList<FrcsMenuVO>();
		
		for(int i = 0; i < resMenuList.size(); i++) {
			
			if(resMenuList.get(i).getMenuCg().equals("마른안주")) {
				dryMenu.add(resMenuList.get(i));
			}
		}
		return dryMenu;
	}

	/**
	 * 튀김 조회 서비스 로직
	 * @param frcsId 가맹점 코드
	 * @return List<FrcsMenuVO> 리스트 리턴
	 */
	@Override
	public List<FrcsMenuVO> friedfrcsMenuList(String frcsId) {
		
		List<FrcsMenuVO> resMenuList = frcsmenuMapper.resfrcsMenuList(frcsId);
		
		List<FrcsMenuVO> friedMenu = new ArrayList<FrcsMenuVO>();
		
		for(int i = 0; i < resMenuList.size(); i++) {
			
			if(resMenuList.get(i).getMenuCg().equals("튀김안주")) {
				friedMenu.add(resMenuList.get(i));
			}
		}
		return friedMenu;
	}
	
	/**
	 * 식사안주 조회 서비스 로직
	 * @param frcsId 가맹점 코드
	 * @return List<FrcsMenuVO> 리스트 리턴
	 */
	@Override
	public List<FrcsMenuVO> mainfrcsMenuList(String frcsId) {
		
		List<FrcsMenuVO> resMenuList = frcsmenuMapper.resfrcsMenuList(frcsId);
		
		List<FrcsMenuVO> mainMenu = new ArrayList<FrcsMenuVO>();
		
		for(int i = 0; i < resMenuList.size(); i++) {
			
			if(resMenuList.get(i).getMenuCg().equals("식사안주")) {
				mainMenu.add(resMenuList.get(i));
			}
		}
		return mainMenu;
	}
	
	/**
	 * 주류메뉴 조회 서비스 로직
	 * @param frcsId 가맹점 코드
	 * @return List<FrcsMenuVO> 리스트 리턴
	 */
	@Override
	public List<FrcsMenuVO> drinkfrcsMenuList(String frcsId) {
		
		List<FrcsMenuVO> resMenuList = frcsmenuMapper.resfrcsMenuList(frcsId);
		
		List<FrcsMenuVO> drinkMenu = new ArrayList<FrcsMenuVO>();
		
		for(int i = 0; i < resMenuList.size(); i++) {
			
			if(resMenuList.get(i).getMenuCg().equals("주류메뉴")) {
				drinkMenu.add(resMenuList.get(i));
			}
		}
		return drinkMenu;
	}

	/**
	 * 매장 페이지 회원 예약 등록  및 쿠폰 사용 서비스 로직
	 *
	 */
	@Override
	public ServiceResult resRegister(ResVO resVO, AlarmVO alarmVO) {
		ServiceResult result = null;
		
		int status = frcsmenuMapper.resRegister(resVO);
		
		if(status > 0) {
			
			// 예약 완료시 알람데이터 넣기 
			String memId = resVO.getMemId(); // 작성자 가져오기 
			String resvNo = resVO.getResvNo(); //예약 번호
			alarmVO.setResvNo(resvNo);
			
			//1) FROM
			alarmVO.setMemId(memId);
			
			//2) WHAT
			alarmVO.setTblName("RESERVATION");
			alarmVO.setTblNo(resvNo);
			
			List<MenuListVO> menuList = resVO.getMenuList();
			
			for(int i = 0; i < menuList.size(); i++) {
				MenuListVO menuListVO = menuList.get(i);
				menuListVO.setResvNo(resvNo);
				frcsmenuMapper.menuInsert(menuListVO);
			}
			
			if(resVO.getMemcpnId() == null) {				
				result = ServiceResult.OK;
			}else {
				mycouponMapper.updatemyCoupon(resVO.getMemcpnId());
				result = ServiceResult.OK;			
			}
			
			//3) TO
			String receiveMemId = this.frcsmenuMapper.getReceiveMemId(resvNo);
			alarmVO.setReceiveMemId(receiveMemId);
			// 알람데이터 넣기 
			frcsmenuMapper.insertResAlarm(alarmVO);
			log.info("resRegister->alaramVO :" + alarmVO);
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult menuUpdate(HttpServletRequest req, FrcsMenuVO menu) {
		ServiceResult result = null;
		int status = frcsmenuMapper.menuUpdate(menu);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public void headMenuUpdate(FrcsMenuVO frcsMenu) {
		frcsmenuMapper.headMenuUpdate(frcsMenu);
	}

	@Override
	public FrcsMenuVO selectMenuImg(String frcsId) {
		return frcsmenuMapper.selectMenuImg(frcsId);
	}

	@Override
	public ServiceResult frcsMenuDelete(HttpServletRequest req, String frcsId) {
		ServiceResult result = null;
		int status = frcsmenuMapper.frcsMenuDelete(frcsId);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult frcsMenuInsert(HttpServletRequest req, FrcsMenuVO frcsMenuVO) {
		ServiceResult result = null;
		int status = frcsmenuMapper.frcsMenuInsert(frcsMenuVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<MenuVO> selectHeadMenu() {
		return frcsmenuMapper.selectHeadMenu();
	}

	@Override
	public ServiceResult newInsert(FrcsMenuVO frcs) {
		
		ServiceResult result = null;
		
		int status = frcsmenuMapper.newInsert(frcs);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<FrcsMenuVO> selectFrcsIdList(String frcsId) {
		return frcsmenuMapper.selectFrcsIdList(frcsId);
	}

}
