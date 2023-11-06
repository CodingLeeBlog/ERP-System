package kr.or.ddit.controller.head.store;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class SalesAnalysisController {

	@RequestMapping(value = "/salesAnalysis.do", method=RequestMethod.GET)
	public String storeDetails(Model model) {
		log.info("salesAnalysis() GET -> 시작");
		return "head/store/salesAnalysis";
	} 
}
