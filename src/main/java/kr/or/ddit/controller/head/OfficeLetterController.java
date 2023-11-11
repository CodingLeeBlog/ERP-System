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
import kr.or.ddit.vo.AlarmVO;
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
	    
	    List<FranchiseVO> allFrcsList = officeService.getAllFrcs();
	    List<FranchiseVO> sefrcsList = officeService.getseFrcsName();
	    List<FranchiseVO> djfrcsList = officeService.getdjFrcsName();
	    List<FranchiseVO> bsfrcsList = officeService.getbsFrcsName();
	    List<FranchiseVO> dgfrcsList = officeService.getdgFrcsName();
	    List<FranchiseVO> gjfrcsList = officeService.getgjFrcsName();
	    
	    model.addAttribute("allFrcsList",allFrcsList);
	    model.addAttribute("sefrcsList",sefrcsList);
	    model.addAttribute("djfrcsList",djfrcsList);
	    model.addAttribute("bsfrcsList",bsfrcsList);
	    model.addAttribute("dgfrcsList",dgfrcsList);
	    model.addAttribute("gjfrcsList",gjfrcsList);
	      
		log.info("OfficeLetter(): 시작");
		return "head/store/officeLetter";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/officeLetterRegister.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<String> officeLetterRegister(HttpServletRequest req, OfficeLetterVO officeLetterVO) {
		
		officeLetterVO.setHdLtcontent(officeLetterVO.getHdLtcontent().substring(officeLetterVO.getHdLtcontent().split(" ")[0].length() + 1));
	    officeService.officeLetterRegister(req, officeLetterVO);
	    
	    ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
	    return entity;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/officeLetterUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public String officeLetterUpdate(@RequestBody OfficeLetterVO officeLetterVO) {
	    officeService.officeLetterUpdate(officeLetterVO);
	    return "{\"result\": \"OK\"}";
	}
	
	/**
	 * 전체 가맹점주에 공문 발송 및 알림 기능
	 * 
	 * @param requestBody
	 * @return
	 */
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/officeLtDetailRegister.do")
	public ResponseEntity<String> officeLtDetailRegister(@RequestBody List<HeadLtDetailVO> requestBody, AlarmVO alarmVO) {
	    
	    officeService.officeLtDetailRegister(requestBody, alarmVO);

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
		
		OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVOF = new OwnerPaginationInfoVO<FrcsOfficialDocVO>();

		// 검색
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVOF.setSearchType(searchType);
			pagingVOF.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
//		String frcsId = idService.getFrcsId();
//		pagingVOF.setFrcsId(frcsId);
		pagingVOF.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectOfldcCount(pagingVOF);//총게시글수
		
		pagingVOF.setTotalRecord(totalRecord); // totalPage 결정
		List<FrcsOfficialDocVO> ofldcList = service.selectHdList(pagingVOF);
		pagingVOF.setDataList(ofldcList);
		
		model.addAttribute("pagingVOF", pagingVOF);
		
		return "head/store/officeLetterRead";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/readDetail.do", method = RequestMethod.GET)
	public String readDetail(String frcsOfldcNo, Model model) {
		FrcsOfficialDocVO frcsOfldcVO = service.selectOfldc(frcsOfldcNo);
		model.addAttribute("frcsOfldcVO", frcsOfldcVO);
		return "head/store/officeLetterReadDetail";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/officeLetterDetail.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<OfficeLetterVO> officeLetterDetail(@RequestBody OfficeLetterVO officeLetterVO) {

	OfficeLetterVO officeLetter = officeService.officeLetterDetail(officeLetterVO);
			
	return new ResponseEntity<OfficeLetterVO>(officeLetter, HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value="/officeLetterDelete.do", method = RequestMethod.POST)
	public String officeLetterDelete(@RequestParam("hdLtno")int hdLtno) {
		officeService.officeLetterDelete(hdLtno);
		
        return "redirect:/head/officeLetter.do";
   }
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value="/officeAllList.do", method = RequestMethod.POST)
	public ResponseEntity<List<FranchiseVO>> allfranList(){
	
		List<FranchiseVO> allFranList =  officeService.getAllFrcs();
		
		return new ResponseEntity<List<FranchiseVO>>(allFranList, HttpStatus.OK);
		
	}
}
