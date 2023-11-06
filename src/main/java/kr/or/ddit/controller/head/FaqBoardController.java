package kr.or.ddit.controller.head;

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
@RequestMapping("/head")
public class FaqBoardController {
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
		
		pagingVO.setTotalRecord(totalRecord); //totalPage 결정
		List<HeadBoardVO> dataList = faqboardService.selectBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/faq/list";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@GetMapping(value = "/faqdetail.do" )
	public String boardDetail(int boardNo, Model model) {
		HeadBoardVO headBoardVO = faqboardService.selectBoard(boardNo);
		model.addAttribute("headBoardVO", headBoardVO);
		return "head/faq/detail";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/faqform.do")
	public String boardform() {
		return "head/faq/form";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/faqinsert.do", method = RequestMethod.POST)
	public String boardInsert(
			HttpServletRequest req,
			HttpSession session,
			RedirectAttributes ra,
			HeadBoardVO headBoardVO, Model model, MemberVO memberVO) {
		String goPage="";
		
		
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isBlank(headBoardVO.getBoardTitle())) {
			errors.put("boardTitle", "제목을 입력해주세요.");
		}
		if(StringUtils.isBlank(headBoardVO.getBoardContent())) {
			errors.put("boardContent", "내용을 입력해주세요.");
		}
		if(errors.size()>0) {//에러발생
			model.addAttribute("errors",errors);
			model.addAttribute("headBoardVO", headBoardVO);
			goPage = "head/faq/form";
		}else {
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			memberVO.setMemId(user.getUsername());
			
			ServiceResult result = faqboardService.insertBoard(req, headBoardVO);
			
			if(result.equals(ServiceResult.OK)) {
				goPage = "redirect:/head/faqdetail.do?boardNo=" + headBoardVO.getBoardNo();
			}else {
				model.addAttribute("message","서버에러, 다시 시도해주세요!");
				goPage = "mainhome/head/form";
			}
		}
		return goPage;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/faqupdate.do", method = RequestMethod.GET)
	public String boardModifyForm(int boardNo, Model model) {
		HeadBoardVO headBoardVO = faqboardService.selectBoard(boardNo);
		model.addAttribute("headBoardVO", headBoardVO);
		model.addAttribute("status", "u"); //지금 응답은 수정이야!
		return "head/faq/form";
	}
	@RequestMapping(value = "/faqupdate.do", method = RequestMethod.POST)
	public String boardModify(
			HttpServletRequest req,
			RedirectAttributes ra, HeadBoardVO headBoardVO, Model model) {
		
		String goPage = "";
		ServiceResult result = faqboardService.updateBoard(req, headBoardVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message","수정이 완료되었습니다!");
			goPage = "redirect:/head/faqdetail.do?boardNo=" + headBoardVO.getBoardNo();
		}else {
			model.addAttribute("message","수정에 실패하였습니다.");
			model.addAttribute("headBoardVO", headBoardVO);
			model.addAttribute("status", "u");
			goPage = "head/faq/form";
		}
		return goPage;
	}
	
	@RequestMapping(value = "/faqdelete.do", method = RequestMethod.POST)
	public String boardDelete(
			HttpServletRequest req,
			RedirectAttributes ra, int boardNo, Model model) {
		String goPage;
		ServiceResult result = faqboardService.deleteBoard(req, boardNo);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message","삭제가 완료 되었습니다.");
			goPage = "redirect:/head/faqlist.do";
		}else {
			ra.addFlashAttribute("message","서버 오류, 다시 시도해주세요!");
			goPage = "redirect:/head/faqdetail.do?boardNo=" + boardNo;
		}
		return goPage;
	}
	
}

