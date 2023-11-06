package kr.or.ddit.controller.head;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class HeadLoginController {
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String headmainForm(Model model) {
		return "head/main/home";
	}
}

