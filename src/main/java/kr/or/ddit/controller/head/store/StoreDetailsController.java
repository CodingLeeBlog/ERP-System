package kr.or.ddit.controller.head.store;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.head.IStoreInquiryService;
import kr.or.ddit.vo.head.TotalInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class StoreDetailsController {

		@Inject
		private IStoreInquiryService service;
	
		@PreAuthorize("hasRole('ROLE_HEAD')")
	   @RequestMapping(value = "/storeDetails.do")
	   public String storeDetails(
	         @RequestParam("frcsName") String frcsName,
	         @RequestParam("memId") String memId,
	         Model model) {
	      log.debug("StoreDetailsController -> storeDetails() GET -> 시작");
	      
	      log.info("쿼리스트링으로 넘어온 memId -> ",memId);
	      log.info("쿼리스트링으로 넘어온 frcsName -> ",frcsName);
	      
	      TotalInfoVO memberTotal = service.selectMemberDetail(memId);
	      TotalInfoVO frcsTotal = service.selectFrcsDetail(frcsName);
	      
	      model.addAttribute("memberTotal",memberTotal);
	      model.addAttribute("frcsTotal",frcsTotal);
	      
	      return "head/store/storeDetails";
	   } 

}
