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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsTradingService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.TradingVO;

@Controller
@RequestMapping("/owner")
public class OwnerTradingController {

	@Inject
	private IFrcsTradingService service;
	
	@Inject
	private IFrcsIdService commService;
	
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/trading.do", method = RequestMethod.GET)
	public String tradingRequest(Model model) {
		
		String frcsId= commService.getFrcsId();
		
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
	public ResponseEntity<ServiceResult> tradingInsert(@RequestBody TradingVO tradVO){
		
		ServiceResult result = service.tradingInsert(tradVO);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/tradingList.do", method = RequestMethod.GET)
	public String tradingHistoryList() {
		return "owner/trading/tradingHistory";
	}
}
