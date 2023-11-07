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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.member.ITendiBoardService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HdBoardAnswerVO;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.member.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/elly")
public class TendiBoardController {
	@Inject
	private ITendiBoardService tendiboardService;

	@RequestMapping(value = "/tendilist.do")
	public String boardList(
			@RequestParam(name = "page", required = false, defaultValue = "1")int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
			){
		
		PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<BoardVO>();
		
		// 검색이 이뤄지면 아래가 실행됨
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);  
		int totalRecord = tendiboardService.selectBoardCount(pagingVO); //총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord); //totalPage 결정
		List<BoardVO> dataList = tendiboardService.selectBoardList(pagingVO);
		log.info("boardList->dataList : " + dataList);
		
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "mainhome/member/tendiboard/list";
	}
	
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/tendidetail.do" )
	public String boardDetail(int tableNo, Model model) {
		BoardVO boardVO = tendiboardService.selectBoard(tableNo);
		
		//본사 답변
		HdBoardAnswerVO hdBoardAnswer = tendiboardService.selectBoardAnswer(tableNo);
		log.info("hdBoardAnswer->hdBoardAnswer : " + tableNo);
		
		model.addAttribute("board", boardVO);
		model.addAttribute("hdBoardAnswer", hdBoardAnswer);
		return "mainhome/member/tendiboard/detail";
	}
	
	
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/tendiform.do")
	public String boardform() {
		return "mainhome/member/tendiboard/form";
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/tendiinsert.do", method = RequestMethod.POST)
	public String boardInsert(
			HttpServletRequest req,
			HttpSession session,
			RedirectAttributes ra,
			AlarmVO alarmVO, BoardVO boardVO, Model model, MemberVO memberVO) {
		String goPage="";
		
		
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isBlank(boardVO.getBoardTitle())) {
			errors.put("boardTitle", "제목을 입력해주세요.");
		}
		if(StringUtils.isBlank(boardVO.getBoardContent())) {
			errors.put("boardContent", "내용을 입력해주세요.");
		}
		if(errors.size()>0) {//에러발생
			model.addAttribute("errors",errors);
			model.addAttribute("boardVO", boardVO);
			goPage = "mainhome/member/tendiboard/form";
		}else {
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			boardVO.setMemId(user.getUsername());
			
			ServiceResult result = tendiboardService.insertBoard(req, boardVO, alarmVO);
			
			if(result.equals(ServiceResult.OK)) {
				goPage = "redirect:/elly/tendidetail.do?tableNo=" + boardVO.getTableNo();
			}else {
				model.addAttribute("message","서버에러, 다시 시도해주세요!");
				goPage = "mainhome/member/tendiboard/form";
			}
		}
		return goPage;
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/tendiupdate.do", method = RequestMethod.GET)
	public String boardModifyForm(int tableNo, Model model) {
		BoardVO boardVO = tendiboardService.selectBoard(tableNo);
		model.addAttribute("board", boardVO);
		model.addAttribute("status", "u"); //지금 응답은 수정이야!
		return "mainhome/member/tendiboard/form";
	}
	@RequestMapping(value = "/tendiupdate.do", method = RequestMethod.POST)
	public String boardModify(
			HttpServletRequest req,
			RedirectAttributes ra, BoardVO boardVO, Model model) {
		
		String goPage = "";
		ServiceResult result = tendiboardService.updateBoard(req, boardVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message","수정이 완료되었습니다!");
			goPage = "redirect:/elly/tendidetail.do?tableNo=" + boardVO.getTableNo();
		}else {
			model.addAttribute("message","수정에 실패하였습니다.");
			model.addAttribute("board", boardVO);
			model.addAttribute("status", "u");
			goPage = "mainhome/member/tendiboard/form";
		}
		return goPage;
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/tendidelete.do", method = RequestMethod.POST)
	public String boardDelete(
			HttpServletRequest req,
			RedirectAttributes ra, int tableNo, Model model) {
		String goPage;
		ServiceResult result = tendiboardService.deleteBoard(req, tableNo);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message","삭제가 완료 되었습니다.");
			goPage = "redirect:/elly/tendilist.do";
		}else {
			ra.addFlashAttribute("message","서버 오류, 다시 시도해주세요!");
			goPage = "redirect:/elly/tendidetail.do?tableNo=" + tableNo;
		}
		return goPage;
	}
	
}