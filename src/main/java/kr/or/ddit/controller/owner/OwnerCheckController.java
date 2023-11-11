package kr.or.ddit.controller.owner;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.controller.MediaUtils;
import kr.or.ddit.service.head.IInspectionService;
import kr.or.ddit.service.owner.IFrcsCheckService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InspectionVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Controller
@RequestMapping("/owner")
public class OwnerCheckController {

	@Inject
	private IFrcsCheckService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IInspectionService inspectionService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/check.do", method = RequestMethod.GET )
	public String ownerCheckList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		HeadPaginationInfoVO<InspectionVO> pagingVO = new HeadPaginationInfoVO<InspectionVO>();
		
		// 검색이 이뤄지면 아래가 실행됨
	      if(StringUtils.isNotBlank(searchWord)) {
	         pagingVO.setSearchType(searchType);
	         pagingVO.setSearchWord(searchWord);
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("searchWord", searchWord);
	      }
		
	    pagingVO.setFrcsId(frcsId);
	    pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
	    int totalRecord = inspectionService.selectInspectionCount(pagingVO);   // 총 게시글 수

	    pagingVO.setTotalRecord(totalRecord);   // totalPage 결정
	    List<InspectionVO> dataList = service.selectFrcsCheckList(pagingVO);
	    pagingVO.setDataList(dataList);
	    
	    model.addAttribute("pagingVO",pagingVO);  	
	    
		return "owner/check/checkList";
	}
	
	// 매장 점검 교육비디오
	@RequestMapping(value="/checkVideo.do", method = RequestMethod.GET )
	public String ownerCheckVideo() {
		return "owner/check/checkVideo";
	}
	
	@RequestMapping(value="/checkDownload.do", method = RequestMethod.GET)
	   public ResponseEntity<byte[]> docDownload(int attachNo, HttpServletRequest req) throws IOException{
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
	
}
