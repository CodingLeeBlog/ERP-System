package kr.or.ddit.controller.owner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/owner")
public class OwnerTradingController {

	@RequestMapping(value="/trading.do", method = RequestMethod.GET)
	public String tradingRequest() {
		return "owner/trading/tradingRequest";
	}
	
	@RequestMapping(value="/tradingList.do", method = RequestMethod.GET)
	public String tradingHistoryList() {
		return "owner/trading/tradingHistory";
	}
}
