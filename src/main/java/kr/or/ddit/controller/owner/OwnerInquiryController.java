package kr.or.ddit.controller.owner;

import java.util.List;

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
import kr.or.ddit.service.owner.IFrcsInquiryService;
import kr.or.ddit.vo.owner.FrcsInquiryVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/owner")
public class OwnerInquiryController {

	@Inject
	private IFrcsInquiryService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/inquiry.do", method = RequestMethod.GET )
	public String ownerInquiryList(Model model) {
		String frcsId = idService.getFrcsId();
		List<FrcsInquiryVO> frcsInqList = service.frcsInqList(frcsId);
		model.addAttribute("inqList", frcsInqList);
		return "owner/board/inquiryList";
	}
	
//	가맹점마다 문의번호를 지정해주려면 어떻게 해야할까...?
	@RequestMapping(value = "/inqDetail.do", method = RequestMethod.GET)
	public String ownerInquiryDetail(String inqryNo, Model model) {
		FrcsInquiryVO inqVO = service.frcsInqDetail(inqryNo);
		model.addAttribute("inqVO", inqVO);
		return "owner/board/inquiryDetail";
	}
	
	@RequestMapping(value = "/inqForm.do", method = RequestMethod.GET)
	public String ownerInquiryForm() {
		return "owner/board/inquiryForm";
	}
	
	@RequestMapping(value = "/inqInsert.do", method = RequestMethod.POST)
	public String ownerInquiryInsert(
			HttpServletRequest req,
			RedirectAttributes ra,
			FrcsInquiryVO FrcsInqVO, Model model 
			) {
		
		String goPage = "";
		String frcsId = idService.getFrcsId();
		FrcsInqVO.setFrcsId(frcsId); //로그인한 사용자 설정
		ServiceResult result = service.inqInsert(req,FrcsInqVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "문의글 등록 완료!");
			goPage = "redirect:/owner/inqDetail.do?inqryNo=" + FrcsInqVO.getInqryNo();
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요.");
			goPage = "board/inquiryForm";
		}
		
		return goPage;
	}
	
	@RequestMapping(value = "/inqUpdate.do", method = RequestMethod.GET)
	public String ownerInquiryUpdateForm(String inqryNo, Model model) {
		FrcsInquiryVO frcsInquiryVO = service.frcsInqDetail(inqryNo);
		model.addAttribute("inqVO", frcsInquiryVO);
		model.addAttribute("status", "u");
		return "owner/board/inquiryForm";
	}
	
	@RequestMapping(value = "/inqUpdate.do", method = RequestMethod.POST)
	public String ownerInquiryUpdate(
			HttpServletRequest req,
			RedirectAttributes ra,
			FrcsInquiryVO frcsInquiryVO, Model model) {
		String goPage = "";
		ServiceResult result = service.frcsInqUpdate(req, frcsInquiryVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "수정이 완료되었습니다!");
			goPage = "redirect:/owner/inqDetail.do?inqryNo=" + frcsInquiryVO.getInqryNo();
		}else {
			model.addAttribute("message", "수정에 실패했습니다!");
			model.addAttribute("inqVO", frcsInquiryVO);
			model.addAttribute("status", "u");
			goPage = "board/inquiryForm";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/inqDelete.do", method = RequestMethod.POST)
	public String ownerInquiryDelete(
			RedirectAttributes ra,
			String inqryNo, Model model) {
		String goPage = "";
		ServiceResult result = service.frcsInqDelete(inqryNo);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
			goPage = "redirect:/owner/inquiry.do";
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "redirect:/owner/inqDetail.do?inqryNo="+ inqryNo;
		}
		return goPage;
	}
	
}
