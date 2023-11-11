package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.DashboardMapper;
import kr.or.ddit.service.head.IDashboardService;
import kr.or.ddit.vo.head.DashboardVO;

@Service
public class DashboardServiceImpl implements IDashboardService{

	@Inject
	private DashboardMapper mapper;
	
	// 최근가맹점 조회
	@Override
	public List<DashboardVO> selectOrderFrcsList() {
		return mapper.selectOrderFrcsList();
	}

	@Override
	public int selectOrderCount() {
		return mapper.selectOrderCount();
	}

	@Override
	public List<DashboardVO> selectOpenFranchiseDate() {
		return mapper.selectOpenFranchiseDate();
	}

	@Override
	public int selectOpenFranchiseCount() {
		return mapper.selectOpenFranchiseCount();
	}

	//공문 카운트
	@Override
	public int selectOfficeLetterCount()  {
		return mapper.selectOfficeLetterCount();
	}
	
	//공문 리스트
	@Override
	public List<DashboardVO> selectOfficeLetterList() {
		return mapper.selectOfficeLetterList();
	}

	//창업 리스트
	@Override
	public List<DashboardVO> selectCounselList() {
		return mapper.selectCounselList();
	}

	//창업 카운트
	@Override
	public int selectCounselCount() {
		return mapper.selectCounselCount();
	}

	
}
