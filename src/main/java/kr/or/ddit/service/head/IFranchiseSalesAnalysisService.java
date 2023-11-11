package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.vo.head.FranchiseSalesAnalysisVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;

public interface IFranchiseSalesAnalysisService {

	// 가맹점 리스트 count
	public int selectCountFrcs(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO);
	// 가맹점 리스트 select
	public List<FranchiseSalesAnalysisVO> selectFrcsList(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO);
	// 가맹점을 클릭했을 시 손익계산서에 들어갈 데이터
	public FranchiseSalesAnalysisVO selectAllPrice(FranchiseSalesAnalysisVO fsaVO);
	// 가맹점의 월별 총매출
	public FranchiseSalesAnalysisVO selectChartSalesData(FranchiseSalesAnalysisVO fsaVO);

}
