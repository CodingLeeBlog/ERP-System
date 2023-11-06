package kr.or.ddit.controller.owner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/owner")
public class OwnerAttendanceController {

	@RequestMapping(value="/attendance.do", method = RequestMethod.GET )
	public String ownerAttendanceCal() {
		return "owner/attendance/calendar";
	}
	
}
