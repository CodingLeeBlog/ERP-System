package kr.or.ddit.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

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

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/elly")
public class LoginController {
	
	@Inject
	private IMemberService memberService;
	
	@Autowired
	private JavaMailSender emailSender;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm(String error, String logout, Model model) {
		log.info("loginForm() 실행...!");
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error!");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!!");
		}
		
		return "conn/loginForm";
	}
	
	/**
	 * 회원 가입 아이디 중복 체크 기능
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> idCheck (@RequestBody Map<String, String> map){
		String id = map.get("memId").toString();
		ServiceResult result = memberService.idCheck(id);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	/**
	 * 가맹점주 회원 가입 창업자 일련번호 인증 기능
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/ownerIdCheck.do", method = RequestMethod.POST)
	public ResponseEntity<OwnerVO> ownerIdCheck (@RequestBody Map<String, String> map){
		String ownerId = map.get("ownerId").toString();
		OwnerVO result = memberService.ownerIdCheck(ownerId);
		return new ResponseEntity<OwnerVO>(result, HttpStatus.OK);
	}
	
	/**
	 * 가맹점주 회원 가입 가맹점 인증 기능
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/frcsIdCheck.do", method = RequestMethod.POST)
	public ResponseEntity<FranchiseVO> frcsIdCheck (@RequestBody Map<String, String> map){
		String frcsId = map.get("frcsId").toString();
		FranchiseVO result = memberService.frcsIdCheck(frcsId);
		return new ResponseEntity<FranchiseVO>(result, HttpStatus.OK);
	}
	
	/**
	 * 회원 가입 이메일 인증 기능
	 * 
	 * @param email
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("email") String email) throws Exception{
	    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    
	    String from = "qweiop1541@naver.com"; //보내는 이 메일주소
	    String to = email;
	    String title = "[엘리할머니맥주] 회원가입 이메일 인증번호입니다.";
	    String content = "<div>";
		content += "<div style='margin:30px auto;width:600px;border:10px solid #f7f7f7'>";
		content += "<div style='border:1px solid #000000'>";
		content += "<h1 style='padding:30px 30px 0;background:#f7f7f7;color:#555;font-size:1.4em'>이메일 인증번호 안내</h1>";
		content += "<span style='display:block;padding:10px 30px 30px;background:#f7f7f7;text-align:right'>";
		content += "<a href='https://coolenjoy.net:443' target='_blank' rel='noreferrer noopener'>엘리할머니맥주</a>";
		content += "</span>";
		content += "<p style='margin:20px 0 0;padding:30px 30px 30px;border-bottom:1px solid #eee;line-height:1.7em'>";
	    content += "안녕하세요 고객님<br>";
	    content += "'회원가입'을 위해 필요한 이메일 인증 번호입니다.<br>";
	    content += "아래 발급된 인증번호를 확인하신 후, <span style='color:#ff3061'><strong>이메일 인증을</strong> 진행해주세요.</span><br>";
		content += "감사합니다.</p>";
		content += "<p style='margin:0;padding:30px 30px 30px;border-bottom:1px solid #eee;line-height:1.7em'>";
		content += "<span style='display:inline-block;width:110px'>이메일 인증번호 :</span><strong style='color:#ff3061'>" + serti + "</strong>";
		content += "</p>";
		content += "<p style='display:block;padding:30px 0; background:#484848; color:#fff;text-decoration:none; text-align:center'>엘리할머니맥주</p>";
		content += "</div>";
		content += "</div>";
		content += "</div>";
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
	
	@RequestMapping(value = "/register01.do", method = RequestMethod.GET)
	public String registerForm1(Model model) {
		return "conn/register01";
	}
	
	/**
	 * 회원가입 페이지 리턴 기능
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/register02.do", method = RequestMethod.GET)
	public String registerForm2(Model model) {
		return "mainhome/register/register02";
	}
	
	/**
	 * 회원가입 기능(ajax 비동기처리)
	 * 
	 * @param memberVO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/register02.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> register(@RequestBody MemberVO memberVO) {
		
		ServiceResult result = null;
		
		if(memberVO.getOwnerId() == null) {
			memberVO.setMemGrade("Welcome");
			result = memberService.membercreate(memberVO);
		}else {
			 result = memberService.ownercreate(memberVO);
		}

		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	/**
	 * 기존 회원가입 기능(ajax 비동기처리 방식으로 변경)
	 * 
	 * @param ra
	 * @param memberVO
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "/register02.do", method = RequestMethod.POST)
//	public String register(
//			RedirectAttributes ra,
//			MemberVO memberVO, Model model
//		) {
//		
//		String goPage = "";
//		
//		Map<String, String> errors = new HashMap<String, String>();
//		
//		if(StringUtils.isBlank(memberVO.getMemId())) {
//			errors.put("memId", "아이디를 입력해주세요");
//		}
//		if(StringUtils.isBlank(memberVO.getMemPw())) {
//			errors.put("memPw", "비밀번호를 입력해주세요");
//		}
//		if(errors.size() > 0) {
//			model.addAttribute("errors", errors);
//			model.addAttribute("member", memberVO);
//			goPage = "conn/register02";
//		}else {
//			if(memberVO.getOwnerId() == null) {
//				memberVO.setMemGrade("Welcome");
//				ServiceResult result = memberService.membercreate(memberVO);
//				if(result.equals(ServiceResult.OK)) {
//					ra.addFlashAttribute("message", "회원가입이 완료되였습니다!");
//					goPage = "redirect:/elly/login.do";
//				}else {
//					model.addAttribute("bodyText", "register-page");
//					model.addAttribute("message", "서버 에러, 다시 시도해주세요!");
//					model.addAttribute("member", memberVO);
//					goPage = "conn/register02";
//				}
//			}else {
//				ServiceResult result = memberService.ownercreate(memberVO);
//				if(result.equals(ServiceResult.OK)) {
//					ra.addFlashAttribute("message", "회원가입이 완료되였습니다!");
//					goPage = "redirect:/elly/login.do";
//				}else {
//					model.addAttribute("bodyText", "register-page");
//					model.addAttribute("message", "서버 에러, 다시 시도해주세요!");
//					model.addAttribute("member", memberVO);
//					goPage = "conn/register02";
//				}
//			}
//			
//		}
//		return goPage;
//	}
	
	/**
	 * 회원 정보 찾기(모달창 사용으로 주석처리)
	 * 
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "/forget.do", method = RequestMethod.GET)
//	public String forgetForm(Model model) {
//		return "conn/forget";
//	}
	
	/**
	 * 회원 아이디 찾기 기능
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/findid.do")
	public ResponseEntity<MemberVO> findId(@RequestBody Map<String, String> map){
		MemberVO result = null;
		MemberVO member = new MemberVO();
		
		String memName = map.get("memName").toString();
		String memEmail = map.get("memEmail").toString();
		
		member.setMemName(memName);
		member.setMemEmail(memEmail);
		result = memberService.findId(member);

		return new ResponseEntity<MemberVO>(result, HttpStatus.OK);
	}
	
	/**
	 * 회원 패스워드 찾기 기능
	 * 
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/findpw.do")
	public ResponseEntity<MemberVO> findPw(@RequestBody Map<String, String> map){
		MemberVO result = null;
		MemberVO member = new MemberVO();
		
		String memName = map.get("memName").toString();
		String memEmail = map.get("memEmail").toString();
		String memId = map.get("memId").toString();
		
		member.setMemName(memName);
		member.setMemEmail(memEmail);
		member.setMemId(memId);
		
		result = memberService.findPw(member);
		
	    String from = "qweiop1541@naver.com"; //보내는 이 메일주소
	    String to = memEmail;
	    String title = "[엘리할머니맥주] 요청하신 회원 비밀번호 찾기 안내 메일입니다.";
	    String content = "<div>";
		content += "<div style='margin:30px auto;width:600px;border:10px solid #f7f7f7'>";
		content += "<div style='border:1px solid #000000'>";
		content += "<h1 style='padding:30px 30px 0;background:#f7f7f7;color:#555;font-size:1.4em'>회원정보 찾기 안내</h1>";
		content += "<span style='display:block;padding:10px 30px 30px;background:#f7f7f7;text-align:right'>";
		content += "<a href='https://coolenjoy.net:443' target='_blank' rel='noreferrer noopener'>엘리할머니맥주</a>";
		content += "</span>";
		content += "<p style='margin:20px 0 0;padding:30px 30px 30px;border-bottom:1px solid #eee;line-height:1.7em'>";
		content += "안녕하세요 고객님, 문의해주신 회원님의 비밀번호입니다.<br>";
		content += "타인에게 노출되지 않도록 주의해주십시오.<br>";
		content += "아래 발급된 비밀번호를 확인하신 후, <span style='color:#ff3061'><strong>로그인을</strong> 진행해주세요.</span><br>";
		content += "감사합니다.</p>";
		content += "<p style='margin:0;padding:30px 30px 30px;border-bottom:1px solid #eee;line-height:1.7em'>";
		content += "<span style='display:inline-block;width:70px'>비밀번호 :</span><strong style='color:#ff3061'>" + result.getMemPw() + "</strong>";
		content += "</p>";
		content += "<p style='display:block;padding:30px 0; background:#484848; color:#fff;text-decoration:none; text-align:center'>엘리할머니맥주</p>";
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

	    }
		
		return new ResponseEntity<MemberVO>(result, HttpStatus.OK);
	}	
}