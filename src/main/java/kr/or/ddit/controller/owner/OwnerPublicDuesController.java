package kr.or.ddit.controller.owner;

import java.io.IOException;
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
import kr.or.ddit.service.owner.IFrcsBillService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Controller
@RequestMapping("/owner")
public class OwnerPublicDuesController {

    @Inject
    private IFrcsBillService service;
   
    @Inject
	private IFrcsMyPageService myPageService;
	
	@Inject
	private IFrcsIdService idService;
   
   // 공과금 납부 리스트
   @PreAuthorize("hasRole('ROLE_OWNER')")
   @RequestMapping(value="/dues.do", method = RequestMethod.GET)
   public String publicDuesList(
         @RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
         @RequestParam(required = false) String searchYear,
         @RequestParam(required = false) String searchMonth,
         Model model) {
      
	   //헤더 오른쪽 관리자 영역
	   String frcsId1 = idService.getFrcsId();
	   FranchiseVO frcsHead = myPageService.headerDetail(frcsId1);
	   model.addAttribute("frcsHead", frcsHead); 
	   
      // 사용자 정보 가져오기
      User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      String memId = user.getUsername();

      // 페이징 처리
      OwnerPaginationInfoVO<FrcsPublicDuesVO> pagingVO = new OwnerPaginationInfoVO<FrcsPublicDuesVO>();
      
      // 년도 선택했으면 검색 실행
      if(StringUtils.isNotBlank(searchYear)) {
         pagingVO.setSearchYear(searchYear);
         model.addAttribute("searchYear", searchYear);
      }
      
      // 달 선택했으면 검색 실행
      if(StringUtils.isNotBlank(searchMonth)) {
         pagingVO.setSearchMonth(searchMonth);
         model.addAttribute("searchMonth", searchMonth);
      }
      
      // memId값으로 프랜차이즈 아이디 얻어오기
      String frcsId = service.frcsIdInfo(memId);
      
      pagingVO.setMemId(memId);
      pagingVO.setFrcsId(frcsId);
      pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
      int totalRecord = service.selectDuesCount(pagingVO);    // 총 게시글 수
      
      pagingVO.setTotalRecord(totalRecord);    // totalpage 결정
      List<FrcsPublicDuesVO> dataList = service.selectDuesList(pagingVO);   // 한 페이지에 해당하는 10개의 데이터
      pagingVO.setDataList(dataList);
      
      List<FrcsPublicDuesVO> duesList = service.duesList(memId);
     
      // 내 가맹점 평균 통계 가져오기
      FrcsPublicDuesVO average = service.average(frcsId);
      
      // 전체 가맹점 평균 통계 가져오기
      FrcsPublicDuesVO totalAverage = service.totalAverage();
      
      model.addAttribute("totalAverage",totalAverage);
      model.addAttribute("average",average);
      model.addAttribute("duesList",duesList);
      model.addAttribute("frcsId",frcsId);
      model.addAttribute("pagingVO", pagingVO);
      
      return "owner/payment/publicDuesList";
   }
   
