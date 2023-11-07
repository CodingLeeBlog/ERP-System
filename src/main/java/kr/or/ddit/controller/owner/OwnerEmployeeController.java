package kr.or.ddit.controller.owner;

import java.util.List;

import javax.inject.Inject;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsEmployeeService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;

@Controller
@RequestMapping("/owner")
public class OwnerEmployeeController {
	
	@Inject
	private IFrcsEmployeeService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/emp.do", method = RequestMethod.GET )
	public String ownerEmpList(Model model) {
		String frcsId = idService.getFrcsId();
		List<FrcsEmployeeVO> frcsEmpList = service.frcsEmpList(frcsId);
		model.addAttribute("empList", frcsEmpList);
		return "owner/employee/empList";
	}
	
	@RequestMapping(value = "/empInsert.do", method = RequestMethod.POST)
	public String ownerEmpInsert(
			RedirectAttributes ra,
			FrcsEmployeeVO frcsEmpVO, Model model) {
		String goPage = "";
		String frcsId = idService.getFrcsId();
		frcsEmpVO.setFrcsId(frcsId);
		ServiceResult result = service.frcsEmpInsert(frcsEmpVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "등록 완료!");
			goPage = "redirect:/owner/emp.do";
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요.");
			goPage = "owner/employee/empList";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/empUpdate.do", method = RequestMethod.POST)
	public String ownerEmpUpdate(
			RedirectAttributes ra,
			FrcsEmployeeVO frcsEmpVO, Model model) {
		
		String goPage = "";
		ServiceResult result = service.empUpdate(frcsEmpVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "수정이 완료되었습니다!");
			goPage = "redirect:/owner/emp.do";
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "owner/employee/empList";
		}
		return goPage;
	}
	
	@ResponseBody
	@RequestMapping(value = "/empDelete.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsEmployeeVO>> ownerEmpDelete(
			@RequestBody List<FrcsEmployeeVO> empDelList,
			RedirectAttributes ra){
		
		for(FrcsEmployeeVO frcsEmpVO : empDelList) {
			String frcsEmpCd = frcsEmpVO.getFrcsEmpCd();
			ServiceResult result = service.empDelete(frcsEmpCd);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
			}else {
				ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			}
		}
		return new ResponseEntity<List<FrcsEmployeeVO>>(HttpStatus.OK);
	}
	
}
