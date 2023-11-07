package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.head.FeeVO;

public interface ISalesAnalysisService {

	public FeeVO headChart();

	public List<FeeVO> allmonthheadChart();

	public ServiceResult headmonthChart();

}
