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

import kr.or.ddit.service.head.IOfficeService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsOfficialDocService;
import kr.or.ddit.vo.head.HeadLtDetailVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsOfficialDocVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class OfficeLetterController {
	
	@Inject
	private IOfficeService officeService;
	
	@Inject
	private IFrcsOfficialDocService service;
	
	@Inject
	private IFrcsIdService idService;

	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/officeLetter.do", method=RequestMethod.GET)
	public String officeLetterList(
			@RequestParam(name="page", required = false, defaultValue = "1")int currentPage,
	        @RequestParam(required = false, defaultValue = "title") String searchType,
	        @RequestParam(required = false)String searchWord,
			Model model) {
		
	    HeadPaginationInfoVO<OfficeLetterVO> pagingVO = new HeadPaginationInfoVO<OfficeLetterVO>();
	    
	    // 검색이 이뤄지면 아래가 실행됨
	      if(StringUtils.isNotBlank(searchWord)) {
	         pagingVO.setSearchType(searchType);
	         pagingVO.setSearchWord(searchWord);
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("searchWord", searchWord);
	      }
		
	    pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
	    int totalRecord = officeService.selectLetterCount(pagingVO);   // 총 게시글 수
		int selectLetterCount = officeService.selectLetterCount(pagingVO);
  
	    pagingVO.setTotalRecord(totalRecord);   // totalPage 결정
	    List<OfficeLetterVO> dataList =  officeService.selectLetterList(pagingVO);
	    pagingVO.setDataList(dataList);
	    
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("selectLetterCount", selectLetterCount);
	    model.addAttribute("pagingVO",pagingVO);  
	    List<FranchiseVO> frcsList = officeService.getFrcsName();
	    
	    model.addAttribute("frcsList",frcsList);
	      
		log.info("OfficeLetter(): 시작");
		return "head/store/officeLetter";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/officeLetterRegister.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<String> officeLetterRegister(HttpServletRequest req, OfficeLetterVO officeLetterVO) {
		   
	    officeService.officeLetterRegister(req, officeLetterVO);
	    
	    ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
	    return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/officeLetterUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String officeLetterUpdate(@RequestBody OfficeLetterVO officeLetterVO) {
	    officeService.officeLetterUpdate(officeLetterVO);
	    return "{\"result\": \"OK\"}";
	}
	
	@ResponseBody
	@RequestMapping(value = "/officeLtDetailRegister.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<String> officeLtDetailRegister(@RequestBody List<HeadLtDetailVO> requestBody) {
	    
	    officeService.officeLtDetailRegister(requestBody);

	    ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
	    return entity;
	}
	
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/officeLetterRead.do", method=RequestMethod.GET)
	public String officeLetterRead(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO = new OwnerPaginationInfoVO<FrcsOfficialDocVO>();
		
		// 검색
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		String frcsId = idService.getFrcsId();
		
		pagingVO.setFrcsId(frcsId);
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectOfldcCount(pagingVO);//총게시글수
		
		pagingVO.setTotalRecord(totalRecord); // totalPage 결정
		List<FrcsOfficialDocVO> ofldcList = service.selectOfldcList(pagingVO);
		pagingVO.setDataList(ofldcList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/store/officeLetterRead";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/readDetail.do", method = RequestMethod.GET)
	public String readDetail(String frcsOfldcNo, Model model) {
		FrcsOfficialDocVO frcsOfldcVO = service.selectOfldc(frcsOfldcNo);
		model.addAttribute("frcsOfldcVO", frcsOfldcVO);
		return "head/store/officeLetterReadDetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/officeLetterDetail.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<OfficeLetterVO> officeLetterDetail(@RequestBody OfficeLetterVO officeLetterVO) {

	OfficeLetterVO officeLetter = officeService.officeLetterDetail(officeLetterVO);
			
	return new ResponseEntity<OfficeLetterVO>(officeLetter, HttpStatus.OK);
	}
	
	@RequestMapping(value="/officeLetterDelete.do", method = RequestMethod.POST)
	public String officeLetterDelete(@RequestParam("hdLtno")int hdLtno) {
		officeService.officeLetterDelete(hdLtno);
		
        return "redirect:/head/officeLetter.do";
   }
}
