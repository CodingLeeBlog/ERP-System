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
import org.springframework.web.context.annotation.RequestScope;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsBillService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsBillVO;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.TradingVO;

@Controller
@RequestMapping("/owner")
public class OwnerBillController {

	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsBillService service;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/bill.do", method = RequestMethod.GET)
	public String billList(@RequestParam(name="yearMonth", required = false) String yearMonth,
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
		
		
		FrcsBillVO billVO = service.headBillList(frcsId, thisMonth);
		
		model.addAttribute("frcsId", frcsId);
		model.addAttribute("billVO", billVO);
		model.addAttribute("yearMonth", yearMonth);
		return "owner/payment/frcsBillList";
	}
	
	
	/**
	 * 본사 가맹비 총괄, 가맹비 상세 테이블 insert
	 * @param billVO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/bill/insert.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> billInsert(@RequestBody FrcsBillVO billVO){
		
		ServiceResult result = service.insertBill(billVO);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	
	/**
	 * 트레이딩 내역 디테일
	 * @param tradVO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/bill/tradDetail.do", method = RequestMethod.POST)
	public ResponseEntity<List<TradingVO>> tradingDetail(@RequestBody TradingVO tradVO){
		
		List<TradingVO> tradingList = service.getTradDetail(tradVO);
		
		return new ResponseEntity<List<TradingVO>>(tradingList,HttpStatus.OK);
	}
	
	/**
	 * 트레이딩 내역 디테일
	 * @param tradVO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/bill/tradMinDetail.do", method = RequestMethod.POST)
	public ResponseEntity<List<TradingVO>> tradingMinDetail(@RequestBody TradingVO tradVO){
		
		List<TradingVO> tradingList = service.getTradMinDetail(tradVO);
		
		return new ResponseEntity<List<TradingVO>>(tradingList,HttpStatus.OK);
	}
	
}
