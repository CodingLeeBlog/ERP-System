package kr.or.ddit.service.head.impl;

import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.FoundationMapper;
import kr.or.ddit.service.head.ISalesAreaService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.HeadSalesChartVO;
import kr.or.ddit.vo.head.TotalInfoVO;

@Service
public class SalesAreaServiceImpl implements ISalesAreaService{

	@Inject
	private FoundationMapper mapper;

	@Override
	public int selectTotalFrcsCount(HeadPaginationInfoVO<TotalInfoVO> pagingVO) {
		return mapper.selectTotalFrcsCount(pagingVO);
	}

	@Override
	public List<TotalInfoVO> selectFrcsList(HeadPaginationInfoVO<TotalInfoVO> pagingVO) {
		return mapper.selectFrcsList(pagingVO);
	}

	@Override
	public int selectFrcsCount(HeadPaginationInfoVO<TotalInfoVO> pagingVO) {
		return mapper.selectFrcsCount(pagingVO);
	}

	@Override
	public List<HeadSalesChartVO> frcsSales(HeadSalesChartVO total) {
		List<HeadSalesChartVO> result = mapper.frcsSales(total);
		
		return result;
	}


	
	
	@Override
	public List<HeadSalesChartVO> frcsChart(HeadSalesChartVO salesChartVO) {
		String sMonth = salesChartVO.getMonth() <= 10 ? "0" + (salesChartVO.getMonth()-1) : (salesChartVO.getMonth()-1) + "";
		if(salesChartVO.getType().equals("one")) {
			LocalDate now = LocalDate.now();
			salesChartVO.setMonthStr(now.getYear() + "-" + sMonth);
		}
		return mapper.frcsChart(salesChartVO);
	}
	
	@Override
	public List<HeadSalesChartVO> frcsAllChart(HeadSalesChartVO total) {
		List<HeadSalesChartVO> result = mapper.frcsAllChart(total);
		return result;
	}

	@Override
	public List<HeadSalesChartVO> frcsThirdMonthChart(HeadSalesChartVO total) {
		List<HeadSalesChartVO> result = mapper.frcsThirdMonthChart(total);
		return result;
	}

	@Override
	public List<HeadSalesChartVO> frcsSixMonthChart(HeadSalesChartVO total) {
		List<HeadSalesChartVO> result = mapper.frcsSixMonthChart(total);
		return result;
	}
	
}
