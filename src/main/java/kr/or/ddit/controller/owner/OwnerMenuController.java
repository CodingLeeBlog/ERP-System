package kr.or.ddit.controller.owner;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.head.IMenuService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMenuService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.MenuVO;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerMenuController {

	@Inject
	private IFrcsMenuService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/menu.do", method = RequestMethod.GET )
	public String ownerMenuList(Model model) {
		
		String frcsId = idService.getFrcsId();
		List<FrcsMenuVO> frcsMenuList = service.frcsMenuList(frcsId);
		model.addAttribute("list", frcsMenuList);
		log.info("메뉴 : " + frcsMenuList.get(0).toString());
		
//		List<FrcsMenuVO> frcsMenu = service.selectMenuImg(frcsId);
//		FrcsMenuVO frcsMenuVO = service.selectMenuImg(frcsId);
//		model.addAttribute("frcsMenuVO", frcsMenuVO);
//		log.info("가맹메뉴 : " + frcsMenuVO);
		
		return "owner/info/menuList";
	}
	
//	본사메뉴를 가져와 저장하는 기능도 만들어야 할듯! 본사 메뉴코드만 가져와서 frcsId와 saleYn을 넣어 저장(값이 있을때는 업데이트 없을때는 인서트)...모달로해야하나..?
//	@RequestMapping(value="/menu.do", method = RequestMethod.POST )
//	public String ownerHeadMenuList(List<MenuVO> headMenuList, Model model) {
//		
//		for(MenuVO menuVO : headMenuList) {
//			
//			log.info("MenuCd : " + menuVO.getMenuCd());
//			log.info("FrcsId : " + idService.getFrcsId());
//			
//			FrcsMenuVO frcsMenu = new FrcsMenuVO();
//			frcsMenu.setMenuCd(menuVO.getMenuCd());
//			frcsMenu.setFrcsId(idService.getFrcsId());
//			frcsMenu.setSaleYn("Y");
//			
//			service.headMenuUpdate(frcsMenu);
//		}
//		
//		return "owner/info/menuList";
//	}
	
	// 기존에 등록해놓은 데이터가 있을경우 삭제후 입력, 데이터가 없을 경우 입력  < 가맹점아이디 기준으로 데이터 확인
//	@RequestMapping(value="/menuSet.do", method = RequestMethod.POST )
//	public String ownerHeadMenuSet(
//			RedirectAttributes ra,
//			FrcsMenuVO frcsMenuVO, Model model) {
//		String goPage = "";
//		String frcsId = idService.getFrcsId();
//		if(frcsId != null) {
//			service.frcsMenuDelete(frcsId);
//			frcsMenuVO.setFrcsId(frcsId);
//			String menuCd = frcsMenuVO.getMenuCd();
//			frcsMenuVO.setMenuCd(menuCd );
//			frcsMenuVO.setSaleYn("Y");
//			ServiceResult result = service.frcsMenuInsert(frcsMenuVO);
//			if(result.equals(ServiceResult.OK)) {
//				ra.addFlashAttribute("message", "본사 메뉴 업데이트 완료!");
//				goPage = "redirect:/owner/menu.do";
//			}else {
//				model.addAttribute("message", "서버에러, 다시 시도해주세요.");
//				goPage = "owner/info/menuList";
//			}
//			return goPage;
//		}else {
//			frcsMenuVO.setFrcsId(frcsId);
//			ServiceResult result = service.frcsMenuInsert(frcsMenuVO);
//			if(result.equals(ServiceResult.OK)) {
//				ra.addFlashAttribute("message", "본사 메뉴 업데이트 완료!");
//				goPage = "redirect:/owner/menu.do";
//			}else {
//				model.addAttribute("message", "서버에러, 다시 시도해주세요.");
//				goPage = "owner/info/menuList";
//			}
//			return goPage;
//		}
//	}
	
	@ResponseBody
	@RequestMapping(value = "/menuUpdate.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsMenuVO>> ownerMenuUpdate(
			@RequestBody List<FrcsMenuVO> frcsMenuList) {
		
		for(FrcsMenuVO menuVO : frcsMenuList) {
			log.info("menuCd : " + menuVO.getMenuCd());
			log.info("frcsId : " + idService.getFrcsId());
			log.info("saleYn : " + menuVO.getSaleYn());
			
			String menuCd = menuVO.getMenuCd();
			String frcsId = idService.getFrcsId();
			String saleYn = menuVO.getSaleYn();
			
			FrcsMenuVO menu = new FrcsMenuVO();
			menu.setMenuCd(menuCd);
			menu.setFrcsId(frcsId);
			menu.setSaleYn(saleYn);
			
			service.menuUpdate(menu);
		}
		
		return new ResponseEntity<List<FrcsMenuVO>>(HttpStatus.OK);
	}
	
}
