package kr.or.ddit.controller.owner;

import java.io.IOException;
import java.text.ParseException;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsDailySaleService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;
import kr.or.ddit.vo.owner.FrcsOrderVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerDailySalesController {

	@Inject
	private IFrcsDailySaleService service;
	
	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/dailySales.do", method = RequestMethod.GET)
	public String dailySales(
			@RequestParam(name="page", required=false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String afterDate,
			@RequestParam(required = false) String beforeDate,
			Model model){
		
        String frcsId = commService.getFrcsId();
        
    	//헤더 오른쪽 관리자 영역
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
        
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
        
        
        // 인기 메뉴 차트
        Gson gson = new Gson();
        List<FrcsDailySalesVO> popularMenu = service.getPopularMenu(frcsId);
        String popularMenuList = gson.toJson(popularMenu);
        model.addAttribute("popularMenuList", popularMenuList);
        
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
		
		List<FrcsDailySalesVO> insertList = service.getUpdateForm(saleVO);
		
		return new ResponseEntity<List<FrcsDailySalesVO>>(insertList, HttpStatus.OK);
	}
	
	// 일일 매출 수정
	@ResponseBody
	@RequestMapping(value="/dailyUpdate.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> updateDailySales(@RequestBody List<FrcsDailySalesVO> salesList){
	
		ServiceResult result = service.updateDailySales(salesList);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	// 주간차트
	@ResponseBody
	@RequestMapping(value="/dailySalesChart.do", method = RequestMethod.POST)
	public ResponseEntity<int[]> chartDate(String frcsId){
		
		int[] chartArr = service.getDate(frcsId);
		
		return new ResponseEntity<int[]>(chartArr,HttpStatus.OK);
	}
	
	// 엑셀 다운로드
    @RequestMapping(value="/dailySales/excel.do", method = RequestMethod.GET)
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
	   	Sheet sheet = workbook.createSheet("일일 매출 내역");
	   	 
	   	// 숫자형 데이터 콤마 찍기 위한 작업
		CellStyle formatCs = workbook.createCellStyle();
		formatCs = workbook.createCellStyle();
		formatCs.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
		 
    	// row 갯수를 카운팅 하기 위한 변수
		int rowNo = 0;
		
		// 엑셀 파일 최상위 행에 삽입될 변수명
		Row headerRow = sheet.createRow(rowNo++);
		 headerRow.createCell(0).setCellValue("순번");
		 headerRow.createCell(1).setCellValue("매출 날짜");
		 headerRow.createCell(2).setCellValue("총 매출 금액");
		
		 // db에서 받아온 데이터들을 반복문을 통하여 각각의 row 작성
		List<FrcsDailySalesVO> dailyList = service.getDailySalesCellList(frcsId);

		for(int i=0; i<dailyList.size(); i++) {
			
			Row row = sheet.createRow(rowNo++);
			row.createCell(0).setCellValue(i+1);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date salesDate = dailyList.get(i).getSelngDate();
			String salesDateStr = sdf.format(salesDate);
			
			row.createCell(1).setCellValue(salesDateStr);
			
			Cell cell2 = row.createCell(2);
			cell2.setCellValue(dailyList.get(i).getTotalPrice());
			cell2.setCellStyle(formatCs);	
		}
		
		 // 응답 컨텐츠와 헤더를 정해주기
		 // header를 통해 파일명을 지정해주는 방식으로 한글 파일명을 사용할 수 없음
		 response.setContentType("application/vnd.ms-excel");
		 response.setHeader("Content-Disposition", "attachment;filename=dailySaleList.xls");
	   
		 // 다운로드
	 	 workbook.write(response.getOutputStream());
	 	 // 마무리로 close();
	     workbook.close();
	}
	
	
}
