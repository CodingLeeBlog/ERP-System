package kr.or.ddit.service.member;

import java.util.List;

import kr.or.ddit.vo.member.ResVO;

public interface IMyResService {

	public List<ResVO> myResList(String memId);

}
