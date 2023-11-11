package kr.or.ddit.controller.mainhome;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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

	/**
	 * 메인 홈페이지 페이지 리턴 기능
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mainForm(Model model) {
		return "mainhome/main/home";
	}
	
	/**
	 * 메인 홈페이지 매장 페이지 리턴 기능
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/store/find.do", method = RequestMethod.GET)
	public String mapForm(String frcsName, String frcsreview, Model model) {
		model.addAttribute("resfrcsName", frcsName);
		model.addAttribute("resfrcsReview", frcsreview);
		return "mainhome/store/home3";
	}
	
	/**
	 * 매장 페이지 매장 목록 조회 기능(ajax 비동기처리)
	 * @param map
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 메인 홈페이지 창업 문의 페이지 리턴 기능
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/consult.do", method = RequestMethod.GET)
	public String consultForm(Model model) {
		return "mainhome/consult/consultForm";
	}
	
	/**
	 * 창업 문의 페이지 문의하기 기능(ajax 비동기 처리)
	 * @param ownerVO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/consult.do")
	public ResponseEntity<ServiceResult> consult(@RequestBody OwnerVO ownerVO) {
		ServiceResult result = memberService.consult(ownerVO);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	
	/**
	 * 창업 문의 비동기 처리로 인한 주석처리
	 * @param req
	 * @param ownerVO
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "/consult.do", method = RequestMethod.POST)
//	public String consult(
//			HttpServletRequest req,
//			OwnerVO ownerVO, 
//			Model model) {
//		String goPage = "";
//		
//		Map<String, String> errors = new HashMap<String, String>();
//		
//		if(StringUtils.isBlank(ownerVO.getOwnerName())) {
//			errors.put("ownerName", "이름을 입력해주세요!");
//		}
//		if(errors.size() > 0) {
//			model.addAttribute("errors", errors);
//			model.addAttribute("owner", ownerVO);
//			goPage = "mainhome/consult/consultForm";
//		}else {
//			ServiceResult result = memberService.consult(ownerVO);
//			if(result.equals(ServiceResult.OK)) {
//				goPage = "redirect:/elly/consultsuccess.do";
//			}else {
//				model.addAttribute("bodyText", "register-page");
//				model.addAttribute("message", "서버 에러, 다시 시도해주세요!");
//				model.addAttribute("owner", ownerVO);
//				goPage = "mainhome/consult/consultForm";
//			}
//		}
//		return goPage;
//	}
	
	/**
	 * 창업 문의 성공시 페이지 리턴(ajax 비동기처리로 주석 처리)
	 * @param req
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "/consultsuccess.do", method = RequestMethod.GET)
//	public String consultSuccess(HttpServletRequest req, Model model) {
//		return "mainhome/consult/consultSuccess";
//	}
}
