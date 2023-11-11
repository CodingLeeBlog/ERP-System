package kr.or.ddit.service.member.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.member.MyResMapper;
import kr.or.ddit.service.member.IMyResService;
import kr.or.ddit.vo.member.ResVO;

@Service
public class MyResServiceImpl implements IMyResService {

	@Inject
	private MyResMapper myresMapper;
	
	
	/**
	 * 나의 예약 내역 조회 서비스 로직
	 * 
	 * @param memId
	 * @return List<ResVO> 타입의 객체 리턴
	 */
	@Override
	public List<ResVO> myResList(String memId) {
		return myresMapper.myResList(memId);
	}

}
