package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.vo.head.DashboardVO;

public interface IDashboardService {

	// 최근가맹점 조회
	public List<DashboardVO> selectOrderFrcsList();
	// 최신3일간 주문내역 카운트
	public int selectOrderCount();
	// 최근 3개월간 오픈한 프렌차이즈 select
	public List<DashboardVO> selectOpenFranchiseDate();
	// 최근 3개월간 오픈한 프렌차이즈 count
	public int selectOpenFranchiseCount();
	
	//공문 카운트
	public List<DashboardVO> selectOfficeLetterList();
	//공문 리스트
	public int selectOfficeLetterCount();
	
	//창업 리스트
	public List<DashboardVO> selectCounselList();
	
	//창업 카운트
	public int selectCounselCount();

}
