package kr.or.ddit.mapper.owner;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.TradingVO;

public interface FrcsTradingMapper {

	// 내 가맹점 위치 조회
	public FranchiseVO getLocation(String frcsId);

	// 모든 가맹점 정보 가져오기
	public List<FranchiseVO> getAllFrcsList();

	// 다른 가맹점 재고 현황 가져오기
	public FrcsInventoryVO getInventList(@Param("searchWord")String searchWord, @Param("searchType")String searchType, @Param("frcsId")String frcsId);

	// 트레이딩 신청
	public int tradingInsert(TradingVO tradVO);

	// 제품 코드별 가격 가져오기
	public int getHdforwardPrice(String vdprodCd);

}
