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
import kr.or.ddit.service.owner.IFrcsOperationProfitService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.OperationProfitVO;

@Controller
@RequestMapping("/owner")
public class OwnerOperationProfitController {

	@Inject
	private IFrcsOperationProfitService service;
	
	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/operationProfit.do", method = RequestMethod.GET)
	public String operationProfitList(@RequestParam(name="yearMonth", required = false) String yearMonth,
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
		
		OperationProfitVO operationVO = service.getOneOperation(frcsId,thisMonth);
		
		model.addAttribute("frcsId", frcsId);
		model.addAttribute("operationVO", operationVO);
		model.addAttribute("yearMonth", yearMonth);

		return "owner/purchaseSales/operationProfit";
	}
	
	// 1개월 매출 총이익 분석 ajax
	@ResponseBody
	@RequestMapping(value="/operationProfit/oneMonth.do", method = RequestMethod.POST)
	public ResponseEntity<OperationProfitVO> oneOperationProfit(@RequestBody OperationProfitVO operVO){
		
		OperationProfitVO oneTotalList = service.getOneTotal(operVO);
		
		return new ResponseEntity<OperationProfitVO>(oneTotalList, HttpStatus.OK);
	}
	
	
	// 3개월 매출 총이익 분석
	@ResponseBody
	@RequestMapping(value="/operationProfit/threeMonth.do", method = RequestMethod.POST)
	public ResponseEntity<OperationProfitVO> threeOperationProfit(@RequestBody OperationProfitVO operVO){
		
		OperationProfitVO threeTotalList = service.getThreeTotal(operVO);
		
		return new ResponseEntity<OperationProfitVO>(threeTotalList, HttpStatus.OK);
	}
	
	// 6개월 매출 총이익 분석
	@ResponseBody
	@RequestMapping(value="/operationProfit/sixMonth.do", method = RequestMethod.POST)
	public ResponseEntity<OperationProfitVO> sixOperationProfit(@RequestBody OperationProfitVO operVO){
		
		OperationProfitVO sixTotalList = service.getSixTotal(operVO);
		
		return new ResponseEntity<OperationProfitVO>(sixTotalList, HttpStatus.OK);
	}
	
	// 12개월 차트
	@ResponseBody
	@RequestMapping(value="/operationProfit/chart.do", method = RequestMethod.POST)
	public ResponseEntity<List<OperationProfitVO>> operationProfitChart(String frcsId){
		
		List<OperationProfitVO> monthsList = service.getOperationProfitChart(frcsId);
		
		return new ResponseEntity<List<OperationProfitVO>>(monthsList, HttpStatus.OK);
	}
}
