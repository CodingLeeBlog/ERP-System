package kr.or.ddit.service.member;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerVO;

public interface IMemberService {

	public ServiceResult membercreate(MemberVO memberVO);

	public ServiceResult idCheck(String memId);

//	public MemberVO loginCheck(MemberVO memberVO);

//	public ServiceResult consult(OwnerVO ownerVO);

	public MemberVO findId(MemberVO member);

	public MemberVO findPw(MemberVO member);

	public MemberVO selectMember(String memId);

	public ServiceResult memberUpdate(MemberVO memberVO);

	public FranchiseVO frcsIdCheck(String frcsId);

	public OwnerVO ownerIdCheck(String ownerId);

	public ServiceResult ownercreate(MemberVO memberVO);

	public ServiceResult consult(OwnerVO ownerVO);

}
