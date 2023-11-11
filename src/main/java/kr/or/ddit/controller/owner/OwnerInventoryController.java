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
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
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
import kr.or.ddit.service.owner.IFrcsInventoryService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerInventoryController {

	@Inject
	private IFrcsInventoryService service;

	@Inject
	private IFrcsIdService commService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/inventory.do", method = RequestMethod.GET )
	public String ownerInventoryList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "vdprodName") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		String frcsId = commService.getFrcsId();
		
		//헤더 오른쪽 관리자 영역
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
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
		model.addAttribute("pagingVO",pagingVO);
		model.addAttribute("frcsId",frcsId);
		
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
	
	// 재고초기설정
	@ResponseBody
	@RequestMapping(value="/inventory/beginSetting.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> beginSetting(String frcsId){
		
		ServiceResult result = service.beginSetting(frcsId);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	
	// 신규 제품 업데이트
	@ResponseBody
	@RequestMapping(value="/inventory/inventAdd.do")
	public ResponseEntity<ServiceResult> inventAdd(String frcsId){
		
		ServiceResult result = service.inventAdd(frcsId);
		
		return new ResponseEntity<ServiceResult>(result,HttpStatus.OK);
	}
	
	// 엑셀 다운로드
    @RequestMapping(value="/inventory/excel.do", method = RequestMethod.GET)
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
	   	Sheet sheet = workbook.createSheet("재고 내역");
	   	 
	   	// 숫자형 데이터 콤마 찍기 위한 작업
		CellStyle formatCs = workbook.createCellStyle();
		formatCs = workbook.createCellStyle();
		formatCs.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
		 
    	// row 갯수를 카운팅 하기 위한 변수
		int rowNo = 0;
		
		// 엑셀 파일 최상위 행에 삽입될 변수명
		Row headerRow = sheet.createRow(rowNo++);
		 headerRow.createCell(0).setCellValue("제품코드");
		 headerRow.createCell(1).setCellValue("제품명");
		 headerRow.createCell(2).setCellValue("현 재고수량");
		 headerRow.createCell(3).setCellValue("적정 재고수량");
		 headerRow.createCell(4).setCellValue("구매단가");
		 headerRow.createCell(5).setCellValue("이번달 입고량");
		 headerRow.createCell(6).setCellValue("이번달 출고량");
		 headerRow.createCell(7).setCellValue("마지막 입고일자");
		
		 // db에서 받아온 데이터들을 반복문을 통하여 각각의 row 작성
		List<FrcsInventoryVO> inventList = service.getInventList(frcsId);
		
		for(FrcsInventoryVO invent : inventList) {
			Row row = sheet.createRow(rowNo++);
			row.createCell(0).setCellValue(invent.getVdprodCd());
			row.createCell(1).setCellValue(invent.getVdprodName());
			row.createCell(2).setCellValue(invent.getInvntryQy());
			row.createCell(3).setCellValue(invent.getProprtQy());
			
			Cell cell4 = row.createCell(4);
			cell4.setCellValue(invent.getHdforwardPrice());
			cell4.setCellStyle(formatCs);
			
			row.createCell(5).setCellValue(invent.getAtorderQy());
			row.createCell(6).setCellValue(invent.getDlivyQy());

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date lastwrhousng = invent.getLastwrhousngDate();
			String lastwrhousngDate = "미입고";
			
			if(lastwrhousng != null) {
				lastwrhousngDate = sdf.format(lastwrhousng);
			}
			row.createCell(7).setCellValue(lastwrhousngDate);
			
		}
		
		 // 응답 컨텐츠와 헤더를 정해주기
		 // header를 통해 파일명을 지정해주는 방식으로 한글 파일명을 사용할 수 없음
		 response.setContentType("application/vnd.ms-excel");
		 response.setHeader("Content-Disposition", "attachment;filename=inventList.xls");
	   
		 // 다운로드
	 	 workbook.write(response.getOutputStream());
	 	 // 마무리로 close();
	     workbook.close();
		
	}
	
}
