package kr.or.ddit.controller.head.store;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class MaintenanceCostController {

	@RequestMapping(value = "/maintenanceCost.do")
	public String maintenanceCost(Model model) {
		log.info("maintenanceCost() GET -> 시작");
		return "head/store/maintenanceCost";
	}
	
	@RequestMapping(value = "/maintenanceCostDetail.do", method=RequestMethod.GET)
	public String maintenanceCostDetail(Model model) {
		log.info("maintenanceCostDetail() GET -> 시작");
		return "head/store/maintenanceCostDetail";
	}
}
