package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.member.MyCouponMapper;
import kr.or.ddit.mapper.owner.FrcsMenuMapper;
import kr.or.ddit.service.owner.IFrcsMenuService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.member.MenuListVO;
import kr.or.ddit.vo.member.ResVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;

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
	public ServiceResult resRegister(ResVO resVO) {
		ServiceResult result = null;
		
		int status = frcsmenuMapper.resRegister(resVO);
		
		if(status > 0) {
			
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
