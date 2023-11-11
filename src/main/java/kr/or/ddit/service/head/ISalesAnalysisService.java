package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadMonthVO;

public interface ISalesAnalysisService {

//	public FeeVO headChart();

//	public List<FeeVO> allmonthheadChart();

//	public List<FeeVO> allmonthheadChart1(HeadSalesTotalVO headsalesTotalVO);

	public List<HeadMonthVO> headmonthChart();

	public HeadMonthVO selectheadmonthChart(HeadMonthVO month);

	public List<HeadMonthVO> allheadmonthChart();

	public List<HeadMonthVO> quarterheadmonthChart();

	public List<HeadMonthVO> quarterheadmonthChartDetails(HeadMonthVO quater);

}
