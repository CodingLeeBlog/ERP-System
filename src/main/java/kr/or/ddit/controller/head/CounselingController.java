package kr.or.ddit.controller.head;

import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.head.ICounselService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
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
	
	@RequestMapping(value = "/counselMail.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("email") String email) throws Exception{
	    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    
	    String from = "qweiop1541@naver.com"; //보내는 이 메일주소
	    String to = email;
	    String title = "가맹점 회원가입시 필요한 인증번호 입니다.";
	    String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
	    String num = "";
	    try {
	    	MimeMessage mail = emailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(title);
	        mailHelper.setText(content, true);       
	        
	        emailSender.send(mail);
	        num = Integer.toString(serti);
	        
	    } catch(Exception e) {
	        num = "error";
	    }
	    return num;
	}
	
}