   @RequestMapping(value="/dues/register.do", method = RequestMethod.POST)
   public String publicDuesRegister(FrcsPublicDuesVO duesVO) {
      
      service.duesRegister(duesVO);
      
       return "redirect:/owner/dues.do";
   }

   
   // 납부년월 중복체크
   @ResponseBody 
   @RequestMapping(value="/dues/duesPaydeCheck.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
   public ResponseEntity<ServiceResult> duesPaydeCheck(@RequestBody FrcsPublicDuesVO duesVO){
      ServiceResult result = service.duesPaydeCheck(duesVO);
      return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
   }
   
   @RequestMapping(value="/dues/delete.do", method = RequestMethod.POST)
   public String publicDuesDelete(@RequestParam("duesPayde")String duesPayde, @RequestParam("frcsId")String frcsId) {
      service.duesRemove(duesPayde,frcsId);
      // 삭제 시 dusePayde랑 가맹점주 코드 같이 보내야한다.
      return "redirect:/owner/dues.do";
   }
   
   // 페이지를  리턴하는 것이 아니라 데이터를 리턴하는 것이기 때문에 @RequestBody 어노테이션을 사용
   @ResponseBody
   @RequestMapping(value="/dues/duesDetail.do", method = RequestMethod.POST)
   public ResponseEntity<FrcsPublicDuesVO> duesDetail(@RequestBody Map<String,String> map){
	   
	   String duesPayde = map.get("duesPayde").toString();
	   String frcsId = map.get("frcsId").toString();
	   
	   FrcsPublicDuesVO frcsVO = service.duesDetail(duesPayde,frcsId);
	  
	   
	   return new ResponseEntity<FrcsPublicDuesVO>(frcsVO, HttpStatus.OK);
   }
   
   @RequestMapping(value="/dues/duesUpdate.do", method = RequestMethod.POST)
   public String publicDuesUpdate(FrcsPublicDuesVO duesVO) {
	   service.duesUpdate(duesVO);
	   return "redirect:/owner/dues.do";
   }
   
   // 차트를 위한 데이터
   @ResponseBody
   @RequestMapping(value="/dues/chart.do", method = RequestMethod.POST)
   public ResponseEntity<List<FrcsPublicDuesVO>> chartData(String frcsId){
	  
	  List<FrcsPublicDuesVO> chartList = service.getData(frcsId);
	   
	  return new ResponseEntity<List<FrcsPublicDuesVO>>(chartList,HttpStatus.OK);
   }

   // 엑셀 다운로드
   @RequestMapping(value="/publicDues/excel.do", method = RequestMethod.GET)
   public void excelDownload(HttpServletResponse response) throws IOException {
	   
	   /*
	    *  HSSF : Excel 2007 하위버전(.xls) 파일 포맷을 사용할 때 사용
	    *  XSSF : Excel 2007 (.xlsx) 파일 포맷을 사용할 때 사용
	    *  SXSSF : 대용량 엑셀 파일을 출력할 때 사용
	    * 
	    */  
   
      // 사용자 정보 가져오기
      User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      String memId = user.getUsername();
	
     // workbook => 엑셀 파일 객체
	 Workbook workbook = new HSSFWorkbook();
	   
	 // 하나의  sheet 생성
	 Sheet sheet = workbook.createSheet("공과금 내역");

	 // 숫자형 데이터 콤마 찍기 위한 작업
	 CellStyle formatCs = workbook.createCellStyle();
	 formatCs = workbook.createCellStyle();
	 formatCs.setDataFormat(HSSFDataFormat.getBuiltinFormat("#,##0"));
	 
	 // row 갯수를 카운팅 하기 위한 변수
	 int rowNo = 0;
	 
	 // 엑셀 파일 최상위 행에 삽입될 변수명
	 Row headerRow = sheet.createRow(rowNo++);
	 headerRow.createCell(0).setCellValue("순번");
	 headerRow.createCell(1).setCellValue("납부년월");
	 headerRow.createCell(2).setCellValue("전기세");
	 headerRow.createCell(3).setCellValue("수도세");
	 headerRow.createCell(4).setCellValue("가스비");
	 headerRow.createCell(5).setCellValue("월세");
	 
	 // db에서 받아온 데이터들을 반복문을 이용하여 각각의 row 작성
	 List<FrcsPublicDuesVO> duesList = service.duesList(memId);
	 
	 for(int i=0; i<duesList.size(); i++) {
		 // createRow 메소드를 통해 행을 생성하고, 해당 행의 지정된 열에 반복문을 통해 값을 넣어준다.
		 Row row = sheet.createRow(rowNo++);
		 row.createCell(0).setCellValue(i+1);
		 row.createCell(1).setCellValue(duesList.get(i).getDuesPayde());
		 
		 Cell cell2 = row.createCell(2);
		 cell2.setCellValue(duesList.get(i).getDuesElcty());
		 cell2.setCellStyle(formatCs);

		 Cell cell3 = row.createCell(3);
		 cell3.setCellValue(duesList.get(i).getDuesWater());
		 cell3.setCellStyle(formatCs);
		 
		 Cell cell4 = row.createCell(4);
		 cell4.setCellValue(duesList.get(i).getDuesGas());
		 cell4.setCellStyle(formatCs);

		 Cell cell5 = row.createCell(5);
		 cell5.setCellValue(duesList.get(i).getDuesMtht());
		 cell5.setCellStyle(formatCs);
		 
	 }
	 
	 // 응답 컨텐츠와 헤더를 정해주기
	 // header를 통해 파일명을 지정해주는 방식으로 한글 파일명을 사용할 수 없음
	 response.setContentType("application/vnd.ms-excel");
	 response.setHeader("Content-Disposition", "attachment;filename=publicDuesList.xls");
   
	 // 다운로드
 	 workbook.write(response.getOutputStream());
 	 // 마무리로 close();
     workbook.close();
   }
}