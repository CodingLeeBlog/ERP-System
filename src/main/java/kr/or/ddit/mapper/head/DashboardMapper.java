package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.DashboardVO;

public interface DashboardMapper {

	// 최근가맹점 주문
	public List<DashboardVO> selectOrderFrcsList();
	// 최근 3일간 주문내역 카운트
	public int selectOrderCount();
	// 최근 3개월간 오픈한 매장
	public List<DashboardVO> selectOpenFranchiseDate();
	// 최근 3개월간 오픈한 매장 카운트
	public int selectOpenFranchiseCount();
	
	//공문 카운트
	public int selectOfficeLetterCount();
	//공문 리스트
	public List<DashboardVO> selectOfficeLetterList();
	
	//창업 리스트
	public List<DashboardVO> selectCounselList();
	//창업 카운트
	public int selectCounselCount();
	

}
