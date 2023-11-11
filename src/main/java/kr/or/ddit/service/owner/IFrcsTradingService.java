package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import kr.or.ddit.vo.owner.TradingVO;

public interface IFrcsTradingService {

	// 내 가맹점 위치 조회
	public FranchiseVO getLocation(String frcsId);

	// 모든 가맹점 정보 가져오기
	public List<FranchiseVO> getAllFrcsList();

	// 주변 가맹점 재고 현황 가져오기
	public List<FrcsInventoryVO> getNearInventList(String searchWord, String searchType, List<Object> nearList);

	// 트레이딩 신청
	public ServiceResult tradingInsert(TradingVO tradVO, AlarmVO alarmVO);

	// 트레이딩 신청내역 페이징1
	public int selectTradeCount(OwnerPaginationInfoVO<TradingVO> pagingVO);

	// 트레이딩 신청내역 페이징2
	public List<TradingVO> selectTradingHistoryList(OwnerPaginationInfoVO<TradingVO> pagingVO);

	// 트레이딩 성공 시 각 가맹점 재고 수량 반영
	public ServiceResult tradingSuccess(FrcsInventoryVO inventVO);

	// 트레이딩 거절
	public ServiceResult tradingRefuse(TradingVO tradVO);

	// 금일 받은 트레이딩 내역 개수
	public int selectCount(String frcsId);

	// 트레이딩 상세내역
	public FrcsInventoryVO getDetail(FrcsInventoryVO frcsInventVO);
	
	// 트레이딩 상세(응답)
	public FrcsInventoryVO getReqDetail(FrcsInventoryVO frcsInventVO);
}
