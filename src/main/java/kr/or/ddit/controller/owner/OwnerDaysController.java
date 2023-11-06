package kr.or.ddit.controller.owner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/owner")
public class OwnerDaysController {

	@RequestMapping(value="/days.do", method = RequestMethod.GET )
	public String ownerDaysCalendar() {
		return "owner/info/daysCalendar";
	}
	
}
