package kr.or.ddit.controller.head.store;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.head.IFranchiseSalesAnalysisService;
import kr.or.ddit.vo.head.FranchiseSalesAnalysisVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class FranchiseSalesAnalysisController {
	
	@Inject
	private IFranchiseSalesAnalysisService service;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/franchiseSalesAnalysis.do")
	public String frSalesAnalysis(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchArea,
			@RequestParam(required = false) String searchFranchise,
			Model model) {
		log.info("frSalesAnalysis() GET , 가맹점 총매출 분석 -> 시작");
		
		HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO = new HeadPaginationInfoVO<FranchiseSalesAnalysisVO>();
		
		if(StringUtils.isNotBlank(searchArea)) {
			pagingVO.setSearchArea(searchArea);
		}
		
		if(StringUtils.isNotBlank(searchFranchise)) {
			pagingVO.setSearchFranchise(searchFranchise);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.selectCountFrcs(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		log.debug("가맹점총매출분석 totalRecord -> {}", totalRecord);
		
		List<FranchiseSalesAnalysisVO> dataList = service.selectFrcsList(pagingVO);
		pagingVO.setDataList(dataList);
		
		log.debug("가맹점총매출분석 dataList -> {}", dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/store/franchiseSalesAnalysis";
	} 
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/selectChartData.do", produces = "application/json;charset=utf-8")
	public FranchiseSalesAnalysisVO selectChartData(
			@RequestBody FranchiseSalesAnalysisVO fsaVO,
			Model model
			){
		
		log.info("selectChartData() 가맹점총매출분석 -> 시작");
		
		log.debug("ajax로 보내준 객체 값 -> {}", fsaVO.toString());
		log.debug("ajax로 보내준 frcsId 값 -> {}", fsaVO.getFrcsId().toString());
		log.debug("ajax로 보내준 frcsName 값 -> {}", fsaVO.getFrcsName().toString());
		log.debug("ajax로 보내준 curMonth 값 -> {}", fsaVO.getCurMonth());
		log.debug("ajax로 보내준 year 값 -> {}", fsaVO.getYear());
		
		FranchiseSalesAnalysisVO dataList = service.selectAllPrice(fsaVO);
		
		log.debug("받아온 dataList 값 -> {}", dataList);
		
		return dataList;
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/selectChartSales.do", produces = "application/json;charset=utf-8")
	public FranchiseSalesAnalysisVO selectChartSales(
			@RequestBody Map<String, Object> param,
			Model model
			){
		
		log.info("selectChartSales() 가맹점1년매출 차트 -> 시작");
		
		log.debug("ajax로 보내준 frcsId 값 -> {}", param.get("frcsId").toString());
		log.debug("ajax로 보내준 frcsName 값 -> {}", param.get("frcsName").toString());
		log.debug("ajax로 보내준 curMonth 값 -> {}", param.get("curMonth").toString());
		log.debug("ajax로 보내준 year 값 -> {}", param.get("year").toString());
		
		String frcsId = param.get("frcsId").toString();
		String frcsName = param.get("frcsName").toString();
		int curMonth = Integer.parseInt(param.get("curMonth").toString());
		int year = Integer.parseInt(param.get("year").toString());
		
		FranchiseSalesAnalysisVO fsaVO = new FranchiseSalesAnalysisVO();
		fsaVO.setFrcsId(frcsId);
		fsaVO.setFrcsName(frcsName);
		fsaVO.setCurMonth(curMonth);
		fsaVO.setYear(year);
		
		FranchiseSalesAnalysisVO dataList = service.selectChartSalesData(fsaVO);
		
		log.debug("받아온 dataList 값 -> {}", dataList);
		
		return dataList;
	}
}
