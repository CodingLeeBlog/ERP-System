package kr.or.ddit.controller.owner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/owner")
public class OwnerCheckController {

	@RequestMapping(value="/check.do", method = RequestMethod.GET )
	public String ownerCheckList() {
		return "owner/check/list";
	}
	
}
