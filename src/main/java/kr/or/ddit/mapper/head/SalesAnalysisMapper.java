package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadMonthVO;
import kr.or.ddit.vo.head.HeadSalesTotalVO;

public interface SalesAnalysisMapper {

//	public HeadSalesTotalVO headyeartotalChart();
//
//	public List<HeadSalesTotalVO> allmonthtotalChart();
//
//	public List<HeadSalesTotalVO> allmonthtotalChart1(HeadSalesTotalVO hesalestotalVO);

	public List<HeadMonthVO> headmonthChart();

	public List<HeadMonthVO> selectheadmonthChart();

	public List<HeadMonthVO> quarterheadmonthChartDetails(HeadMonthVO quater);

}
