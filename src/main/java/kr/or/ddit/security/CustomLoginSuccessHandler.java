package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	private RequestCache requestCache = new HttpSessionRequestCache();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("onAuthenticationSuccess() 실행...!");
		User customUser = (User) authentication.getPrincipal();
		log.info("username : " + customUser.getUsername());
		log.info("password : " + customUser.getPassword());
		
//		clearAuthenticationAttribute(request);
		
//		HttpSession session = request.getSession();
//		session.setAttribute("SessionInfo", customUser);
		
		log.info("auth : " + customUser.getAuthorities());
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String targetUrl = "";
		if(customUser.getAuthorities().stream().anyMatch(auth -> auth.getAuthority().equals("ROLE_HEAD"))) {			
			targetUrl = request.getContextPath() + "/head/dashboard.do";
			if(savedRequest != null) {
				targetUrl = savedRequest.getRedirectUrl();
			}	
			log.info("Login Success targetUrl 실행..! : " + targetUrl);
		}else if (customUser.getAuthorities().stream().anyMatch(auth -> auth.getAuthority().equals("ROLE_OWNER"))){
			targetUrl = request.getContextPath() + "/owner/home.do";
			if(savedRequest != null) {
				targetUrl = savedRequest.getRedirectUrl();
			}	
			log.info("Login Success targetUrl 실행..! : " + targetUrl);
		}else {
			targetUrl = request.getContextPath() + "/elly/main.do";
			if(savedRequest != null) {
				targetUrl = savedRequest.getRedirectUrl();
			}	
			log.info("Login Success targetUrl 실행..! : " + targetUrl);			
		}
		response.sendRedirect(targetUrl);
	}

//	public void clearAuthenticationAttribute(HttpServletRequest req) {
//		HttpSession session = req.getSession();
//		if(session == null) {
//			return;
//		}
//		
//		// SPRING_SECURITY_LAST_EXCEPTION 값
//		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
//	}

}
