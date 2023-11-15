package kr.or.ddit.controller.owner;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.owner.FranchiseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerMyPageController {

	@Inject
	private IFrcsMyPageService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/mypageDetail.do", method = RequestMethod.GET )
	public String ownerMyPageDetail(Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		FranchiseVO frcs = service.detail(frcsId);
		model.addAttribute("frcs", frcs);
		return "owner/info/mypageDetail";
	}
	
	@RequestMapping(value="/mypageUpdate.do", method = RequestMethod.GET )
	public String ownerMyPageForm(Model model, String frcsId) {
//		String frcsId = idService.getFrcsId();
		FranchiseVO frcs = service.detail(frcsId);
		model.addAttribute("frcs", frcs);
		return "owner/info/mypageForm";
	}
	
	@RequestMapping(value="/mypageUpdate.do", method = RequestMethod.POST )
	public String ownerMyPageUpdate(
			HttpServletRequest req,
			RedirectAttributes ra,
			FranchiseVO franchiseVO, Model model) {
		log.info("franchiseVO : " + franchiseVO);
		String goPage = "";
		ServiceResult result = service.update(req, franchiseVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "수정이 완료되었습니다!");
			goPage = "redirect:/owner/mypageDetail.do";
		}else {
			model.addAttribute("message", "수정에 실패했습니다!");
			model.addAttribute("frcs", franchiseVO);
			goPage = "owner/info/myPageForm";
		}
		return goPage;
	}
	
}
