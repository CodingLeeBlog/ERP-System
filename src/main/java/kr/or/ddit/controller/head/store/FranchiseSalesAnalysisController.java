package kr.or.ddit.controller.head.store;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "/franchiseSalesAnalysis.do", method=RequestMethod.GET)
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
}
