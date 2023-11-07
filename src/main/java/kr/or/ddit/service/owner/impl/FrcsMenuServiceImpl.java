package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.member.MyCouponMapper;
import kr.or.ddit.mapper.owner.FrcsMenuMapper;
import kr.or.ddit.service.owner.IFrcsMenuService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AttachVO;
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
	 * 매장 페이지 회원 예약 등록 기능
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
				frcsmenuMapper.menuInsert(menuListVO);
			}
			
			if(resVO.getMemcpnId() == null) {				
				result = ServiceResult.OK;
			}else {
				mycouponMapper.deletemyCoupon(resVO.getMemcpnId());
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
	public void menuUpdate(FrcsMenuVO menu) {
		frcsmenuMapper.menuUpdate(menu);
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
	public void frcsMenuDelete(String frcsId) {
		frcsmenuMapper.frcsMenuDelete(frcsId);
	}

	@Override
	public ServiceResult frcsMenuInsert(FrcsMenuVO frcsMenuVO) {
		ServiceResult result = null;
		int status = frcsmenuMapper.frcsMenuInsert(frcsMenuVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

}
