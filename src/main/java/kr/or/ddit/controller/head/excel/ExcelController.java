package kr.or.ddit.controller.head.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.head.IStoreInquiryService;
import kr.or.ddit.vo.head.TotalInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class ExcelController {
	@Inject
	private IStoreInquiryService service;
	
	/**
	 * 입력값을 EXCEL로 
	 * @param response
	 * @throws IOException
	 */
	@PreAuthorize("hasRole('ROLE_HEAD')")
    @GetMapping(value = "/excel.do")
    public void excelDownload(HttpServletResponse response) throws IOException{
    	/*
    	 *  HSSF : Excel 2007 하위버전(.xls) 파일 포맷을 사용할 때 사용
    	 *	XSSF : Excel 2007 (.xlsx) 파일 포맷을 사용할 때 사용
    	 *	SXSSF : 대용량 엑셀 파일을 출력할 때 사용
    	 * 
    	 */
    	
    	
    	// workbook -> 엑셀 파일 객체
    	Workbook workbook = new HSSFWorkbook();
    	// 하나의 sheet 생성
    	Sheet sheet = workbook.createSheet("가맹점리스트");
    	// row 갯수를 카운팅 하기 위한 변수
    	int rowNo = 0;
    	
    	// 엑셀 파일 최상위 행에 삽입될 변수명
    	Row headerRow = sheet.createRow(rowNo++);
    	headerRow.createCell(0).setCellValue("순번");
    	headerRow.createCell(1).setCellValue("가맹점코드");
    	headerRow.createCell(2).setCellValue("가맹점명");
    	headerRow.createCell(3).setCellValue("가맹점주명");
    	headerRow.createCell(4).setCellValue("주소");
    	headerRow.createCell(5).setCellValue("운영상태");
    	headerRow.createCell(6).setCellValue("오픈일자");
    	headerRow.createCell(7).setCellValue("매장전화번호");
    	headerRow.createCell(8).setCellValue("가맹점주ID");
    	
    	// DB에서 받아온 데이터들을 반복문을 이용해 각각의 row 작성
    	List<TotalInfoVO> storeInquiry = service.storeList();
    	
    	for(TotalInfoVO total : storeInquiry) {
    		// createRow 메소드를 통해 행을 생성하고, 해당 행의 지정된 열에 반복문을 통해 값을 넣어준다.
    		
    		Row row = sheet.createRow(rowNo++);
    		row.createCell(0).setCellValue(total.getRnum());
    		row.createCell(1).setCellValue(total.getFrcsId());
    		row.createCell(2).setCellValue(total.getFrcsName());
    		row.createCell(3).setCellValue(total.getMemName());
    		row.createCell(4).setCellValue(total.getFrcsAdd1() + "_" + total.getFrcsAdd2());
    		row.createCell(5).setCellValue(total.getFrcsState());
    		row.createCell(6).setCellValue(total.getFrcsOpdate());
    		row.createCell(7).setCellValue(total.getFrcsTel());
    		row.createCell(8).setCellValue(total.getMemId());
    		log.debug("total -> {}" , total);
    	}
    	
    	// 응답 컨텐츠와 헤더를 정해 주기
    	// header를 통해 파일명을 지정해주는 방식으로는 한글 파일명을 사용할 수 없음
    	response.setContentType("application/vnd.ms-excel");
    	response.setHeader("Content-Disposition", "attachment;filename=storeList.xls");
    	
    	// 다운로드
    	workbook.write(response.getOutputStream());
    	// 마무리로 close();
    	workbook.close();
    }
    
    @ResponseBody
    @PreAuthorize("hasRole('ROLE_HEAD')")
    @RequestMapping(value="/excelUpload.do", method = RequestMethod.POST)
    public ResponseEntity<ServiceResult> uploadExcel(@RequestParam("excelFile") MultipartFile excelFile) throws InvalidFormatException {
    	
    	log.info("uploadExcel() -> 실행");
    	log.debug("excelFile : {}" , excelFile);
    	
    	ServiceResult result = null;
    	
    	try {
    		
    		// 업로드 받은 파일을 저장할 경로
    		String uploadFolder = "D:\\99.JSP_SPRING\\02. SPRING2\\uploadExcel";
    		// 파일 복사
    		File fileUpload = new File(uploadFolder, excelFile.getOriginalFilename());
    		excelFile.transferTo(fileUpload);
    		
    		// 복사한 파일 불러오기
    		FileInputStream file = new FileInputStream(uploadFolder + "\\" + excelFile.getOriginalFilename());
    		// 엑셀 객체에 해당 파일 보냄
    		HSSFWorkbook workbook = new HSSFWorkbook(file);
    					
    		// 현재 행 번호
    		int rowNo = 0;
    		// 현재 열 번호
    		int cellIndex = 0;
    							
    		HSSFSheet sheet = workbook.getSheetAt(0);
    		
    		// row 총 길이
    		int rows = sheet.getPhysicalNumberOfRows();	
    		// 행 반복문(행의 총 길이만큼)
    		for(rowNo = 0; rowNo<rows; rowNo++) {	
    			TotalInfoVO store = new TotalInfoVO();
    			HSSFRow row = sheet.getRow(rowNo);
    			if(row != null) {
    				
    				if(rowNo == 0) {
        				continue;
        			}
    				
    				// 열의 총 길이
    				int cells = row.getPhysicalNumberOfCells();
    				// 열의 총 길이만큼 반복
    				for(cellIndex = 0; cellIndex <= cells; cellIndex++){
    					HSSFCell cell = row.getCell(cellIndex);
    					String value = "";
    					
    					if(cell == null) {
    						continue;
    					}else {
	    					switch(cell.getCellType()) {
	    						case FORMULA:
	    							value = cell.getCellFormula(); // 수식 반환
	    							break;
	    						case NUMERIC:
	    							value = cell.getNumericCellValue() + ""; // 숫자반환
	    							break;
	    						case STRING:
	    							value = cell.getStringCellValue() + ""; // 문자열 반환/빈 셀은 빈 문자열
	    							break;
	    						case BLANK:
	    							value = cell.getBooleanCellValue() + "";  
	    							break;
	    						case ERROR:
	    							value = cell.getErrorCellValue() + ""; // 셀값을 오류코드로
	    					}
    					}
    					log.debug(rowNo + "번 행 : " + cellIndex + "번 열 값은 :" + value);
    				}
    			}
    			
    			int storeRnum = (int)row.getCell(0).getNumericCellValue();
    			store.setRnum(storeRnum);	// 순번
    			store.setFrcsId(row.getCell(1).getStringCellValue()); // 가맹점코드
    			store.setFrcsName(row.getCell(2).getStringCellValue()); // 가맹점명
    			store.setMemName(row.getCell(3).getStringCellValue()); // 가맹점주명
    			if(row.getCell(4).getStringCellValue() != null) { // 주소
    				String location = row.getCell(4).getStringCellValue();
    				String[] frcsAdd = location.split("_");
    				if(frcsAdd.length >= 2) {
    					store.setFrcsAdd1(frcsAdd[0]);
    					store.setFrcsAdd2(String.join(" ", Arrays.copyOfRange(frcsAdd, 1, frcsAdd.length)));
    				}else if(frcsAdd.length == 1) {
    					store.setFrcsAdd1(frcsAdd[0]);
    				}
    			}
    			store.setFrcsState(row.getCell(5).getStringCellValue()); // 운영상태
    			
    			Date frOpdate = row.getCell(6).getDateCellValue();
    			SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
    			String frcsOpdate = format.format(frOpdate);
    			store.setFrOpdate(frcsOpdate);	// 오픈일자
    			
    			store.setFrcsTel(row.getCell(7).getStringCellValue()); // 매장전화번호
    			store.setMemId(row.getCell(8).getStringCellValue());// 가맹점주ID
//    			int storeIpStts = (int)row.getCell(6).getNumericCellValue();
//    			store.setIpStts(storeIpStts); // 금월점검점수
    			
    			log.info("가맹점 액셀 업로드 시 행 업데이트.");
    			result = service.registerExcel(store);
    			log.debug("엑셀 업로드 결과 : {}", result);
    		}
    		
    		workbook.close();
    		
    	}catch(IOException e) {
    		e.printStackTrace();
    	}
    	
    	return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
    }
}
