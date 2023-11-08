package kr.or.ddit.controller.owner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;

import kr.or.ddit.service.owner.IFrcsBillService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.vo.owner.FrcsBillVO;

@Controller
@RequestMapping("/owner")
public class OwnerBillController {

	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsBillService service;
	
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/bill.do", method = RequestMethod.GET)
	public String billList(@RequestParam(name="yearMonth", required = false) String yearMonth,
			Model model) {
		
		String frcsId = commService.getFrcsId();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(yearMonth);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	
		
		
		List<FrcsBillVO> billList = service.headBillList(frcsId,thisMonth);
		
		model.addAttribute("yearMonth", yearMonth);
		return "owner/payment/frcsBillList";
	}
}
