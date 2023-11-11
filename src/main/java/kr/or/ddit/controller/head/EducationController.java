package kr.or.ddit.controller.head;

import java.util.List;

import javax.annotation.Resource;
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

import kr.or.ddit.service.head.IEducationService;
import kr.or.ddit.vo.head.EducationVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.head.OpenPlanVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
@RequiredArgsConstructor
public class EducationController {
	
	// 이렇게 설정해줘야 root-context에서 설정했던 bean의 value값이 바인딩되어 여기에 들어온다.
	@Resource(name="uploadPath")
	private String resourcePath; 

	private String url = "https://www.youtube.com/watch?v=G0w6lT-FZhY";
	
	@Inject
	private IEducationService educationService;

	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/education.do", method=RequestMethod.GET)
	public String educationList(
			@RequestParam(name="page", required = false, defaultValue = "1")int currentPage,
	        @RequestParam(required = false, defaultValue = "frcsName") String searchType,
	        @RequestParam(required = false)String searchWord,
			Model model) {
		
	    HeadPaginationInfoVO<EducationVO> pagingVO = new HeadPaginationInfoVO<EducationVO>();
	    
	    // 검색이 이뤄지면 아래가 실행됨
	      if(StringUtils.isNotBlank(searchWord)) {
	         pagingVO.setSearchType(searchType);
	         pagingVO.setSearchWord(searchWord);
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("searchWord", searchWord);
	      }
		
	    pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
	    int totalRecord = educationService.selectEducationCount(pagingVO);   // 총 게시글 수
		int selectEducationCount = educationService.selectEducationCount(pagingVO);
  
	    pagingVO.setTotalRecord(totalRecord);   // totalPage 결정
	    List<EducationVO> dataList =  educationService.selectEducationList(pagingVO);
	    pagingVO.setDataList(dataList);
	    
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("selectEducationCount", selectEducationCount);
	    model.addAttribute("pagingVO",pagingVO);  
	      
		return "head/grandopening/education";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/educationRegister.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<String> educationRegister(@RequestBody EducationVO educationVO) {
		   
		educationService.educationRegister(educationVO);
	    
	    ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
	    return entity;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/educationUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<String> educationUpdate(@RequestBody EducationVO educationVO) {
		
		educationService.educationUpdate(educationVO);
		
		ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
		return entity;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/educationVideo.do", method=RequestMethod.GET)
	public String educationVideo(Model model) {
		log.info("educationVideo(): 시작");
		return "owner/board/educationVideo";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/educationDetail.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<EducationVO> educationDetail(@RequestBody EducationVO educationVO) {

	EducationVO education = educationService.educationDetail(educationVO);
			
	return new ResponseEntity<EducationVO>(education, HttpStatus.OK);
	}
}
