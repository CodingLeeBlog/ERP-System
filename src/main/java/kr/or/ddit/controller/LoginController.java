package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.vo.member.MemberVO;
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
	
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String logoutForm() {
//		return "mainhome/main/home";
//	}
		
	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> idCheck (@RequestBody Map<String, String> map){
		String id = map.get("memId").toString();
		ServiceResult result = memberService.idCheck(id);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("email") String email) throws Exception{
	    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    
	    String from = "qweiop1541@naver.com"; //보내는 이 메일주소
	    String to = email;
	    String title = "회원가입시 필요한 인증번호 입니다.";
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
	
	@RequestMapping(value = "/register01.do", method = RequestMethod.GET)
	public String registerForm1(Model model) {
		return "conn/register01";
	}
	
	@RequestMapping(value = "/register02.do", method = RequestMethod.GET)
	public String registerForm2(Model model) {
		return "mainhome/register/register02";
	}
	
	@RequestMapping(value = "/register02.do", method = RequestMethod.POST)
	public String register(
			RedirectAttributes ra,
			MemberVO memberVO, Model model
		) {
		
		String goPage = "";
		
		Map<String, String> errors = new HashMap<String, String>();
		
		if(StringUtils.isBlank(memberVO.getMemId())) {
			errors.put("memId", "아이디를 입력해주세요");
		}
		if(StringUtils.isBlank(memberVO.getMemPw())) {
			errors.put("memPw", "비밀번호를 입력해주세요");
		}
		if(errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("member", memberVO);
			goPage = "conn/register02";
		}else {
			memberVO.setMemGrade("Welcome");
			ServiceResult result = memberService.create(memberVO);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "회원가입이 완료되였습니다!");
				goPage = "redirect:/elly/login.do";
			}else {
				model.addAttribute("bodyText", "register-page");
				model.addAttribute("message", "서버 에러, 다시 시도해주세요!");
				model.addAttribute("member", memberVO);
				goPage = "conn/register02";
			}
			
		}
		return goPage;
	}
	
	@RequestMapping(value = "/forget.do", method = RequestMethod.GET)
	public String forgetForm(Model model) {
		return "conn/forget";
	}
	
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
	
}

//if(map.size() == 3) {
//	String memId = map.get("memId").toString();
//	member.setMemName(memName);
//	member.setMemEmail(memEmail);
//	member.setMemId(memId);
//	result = memberService.findPw(member);
//}