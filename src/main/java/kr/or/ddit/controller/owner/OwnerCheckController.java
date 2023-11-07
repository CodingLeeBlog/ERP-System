package kr.or.ddit.controller.owner;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.owner.IFrcsCheckService;
import kr.or.ddit.service.owner.IFrcsIdService;

@Controller
@RequestMapping("/owner")
public class OwnerCheckController {

	@Inject
	private IFrcsCheckService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/check.do", method = RequestMethod.GET )
	public String ownerCheckList() {
		return "owner/check/checkList";
	}
	
}
