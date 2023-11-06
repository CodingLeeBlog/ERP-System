package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.HeadSalesChartVO;
import kr.or.ddit.vo.head.TotalInfoVO;


public interface ISalesAreaService {

	public int selectTotalFrcsCount(HeadPaginationInfoVO<TotalInfoVO> pagingVO);

	public List<TotalInfoVO> selectFrcsList(HeadPaginationInfoVO<TotalInfoVO> pagingVO);

	public int selectFrcsCount(HeadPaginationInfoVO<TotalInfoVO> pagingVO);

	public List<HeadSalesChartVO> frcsSales(HeadSalesChartVO total);
	
	
	public List<HeadSalesChartVO> frcsChart(HeadSalesChartVO salesChartVO);
	
	public List<HeadSalesChartVO> frcsAllChart(HeadSalesChartVO total);
	public List<HeadSalesChartVO> frcsThirdMonthChart(HeadSalesChartVO total);
	public List<HeadSalesChartVO> frcsSixMonthChart(HeadSalesChartVO total);


	
}
