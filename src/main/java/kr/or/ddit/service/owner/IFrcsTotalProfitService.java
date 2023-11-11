package kr.or.ddit.service.owner;

import java.util.Date;
import java.util.List;

import kr.or.ddit.vo.owner.FrcsDailySalesVO;

public interface IFrcsTotalProfitService {

	// 매출 총이익 분석 (한달)
	public FrcsDailySalesVO getTotalOneMonthList(String frcsId, Date thisMonth);
	public FrcsDailySalesVO getOneTotal(FrcsDailySalesVO salesVO);	// ajax
	
	// 매출 총이익 분석 (3개월)
	public FrcsDailySalesVO getThreeTotal(FrcsDailySalesVO salesVO);
	
	// 매출 총이익 분석 (6개월)
	public FrcsDailySalesVO getSixTotal(FrcsDailySalesVO salesVO);
	
	// 매출 총이익 분석 12개월 차트
	public List<FrcsDailySalesVO> getTotalProfitChart(String frcsId);

	
}
