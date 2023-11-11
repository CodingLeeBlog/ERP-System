package kr.or.ddit.controller.owner;

import java.util.List;
import java.util.Map;

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

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.service.owner.IFrcsTradingService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import kr.or.ddit.vo.owner.TradingVO;

@Controller
@RequestMapping("/owner")
public class OwnerTradingController {

	@Inject
	private IFrcsTradingService service;
	
	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/trading.do", method = RequestMethod.GET)
	public String tradingRequest(Model model) {
		
		String frcsId= commService.getFrcsId();
		
		//헤더 오른쪽 관리자 영역
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		// 내 가맹점 위치 조회
		FranchiseVO frcsVO = service.getLocation(frcsId);
		
		model.addAttribute("frcsVO", frcsVO);
		
		return "owner/trading/tradingRequest";
	}

	// 모든 가맹점 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/allFrcsList.do", method = RequestMethod.POST)
	public ResponseEntity<List<FranchiseVO>> allFrcsList(){
	
		List<FranchiseVO> frcsList = service.getAllFrcsList();
		
		return new ResponseEntity<List<FranchiseVO>>(frcsList, HttpStatus.OK);
	}
	
	// 주변 가맹점 재고 현황 가져오기
	@ResponseBody
	@RequestMapping(value="/nearFrcsInventList.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsInventoryVO>> nearFrcsInventList(@RequestBody Map<String,Object> map){
		
		
		String searchWord = map.get("searchWord").toString();
		String searchType = map.get("searchType").toString();
		List<Object> nearList = (List<Object>) map.get("nearList");
		
		List<FrcsInventoryVO> nearInventList = service.getNearInventList(searchWord,searchType,nearList);
		
		return new ResponseEntity<List<FrcsInventoryVO>>(nearInventList, HttpStatus.OK);
	}
	
	// 트레이딩 신청
	@ResponseBody
	@RequestMapping(value="/tradingInsert.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> tradingInsert(@RequestBody TradingVO tradVO, AlarmVO alarmVO){
		
		ServiceResult result = service.tradingInsert(tradVO, alarmVO);
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	
	// 트레이딩 내역
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/tradingList.do", method = RequestMethod.GET)
	public String tradingHistoryList(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			Model model) {
		

		String frcsId= commService.getFrcsId();
		System.out.println(frcsId);
	
		//헤더 오른쪽 관리자 영역
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		// 페이징 처리
		OwnerPaginationInfoVO<TradingVO> pagingVO = new OwnerPaginationInfoVO<TradingVO>();
		
		pagingVO.setFrcsId(frcsId);
		pagingVO.setCurrentPage(currentPage);	// startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectTradeCount(pagingVO);	// 총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord);	// totalPage 결정
		List<TradingVO> dataList = service.selectTradingHistoryList(pagingVO);	// 한 페이지에 해당하는 10개의 데이터
		pagingVO.setDataList(dataList);
		
		model.addAttribute("frcsId", frcsId);	//내가맹점
		model.addAttribute("pagingVO", pagingVO);
		
		return "owner/trading/tradingHistory";
	}
	
	// 트레이딩 성공 시 재고 반영
	@ResponseBody
	@RequestMapping(value="/tradingSuccess.do", method =RequestMethod.POST)
	public ResponseEntity<ServiceResult> tradingSuccess(@RequestBody FrcsInventoryVO inventVO){
		
		ServiceResult result = service.tradingSuccess(inventVO);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	// 트레이딩 거절
	@ResponseBody
	@RequestMapping(value="/tradingRefuse.do", method =RequestMethod.POST)
	public ResponseEntity<ServiceResult> tradingRefuse(@RequestBody TradingVO tradVO){
		
		ServiceResult result = service.tradingRefuse(tradVO);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	// 트레이딩 상세
	@ResponseBody
	@RequestMapping(value="/tradingDetail.do", method = RequestMethod.POST)
	public ResponseEntity<FrcsInventoryVO> tradingDetail(@RequestBody FrcsInventoryVO frcsInventVO){
		
		FrcsInventoryVO inventVO = service.getDetail(frcsInventVO);
		
		return new ResponseEntity<FrcsInventoryVO>(inventVO, HttpStatus.OK);
	}
	
	// 응답 트레이딩 상세
	@ResponseBody
	@RequestMapping(value="/tradingReqDetail.do", method = RequestMethod.POST)
	public ResponseEntity<FrcsInventoryVO> tradingReqDetail(@RequestBody FrcsInventoryVO frcsInventVO){
		
		FrcsInventoryVO inventVO = service.getReqDetail(frcsInventVO);
		
		return new ResponseEntity<FrcsInventoryVO>(inventVO, HttpStatus.OK);
	}
	
	
}
