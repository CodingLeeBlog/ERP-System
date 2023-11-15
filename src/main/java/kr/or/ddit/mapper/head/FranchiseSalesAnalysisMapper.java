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
	// 월별 가맹점 총매출
	public List<FranchiseSalesAnalysisVO> selectAllPrice(FranchiseSalesAnalysisVO fsaVO);
	// 월별 로얄티 도출
	public List<FranchiseSalesAnalysisVO> selectRowal(FranchiseSalesAnalysisVO fsaVO);
	// 월별 공과금 도출
	public int selectPublicDuesTotal(FranchiseSalesAnalysisVO fsVO);
	// 월별 매입가 도출
	public int selectPurchasePrice(FranchiseSalesAnalysisVO fsVO);
	// 차트에그려줄 월별 데이터 받아오기
	public int selectAllMonthData(FranchiseSalesAnalysisVO frcs);
	// 가맹점평균 총매출액
	public List<FranchiseSalesAnalysisVO> selectAvgPrice(FranchiseSalesAnalysisVO fsaVO);
	// 가맹점평균 로얄티
	public List<FranchiseSalesAnalysisVO> selectAvgRowal(FranchiseSalesAnalysisVO fsaVO);
	// 가맹점평균 공과금
	public int selectAvgPublicDuesTotal(FranchiseSalesAnalysisVO fsVO);
	// 가맹점평균 매입가
	public int selectAvgPurchasePrice(FranchiseSalesAnalysisVO fsVO);
	
}
