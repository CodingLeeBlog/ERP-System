package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadSalesTotalVO;

public interface SalesAnalysisMapper {

	public HeadSalesTotalVO headyeartotalChart();

	public List<HeadSalesTotalVO> allmonthtotalChart();

}
