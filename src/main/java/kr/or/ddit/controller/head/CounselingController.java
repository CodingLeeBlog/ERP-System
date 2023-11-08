package kr.or.ddit.controller.head;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.head.ICounselService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class CounselingController {
	
	@Inject
	private ICounselService counselService;
	
	@Autowired
	private JavaMailSender emailSender;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/counseling.do", method=RequestMethod.GET)
	public String ownerList(
		@RequestParam(name="page", required = false, defaultValue = "1")int currentPage,
        @RequestParam(required = false, defaultValue = "title") String searchType,
        @RequestParam(required = false)String searchWord,
		Model model) {
	
    HeadPaginationInfoVO<OwnerVO> pagingVO = new HeadPaginationInfoVO<OwnerVO>();
    
    // 검색이 이뤄지면 아래가 실행됨
      if(StringUtils.isNotBlank(searchWord)) {
         pagingVO.setSearchType(searchType);
         pagingVO.setSearchWord(searchWord);
         model.addAttribute("searchType", searchType);
         model.addAttribute("searchWord", searchWord);
      }
	
    pagingVO.setCurrentPage(currentPage);   // startRow, endRow, startPage, endPage가 결정
    int totalRecord = counselService.selectCounselCount(pagingVO);   // 총 게시글 수
	int selectCounselCount = counselService.selectCounselCount(pagingVO);

    pagingVO.setTotalRecord(totalRecord);   
    List<OwnerVO> dataList =  counselService.selectCounselList(pagingVO);
    pagingVO.setDataList(dataList);
    
	model.addAttribute("totalRecord",totalRecord);
    model.addAttribute("pagingVO",pagingVO); 
		
		log.info("Counseling(): 시작");
		return "head/foundation/counseling";
	}
	
	@ResponseBody
	@RequestMapping(value = "/counselDetail.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<OwnerVO> counselDetail(@RequestBody OwnerVO ownerVO) {

	OwnerVO	owner = counselService.counselDetail(ownerVO);
			
	return new ResponseEntity<OwnerVO>(owner, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value = "/counselUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<String> counselUpdate(HttpServletRequest req, OwnerVO ownerVO) {
		
		counselService.counselUpdate(req, ownerVO); 
		
		ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
		return entity;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/counselRegister.do", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public ResponseEntity<String> counselRegister(@RequestBody FranchiseVO frcsVO) {
	    log.info("frcsId : " + frcsVO.getFrcsId());
	    
	    counselService.counselRegister(frcsVO); // counselService 메서드에는 HttpServletRequest를 사용하지 않도록 변경해야 합니다.
	    
	    ResponseEntity<String> entity = new ResponseEntity<String>("{\"result\": \"OK\"}", HttpStatus.OK);
	    return entity;
	}
	
	@RequestMapping(value = "/frcsIdMake.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity <String> makeFrcsId(Model model) {
	    String newFrcsId = counselService.makeFrcsId();
//	    model.addAttribute("newFrcsId", newFrcsId);
		return new ResponseEntity<String> (newFrcsId, HttpStatus.OK) ;
	}
	
	@ResponseBody
	@RequestMapping(value = "/frcsCheck.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> frcsCheck (@RequestBody Map<String, String> map){
		String name = map.get("frcsName").toString();
		ServiceResult result = counselService.frcsCheck(name);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/counselMail.do", method = RequestMethod.POST)
	@ResponseBody
	public String mailCheck(@RequestBody Map<String, String> map) throws Exception {
	    
	    String frcsId = map.get("frcsId").toString();
	    String email = map.get("email").toString();
	    
	    String from = "qweiop1541@naver.com"; // 보내는 이메일 주소
	    String to = email;
	    String title = "가맹점 회원가입시 필요한 가맹점 코드입니다.";
	    String content = "[가맹점 코드] "+ frcsId +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
	    
	    try {
	        MimeMessage mail = emailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(title);
	        mailHelper.setText(content, true);
	        
	        emailSender.send(mail);
	    } catch(Exception e) {
	        return "error";
	    }
	    
	    return frcsId;
	}
}
