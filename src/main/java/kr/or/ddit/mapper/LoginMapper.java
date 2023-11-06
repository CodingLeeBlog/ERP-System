package kr.or.ddit.mapper;

import kr.or.ddit.vo.member.MemberVO;

public interface LoginMapper {

	public MemberVO readByMemId(String username);
	
	public MemberVO idCheck(String memId);

	public int create(MemberVO memberVO);

	public void signupAuth(String memId);

	public MemberVO loginCheck(MemberVO memberVO);

	public MemberVO findId(MemberVO member);

	public MemberVO selectMember(String memId);

	public int memberUpdate(MemberVO memberVO);

}
