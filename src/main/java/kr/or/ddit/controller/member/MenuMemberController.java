package kr.or.ddit.controller.member;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.head.IMenuService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.MenuVO;
import kr.or.ddit.vo.head.TotalInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/elly")
public class MenuMemberController {

	@Inject
	private IMenuService menuService;
	
	
	/**
	 * 메인 홈페이지 메뉴 안내 페이지 리턴 기능
	 * pagingVO를 통한 페이지네이션 기능
	 * @param currentPage
	 * @param searchType
	 * @param searchWord
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/menu.do", method=RequestMethod.GET)
	public String menu(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
	        @RequestParam(required = false, defaultValue = "title") String searchType,
	        @RequestParam(required = false) String searchWord,
			Model model) {
		
	    HeadPaginationInfoVO<MenuVO> pagingVO = new HeadPaginationInfoVO<MenuVO>(6,5);
	    
	    // 검색이 이뤄지면 아래가 실행됨
	      if(StringUtils.isNotBlank(searchWord)) {
	         pagingVO.setSearchType(searchType);
	         pagingVO.setSearchWord(searchWord);
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("searchWord", searchWord);
	      }
		
	    pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
	    int totalRecord = menuService.selectMemberMenuCount(pagingVO);   // 총 게시글 수
	    log.info("totalRecord : " + totalRecord);
	    
		int selectMenuCount = menuService.selectMemberMenuCount(pagingVO);
  
		pagingVO.setTotalRecord(totalRecord);// totalPage 결정
	    List<MenuVO> dataList = menuService.getMenuListByCategory(pagingVO);
	    log.info("menu->dataList : " + dataList);
	    pagingVO.setDataList(dataList);
	    
	    log.info("pagingVO : " + pagingVO);
	    
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("selectMenuCount", selectMenuCount);
	    model.addAttribute("pagingVO", pagingVO);  
	      
		log.info("Menu(): 시작");
		return "mainhome/member/menu/menu";
				
	}
	
	
	
	@RequestMapping(value = "/beerMenu.do", method=RequestMethod.GET)
	public String beerMenu(Model model) {
		return "mainhome/member/menu/beer";
	} 
}
	
	
	
