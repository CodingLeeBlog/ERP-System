package kr.or.ddit.controller.head;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.head.IInquiryService;
import kr.or.ddit.vo.head.HeadInquiryVO;
import kr.or.ddit.vo.member.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class InquiryController {

	@Inject
	private IInquiryService inquiryService;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/inquiryList.do")
	public String inquiryList(
			@RequestParam(name = "page", required = false, defaultValue = "1")int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			){
		
		PaginationInfoVO<HeadInquiryVO> pagingVO = new PaginationInfoVO<HeadInquiryVO>();
		
		// 검색이 이뤄지면 아래가 실행됨
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);  
		int totalRecord = inquiryService.selectInquiryCount(pagingVO); //총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord); //totalPage 결정
		List<HeadInquiryVO> dataList = inquiryService.selectInquiryList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/inquiry/list";
	}
}
