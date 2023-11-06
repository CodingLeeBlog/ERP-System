package kr.or.ddit.controller.head.foundation;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.head.ISalesAreaService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.HeadSalesChartVO;
import kr.or.ddit.vo.head.TotalInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class SalesAreaController {
	
	@Inject
	private ISalesAreaService service;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/salesArea.do")
	public String salesArea(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchArea,
			Model model) {
		log.info("salesArea() GET -> 시작");
		
		HeadPaginationInfoVO<TotalInfoVO> pagingVO = new HeadPaginationInfoVO<TotalInfoVO>();
		
		if(StringUtils.isNotBlank(searchArea)) {
			pagingVO.setSearchArea(searchArea);
			model.addAttribute("searchArea", searchArea);
		}
		
		TotalInfoVO latestInfoVO = null; // 최신 오픈일자를 가진 TotalInfoVO를 저장할 변수
		Date latestOpenDate = null; // 최신 오픈일자를 저장할 변수
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.selectTotalFrcsCount(pagingVO);
		int selectFrcsCount = service.selectFrcsCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		List<TotalInfoVO> dataList = service.selectFrcsList(pagingVO);
		pagingVO.setDataList(dataList);
		
		// 최근 오픈매장을 찾기위한 반복문
		for (TotalInfoVO totalInfoVO : dataList) {
			Date openDate = totalInfoVO.getFrcsOpdate(); // 각 TotalInfoVO의 오픈일자를 가져옴
			
			// 최신 오픈일자를 비교하여 업데이트
			if(latestOpenDate == null || openDate.after(latestOpenDate)) {
				latestOpenDate = openDate;
				latestInfoVO = totalInfoVO; // 가장 최신 오픈일자를 가진 totalInfoVO가 저장됨
			}
		}
		
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("selectFrcsCount", selectFrcsCount);
		model.addAttribute("latestInfoVO", latestInfoVO);
		model.addAttribute("pagingVO",pagingVO);
		
		return "head/foundation/salesArea";
	} 
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/salesChart.do")
	public ResponseEntity< List<HeadSalesChartVO>> salesChart(
			@RequestBody HeadSalesChartVO salesChartVO,
			Model model) {
		
		List<HeadSalesChartVO> allChart = service.frcsChart(salesChartVO);
		
		return new ResponseEntity<List<HeadSalesChartVO>>(allChart, HttpStatus.OK);
	}
	
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/salesOneMonthChart.do")
	public ResponseEntity< List<HeadSalesChartVO>> salesOneMonthChart(
			@RequestBody Map<String, String> map,
			Model model) {
		
		HeadSalesChartVO total = new HeadSalesChartVO();
		
		String frcsId = map.get("frcsId").toString();
		log.info(frcsId);
		total.setFrcsId(frcsId);
		
		List<HeadSalesChartVO> dailySelling = service.frcsSales(total);
		
		return new ResponseEntity<List<HeadSalesChartVO>>(dailySelling, HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/salesThirdMonthChart.do")
	public ResponseEntity< List<HeadSalesChartVO>> salesThirdMonthChart(
			@RequestBody Map<String, String> map,
			Model model) {
		
		HeadSalesChartVO total = new HeadSalesChartVO();
		
		String frcsId = map.get("frcsId").toString();
		String stringMonth = map.get("month");
		int month = Integer.parseInt(stringMonth);
		total.setMonth(month);
		
		log.info(frcsId);
		total.setFrcsId(frcsId);
		
		List<HeadSalesChartVO> thirdMonthChart = service.frcsThirdMonthChart(total);
		
		return new ResponseEntity<List<HeadSalesChartVO>>(thirdMonthChart, HttpStatus.OK);
	}
	
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/salesSixMonthChart.do")
	public ResponseEntity< List<HeadSalesChartVO>> salesSixMonthChart(
			@RequestBody Map<String, String> map,
			Model model) {
		
		HeadSalesChartVO total = new HeadSalesChartVO();
		
		String frcsId = map.get("frcsId").toString();
		String stringMonth = map.get("month");
		int month = Integer.parseInt(stringMonth);
		total.setMonth(month);
		
		log.info(frcsId);
		total.setFrcsId(frcsId);
		
		List<HeadSalesChartVO> sixMonthChart = service.frcsSixMonthChart(total);
		
		return new ResponseEntity<List<HeadSalesChartVO>>(sixMonthChart, HttpStatus.OK);
	}
}
