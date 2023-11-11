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
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/counselDetail.do", produces = "application/json;charset=utf-8")
	public ResponseEntity<OwnerVO> counselDetail(@RequestBody OwnerVO ownerVO) {

	OwnerVO	owner = counselService.counselDetail(ownerVO);
			
	return new ResponseEntity<OwnerVO>(owner, HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
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
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/frcsIdMake.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity <String> makeFrcsId(Model model) {
	    String newFrcsId = counselService.makeFrcsId();
//	    model.addAttribute("newFrcsId", newFrcsId);
		return new ResponseEntity<String> (newFrcsId, HttpStatus.OK) ;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping(value = "/frcsCheck.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> frcsCheck (@RequestBody Map<String, String> map){
		String name = map.get("frcsName").toString();
		ServiceResult result = counselService.frcsCheck(name);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/counselMail.do", method = RequestMethod.POST)
	@ResponseBody
	public String mailCheck(@RequestBody Map<String, String> map) throws Exception {
	    
		String ownerId = map.get("ownerId").toString();
	    String frcsId = map.get("frcsId").toString();
	    String email = map.get("email").toString();
	    
	    String from = "qweiop1541@naver.com"; // 보내는 이메일 주소
	    String to = email;
	    String title = "[엘리할머니맥주] 창업문의 일련번호 및 가맹점 코드 인증번호입니다.";
	    String content = "<div>";
		content += "<div style='margin:30px auto;width:600px;border:10px solid #f7f7f7'>";
		content += "<div style='border:1px solid #000000'>";
		content += "<h1 style='padding:30px 30px 0;background:#f7f7f7;color:#555;font-size:1.4em'>창업문의 일련번호 및 가맹점 코드 안내</h1>";
		content += "<span style='display:block;padding:10px 30px 30px;background:#f7f7f7;text-align:right'>";
		content += "<a href='https://coolenjoy.net:443' target='_blank' rel='noreferrer noopener'>엘리할머니맥주</a>";
		content += "</span>";
		content += "<p style='margin:20px 0 0;padding:30px 30px 30px;border-bottom:1px solid #eee;line-height:1.7em'>";
		content += "안녕하세요 고객님<br>";
		content += "'회원가입'을 위해 필요한 창업문의 일련번호와 가맹점 코드 인증번호입니다.<br>";
		content += "아래 발급된 인증번호를 확인하신 후, <span style='color:#ff3061'><strong>회원가입 바로 가기</strong> 링크를 클릭 하십시오.</span><br>";
		content += "감사합니다.</p>";
		content += "<p style='margin:0;padding:30px 30px 30px;border-bottom:1px solid #eee;line-height:1.7em'>";
		content += "<span style='display:inline-block;width:65px'>일련번호 :</span> <strong style='color:#ff3061'>" + ownerId + "</strong><br>";
		content += "<span style='display:inline-block;width:80px'>가맹점 코드 :</span> <strong style='color:#ff3061'>" + frcsId + "</strong>";
		content += "</p>";
		content += "<a href='http://localhost/elly/register02.do' target='_blank' style='display:block;padding:30px 0;background:#484848;color:#fff;text-decoration:none;text-align:center' rel='noreferrer noopener'>회원가입 바로 가기</a>";
		content += "</div>";
		content += "</div>";
		content += "</div>";
	    
	    

	    try {
	        MimeMessage mail = emailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(title);
	        mailHelper.setText(content, true);
	        
	        emailSender.send(mail);
	    } catch(Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	    
	    return frcsId;
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@ResponseBody
	@RequestMapping("/frcsIdByOwnerId.do") // GET 요청을 처리할 메서드를 지정
    public ResponseEntity<String> getFrcsId(int ownerId) {
            // ownerId를 사용하여 frcsId를 데이터베이스에서 가져오는 서비스 메서드 호출
            String frcsId = counselService.getFrcsId(ownerId);
            
            return new ResponseEntity<String>(frcsId, HttpStatus.OK);
    }
}
