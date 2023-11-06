package kr.or.ddit.controller.owner;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsOrderService;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;
import kr.or.ddit.vo.owner.FrcsOrderVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Controller
@RequestMapping("/owner")
public class OwnerOrderController {
	
	@Inject
	private IFrcsOrderService service;
	
	@Inject
	private IFrcsIdService commService;
	
	// 발주 리스트
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String orderList(
			Model model) {
		
		String frcsId = commService.getFrcsId();

		// 발주 가능 리스트
		List<FrcsInventoryVO> inventList = service.getInventList(frcsId);
		model.addAttribute("inventList", inventList);
		
		// 자동 발주 추가
		List<FrcsInventoryVO> autoList = service.getAutoList(frcsId);
		model.addAttribute("autoList",autoList);
		
		return "owner/order/orderList";
	}
	
	// 발주 검색
	@ResponseBody
	@RequestMapping(value="/order/orderSearch.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsInventoryVO>> inventSearch(@RequestBody Map<String,String> map){
		String searchWord = map.get("searchWord").toString();
		String searchType = map.get("searchType").toString();
		  
		String frcsId = commService.getFrcsId();
		System.out.println(frcsId);
		
		List<FrcsInventoryVO> inventVO = service.inventSearch(searchWord,searchType,frcsId);
		
		return new ResponseEntity<List<FrcsInventoryVO>>(inventVO, HttpStatus.OK);
	}
	
	// 발주 신청
	@ResponseBody
	@RequestMapping(value="/order/frcsOrder.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> frcsOrder(@RequestBody FrcsOrderVO frcsOrderVO) {
		
		String frcsId = commService.getFrcsId();
		System.out.println(frcsId);
		
		frcsOrderVO.setFrcsId(frcsId);
		ServiceResult result =  service.orderInsert(frcsOrderVO);
	    
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	
	// 발주 내역 페이지
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/orderDetail.do", method = RequestMethod.GET)
	public String orderDetail(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String afterDate,
			@RequestParam(required = false) String beforeDate,
			Model model) {
		
		String frcsId = commService.getFrcsId();
		System.out.println(frcsId);
		
		OwnerPaginationInfoVO<FrcsOrderVO> pagingVO = new OwnerPaginationInfoVO<FrcsOrderVO>();
		
		if(StringUtils.isNotBlank(afterDate)) {
			pagingVO.setAfterDate(afterDate);
			model.addAttribute("afterDate",afterDate);
		}
		
		if(StringUtils.isNotBlank(beforeDate)) {
			pagingVO.setBeforeDate(beforeDate);
			model.addAttribute("beforeDate",beforeDate);
		}
	
		pagingVO.setFrcsId(frcsId);
		pagingVO.setCurrentPage(currentPage);	// startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectOrderCount(pagingVO);	// 총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord);	// totalPage 결정
		List<FrcsOrderVO> dataList = service.selectOrderList(pagingVO);	// 한 페이지에 해당하는 10개의 데이터
		pagingVO.setDataList(dataList);
	
		model.addAttribute("pagingVO",pagingVO);

		
		return "owner/order/orderDetail";
	}
	
	// 발주 취소
	@ResponseBody
	@RequestMapping(value="/orderCancel.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> orderCancel(String frcsOrderNo) {
		
		ServiceResult result = service.orderCancel(frcsOrderNo);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	// 발주 상세보기
	@ResponseBody
	@RequestMapping(value="/orderDetailModal.do", method = RequestMethod.POST)
	public ResponseEntity<FrcsOrderVO> orderDetailModal(String frcsOrderNo){
		
		FrcsOrderVO detailVO = service.getDetail(frcsOrderNo);
		
		return new ResponseEntity<FrcsOrderVO>(detailVO, HttpStatus.OK);
	}
	
}
