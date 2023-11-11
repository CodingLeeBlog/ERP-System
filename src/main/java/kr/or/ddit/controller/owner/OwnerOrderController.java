package kr.or.ddit.controller.owner;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
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
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.service.owner.IFrcsOrderService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FranchiseVO;
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
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	// 발주 리스트
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String orderList(
			Model model) {
		
		String frcsId = commService.getFrcsId();
		
		//헤더 오른쪽 관리자 영역
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);

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
	public ResponseEntity<ServiceResult> frcsOrder(@RequestBody FrcsOrderVO frcsOrderVO, AlarmVO alarmVO) {
		
		String frcsId = commService.getFrcsId();
		System.out.println(frcsId);
		
		frcsOrderVO.setFrcsId(frcsId);
		ServiceResult result =  service.orderInsert(frcsOrderVO, alarmVO);
	    
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
		
		//헤더 오른쪽 관리자 영역
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
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
	
	// 엑셀 다운로드
    @RequestMapping(value="/orderDetail/excel.do", method = RequestMethod.GET)
	public void excelDownload(HttpServletResponse response) throws IOException{
 	   
 	   /*
 	    *  HSSF : Excel 2007 하위버전(.xls) 파일 포맷을 사용할 때 사용
 	    *  XSSF : Excel 2007 (.xlsx) 파일 포맷을 사용할 때 사용
 	    *  SXSSF : 대용량 엑셀 파일을 출력할 때 사용
 	    * 
 	    */  
    
    	String frcsId = commService.getFrcsId();
    	
        // workbook => 엑셀 파일 객체
	   	Workbook workbook = new HSSFWorkbook();
	   	   
	   	// 하나의  sheet 생성
	   	Sheet sheet = workbook.createSheet("발주 내역");
	   	 
	   	// 숫자형 데이터 콤마 찍기 위한 작업
		CellStyle formatCs = workbook.createCellStyle();
		formatCs = workbook.createCellStyle();
		formatCs.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
		 
    	// row 갯수를 카운팅 하기 위한 변수
		int rowNo = 0;
		
		// 엑셀 파일 최상위 행에 삽입될 변수명
		Row headerRow = sheet.createRow(rowNo++);
		 headerRow.createCell(0).setCellValue("순번");
		 headerRow.createCell(1).setCellValue("주문번호");
		 headerRow.createCell(2).setCellValue("주문명");
		 headerRow.createCell(3).setCellValue("주문금액");
		 headerRow.createCell(4).setCellValue("주문일자");
		 headerRow.createCell(5).setCellValue("승인여부");
		
		 // db에서 받아온 데이터들을 반복문을 통하여 각각의 row 작성
		List<FrcsOrderVO> orderList = service.getOrderList(frcsId);
		
		for(int i=0; i<orderList.size(); i++) {
			Row row = sheet.createRow(rowNo++);
			row.createCell(0).setCellValue(i+1);
			row.createCell(1).setCellValue(orderList.get(i).getFrcsOrderNo());
			row.createCell(2).setCellValue(orderList.get(i).getFrcsOrderName());
			
			Cell cell3 = row.createCell(3);
			cell3.setCellValue(orderList.get(i).getFrcsOrderAmt());
			cell3.setCellStyle(formatCs);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date orderDate = orderList.get(i).getFrcsOrderDate();
			String orderDateStr = "";
			
			if(orderDate != null) {
				orderDateStr = sdf.format(orderDate);
			}
			row.createCell(4).setCellValue(orderDateStr);
			row.createCell(5).setCellValue(orderList.get(i).getFrcsOrderConfm());
		}
		
		 // 응답 컨텐츠와 헤더를 정해주기
		 // header를 통해 파일명을 지정해주는 방식으로 한글 파일명을 사용할 수 없음
		 response.setContentType("application/vnd.ms-excel");
		 response.setHeader("Content-Disposition", "attachment;filename=orderList.xls");
	   
		 // 다운로드
	 	 workbook.write(response.getOutputStream());
	 	 // 마무리로 close();
	     workbook.close();
	}
}
