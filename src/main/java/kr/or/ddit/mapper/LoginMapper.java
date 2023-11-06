package kr.or.ddit.mapper;

import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerVO;

public interface LoginMapper {

	public MemberVO readByMemId(String username);
	
	public MemberVO idCheck(String memId);

	public int membercreate(MemberVO memberVO);

	public void signupmemberAuth(String memId);

//	public MemberVO loginCheck(MemberVO memberVO);

	public MemberVO findId(MemberVO member);

	public MemberVO selectMember(String memId);

	public int memberUpdate(MemberVO memberVO);

	public FranchiseVO frcsIdCheck(String frcsId);

	public OwnerVO ownerIdCheck(String ownerId);

	public MemberVO findPw(MemberVO member);

	public int ownercreate(MemberVO memberVO);

	public void signupownerAuth(String memId);

	public void createfrcsownerShip(MemberVO memberVO);

}
