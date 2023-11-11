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
import kr.or.ddit.service.head.IOfficeService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.service.owner.IFrcsOfficialDocService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInquiryVO;
import kr.or.ddit.vo.owner.FrcsOfficialDocVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Controller
@RequestMapping("/owner")
public class OwnerOfficialDocController {

	// 이렇게 설정해줘야 root-context에서 설정했던 bean의 value값이 바인딩되어 여기에 들어온다.
	@Resource(name="uploadPath")
	private String resourcePath; 
	
	@Inject
	private IFrcsOfficialDocService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IOfficeService officeService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/doc.do", method = RequestMethod.GET )
	public String ownerOfficialDocList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVOF = new OwnerPaginationInfoVO<FrcsOfficialDocVO>();
		
		// 검색
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVOF.setSearchType(searchType);
			pagingVOF.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVOF.setFrcsId(frcsId);
		pagingVOF.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectOfldcCount(pagingVOF);//총게시글수
		
		pagingVOF.setTotalRecord(totalRecord); // totalPage 결정
		List<FrcsOfficialDocVO> ofldcList = service.selectOfldcList(pagingVOF);
		pagingVOF.setDataList(ofldcList);
		
		model.addAttribute("pagingVOF", pagingVOF);
		
		//본사 공문 리스트 받아오기 -------------------------------------------------------------------------
		HeadPaginationInfoVO<OfficeLetterVO> pagingVO = new HeadPaginationInfoVO<OfficeLetterVO>();
	    
	    // 검색이 이뤄지면 아래가 실행됨
	      if(StringUtils.isNotBlank(searchWord)) {
	         pagingVO.setSearchType(searchType);
	         pagingVO.setSearchWord(searchWord);
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("searchWord", searchWord);
	      }
		
	    pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
	    int totalRecord1 = officeService.selectLetterCount(pagingVO);   // 총 게시글 수
  
	    pagingVO.setTotalRecord(totalRecord1);   // totalPage 결정
	    List<OfficeLetterVO> dataList =  officeService.selectLetterList(pagingVO);
	    pagingVO.setDataList(dataList);
	    
	    model.addAttribute("pagingVO",pagingVO);
		
		return "owner/board/officialDocList";
	}
	
	@RequestMapping(value="/docDownload.do", method = RequestMethod.GET)
	   public ResponseEntity<byte[]> docDownload(int attachNo, HttpServletRequest req) throws IOException{
		   InputStream in = null;
		   ResponseEntity<byte[]> entity = null;
		   
		   String attachOrgname = null;
		   AttachVO attachVO = officeService.selectFileInfo(attachNo);
//		   attachVO = service.selectFileInfo(attachNo);
		   
		   if(attachVO != null) {
			   attachOrgname = attachVO.getAttachOrgname();
			   try {
				   String attachSavename = attachOrgname.substring(attachOrgname.lastIndexOf(".") + 1);
				   MediaType mType = MediaUtils.getMediaType(attachSavename);
				   HttpHeaders headers = new HttpHeaders();
				   in = new FileInputStream(req.getServletContext().getRealPath("")+attachVO.getAttachSavename());
				   
				   attachOrgname = attachOrgname.substring(attachOrgname.indexOf("_") +1);
				   if(mType != null) {
					   headers.setContentType(mType);
				   }else {
					   headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				   }
				   headers.add("content-Disposition", "attachment; filename=\""+
						   new String(attachOrgname.getBytes("UTF-8"), "ISO-8859-1") + "\"");
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
	
	
	@RequestMapping(value = "/docInsert.do", method = RequestMethod.POST)
	public String ownerOfficialDocInsert(
			HttpServletRequest req,
			RedirectAttributes ra,
			FrcsOfficialDocVO frcsOfldcVO, Model model, AlarmVO alarmVO) {
		
		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		if(StringUtils.isBlank(frcsOfldcVO.getFrcsOfldcTtl())) {
			errors.put("frcsOfldcTtl", "제목을 입력해주세요.");
		}
		if(StringUtils.isBlank(frcsOfldcVO.getFrcsOfldcCn())) {
			errors.put("frcsOfldcCn", "내용을 입력해주세요.");
		}
		
		if(errors.size() > 0 ) {
			model.addAttribute("errors", errors);
			model.addAttribute("frcsOfldcVO", frcsOfldcVO);
			goPage = "owner/board/officialDocList";
		}else {
			String frcsId = idService.getFrcsId();
			frcsOfldcVO.setFrcsOfldcSndpty(frcsId); //로그인한 사용자 설정
			ServiceResult result = service.ofldcInsert(req,frcsOfldcVO, alarmVO);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "공문 보내기 완료!");
				goPage = "redirect:/owner/doc.do";
			}else {
				model.addAttribute("message", "서버에러, 다시 시도해주세요.");
				goPage = "owner/board/officialDocList";
			}
		}
		return goPage;
	}
	
	@RequestMapping(value = "/docDetail.do", method = RequestMethod.GET)
	public String ownerOfficialDocDetail(String frcsOfldcNo, Model model) {
		FrcsOfficialDocVO frcsOfldcVO = service.selectOfldc(frcsOfldcNo);
		model.addAttribute("frcsOfldcVO", frcsOfldcVO);
		return "owner/board/officialDocDetail";
	}
	
	@RequestMapping(value = "/docDetailHead.do", method = RequestMethod.GET)
	public String ownerOfficialDocDetailHead(int hdLtno, Model model) {
		OfficeLetterVO officeLetterVO = officeService.officeLetterDetail(hdLtno);
		model.addAttribute("officeLetterVO", officeLetterVO);
		return "owner/board/officialDocDetailHead";
	}
	
	@ResponseBody
	@RequestMapping(value = "/docDelete.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsOfficialDocVO>> ownerOfficialDocDelete(
			HttpServletRequest req,
			RedirectAttributes ra,
			@RequestBody List<FrcsOfficialDocVO> ofldcDelList){
		
		String goPage;
		for(FrcsOfficialDocVO frcsOfldcVO : ofldcDelList) {
			String frcsOfldcNo = frcsOfldcVO.getFrcsOfldcNo();
			ServiceResult result = service.frcsOfldcDelete(req, frcsOfldcNo);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
				goPage = "redirect:/owner/doc.do";
			}else {
				ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
				goPage = "redirect:/owner/docDetail.do?frcsOfldcNo=" + frcsOfldcNo;
			}
		}
		return new ResponseEntity<List<FrcsOfficialDocVO>>(HttpStatus.OK);
	}
	
}
