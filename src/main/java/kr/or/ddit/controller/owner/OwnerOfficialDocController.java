package kr.or.ddit.controller.owner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.head.IOfficeService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsOfficialDocService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FrcsOfficialDocVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Controller
@RequestMapping("/owner")
public class OwnerOfficialDocController {

	@Inject
	private IFrcsOfficialDocService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/doc.do", method = RequestMethod.GET )
	public String ownerOfficialDocList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO = new OwnerPaginationInfoVO<FrcsOfficialDocVO>();
		
		// 검색
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		String frcsId = idService.getFrcsId();
		
		pagingVO.setFrcsId(frcsId);
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectOfldcCount(pagingVO);//총게시글수
		
		pagingVO.setTotalRecord(totalRecord); // totalPage 결정
		List<FrcsOfficialDocVO> ofldcList = service.selectOfldcList(pagingVO);
		pagingVO.setDataList(ofldcList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "owner/board/officialDocList";
	}
	
	
	@RequestMapping(value = "/docInsert.do", method = RequestMethod.POST)
	public String ownerIOfficialDocInsert(
			HttpServletRequest req,
			RedirectAttributes ra,
			FrcsOfficialDocVO frcsOfldcVO, Model model) {
		
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
			ServiceResult result = service.ofldcInsert(req,frcsOfldcVO);
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
	
}
