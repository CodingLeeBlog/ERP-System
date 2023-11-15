package kr.or.ddit.controller.head.orderdeal;

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
import kr.or.ddit.service.head.IPurchaseService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.PurchaseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class PurchaseListController {

	@Inject
	private IPurchaseService service;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	   @RequestMapping(value = "/purchaseList.do")
	   public String purchaseList(
	         @RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
	         Model model) {
	      log.info("purchaseList() GET -> 매입내역관리 -> 시작");
	      
	      HeadPaginationInfoVO<PurchaseVO> pagingVO = new HeadPaginationInfoVO<PurchaseVO>();
	      
	      pagingVO.setCurrentPage(currentPage);
	      int totalRecord = service.selectTotalPurchaseCount(pagingVO);
	      pagingVO.setTotalRecord(totalRecord);
	      log.debug("totalRecord -> {}", totalRecord);
	      
	      List<PurchaseVO> dataList = service.selectTotalPurchaseList(pagingVO);
	      
	      int thisMonth = 0;
	      int thisDay = 0;
	      
	      for (PurchaseVO pcVO : dataList) {
	         int tm = pcVO.getThisMonth();
	         thisMonth += tm;
	         
	         int td = pcVO.getThisDay();
	         thisDay += td;
	      }
	      
	      pagingVO.setDataList(dataList);
	      
	      log.debug("dataList값 -> {}", dataList);
	      
	       model.addAttribute("pagingVO", pagingVO);
	       model.addAttribute("thisMonth", thisMonth);
	       model.addAttribute("thisDay", thisDay);
	       
	      return "head/orderDeal/purchaseList";
	   }
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/purchaseListDetail.do")
	public String purchaseListDetail(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam String hdorderNo,
			Model model) {
		log.info("purchaseListDetail() GET -> 시작");
		
		HeadPaginationInfoVO<PurchaseVO> pagingVO = new HeadPaginationInfoVO<PurchaseVO>();
		pagingVO.setHdorderNo(hdorderNo);
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.selectDetailCount(hdorderNo);
		pagingVO.setTotalRecord(totalRecord);
		
		List<PurchaseVO> dataList = service.selectDetailList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/orderDeal/purchaseListDetail";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/purchaseListOrder.do", method=RequestMethod.GET)
	public String purchaseListOrder(Model model) {
		log.info("purchaseListOrder() GET -> 시작");
		return "head/orderDeal/purchaseListOrder";
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/selectPurchaseVendorName.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<List<PurchaseVO>> selectPurchaseVendorName(
			@RequestBody Map<String, String> param,
			Model model) {
		
		log.info("selectPurchaseVendorName() -> 시작");
		log.debug("ajax로 보내준 vdCategory값 -> {}", param.get("vdCategory").toString());
		
		String vdCategory = param.get("vdCategory").toString();
		
		List<PurchaseVO> selectBox = service.selectDataList(vdCategory);
		
		log.debug("selectBox로 가져온값 -> {}", selectBox);
		
		return new ResponseEntity<List<PurchaseVO>>(selectBox,HttpStatus.OK);
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/selectPurchaseDataList.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<List<PurchaseVO>> selectPurchaseDataList(
			@RequestBody Map<String, String> param,
			Model model) {
		
		log.info("selectPurchaseDataList() -> 시작");
		log.debug("ajax로 보내준 vdCode값 -> {}", param.get("vdCode").toString());
		log.debug("ajax로 보내준 vdName값 -> {}", param.get("vdName").toString());
		
		PurchaseVO pcVO = new PurchaseVO();
		pcVO.setVdCode(param.get("vdCode").toString());
		pcVO.setVdName(param.get("vdName").toString());
		List<PurchaseVO> dataList = service.selectOrderList(pcVO);
		
		log.debug("dataList로 가져온값 -> {}", dataList);
		
		return new ResponseEntity<List<PurchaseVO>>(dataList, HttpStatus.OK);
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/insertHeadOrder.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<ServiceResult> insertHeadOrder(
			@RequestBody Map<String, String> param,
			Model model) {
		
		log.info("insertHeadOrder() -> 시작");
		log.debug("ajax로 보내준 vdCode값 -> {}", param.get("vdCode").toString());
		log.debug("ajax로 보내준 hdordertotalPrice값 -> {}", param.get("hdordertotalPrice").toString());
		
		ServiceResult result = null;
		
		String vdCode = param.get("vdCode").toString();
		int hdordertotalPrice = Integer.parseInt(param.get("hdordertotalPrice").toString());
		
		PurchaseVO pcVO = new PurchaseVO();
		pcVO.setVdCode(vdCode);
		pcVO.setHdordertotalPrice(hdordertotalPrice);
		result = service.insertHeadOrder(pcVO);
		
		log.debug("insert후 result -> {}", result);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/selectPurchaseOrderList.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<ServiceResult> selectPurchaseOrderList(
			@RequestBody List<Map<String, Object>> params,
			Model model) {
		
		log.info("selectPurchaseOrderList() -> 시작");
		
		ServiceResult result = null;
		
	    for (Map<String, Object> order : params) {
	    	String vdCode = order.get("vdCode").toString();
	        String vdprodCd = order.get("vdprodCd").toString();
	        String vdprodName = order.get("vdprodName").toString();
	        String hdrtrcvPrice = order.get("hdrtrcvPrice").toString();
	        String hdorderQy = order.get("hdorderQy").toString();
	        String hdordertotalPrice = order.get("hdordertotalPrice").toString();
	        
	        log.info("================================================");
	        log.debug("제품 코드 -> {}", vdCode);
	        log.debug("제품명 코드 -> {}", vdprodCd);
	        log.debug("제품명 -> {}", vdprodName);
	        log.debug("구매가격 -> {}", hdrtrcvPrice);
	        log.debug("주문수량 -> {}", hdorderQy);
	        log.debug("주문예상금액(구매가격*주문수량) expectPrice -> {}", hdordertotalPrice);
	        log.info("================================================");
	        
	        PurchaseVO phVO = new PurchaseVO();
	        
	        int hdrtrcvPrice1 = Integer.parseInt(hdrtrcvPrice);
	        int hdorderQy1 = Integer.parseInt(hdorderQy);
	        int hdordertotalPrice1 = Integer.parseInt(hdordertotalPrice);
	        
	        phVO.setVdprodCd(vdprodCd);
	        phVO.setVdprodName(vdprodName);
	        phVO.setHdrtrcvPrice(hdrtrcvPrice1);
	        phVO.setHdorderQy(hdorderQy1);
	        phVO.setHdordertotalPrice(hdordertotalPrice1);
	        
	        result = service.insertOrder(phVO);
	        
	    }
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/updateCancelOrderList.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<ServiceResult> updateCancelOrderList(
			@RequestBody Map<String, String> param,
			Model model) {
		
		log.info("updateCancelOrderList() -> 시작");
		log.debug("ajax로 보내준 hdorderNo값 -> {}", param.get("hdorderNo").toString());
		
		ServiceResult result = null;
		
		String hdorderNo = param.get("hdorderNo").toString();
		
		result = service.updateHeadOrderConfm(hdorderNo);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
}
