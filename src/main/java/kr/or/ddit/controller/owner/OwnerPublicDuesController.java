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
import kr.or.ddit.service.owner.IFrcsBillService;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/owner")
public class OwnerPublicDuesController {

   @Inject
   private IFrcsBillService service;
   
   // 공과금 납부 리스트
   @PreAuthorize("hasRole('ROLE_OWNER')")
   @RequestMapping(value="/dues.do", method = RequestMethod.GET)
   public String publicDuesList(
         @RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
         @RequestParam(required = false) String searchYear,
         @RequestParam(required = false) String searchMonth,
         Model model) {
      
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
      
      pagingVO.setMemId(memId);
      pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
      int totalRecord = service.selectDuesCount(pagingVO);    // 총 게시글 수
      
      pagingVO.setTotalRecord(totalRecord);    // totalpage 결정
      List<FrcsPublicDuesVO> dataList = service.selectDuesList(pagingVO);   // 한 페이지에 해당하는 10개의 데이터
      pagingVO.setDataList(dataList);
      
      
      List<FrcsPublicDuesVO> duesList = service.duesList(memId);
      
      // memId값으로 프랜차이즈 아이디 얻어오기
      String frcsId = service.frcsIdInfo(memId);
//      duesVO.setFrcsId(frcsId);
      
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

   
   
}