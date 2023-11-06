package kr.or.ddit.controller.head;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.head.IOfficeService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.MenuVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class OfficeLetterController {
	
	@Inject
	private IOfficeService officeService;

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
	
	@ResponseBody
	@RequestMapping(value = "/officeLetterRegister.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<OfficeLetterVO> officeLetterRegister(@RequestBody OfficeLetterVO officeLetterVO) {
	    int hdLtno = officeLetterVO.getHdLtno();
		   
	    officeService.officeLetterRegister(officeLetterVO);
	    
		return new ResponseEntity<OfficeLetterVO>(officeLetterVO, HttpStatus.OK);
	  }
	
	@RequestMapping(value = "/officeLetterRead.do", method=RequestMethod.GET)
	public String OfficeLetterRead(Model model) {
		log.info("OfficeLetterRead(): 시작");
		return "head/store/officeLetterRead";
	}
}
