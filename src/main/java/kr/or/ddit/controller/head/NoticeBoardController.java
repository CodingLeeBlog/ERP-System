package kr.or.ddit.controller.head;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.MediaUtils;
import kr.or.ddit.controller.UploadFileUtils;
import kr.or.ddit.service.head.INoticeBoardService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadBoardVO;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.member.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class NoticeBoardController {
	
	// 이렇게 설정해줘야 root-context에서 설정했던 bean의 value값이 바인딩되어 여기에 들어온다.
	@Resource(name="uploadPath")
	private String resourcePath; 
	
	@Inject
	private INoticeBoardService noticeboardService;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/list.do")
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
		int totalRecord = noticeboardService.selectBoardCount(pagingVO); //총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord); //totalPage 결정
		List<HeadBoardVO> dataList = noticeboardService.selectBoardList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/notice/list";
	}
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@GetMapping(value = "/detail.do" )
	public String boardDetail(int boardNo, Model model) {
		HeadBoardVO headBoardVO = noticeboardService.selectBoard(boardNo);
		model.addAttribute("headBoardVO", headBoardVO);
		return "head/notice/detail";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/form.do")
	public String boardform() {
		return "head/notice/form";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String boardInsert(
			HttpServletRequest req,
			HttpSession session,
			RedirectAttributes ra,
			HeadBoardVO headBoardVO, MemberVO memberVO, Model model) {
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
			goPage = "head/notice/form";
		}else {
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			memberVO.setMemId(user.getUsername());
			
			ServiceResult result = noticeboardService.insertBoard(req, headBoardVO);
			
			if(result.equals(ServiceResult.OK)) {
				goPage = "redirect:/head/detail.do?boardNo=" + headBoardVO.getBoardNo();
			}else {
				model.addAttribute("message","서버에러, 다시 시도해주세요!");
				goPage = "head/notice/form";
			}
		}
		return goPage;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String boardModifyForm(int boardNo, Model model) {
		HeadBoardVO headBoardVO = noticeboardService.selectBoard(boardNo);
		model.addAttribute("headBoardVO", headBoardVO);
		model.addAttribute("status", "u"); //지금 응답은 수정이야!
		return "head/notice/form";
	}
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String boardModify(
			HttpServletRequest req,
			RedirectAttributes ra, HeadBoardVO headBoardVO, Model model) {
		
		String goPage = "";
		ServiceResult result = noticeboardService.updateBoard(req, headBoardVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message","수정이 완료되었습니다!");
			goPage = "redirect:/head/detail.do?boardNo=" + headBoardVO.getBoardNo();
		}else {
			model.addAttribute("message","수정에 실패하였습니다.");
			model.addAttribute("headBoardVO", headBoardVO);
			model.addAttribute("status", "u");
			goPage = "head/notice/form";
		}
		return goPage;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String boardDelete(
			HttpServletRequest req,
			RedirectAttributes ra, int boardNo, Model model) {
		String goPage;
		ServiceResult result = noticeboardService.deleteBoard(req, boardNo);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message","삭제가 완료 되었습니다.");
			goPage = "redirect:/head/list.do";
		}else {
			ra.addFlashAttribute("message","서버 오류, 다시 시도해주세요!");
			goPage = "redirect:/head/detail.do?boardNo=" + boardNo;
			}
			return goPage;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value="/download.do", method = RequestMethod.GET)
	   public ResponseEntity<byte[]> fileDownload(int attachNo) throws IOException{
		   InputStream in = null;
		   ResponseEntity<byte[]> entity = null;
		   
		   String attachOrgname = null;
		   AttachVO attachVO = noticeboardService.selectFileInfo(attachNo);
		   
		   if(attachVO != null) {
			   attachOrgname = attachVO.getAttachOrgname();
			   try {
				   String attachSavename = attachOrgname.substring(attachOrgname.lastIndexOf(".") + 1);
				   MediaType mType = MediaUtils.getMediaType(attachSavename);
				   HttpHeaders headers = new HttpHeaders();
				   in = new FileInputStream(attachVO.getAttachSavename());
				   
				   if(mType != null) {
					   headers.setContentType(mType);
				   }else {
					   attachOrgname = attachOrgname.substring(attachOrgname.indexOf("_") +1);
					   headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					   headers.add("content-Disposition", "attachment; attachOrgname=\""+
					   new String(attachOrgname.getBytes("UTF-8"), "ISO-8859-1") + "\"");
				   }
					entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			   }catch(Exception e) {
				   e.printStackTrace();
				   entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			   }finally {
				if(in != null) {
					in.close();
				  }
			   }
		   }else{
			   entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		   }
		   return entity;
	   }
	   
		
}