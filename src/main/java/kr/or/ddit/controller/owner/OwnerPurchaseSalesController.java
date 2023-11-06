package kr.or.ddit.controller.owner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import kr.or.ddit.service.owner.IFrcsDailySaleService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import kr.or.ddit.vo.owner.FrcsOrderVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerPurchaseSalesController {

	@Inject
	private IFrcsDailySaleService service;
	
	@Inject
	private IFrcsIdService commService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/dailySales.do", method = RequestMethod.GET)
	public String dailySales(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String afterDate,
			@RequestParam(required = false) String beforeDate,
			Model model){
		
        String frcsId = commService.getFrcsId();
        
        OwnerPaginationInfoVO<FrcsDailySalesVO> pagingVO = new OwnerPaginationInfoVO<FrcsDailySalesVO>();
        
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
		
		int totalRecord = service.selectDailySalesCount(pagingVO);	// 총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord);	// totalPage 결정
		List<FrcsDailySalesVO> dataList = service.selectDailySalesList(pagingVO);	// 한 페이지에 해당하는 10개의 데이터
		pagingVO.setDataList(dataList);
		
		// 일일 매출 전체 리스트가 담긴 pagingVO
		model.addAttribute("pagingVO",pagingVO);
		
        // 일일 매출 조회(오늘)
//        List<FrcsDailySalesVO> dailySaleList = service.getDailySalesList(frcsId);
        
        // 가맹점 메뉴 정보
        List<FrcsMenuVO> frcsMenuList = service.getMenu(frcsId);
        
        model.addAttribute("frcsId",frcsId);
//        model.addAttribute("dailySaleList", dailySaleList);	// 가맹점 일일매출
        model.addAttribute("frcsMenuList", frcsMenuList);	// 가맹점 메뉴정보
        
        return "owner/purchaseSales/dailySales";
    }
	
	// 일일 매출 등록 시 날짜 중복 체크
	@ResponseBody
	@RequestMapping(value="/dailyInsertCheck.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> dailyInsertCheck(@RequestBody FrcsDailySalesVO saleVO){
		
		ServiceResult result = service.dailyInsertCheck(saleVO);
		
		return  new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	// 일일 매출 등록
	@ResponseBody
	@RequestMapping(value="/dailySalesInsert.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> insertDailySales(@RequestBody List<FrcsDailySalesVO> salesList){
		
		log.info("FrcsDailySalesVO : " + salesList);
		
		ServiceResult result = service.insertDailySales(salesList);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	
	// 일일 매출 수정을 위해 이미 db에 들어가있는 값 불러오기
	@ResponseBody
	@RequestMapping(value = "/dailyGetUpdateForm.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<List<FrcsDailySalesVO>> getUpdateForm(@RequestBody Map<String, Object> map) {
		
		String selngDateStr = map.get("selngDate").toString();
		String frcsId = map.get("frcsId").toString();
		
		Date selngDate = null;
		
		 try {
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		        selngDate = dateFormat.parse(selngDateStr);
		    } catch (ParseException e) {
		        e.printStackTrace();
		    }
		
		FrcsDailySalesVO saleVO = new FrcsDailySalesVO();
		saleVO.setSelngDate(selngDate);
		saleVO.setFrcsId(frcsId);
		
//		log.info("salesVO.getSelngDate()" + saleVO.getSelngDate());
//		log.info(saleVO.getFrcsId());
		
		List<FrcsDailySalesVO> insertList = service.getUpdateForm(saleVO);
		
		return new ResponseEntity<List<FrcsDailySalesVO>>(insertList, HttpStatus.OK);
	}
	
	// 일일 매출 수정
	@ResponseBody
	@RequestMapping(value="/dailySalesUpdate.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> updateDailySales(@RequestBody List<FrcsDailySalesVO> salesList){
	
		ServiceResult result = service.updateDailySales(salesList);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
}
