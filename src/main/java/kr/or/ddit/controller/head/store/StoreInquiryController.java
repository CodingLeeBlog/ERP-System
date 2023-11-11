package kr.or.ddit.controller.head.store;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.head.IStoreInquiryService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.TotalInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class StoreInquiryController {
	
	@Inject
	private IStoreInquiryService service;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/storeInquiry.do")
	public String storeInquiry(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchStatus,
			@RequestParam(required = false) String searchWord,
			Model model) {
		log.info("storeInquiry() GET -> 시작");
		
		HeadPaginationInfoVO<TotalInfoVO> pagingVO = new HeadPaginationInfoVO<TotalInfoVO>();
		
		if(StringUtils.isNotBlank(searchStatus)) {
			pagingVO.setSearchStatus(searchStatus);
			model.addAttribute("searchStatus", searchStatus);
		}
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.selectTotalFrcsCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<TotalInfoVO> dataList = service.selectTotalFrcsList(pagingVO);
		pagingVO.setDataList(dataList);
		
//		if(!dataList.isEmpty()) {
//		
//			Set<String> frcsNames = new HashSet<String>();
//			List<TotalInfoVO> remove = new ArrayList<TotalInfoVO>();
//			
//			for (TotalInfoVO tfVO : dataList) {
//				String frcsName = tfVO.getFrcsName();
//				if(frcsNames.contains(frcsName)) {
//					remove.add(tfVO);
//				}else {
//					frcsNames.add(frcsName);
//				}
//			}
//			
//			dataList.removeAll(remove);
//		}
		
//		totalRecord = dataList.size();
		
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/store/storeInquiry";
	} 
}