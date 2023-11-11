package kr.or.ddit.controller.head;

import java.io.Console;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.controller.ImageUpload;
import kr.or.ddit.service.head.IMenuService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.MenuVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class HeadMenuController {
	
	// 이렇게 설정해줘야 root-context에서 설정했던 bean의 value값이 바인딩되어 여기에 들어온다.
	@Resource(name="uploadPath")
	private String resourcePath; 
	
	@Inject
	private IMenuService menuService;

	@RequestMapping(value = "/menu.do", method=RequestMethod.GET)
	public String menuList(
			@RequestParam(name="page", required = false, defaultValue = "1")int currentPage,
	        @RequestParam(required = false, defaultValue = "menuName") String searchType,
	        @RequestParam(required = false)String searchWord,
			Model model) {
		
	    HeadPaginationInfoVO<MenuVO> pagingVO = new HeadPaginationInfoVO<MenuVO>();
	    
	    // 검색이 이뤄지면 아래가 실행됨
	      if(StringUtils.isNotBlank(searchWord)) {
	         pagingVO.setSearchType(searchType);
	         pagingVO.setSearchWord(searchWord);
	         model.addAttribute("searchType", searchType);
	         model.addAttribute("searchWord", searchWord);
	      }
		
	    pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
	    int totalRecord = menuService.selectMenuCount(pagingVO);   // 총 게시글 수
		int selectMenuCount = menuService.selectMenuCount(pagingVO);
  
	    pagingVO.setTotalRecord(totalRecord);   // totalPage 결정
	    List<MenuVO> dataList =  menuService.selectMenuList(pagingVO);
	    pagingVO.setDataList(dataList);
	    
		model.addAttribute("totalRecord",totalRecord);
		model.addAttribute("selectMenuCount", selectMenuCount);
	    model.addAttribute("pagingVO",pagingVO);  
	      
		log.info("Menu(): 시작");
		return "head/information/menu";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/menuRegister.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
//	public ResponseEntity<MenuVO> menuRegister(@RequestBody MenuVO menuVO) {
//	    String menuCd = menuVO.getMenuCd();
//		   
//	    menuService.menuRegister(menuVO);
//	    
//		return new ResponseEntity<MenuVO>(menuVO, HttpStatus.OK);
//	  }
	
//	@Autowired
//	private ImageUpload imageUploadController;

	@ResponseBody
	@RequestMapping(value = "/menuRegister.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<String> menuRegister(
			HttpServletRequest req, MenuVO menuVO) throws IOException {
//	    String menuCd = menuVO.getMenuCd();

	    String attachOrgname = menuVO.getMenuFileList().get(0).getAttachOrgname();
		log.info("attachOrgname : " + attachOrgname);
		log.info("menuCg : " + menuVO.getMenuCg());
		log.info("menuDes : " + menuVO.getMenuDes());
		log.info("menuPrice : " + menuVO.getMenuPrice());
		log.info("menuName : " + menuVO.getMenuName());
		
		menuService.menuRegister(req, menuVO);
		
		ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
		return entity;
		}
	
	@ResponseBody
	@RequestMapping(value = "/menuDetail.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<MenuVO> menuDetail(@RequestBody Map<String,String> map){
		String menuCd = map.get("menuCd").toString();
		
		MenuVO menuVO = menuService.menuDetail(menuCd);
		return new ResponseEntity<MenuVO>(menuVO, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/menuUpdate.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<MenuVO> menuUpdate(@RequestBody Map<String, Object> map) {
	    String menuCd = (String) map.get("menuCd");
	    
	    // menuVO를 초기화
	    MenuVO menuVO = new MenuVO();
	    
	    if (menuCd != null && !menuCd.isEmpty()) {
	        log.info("menuCd는 제대로 넘어왔어 다음 진행해보쟈!!");
	        // 넘어온 값을 menuVO에 설정
	        String menuName = (String) map.get("menuName");
	        String menuDes = (String) map.get("menuDes");
	        String menuCg = (String) map.get("menuCg");
	        String price = map.get("menuPrice").toString();
	        int menuPrice = Integer.parseInt(price);
	        
	        menuVO.setMenuCd(menuCd);
	        menuVO.setMenuName(menuName);
	        menuVO.setMenuDes(menuDes);
	        menuVO.setMenuCg(menuCg);
	        menuVO.setMenuPrice(menuPrice);
	        
	        menuService.menuUpdate(menuVO); 
	    }

	    return new ResponseEntity<MenuVO>(menuVO, HttpStatus.OK);
	}

	@RequestMapping(value="/menuDelete.do", method = RequestMethod.POST)
	public String menuDelete(@RequestParam("menuCd")String menuCd) {
		menuService.menuDelete(menuCd);
		
        return "redirect:/head/menu.do";
   }
}
