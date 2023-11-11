package kr.or.ddit.mapper.owner;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import kr.or.ddit.vo.owner.TradingVO;

public interface FrcsTradingMapper {

	// 내 가맹점 위치 조회
	public FranchiseVO getLocation(String frcsId);

	// 모든 가맹점 정보 가져오기
	public List<FranchiseVO> getAllFrcsList();

	// 다른 가맹점 재고 현황 가져오기
	public List<FrcsInventoryVO> getInventList(@Param("searchWord")String searchWord, @Param("searchType")String searchType, @Param("frcsId")String frcsId);

	// 트레이딩 신청
	public int tradingInsert(TradingVO tradVO);

	// 제품 코드별 가격 가져오기
	public int getHdforwardPrice(String vdprodCd);
	
	// 트레이딩 신청내역 페이징1
	public int selectTradeCount(OwnerPaginationInfoVO<TradingVO> pagingVO);

	// 트레이딩 신청내역 페이징2
	public List<TradingVO> selectTradingHistoryList(OwnerPaginationInfoVO<TradingVO> pagingVO);

	// 트레이딩 재고 - 처리
	public int tradingMinus(FrcsInventoryVO inventVO);

	// 트레이딩 재고 + 처리
	public int tradingPlus(FrcsInventoryVO inventVO);

	// 상태 업데이트
	public void updateStatus(String tradNo);

	// 트레이딩 거절
	public int tradingRefuse(TradingVO tradVO);
	
	// 트레이딩 알림
	public void insertAlarm(AlarmVO alarmVO);
	public String getReceiveMemId(String frcsId);
	public String getMemFrcs(String frcsId2);

	// 금일 트레이딩 들어온 수
	public int selectCount(String frcsId);

	// 트레이딩 상세내역
	public FrcsInventoryVO getDetail(FrcsInventoryVO frcsInventVO);

	// 트레이딩 상세내역(응답)
	public FrcsInventoryVO getReqDetail(FrcsInventoryVO frcsInventVO);

}
