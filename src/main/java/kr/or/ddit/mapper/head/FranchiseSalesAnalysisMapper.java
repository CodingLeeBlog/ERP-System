package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.FranchiseSalesAnalysisVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;

/**
 * @author PC-09
 *	가맹점총매출분석 Mapper
 */
public interface FranchiseSalesAnalysisMapper {

	
	/**
	 * 가맹점 총 COUNT
	 * @param pagingVO
	 * @return	int
	 */
	public int selectCountFrcs(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO);
	// 가맹점 리스트 select
	public List<FranchiseSalesAnalysisVO> selectFrcsList(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO);
	
}
