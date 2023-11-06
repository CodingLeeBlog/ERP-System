package kr.or.ddit.service.member.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.LoginMapper;
import kr.or.ddit.mapper.head.CouponMapper;
import kr.or.ddit.mapper.member.ConsultMapper;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.vo.member.MemberVO;
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

	@Override
	public ServiceResult create(MemberVO memberVO) {
		ServiceResult result = null;
		int status = loginMapper.create(memberVO);
		if(status > 0) {
			loginMapper.signupAuth(memberVO.getMemId());
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public MemberVO loginCheck(MemberVO memberVO) {
		return loginMapper.loginCheck(memberVO);
	}

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

	@Override
	public MemberVO findId(MemberVO member) {
		MemberVO result = loginMapper.findId(member);
		return result;
	}

	@Override
	public MemberVO findPw(MemberVO member) {
		return null;
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

	
}
