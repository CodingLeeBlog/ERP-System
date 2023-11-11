package kr.or.ddit.mapper.owner;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.owner.FrcsOrderDetailVO;

public interface FrcsPurchaseMapper {

	// 매입 분석 (한달)
	public List<FrcsOrderDetailVO> getOnePurchase(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 매입 분석 (3개월)
	public List<FrcsOrderDetailVO> getThreePurchase(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 매입 분석 (6개월)
	public List<FrcsOrderDetailVO> getSixPurchase(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 매입 분석 12개월 차트
	public int getTotalPurchse(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);
}
