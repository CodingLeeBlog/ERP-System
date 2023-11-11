package kr.or.ddit.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.vo.member.CustomUser;
import kr.or.ddit.vo.member.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {

	@Inject
	private LoginMapper loginMapper;
	
	/**
	 * 로그인 아이디, 패스워드를 통해 접근 권한 조회
	 * 
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("loadUserByUsername() 실행...!");
		
		MemberVO member;
		try {
			member = loginMapper.readByMemId(username);
			log.info("queried by member mapper : " + member);
			return member == null ? null : new CustomUser(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}










