package kr.or.ddit.service.member.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.mapper.head.CouponMapper;
import kr.or.ddit.mapper.member.ConsultMapper;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerVO;

@Service
public class MemberServiceImpl implements IMemberService {
	
	@Inject
	private LoginMapper loginMapper;
	
	@Inject
	private ConsultMapper consultMapper;
	
	@Inject
	private CouponMapper couponMapper;
	
	@Override
	public ServiceResult idCheck(String memId) {
		ServiceResult result = null;
		MemberVO member = loginMapper.idCheck(memId);
		if(member != null) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	/**
	 * 일반회원 회원가입 서비스 로직
	 */
	@Override
	public ServiceResult membercreate(MemberVO memberVO) {
		ServiceResult result = null;
		int status = loginMapper.membercreate(memberVO);
		if(status > 0) {
			loginMapper.signupmemberAuth(memberVO.getMemId());
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

//	@Override
//	public MemberVO loginCheck(MemberVO memberVO) {
//		return loginMapper.loginCheck(memberVO);
//	}

//	@Override
//	public ServiceResult consult(OwnerVO ownerVO) {
//		ServiceResult result = null;
//		int status = consultMapper.consult(ownerVO);
//		if(status > 0) {
//			result = ServiceResult.OK;
//		}else {
//			result = ServiceResult.FAILED;
//		}
//		return result;		
//	}

	@Override
	public MemberVO findId(MemberVO member) {
		MemberVO result = loginMapper.findId(member);
		return result;
	}

	@Override
	public MemberVO findPw(MemberVO member) {
		MemberVO result = loginMapper.findPw(member);
		return result;
	}

	@Override
	public MemberVO selectMember(String memId) {
		return loginMapper.selectMember(memId);
	}

	@Override
	public ServiceResult memberUpdate(MemberVO memberVO) {
		ServiceResult result = null;
		int status = loginMapper.memberUpdate(memberVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public OwnerVO ownerIdCheck(String ownerId) {
		OwnerVO result = loginMapper.ownerIdCheck(ownerId);
		return result;
	}
	
	@Override
	public FranchiseVO frcsIdCheck(String frcsId) {
		FranchiseVO result = loginMapper.frcsIdCheck(frcsId);
		return result;
	}

	/**
	 * 예비 가맹점주 회원가입 서비스 로직
	 */
	@Override
	public ServiceResult ownercreate(MemberVO memberVO) {
		ServiceResult result = null;
		int status = loginMapper.ownercreate(memberVO);
		if(status > 0) {
			loginMapper.signupownerAuth(memberVO.getMemId());
			loginMapper.createfrcsownerShip(memberVO);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	/**
	 * 창업문의시 서비스 로직
	 */
	@Override
	public ServiceResult consult(OwnerVO ownerVO) {
		ServiceResult result = null;
		int status = consultMapper.consult(ownerVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

}
