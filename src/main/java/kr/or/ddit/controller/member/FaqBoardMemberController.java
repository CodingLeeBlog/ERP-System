package kr.or.ddit.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.head.IFaqBoardService;
import kr.or.ddit.vo.head.HeadBoardVO;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.member.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/elly")
public class FaqBoardMemberController {
	@Inject
	private IFaqBoardService faqboardService;

	
	@RequestMapping(value = "/faqlist.do")
	public String boardList(
			@RequestParam(name = "page", required = false, defaultValue = "1")int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			){
		
		PaginationInfoVO<HeadBoardVO> pagingVO = new PaginationInfoVO<HeadBoardVO>();
		
		// 검색이 이뤄지면 아래가 실행됨
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);  
		int totalRecord = faqboardService.selectBoardCount(pagingVO); //총 게시글 수
		
		int selectBoardCount = faqboardService.selectBoardCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord); //totalPage 결정
		List<HeadBoardVO> dataList = faqboardService.selectBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("selectBoardCount", selectBoardCount);
		model.addAttribute("pagingVO", pagingVO);
		
		return "mainhome/member/faq/list";
	}
	
	@GetMapping(value = "/faqdetail.do" )
	public String boardDetail(int boardNo, Model model) {
		HeadBoardVO headBoardVO = faqboardService.selectBoard(boardNo);
		model.addAttribute("headBoardVO", headBoardVO);
		return "mainhome/member/faq/detail";
	}
	
	
}

