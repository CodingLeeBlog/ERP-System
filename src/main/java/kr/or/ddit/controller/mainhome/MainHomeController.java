package kr.or.ddit.controller.mainhome;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.owner.IFranchiseListService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/elly")
public class MainHomeController {
	
	@Inject
	private IMemberService memberService;
	
	@Inject
	private IFranchiseListService franchiseListService;

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mainForm(Model model) {
		return "mainhome/main/home";
	}
	
	@RequestMapping(value = "/store/find.do", method = RequestMethod.GET)
	public String mapForm(Model model) {
		return "mainhome/store/home3";
	}
	
	@ResponseBody
	@RequestMapping(value = "/store/list.do")
	public ResponseEntity<List<FranchiseVO>> storeList(@RequestBody Map<String, String> map, Model model){
		
		List<FranchiseVO> result = new ArrayList<>();
		FranchiseVO franchise = new FranchiseVO();
		
		String keyword = map.get("keyword").toString();
		String memId = map.get("memId").toString();
		franchise.setFrcsAdd1(keyword);
		franchise.setMemId(memId);
		
		result = franchiseListService.findStore(franchise);
		model.addAttribute("resultList", result);
		
		return new ResponseEntity<List<FranchiseVO>>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/consult.do", method = RequestMethod.GET)
	public String consultForm(Model model) {
		return "mainhome/consult/consultForm";
	}
	
	@RequestMapping(value = "/consult.do", method = RequestMethod.POST)
	public String consult(
			HttpServletRequest req,
			OwnerVO ownerVO, 
			Model model) {
		String goPage = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isBlank(ownerVO.getOwnerName())) {
			errors.put("ownerName", "이름을 입력해주세요!");
		}
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("owner", ownerVO);
			goPage = "mainhome/consult/consultForm";
		}else {
			ServiceResult result = memberService.consult(ownerVO);
			if(result.equals(ServiceResult.OK)) {
				HttpSession session = req.getSession();
				session.setAttribute("ownerId", ownerVO.getOwnerId());
				goPage = "redirect:/elly/consultsuccess.do";
			}else {
				model.addAttribute("bodyText", "register-page");
				model.addAttribute("message", "서버 에러, 다시 시도해주세요!");
				model.addAttribute("owner", ownerVO);
				goPage = "mainhome/consult/consultForm";
			}
		}
		return goPage;
	}
	
	@RequestMapping(value = "/consultsuccess.do", method = RequestMethod.GET)
	public String consultSuccess(HttpServletRequest req, Model model) {
		return "mainhome/consult/consultSuccess";
	}
}
