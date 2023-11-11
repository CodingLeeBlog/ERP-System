package kr.or.ddit.controller.owner;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.MenuVO;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FranchiseVO;
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
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/menu.do", method = RequestMethod.GET )
	public String ownerMenuList(Model model, FrcsMenuVO frcsMenuVO) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		List<FrcsMenuVO> validationId = service.selectFrcsIdList(frcsId);
		
		if(validationId.isEmpty()) {
			List<MenuVO> selectMenu = service.selectHeadMenu();
			for (MenuVO menuVO : selectMenu) {
				String menuCd = menuVO.getMenuCd();
				
				FrcsMenuVO frcs = new FrcsMenuVO();
				
				frcs.setFrcsId(frcsId);
				frcs.setMenuCd(menuCd);
				
				ServiceResult result = service.newInsert(frcs);
				
				log.info("신규가맹점주가 메뉴정보 들어갔을때 insert되는 메소드");
				log.debug("result결과 -> {}", result);
			}
		}
		
//		for (FrcsMenuVO fmVO : validationId) {
//			String frId = fmVO.getFrcsId();
//			if(!frId.equalsIgnoreCase(frcsId)){
//				List<MenuVO> selectMenu = service.selectHeadMenu();
//				for (MenuVO menuVO : selectMenu) {
//					String menuCd = menuVO.getMenuCd();
//					
//					FrcsMenuVO frcs = new FrcsMenuVO();
//					
//					frcs.setFrcsId(frcsId);
//					frcs.setMenuCd(menuCd);
//					
//					ServiceResult result = service.newInsert(frcs);
//					
//					log.info("신규가맹점주가 메뉴정보 들어갔을때 insert되는 메소드");
//					log.debug("result결과 -> {}", result);
//				}
//				break;
//			}
//		}
		
		List<FrcsMenuVO> frcsMenuList = service.frcsMenuList(frcsId);
		model.addAttribute("list", frcsMenuList);
		log.info("메뉴 : " + frcsMenuList);
		
//		String attachOrgname = frcsMenuVO.getAttachList().get(0).getAttachOrgname();
//		frcsMenuVO.setAttachOrgname(attachOrgname);
		
		return "owner/info/menuList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/menuUpdate.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsMenuVO>> ownerMenuUpdate(
			HttpServletRequest req,
			RedirectAttributes ra,
			@RequestBody List<FrcsMenuVO> frcsMenuList) {
		
		String goPage;
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
			
			ServiceResult result = service.menuUpdate(req, menu);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "저장이 완료되었습니다!");
				goPage = "redirect:/owner/menu.do";
			}else {
				ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
				goPage = "redirect:/owner/menu.do";
			}
		}
		
		return new ResponseEntity<List<FrcsMenuVO>>(HttpStatus.OK);
	}
	
	// 기존에 등록해놓은 데이터가 있을경우 삭제후 menu데이터 가져와 입력
	@RequestMapping(value="/menuSet.do", method = RequestMethod.POST )
	public String ownerHeadMenuSet(
			HttpServletRequest req,
			RedirectAttributes ra,
			FrcsMenuVO frcsMenuVO, Model model) {
		String goPage = "";
		String frcsId = idService.getFrcsId();
		frcsMenuVO.setFrcsId(frcsId);
		if(frcsId != null) {
			ServiceResult result = service.frcsMenuDelete(req, frcsId);
			if(result.equals(ServiceResult.OK)) {
				List<MenuVO> selectMenu = service.selectHeadMenu();
				for(MenuVO menuVO : selectMenu) {
					frcsMenuVO = new FrcsMenuVO();
					String menuCd = menuVO.getMenuCd();
					frcsMenuVO.setMenuCd(menuCd);
					frcsMenuVO.setFrcsId(frcsId);
					ServiceResult result2 = service.frcsMenuInsert(req, frcsMenuVO);
					if(result2.equals(ServiceResult.OK)) {
						ra.addFlashAttribute("message", "본사 메뉴 업데이트 완료!");
						goPage = "redirect:/owner/menu.do";
					}else {
						model.addAttribute("message", "업데이트 서버에러, 다시 시도해주세요.");
						goPage = "owner/info/menuList";
					}
				}
			}else {
				model.addAttribute("message", "삭제 서버에러, 다시 시도해주세요.");
				goPage = "owner/info/menuList";
			}
		}
		return goPage;
	}
	
	
	
}
