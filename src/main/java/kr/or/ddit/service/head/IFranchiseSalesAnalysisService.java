package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.vo.head.FranchiseSalesAnalysisVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;

public interface IFranchiseSalesAnalysisService {

	// 가맹점 리스트 count
	public int selectCountFrcs(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO);
	// 가맹점 리스트 select
	public List<FranchiseSalesAnalysisVO> selectFrcsList(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO);

}
