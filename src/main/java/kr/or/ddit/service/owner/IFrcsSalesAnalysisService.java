package kr.or.ddit.service.owner;

import java.util.Date;
import java.util.List;

import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;

public interface IFrcsSalesAnalysisService {
	
	// 매출액 분석 (한달)
	public List<FrcsDailySalesVO> getOneMonthData(String frcsId, Date thisMonth);

	// 1개월 매출 분석 ajax
	public List<FrcsDailySalesVO> getOneSalesAnalysis(FrcsDailySalesVO salesVO);

	// 3개월 매출 분석 
	public List<FrcsDailySalesVO> getThreeSalesAnalysis(FrcsDailySalesVO salesVO);

	// 6개월 매출 분석 
	public List<FrcsDailySalesVO> getSixSalesAnalysis(FrcsDailySalesVO salesVO);

	// 12개월 매출 차트
	public List<FrcsDailySalesVO> getsalesAnalysisChart(String frcsId);

}
