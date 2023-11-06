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
import kr.or.ddit.service.owner.IFrcsInventoryService;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Controller
@RequestMapping("/owner")
public class OwnerInventoryController {

	@Inject
	private IFrcsInventoryService service;

	@Inject
	private IFrcsIdService commService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/inventory.do", method = RequestMethod.GET )
	public String ownerInventoryList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "vdprodName") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		String frcsId = commService.getFrcsId();
		
		// 페이징처리
		OwnerPaginationInfoVO<FrcsInventoryVO> pagingVO = new OwnerPaginationInfoVO<FrcsInventoryVO>();
		
	    // 검색이 이뤄지면 아래가 실행됨
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchWord",searchWord);
		}   
		
		pagingVO.setFrcsId(frcsId);
		pagingVO.setCurrentPage(currentPage);	// startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectInventCount(pagingVO);	// 총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord);	// totalPage 결정
		List<FrcsInventoryVO> dataList = service.selectInventList(pagingVO);	// 한 페이지에 해당하는 10개의 데이터
		pagingVO.setDataList(dataList);
		
		// memId로 해당 가맹점 재고현황 가져오기 (페이징 전)
//		List<FrcsInventoryVO> inventList = service.getInventList(memId);
//		model.addAttribute("inventList", inventList);
		model.addAttribute("pagingVO",pagingVO);
		
		return "owner/inventory/list";
	}
	
	// 재고수량 수정
	@ResponseBody
	@RequestMapping(value="/inventory/update.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> ownerInventoryUpdate(@RequestBody FrcsInventoryVO frcsVO) {
		ResponseEntity<FrcsInventoryVO> entity = null;
		
		ServiceResult result = service.inventUpdate(frcsVO);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
}
