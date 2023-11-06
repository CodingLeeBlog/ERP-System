package kr.or.ddit.controller.owner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/owner")
public class OwnerLoginController {

	@RequestMapping(value="/home.do", method= RequestMethod.GET)
	public String ownermainForm() {
		return "owner/main/home";
	}
}
