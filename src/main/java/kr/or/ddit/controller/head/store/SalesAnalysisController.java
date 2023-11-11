package kr.or.ddit.controller.head.store;

import java.time.LocalDate;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.head.ISalesAnalysisService;
import kr.or.ddit.vo.head.HeadMonthVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class SalesAnalysisController {
	
	@Inject
	private ISalesAnalysisService service;

	/**
	 * 본사 매출 분석 페이지 로드시 년도별 매출 분석 기능
	 * 
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/salesAnalysis.do", method=RequestMethod.GET)
	public String storeDetails(Model model) {
		
//		FeeVO feeVO = service.headChart();
//		
//		List<FeeVO> allmonthfeeVO = service.allmonthheadChart();
//		
//		model.addAttribute("feeVO", feeVO);
//		model.addAttribute("allmonthfeeVO", allmonthfeeVO);
		
		// 해당년도의 월별 매출 분석 기능
		List<HeadMonthVO> headmonthVO = service.headmonthChart();
		
		LocalDate now = LocalDate.now();
		
		String year = Integer.toString(now.getYear());
		String month = Integer.toString(now.getMonthValue()-1);
		String thismonth = year + "-" + month;
		
		model.addAttribute("thismonth", thismonth);
		model.addAttribute("monthList", headmonthVO);
		
		return "head/store/salesAnalysis";
	}
	
	/**
	 * 본사 해당년도 월별 매출분석
	 * 
	 * @param month 해당 월
	 * @return HeadMonthVO 타입으로 리턴
	 */
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/month/salesAnalysis.do")
	public ResponseEntity<HeadMonthVO> monthSalesDetails(@RequestBody HeadMonthVO month){
		
		HeadMonthVO monthVO = service.selectheadmonthChart(month);
		
		return new ResponseEntity<HeadMonthVO>(monthVO, HttpStatus.OK);
	}
	
	/**
	 * 본사 해당년도 월별 매출분석
	 * 
	 * @param month 해당 월
	 * @return HeadMonthVO 타입으로 리턴
	 */
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/allmonth/salesAnalysis.do")
	public ResponseEntity<List<HeadMonthVO>> allheadmonthChart(){
		
		List<HeadMonthVO> monthVO = service.allheadmonthChart();
		
		return new ResponseEntity<List<HeadMonthVO>>(monthVO, HttpStatus.OK);
	}
	
	/**
	 * 본사 해당년도 분기별 매출분석
	 * 
	 * @param month 해당 월
	 * @return HeadMonthVO 타입으로 리턴
	 */
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/quartermonth/salesAnalysis.do")
	public ResponseEntity<List<HeadMonthVO>> quarterheadmonthChart(){
		
		List<HeadMonthVO> monthVO = service.quarterheadmonthChart();
		
		return new ResponseEntity<List<HeadMonthVO>>(monthVO, HttpStatus.OK);
	}
	
	/**
	 * 본사 해당년도 분기별 매출분석
	 * 
	 * @param month 해당 월
	 * @return HeadMonthVO 타입으로 리턴
	 */
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/quaterDetails/salesAnalysis.do")
	public ResponseEntity<List<HeadMonthVO>> quarterheadmonthChartDetails(@RequestBody HeadMonthVO quater){
		
		List<HeadMonthVO> quatermonthVO = service.quarterheadmonthChartDetails(quater);
		
		return new ResponseEntity<List<HeadMonthVO>>(quatermonthVO, HttpStatus.OK);
	}
}
