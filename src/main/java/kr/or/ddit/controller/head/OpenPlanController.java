package kr.or.ddit.controller.head;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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

import kr.or.ddit.service.head.IOpenPlanService;
import kr.or.ddit.vo.head.EducationVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.head.OpenPlanVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class OpenPlanController {
	
	@Inject
	private IOpenPlanService openplanService;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/plan.do", method=RequestMethod.GET)
	public String ownerList(
		@RequestParam(name="page", required = false, defaultValue = "1")int currentPage,
        @RequestParam(required = false, defaultValue = "title") String searchType,
        @RequestParam(required = false)String searchWord,
		Model model) {
	
    HeadPaginationInfoVO<OpenPlanVO> pagingVO = new HeadPaginationInfoVO<OpenPlanVO>();
    
    // 검색이 이뤄지면 아래가 실행됨
      if(StringUtils.isNotBlank(searchWord)) {
         pagingVO.setSearchType(searchType);
         pagingVO.setSearchWord(searchWord);
         model.addAttribute("searchType", searchType);
         model.addAttribute("searchWord", searchWord);
      }
	
    pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
    int totalRecord = openplanService.selectOpenPlanCount(pagingVO);   // 총 게시글 수
	int selectOpenPlanCount = openplanService.selectOpenPlanCount(pagingVO);

    pagingVO.setTotalRecord(totalRecord);   
    List<OpenPlanVO> dataList =  openplanService.selectOpenPlanList(pagingVO);
    pagingVO.setDataList(dataList);
    
	model.addAttribute("totalRecord",totalRecord);
    model.addAttribute("pagingVO",pagingVO); 
		
		log.info("Counseling(): 시작");
		return "head/grandopening/plan";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/planUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<String> planUpdate(@RequestBody OpenPlanVO openPlanVO) {
		
		openplanService.planUpdate(openPlanVO);
		
		ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
		return entity;
	}

}
