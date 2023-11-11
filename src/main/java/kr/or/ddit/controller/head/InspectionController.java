package kr.or.ddit.controller.head;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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

import kr.or.ddit.controller.MediaUtils;
import kr.or.ddit.service.head.IInspectionService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InspectionVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.FrcsOrderVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class InspectionController {

	// 이렇게 설정해줘야 root-context에서 설정했던 bean의 value값이 바인딩되어 여기에 들어온다.
	@Resource(name="uploadPath")
	private String resourcePath; 
	
	@Inject
	private IInspectionService inspectionService;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/inspection.do", method=RequestMethod.GET)
	public String inspectionList(@RequestParam(name="page", required = false, defaultValue = "1")int currentPage,
	        @RequestParam(required = false, defaultValue = "title") String searchType,
	        @RequestParam(required = false)String searchWord,
			Model model) {;
			
		HeadPaginationInfoVO<InspectionVO> pagingVO = new HeadPaginationInfoVO<InspectionVO>();
	    
	    // 검색이 이뤄지면 아래가 실행됨
	      if(StringUtils.isNotBlank(searchWord)) {
	         pagingVO.setSearchType(searchType);
	         pagingVO.setSearchWord(searchWord);
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("searchWord", searchWord);
	      }
		
	    pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
	    int totalRecord = inspectionService.selectInspectionCount(pagingVO);   // 총 게시글 수
		int selectMenuCount = inspectionService.selectInspectionCount(pagingVO);
  
	    pagingVO.setTotalRecord(totalRecord);   // totalPage 결정
	    List<InspectionVO> dataList =  inspectionService.selectInspectionList(pagingVO);
	    pagingVO.setDataList(dataList);
	    
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("selectMenuCount", selectMenuCount);
	    model.addAttribute("pagingVO",pagingVO);  	
		    
		return "head/store/inspection";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value="/inspectionDownload.do", method = RequestMethod.GET)
	   public ResponseEntity<byte[]> inspectionDownload(int attachNo, HttpServletRequest req) throws IOException{
		   InputStream in = null;
		   ResponseEntity<byte[]> entity = null;
		   
		   String attachOrgname = null;
		   AttachVO attachVO = inspectionService.selectFileInfo(attachNo);
		   
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
	   
	   @PreAuthorize("hasRole('ROLE_HEAD')")
	   @ResponseBody
	   @RequestMapping(value = "/inspectionDetailModal.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	   public ResponseEntity<List<InspectionVO>> inspectionDetailModal(String frcsId) {
	       List<InspectionVO> detailList = inspectionService.getDetail(frcsId);

	       return new ResponseEntity<>(detailList, HttpStatus.OK);
	   }
	   
	    @PreAuthorize("hasRole('ROLE_HEAD')")
		@ResponseBody
		@RequestMapping(value = "/inspectionRegister.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
		public ResponseEntity<String> inspectionRegister(HttpServletRequest req, InspectionVO franchiseVO) {
			   
		   inspectionService.inspectionRegister(req, franchiseVO);
		    
		    ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
		    return entity;
		}
	   
		@PreAuthorize("hasRole('ROLE_HEAD')")
		@ResponseBody
		@RequestMapping(value="/frcsSearch.do", method =RequestMethod.POST)
		public ResponseEntity<List<FranchiseVO>> inventSearch(String searchWord){
			List<FranchiseVO> franchiseVO = inspectionService.getSearch(searchWord);
			
			return new ResponseEntity<List<FranchiseVO>>(franchiseVO, HttpStatus.OK);
		}
		
}
