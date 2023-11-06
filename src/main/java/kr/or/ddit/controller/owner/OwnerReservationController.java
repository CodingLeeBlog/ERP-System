package kr.or.ddit.controller.owner;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsReservationService;
import kr.or.ddit.vo.owner.FrcsReservationVO;

@Controller
@RequestMapping("/owner")
public class OwnerReservationController {

	@Inject
	private IFrcsReservationService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@RequestMapping(value = "/resv.do", method = RequestMethod.GET)
	public String ownerResList(Model model) {
		String frcsId = idService.getFrcsId();
		List<FrcsReservationVO> frcsResvList = service.frcsResvList(frcsId);
		model.addAttribute("resvList", frcsResvList);
		return "owner/reservation/resvList";
	}
}
