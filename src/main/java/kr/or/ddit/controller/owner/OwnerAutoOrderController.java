package kr.or.ddit.controller.owner;

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
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.service.owner.IFrcsOrderService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsAutoOrderVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Controller
@RequestMapping("/owner")
public class OwnerAutoOrderController {

	@Inject
	private IFrcsOrderService service;
	
	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	// 자동발주 리스트
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value = "/autoOrder.do", method=RequestMethod.GET)
	public String autoOrderList(
			@RequestParam(name="page", required= false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "vdprodName") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		String frcsId = commService.getFrcsId();
		
		//헤더 오른쪽 관리자 영역
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		OwnerPaginationInfoVO<FrcsAutoOrderVO> pagingVO = new OwnerPaginationInfoVO<FrcsAutoOrderVO>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchWord",searchWord);
		}
		
		pagingVO.setFrcsId(frcsId);
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectAutoOrderCount(pagingVO);	// 총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord); // totalPage 결정
		List<FrcsAutoOrderVO> dataList = service.selectAutoOrderList(pagingVO);	// 한 페이지에 해당하는 10개의 데이터
		pagingVO.setDataList(dataList);

		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("frcsId", frcsId);
		
		// 모달창 안 제품 리스트
		List<FrcsInventoryVO> inventList = service.getInventList(frcsId);
		model.addAttribute("inventList", inventList);
		
		return "owner/order/autoOrderList";
	}
	
	// 모달창 안 제품 검색
	@ResponseBody
	@RequestMapping(value="/autoArder/orderSearch.do", method =RequestMethod.POST)
	public ResponseEntity<List<FrcsInventoryVO>> inventSearch(String searchWord){
		List<FrcsInventoryVO> inventVO = service.getSearch(searchWord);
		
		return new ResponseEntity<List<FrcsInventoryVO>>(inventVO, HttpStatus.OK);
	}
	
	// 자동발주 등록
	@ResponseBody
	@RequestMapping(value="/autoOrder/insert.do", method =RequestMethod.POST)
	public ResponseEntity<ServiceResult> addAutoOrder(@RequestBody FrcsAutoOrderVO autoVO){
		
		ServiceResult result = service.insertAutoOrder(autoVO);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	// 자동발주 상태변경
	@ResponseBody
	@RequestMapping(value="/autoOrder/disabled.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> disabledAutoOrder(@RequestBody FrcsAutoOrderVO autoVO){
		
		ServiceResult result = service.disabledAutoOrder(autoVO);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	//자동발주 추가시 중복체크
	@ResponseBody
	@RequestMapping(value="/autoOrderCheck.do", method =RequestMethod.POST)
	public ResponseEntity<ServiceResult> autoOrderCheck(@RequestBody FrcsAutoOrderVO autoVO){
		
		ServiceResult result = service.autoOrderCheck(autoVO);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	
	// 자동발주 수정
	@ResponseBody
	@RequestMapping(value="/autoOrder/update.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> autoOrderUpdate(@RequestBody FrcsAutoOrderVO autoVO){
		
		ServiceResult result = service.autoOrderUpdate(autoVO);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
}
