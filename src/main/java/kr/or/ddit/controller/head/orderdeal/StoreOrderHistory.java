package kr.or.ddit.controller.head.orderdeal;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
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
import kr.or.ddit.service.head.IStoreService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.StoreOrderHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class StoreOrderHistory {

	@Inject
	private IStoreService service;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/storeOrderHistory.do")
	public String storeOrderHistory(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchFrcsId,
			@RequestParam(required = false) String searchFrcsName,
			@RequestParam(required = false) String searchBeforeDate,
			@RequestParam(required = false) String searchAfterDate,
			Model model) {
		log.info("storeOrderHistory() GET -> 시작");
		
		HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO = new HeadPaginationInfoVO<StoreOrderHistoryVO>();
		
		if(StringUtils.isNotBlank(searchFrcsId)) {
			pagingVO.setSearchFrcsId(searchFrcsId);
		}
		
		if(StringUtils.isNotBlank(searchFrcsName)) {
			pagingVO.setSearchFrcsName(searchFrcsName);
		}
		
		if(StringUtils.isNotBlank(searchBeforeDate)) {
			pagingVO.setSearchBeforeDate(searchBeforeDate);
		}
		
		if(StringUtils.isNotBlank(searchAfterDate)) {
			pagingVO.setSearchAfterDate(searchAfterDate);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.totalOrderCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<StoreOrderHistoryVO> dataList = service.selectTotalOrderList(pagingVO);
		pagingVO.setDataList(dataList);
		
		int totalPrice = 0;
		for(StoreOrderHistoryVO soh : dataList) {
			totalPrice += Integer.parseInt(soh.getFrcsorderAmt());
		}
		pagingVO.setTotalPrice(totalPrice);
		
		StoreOrderHistoryVO soh = new StoreOrderHistoryVO();
		
		List<StoreOrderHistoryVO> frcsList = service.selectFrcsNameList(soh);
		
		if(frcsList.size() != 0) {
			for (StoreOrderHistoryVO so : frcsList) {
				log.info("가맹점코드 => " + so.getFrcsId());
				log.info("가맹점이름 => " + so.getFrcsName());
			}
		}
		
		int orderCount = service.selectOrderCnt();
		log.debug("최근3일간 가맹점주문 COUNT -> {}", orderCount);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("frcsList", frcsList);
		model.addAttribute("orderCount", orderCount);
		
		return "head/orderDeal/storeOrderHistory";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/storeOrderHistoryDetails.do")
	public String storeOrderHistoryDetails(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String storeOrderDetailSearch,
			@RequestParam(name="frcsId", required = false) String frcsId,
			@RequestParam(name="frcsorderDate", required = false) String frcsorderDate,
			Model model) {
		log.info("storeOrderHistoryDetails() GET -> 시작");
		
		log.info("넘어온 frcsId -> " + frcsId);
		log.info("넘어온 frcsorderDate -> " + frcsorderDate);
		
		HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO = new HeadPaginationInfoVO<StoreOrderHistoryVO>();
		
		if(StringUtils.isNotBlank(storeOrderDetailSearch)) {
			pagingVO.setStoreOrderDetailSearch(storeOrderDetailSearch);
		}
		
		// /commitBtn.do에서 승인 완료됐을시 다시 상세보기 페이지로가기위해 쿼리스트링값을 받아옴
		if(StringUtils.isNotBlank(frcsId)) {
			pagingVO.setFrcsId(frcsId);
		}
		
		// /commitBtn.do에서 승인 완료됐을시 다시 상세보기 페이지로가기위해 쿼리스트링값을 받아옴
		if(StringUtils.isNotBlank(frcsorderDate)) {
			pagingVO.setFrcsorderDate(frcsorderDate);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.selectOrderListDetailsCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<StoreOrderHistoryVO> dataList = service.selectOrderListDetails(pagingVO);
		pagingVO.setDataList(dataList);
		
		int totalPrice = 0;
		if(dataList.size() != 0) {
			for (StoreOrderHistoryVO soh : dataList) {
				totalPrice += soh.getTotalPrice();
			}
		}
		
		log.info("totalPrice ->" + totalPrice);
		
		pagingVO.setTotalPrice(totalPrice);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("frcsId", frcsId);
		model.addAttribute("frcsorderDate", frcsorderDate);
		
		return "head/orderDeal/storeOrderHistoryDetails";
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/checkOne.do", method = RequestMethod.POST)
	public ResponseEntity<List<StoreOrderHistoryVO>> checkOne(
			String frcsorderNo ){
		
		log.info("checkOne() -> 시작");
		
		log.info("frcsorderNo값 -> " + frcsorderNo);
		
		List<StoreOrderHistoryVO> frcsOrderDetail = service.selectCheckOne(frcsorderNo);
		
		return new ResponseEntity<List<StoreOrderHistoryVO>>(frcsOrderDetail,HttpStatus.OK);
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/commitBtn.do", method = RequestMethod.POST, consumes = "application/json; charset=utf-8")
	public ResponseEntity<ServiceResult> commitBtn(
			@RequestBody List<StoreOrderHistoryVO> storeOrderHistoryVO, AlarmVO alarmVO){

		log.info("checkOne() -> 시작");
		
		for (StoreOrderHistoryVO stohVO : storeOrderHistoryVO) {
			log.debug("승인버튼눌렀을시 넘어오는 VO데이터 -> {}", stohVO.toString());
		}
		
		ServiceResult result = null;
		
		for (StoreOrderHistoryVO soh : storeOrderHistoryVO) {
			String frcsorderNo = soh.getFrcsorderNo().toString();
			String frcsId = soh.getFrcsId().toString();
			
			log.debug("가맹점 주문 승인버튼 눌렀을 시 넘어오는 frcsorderNo -> {}", frcsorderNo);
			log.debug("가맹점 주문 승인버튼 눌렀을 시 넘어오는 frcsId -> {}", frcsId);
			
			result = service.updateOrderDetails(soh, alarmVO);
			
			if(result == ServiceResult.FAILED) {
				log.info("주문상세 승인처리중 오류 발생!!");
				log.info("오류발생된 발주번호 -> " + frcsorderNo);
			}
		}
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/cancleModal.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<List<StoreOrderHistoryVO>> cancleModal(
			@RequestBody StoreOrderHistoryVO storeOrderHistoryVO){
		
		log.info("cancleModal() -> 시작");
		//{checkData=[{frcsorderNo=20231013-0057}, {frcsorderNo=20231013-0056}]}
		log.info("cancleModal->storeOrderHistoryVO : " + storeOrderHistoryVO.toString());
		String frcsId = storeOrderHistoryVO.getFrcsId().toString();
		String frcsorderNo = "";
		
		log.debug("반려버튼클릭시 넘겨받은 frcsId -> {}", frcsId);
		
		List<StoreOrderHistoryVO> dataList = new ArrayList<StoreOrderHistoryVO>();
		
		String[] frcsorderNumbers = storeOrderHistoryVO.getFrcsorderNo().toString().split(",");
		
		for (int i = 0; i < frcsorderNumbers.length; i++) {
			StoreOrderHistoryVO sohVO = new StoreOrderHistoryVO();
			
			if(frcsorderNumbers[i] != "") {
				
				frcsorderNo = frcsorderNumbers[i];
				log.debug("스플릿한 frcsorderNo -> {}", frcsorderNo);
				sohVO.setFrcsId(frcsId);
				sohVO.setFrcsorderNo(frcsorderNo);
				
				sohVO = service.frcsOrderDetails(sohVO);
				dataList.add(sohVO);
			}
		}
		
		return new ResponseEntity<List<StoreOrderHistoryVO>>(dataList,HttpStatus.OK);
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/cancleModalButton.do", method = RequestMethod.POST, consumes = "application/json; charset=utf-8")
	public ResponseEntity<ServiceResult> cancleModalButton(
			@RequestBody List<StoreOrderHistoryVO> storeOrderHistoryVO){
		
		log.info("cancleModalButton() -> 시작");
		log.info("cancleModalButton -> storeOrderHistoryVO : " + storeOrderHistoryVO.toString() + "\n");
		
		ServiceResult result = null;
		
		for (StoreOrderHistoryVO soh : storeOrderHistoryVO) {
			String frcsorderNo = soh.getFrcsorderNo().toString();
			String frcsorderReturn = soh.getFrcsorderReturn().toString();
			
			log.info("frcsorderNo -> " + frcsorderNo);
			log.info("frcsorderReturn -> " + frcsorderReturn);
			
			result = service.updateImpossibleOrder(soh);
			
		}
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
}
