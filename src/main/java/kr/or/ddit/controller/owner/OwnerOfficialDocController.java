package kr.or.ddit.controller.owner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/owner")
public class OwnerOfficialDocController {

	@RequestMapping(value="/officialDoc.do", method = RequestMethod.GET )
	public String ownerOfficialDocList() {
		return "owner/board/officialDocList";
	}
	
}
