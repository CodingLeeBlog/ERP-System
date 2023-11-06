package kr.or.ddit.controller.head;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class HeadDashBoardController {
	
	@RequestMapping(value = "/dashboard.do", method=RequestMethod.GET)
	public String dashBoard(Model model) {
		log.info("dashBoard() GET -> 시작");
		return "head/dashboard/headDashBoard";
	}
	
	@RequestMapping(value = "/salesConsulting.do", method=RequestMethod.GET)
	public String salesConsulting(Model model) {
		log.info("salesConsulting() GET -> 시작");
		return "head/store/salesConsulting";
	}
	
	@RequestMapping(value = "/salesDetails.do", method=RequestMethod.GET)
	public String salesDetails(Model model) {
		log.info("salesDetails() GET -> 시작");
		return "head/store/salesDetails";
	}
}