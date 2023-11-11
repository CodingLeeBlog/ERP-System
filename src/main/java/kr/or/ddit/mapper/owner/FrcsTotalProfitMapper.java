package kr.or.ddit.mapper.owner;

import java.util.Date;

import org.apache.ibatis.annotations.Param;


public interface FrcsTotalProfitMapper {

	// 매출 총이익 분석 - 매출액 조회
	public int getTotalSales(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);	// 한달
	public int getThreeTotalSales(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);	// 세달
	public int getSixTotalSales(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);	// 6개월

	// 매출 총이익 분석 - 매입액 조회
	public int getPurchase(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);	// 한달
	public int getThreePurchase(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);	// 세달
	public int getSixPurchase(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);	// 6개월
	
	// 매출 총이익 분석 - 12개월 차트
//	public int getTotalProfitChartSales(String frcsId);
//	public int getTotalProfitChartPurchase(String frcsId);
	

}
