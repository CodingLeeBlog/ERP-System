package kr.or.ddit.controller.owner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.service.owner.IFrcsTotalProfitService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;

@Controller
@RequestMapping("/owner")
public class OwnerTotalProfitController {

	@Inject
	private IFrcsTotalProfitService service;
	
	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	// 매출 총이익 분석
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/totalProfit.do", method = RequestMethod.GET)
	public String totalProfitList(@RequestParam(name="yearMonth", required=false) String yearMonth,
									Model model) {
		
		String frcsId = commService.getFrcsId();
		
		//헤더 오른쪽 관리자 영역
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(yearMonth);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	
		
		// 한달 매출 총이익
		FrcsDailySalesVO oneTotalProfit = service.getTotalOneMonthList(frcsId,thisMonth);
		
		model.addAttribute("frcsId", frcsId);
		model.addAttribute("yearMonth", yearMonth);
		model.addAttribute("oneTotalProfit", oneTotalProfit);
		
		return "owner/purchaseSales/totalProfit";
		
	}
	
	// 1개월 매출 총이익 분석 ajax
	@ResponseBody
	@RequestMapping(value="/totalProfit/oneMonth.do", method = RequestMethod.POST)
	public ResponseEntity<FrcsDailySalesVO> oneTotalProfit(@RequestBody FrcsDailySalesVO salesVO){
		
		FrcsDailySalesVO oneTotalList = service.getOneTotal(salesVO);
		
		return new ResponseEntity<FrcsDailySalesVO>(oneTotalList, HttpStatus.OK);
	}
	
	
	// 3개월 매출 총이익 분석
	@ResponseBody
	@RequestMapping(value="/totalProfit/threeMonth.do", method = RequestMethod.POST)
	public ResponseEntity<FrcsDailySalesVO> threeTotalProfit(@RequestBody FrcsDailySalesVO salesVO){
		
		FrcsDailySalesVO threeTotalList = service.getThreeTotal(salesVO);
		
		return new ResponseEntity<FrcsDailySalesVO>(threeTotalList, HttpStatus.OK);
	}
	
	// 6개월 매출 총이익 분석
	@ResponseBody
	@RequestMapping(value="/totalProfit/sixMonth.do", method = RequestMethod.POST)
	public ResponseEntity<FrcsDailySalesVO> sixTotalProfit(@RequestBody FrcsDailySalesVO salesVO){
		
		FrcsDailySalesVO sixTotalList = service.getSixTotal(salesVO);
		
		return new ResponseEntity<FrcsDailySalesVO>(sixTotalList, HttpStatus.OK);
	}
	
	// 12개월 차트
	@ResponseBody
	@RequestMapping(value="/totalProfit/chart.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsDailySalesVO>> totalProfitChart(String frcsId){
		
		List<FrcsDailySalesVO> monthsList = service.getTotalProfitChart(frcsId);
		
		return new ResponseEntity<List<FrcsDailySalesVO>>(monthsList, HttpStatus.OK);
	}
}
