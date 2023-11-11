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
import kr.or.ddit.service.owner.IFrcsSalesAnalysisService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;

@Controller
@RequestMapping("/owner")
public class OwnerSalesAnalysisController {

	@Inject
	private IFrcsSalesAnalysisService service;
	
	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	// 매출액 분석
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/salesAnalysis.do", method = RequestMethod.GET)
	public String salesList(@RequestParam(name="yearMonth", required=false) String yearMonth,
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
		
		// 한달 자료 가져오기
		List<FrcsDailySalesVO> oneMonthList = service.getOneMonthData(frcsId,thisMonth);
		
		model.addAttribute("frcsId", frcsId);
		model.addAttribute("yearMonth", yearMonth);
		model.addAttribute("oneMonthList", oneMonthList);
		
		return "owner/purchaseSales/salesAnalysis";
	}
	
	// 1개월 매출 분석 ajax
	@ResponseBody
	@RequestMapping(value="/salesAnalysis/oneMonth.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsDailySalesVO>> oneSalesAnalysis (@RequestBody FrcsDailySalesVO salesVO){

		List<FrcsDailySalesVO> oneSalesAnalysis = service.getOneSalesAnalysis(salesVO);
		
		return new ResponseEntity<List<FrcsDailySalesVO>>(oneSalesAnalysis, HttpStatus.OK);
	}
	
	// 3개월 매출 분석 
	@ResponseBody
	@RequestMapping(value="/salesAnalysis/threeMonth.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsDailySalesVO>> threeSalesAnalysis (@RequestBody FrcsDailySalesVO salesVO){

		List<FrcsDailySalesVO> threeSalesAnalysis = service.getThreeSalesAnalysis(salesVO);
		
		return new ResponseEntity<List<FrcsDailySalesVO>>(threeSalesAnalysis, HttpStatus.OK);
	}
	
	// 6개월 매출 분석
	@ResponseBody
	@RequestMapping(value="/salesAnalysis/sixMonth.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsDailySalesVO>> sixSalesAnalysis (@RequestBody FrcsDailySalesVO salesVO){

		List<FrcsDailySalesVO> sixSalesAnalysis = service.getSixSalesAnalysis(salesVO);
		
		return new ResponseEntity<List<FrcsDailySalesVO>>(sixSalesAnalysis, HttpStatus.OK);
	}
	
	// 매출 차트 (12개월)
	@ResponseBody
	@RequestMapping(value="/salesAnalysis/chart.do", method =RequestMethod.POST)
	public ResponseEntity<List<FrcsDailySalesVO>> salesAnalysisChart(String frcsId){
		
		List<FrcsDailySalesVO> salesAnalysisChart = service.getsalesAnalysisChart(frcsId);
		
		return new ResponseEntity<List<FrcsDailySalesVO>>(salesAnalysisChart, HttpStatus.OK);
	}

	
	
}
