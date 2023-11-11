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
import kr.or.ddit.service.owner.IFrcsPurchaseService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerPurchaseAnalysisController {

	@Inject
	private IFrcsPurchaseService service;
	
	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	// 매입 분석
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/purchaseAnalysis.do", method = RequestMethod.GET)
	public String purchaseAnalysisList(@RequestParam(name="yearMonth", required=false) String yearMonth,
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
		
		// 한달 매입 분석
		List<FrcsOrderDetailVO> onePurchase = service.getOnePurchase(frcsId,thisMonth);
	
		model.addAttribute("frcsId", frcsId);
		model.addAttribute("yearMonth", yearMonth);
		model.addAttribute("onePurchase", onePurchase);
		
		return "owner/purchaseSales/purchaseAnalysis";
	}
	
	// 1개월 매입 분석 ajax
	@ResponseBody
	@RequestMapping(value="/purchaseAnalysis/oneMonth.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsOrderDetailVO>> onePurchase (@RequestBody FrcsOrderDetailVO orderVO){

		List<FrcsOrderDetailVO> onePurchaseList = service.getOnePurchaseList(orderVO);
		
		return new ResponseEntity<List<FrcsOrderDetailVO>>(onePurchaseList, HttpStatus.OK);
	}
	
	// 3개월 매입 분석 
	@ResponseBody
	@RequestMapping(value="/purchaseAnalysis/threeMonth.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsOrderDetailVO>> threePurchase (@RequestBody FrcsOrderDetailVO orderVO){

		List<FrcsOrderDetailVO> threePurchaseList = service.getThreePurchaseList(orderVO);
		
		return new ResponseEntity<List<FrcsOrderDetailVO>>(threePurchaseList, HttpStatus.OK);
	}
	
	// 6개월 매입 분석
	@ResponseBody
	@RequestMapping(value="/purchaseAnalysis/sixMonth.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsOrderDetailVO>> sixPurchase (@RequestBody FrcsOrderDetailVO orderVO){

		List<FrcsOrderDetailVO> sixPurchaseList = service.getSixPurchaseList(orderVO);
		
		return new ResponseEntity<List<FrcsOrderDetailVO>>(sixPurchaseList, HttpStatus.OK);
	}
	
	// 매입 차트 (12개월)
	@ResponseBody
	@RequestMapping(value="/purchaseAnalysis/chart.do", method =RequestMethod.POST)
	public ResponseEntity<List<FrcsOrderDetailVO>> purchaseChart(String frcsId){
		
		List<FrcsOrderDetailVO> purchaseChart = service.getPurchaseChart(frcsId);
		
		return new ResponseEntity<List<FrcsOrderDetailVO>>(purchaseChart, HttpStatus.OK);
	}
}
