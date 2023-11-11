package kr.or.ddit.controller.head.store;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.head.IMaintenancecostService;
import kr.or.ddit.vo.head.FeeVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.StoreOrderHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class MaintenanceCostController {

	@Inject
	private IMaintenancecostService service;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/maintenanceCost.do")
	public String maintenanceCost(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		
		log.info("maintenanceCost() GET -> 시작");
		
		HeadPaginationInfoVO<FeeVO> pagingVO = new HeadPaginationInfoVO<FeeVO>();
		
		pagingVO.setCurrentPage(currentPage);
		// 관리비관리 메인화면 totalRecord
		int totalRecord = service.selectMainCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		log.debug("관리비관리 메인화면 totalRecord -> {}", totalRecord);
		
		List<FeeVO> dataList = service.selectMainList(pagingVO);
		log.debug("관리비관리 메인화면 리스트 -> {}", dataList);
		
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/store/maintenanceCost";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/maintenanceCostDetail.do", method=RequestMethod.GET)
	public String maintenanceCostDetail(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam String frcsId,
			Model model) {
		
		log.info("maintenanceCostDetail() GET -> 시작");
		
		log.debug("관리비관리 상세화면 넘겨받은 frcsId값 -> {}", frcsId);
		
		HeadPaginationInfoVO<FeeVO> pagingVO = new HeadPaginationInfoVO<FeeVO>();
		
		if(StringUtils.isNotBlank(frcsId)) {
			pagingVO.setFrcsId(frcsId);
		}
		
		pagingVO.setCurrentPage(currentPage);
		// 관리비관리 메인화면 totalRecord
		int totalRecord = service.selectDetailCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		log.debug("관리비관리 상세화면 totalRecord -> {}", totalRecord);
		
		List<FeeVO> dataList = service.selectDetailList(pagingVO);
		pagingVO.setDataList(dataList);
		log.debug("관리비관리 상세화면 리스트 -> {}", dataList);
		
		List<StoreOrderHistoryVO> modalData = new ArrayList<StoreOrderHistoryVO>();
		int total = 0;
		
		for (FeeVO feeVO : dataList) {
			
			total += feeVO.getNonpayTotal();
			
			List<StoreOrderHistoryVO> sohVO = feeVO.getModalData();
			
			if(sohVO != null && !sohVO.isEmpty()) {
				for (StoreOrderHistoryVO history : sohVO) {
					log.debug("미납월 발주내역 -> {}", history);
					modalData.add(history);
				}
			}
		}
		
		log.debug("pagingVO 값 확인 -> {}", pagingVO);
		log.debug("modalData 값 확인 -> {}", modalData);
		
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("modalData", modalData);
		model.addAttribute("total", total);
		return "head/store/maintenanceCostDetail";
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/selectNonpayList.do", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public ResponseEntity<List<StoreOrderHistoryVO>> selectNonpayList(
			@RequestBody Map<String, String> param ){

		log.info("selectNonpayList() -> 시작");
		
		log.debug("미납내역 상세에서 넘어온 frcsId -> {}", param.get("frcsId").toString());
		log.debug("미납내역 상세에서 넘어온 frcsNonpaydate -> {}", param.get("frcsNonpaydate").toString());
		
		StoreOrderHistoryVO sohVO = new StoreOrderHistoryVO();
		
		String[] frcsdate =  (param.get("frcsNonpaydate").toString()).split("/");
		String frcsNonpaydate = frcsdate[1];
		
		sohVO.setFrcsId(param.get("frcsId").toString());
		sohVO.setFrcsNonpaydate(frcsNonpaydate);
		
		log.info("배열에담은 frcsNonpaydate -> {}", frcsNonpaydate);
		
		List<StoreOrderHistoryVO> dataList = service.selectModalData(sohVO);
		log.debug("dataList -> {}", dataList);
		
		return new ResponseEntity<List<StoreOrderHistoryVO>>(dataList, HttpStatus.OK);
	}
}
