package kr.or.ddit.controller.head.orderdeal;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.head.IPurchaseService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.PurchaseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class HeadInventoryListController {
	
	@Inject
	private IPurchaseService service;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/headInventoryList.do")
	public String headInventoryList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			Model model) {
		
		log.info("headInventoryList() -> 시작");
		
		HeadPaginationInfoVO<PurchaseVO> pagingVO = new HeadPaginationInfoVO<PurchaseVO>();
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.selectHeadInventory(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		log.debug("본사재고관리 -> totalRecord -> {}", totalRecord);
		
		List<PurchaseVO> dataList = service.selectHeadInventoryList(pagingVO);
		pagingVO.setDataList(dataList);
		
		log.debug("본사재고관리 -> dataList값 -> {}", dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/orderDeal/headInventoryList";
	}
}
