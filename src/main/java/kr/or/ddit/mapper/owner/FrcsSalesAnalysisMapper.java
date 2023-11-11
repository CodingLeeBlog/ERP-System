package kr.or.ddit.mapper.owner;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.owner.FrcsDailySalesVO;

public interface FrcsSalesAnalysisMapper {

	// 매출액 분석 (한달)
	public List<FrcsDailySalesVO> getOneMonthData(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 3개월 매출 분석 
	public List<FrcsDailySalesVO> getThreeSalesAnalysis(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 6개월 매출 분석 
	public List<FrcsDailySalesVO> getSixSalesAnalysis(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 12개월 매출 차트
	public int getTotalSalesAnalysis(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);
	
}
