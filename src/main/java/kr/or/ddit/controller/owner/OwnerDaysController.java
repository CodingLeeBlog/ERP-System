package kr.or.ddit.controller.owner;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.owner.FranchiseVO;

@Controller
@RequestMapping("/owner")
public class OwnerDaysController {
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@Inject
	private IFrcsIdService idService;

	@RequestMapping(value="/days.do", method = RequestMethod.GET )
	public String ownerDaysCalendar(Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		return "owner/info/daysCalendar";
	}
	
}
