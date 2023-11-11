package kr.or.ddit.controller.owner;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.MediaUtils;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsInquiryService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInquiryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerInquiryController {

	@Inject
	private IFrcsInquiryService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	//root-context에서 설정했던 bean의 value값이 바인딩되어 여기에 들어온다.
	@Resource(name="uploadPath")
	private String resourcePath; 
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/inquiry.do", method = RequestMethod.GET )
	public String ownerInquiryList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		OwnerPaginationInfoVO<FrcsInquiryVO> pagingVO = new OwnerPaginationInfoVO<FrcsInquiryVO>();
		
		// 검색이 이루어지면 아래가 실행됨
		if(StringUtils.isNotBlank(searchWord)) { //" "이거나 공백문자"" 혹은 null이면 true를 반환
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setFrcsId(frcsId);
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectInqCount(pagingVO);//총게시글수
		
		pagingVO.setTotalRecord(totalRecord); // totalPage 결정
		List<FrcsInquiryVO> inqList = service.selectInqList(pagingVO);
		pagingVO.setDataList(inqList);
		
		model.addAttribute("pagingVO", pagingVO);
		
//		List<FrcsInquiryVO> frcsInqList = service.frcsInqList(frcsId);
//		model.addAttribute("inqList", frcsInqList);
		
		return "owner/board/inquiryList";
	}
	
//	가맹점마다 문의번호를 지정해주려면 어떻게 해야할까...?
	@RequestMapping(value = "/inqDetail.do", method = RequestMethod.GET)
	public String ownerInquiryDetail(String inqryNo, Model model) {
//		FrcsInquiryVO inqVO = service.frcsInqDetail(inqryNo);
		FrcsInquiryVO inqVO = service.selectInq(inqryNo);
		model.addAttribute("inqVO", inqVO);
		log.info("inqVO : " + inqVO.getTableName());
		return "owner/board/inquiryDetail";
	}
	
	@RequestMapping(value = "/inqForm.do", method = RequestMethod.GET)
	public String ownerInquiryForm() {
		return "owner/board/inquiryForm";
	}
	
	@RequestMapping(value = "/inqInsert.do", method = RequestMethod.POST)
	public String ownerInquiryInsert(
			HttpServletRequest req,
			RedirectAttributes ra,
			FrcsInquiryVO FrcsInqVO, Model model 
			) {
		
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(FrcsInqVO.getInqryTtl())) {
			errors.put("inqryTtl", "제목을 입력해주세요.");
		}
		if(StringUtils.isBlank(FrcsInqVO.getInqryCn())) {
			errors.put("inqryCn", "내용을 입력해주세요.");
		}
		
		if(errors.size() > 0 ) {
			model.addAttribute("errors", errors);
			model.addAttribute("FrcsInqVO", FrcsInqVO);
			goPage = "board/inquiryForm";
		}else {
			String frcsId = idService.getFrcsId();
			FrcsInqVO.setFrcsId(frcsId); //로그인한 사용자 설정
			ServiceResult result = service.inqInsert(req,FrcsInqVO);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "문의글 등록 완료!");
				goPage = "redirect:/owner/inqDetail.do?inqryNo=" + FrcsInqVO.getInqryNo();
			}else {
				model.addAttribute("message", "서버에러, 다시 시도해주세요.");
				goPage = "board/inquiryForm";
			}
		}
		return goPage;
	}
	
	@RequestMapping(value = "/inqUpdate.do", method = RequestMethod.GET)
	public String ownerInquiryUpdateForm(String inqryNo, Model model) {
		FrcsInquiryVO frcsInquiryVO = service.frcsInqDetail(inqryNo);
		model.addAttribute("inqVO", frcsInquiryVO);
		model.addAttribute("status", "u");
		log.info("파일리스트" + frcsInquiryVO.getInqFileList().get(0).getAttachNo());
		return "owner/board/inquiryForm";
	}
	
	@RequestMapping(value = "/inqUpdate.do", method = RequestMethod.POST)
	public String ownerInquiryUpdate(
			HttpServletRequest req,
			RedirectAttributes ra,
			FrcsInquiryVO frcsInquiryVO, Model model) {
		String goPage = "";
		ServiceResult result = service.frcsInqUpdate(req, frcsInquiryVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "수정이 완료되었습니다!");
			goPage = "redirect:/owner/inqDetail.do?inqryNo=" + frcsInquiryVO.getInqryNo();
		}else {
			model.addAttribute("message", "수정에 실패했습니다!");
			model.addAttribute("inqVO", frcsInquiryVO);
			model.addAttribute("status", "u");
			goPage = "board/inquiryForm";
		}
		return goPage;
	}
	
	@ResponseBody
	@RequestMapping(value = "/inqDelete.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsInquiryVO>> ownerInquiryDelete(
			HttpServletRequest req,
			RedirectAttributes ra,
			@RequestBody List<FrcsInquiryVO> inqDelList) {

		String goPage;
		for(FrcsInquiryVO frcsInqVO : inqDelList) {
			String inqryNo = frcsInqVO.getInqryNo();
			ServiceResult result = service.frcsInqDelete(req, inqryNo);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
				goPage = "redirect:/owner/inquiry.do";
			}else {
				ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
				goPage = "redirect:/owner/inqDetail.do?inqryNo=" + inqryNo;
			}
		}
		return new ResponseEntity<List<FrcsInquiryVO>>(HttpStatus.OK) ;
	}
	
	@RequestMapping(value="/inqDownload.do", method = RequestMethod.GET)
	   public ResponseEntity<byte[]> fileDownload(int attachNo) throws IOException{
		   InputStream in = null;
		   ResponseEntity<byte[]> entity = null;
		   
		   String attachOrgname = null;
		   AttachVO attachVO = service.selectFileInfo(attachNo);
		   
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
