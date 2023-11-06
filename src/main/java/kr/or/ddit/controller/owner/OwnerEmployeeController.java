package kr.or.ddit.controller.owner;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.owner.IFrcsEmployeeService;

@Controller
@RequestMapping("/owner")
public class OwnerEmployeeController {

	private IFrcsEmployeeService service;
	
	@RequestMapping(value="/emp.do", method = RequestMethod.GET )
	public String ownerEmpList(Model model) {
		
		
		
		return "owner/employee/empList";
	}
	
}
