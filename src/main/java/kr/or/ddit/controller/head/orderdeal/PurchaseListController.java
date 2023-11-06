package kr.or.ddit.controller.head.orderdeal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class PurchaseListController {

	@RequestMapping(value = "/purchaseList.do", method=RequestMethod.GET)
	public String purchaseList(Model model) {
		log.info("purchaseList() GET -> 시작");
		return "head/orderDeal/purchaseList";
	}
	
	@RequestMapping(value = "/purchaseListDetails.do", method=RequestMethod.GET)
	public String purchaseListDetails(Model model) {
		log.info("purchaseListDetails() GET -> 시작");
		return "head/orderDeal/purchaseListDetails";
	}
}
