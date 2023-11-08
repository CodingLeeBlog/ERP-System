package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.FranchiseSalesAnalysisMapper;
import kr.or.ddit.service.head.IFranchiseSalesAnalysisService;
import kr.or.ddit.vo.head.FranchiseSalesAnalysisVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FranchiseSalesAnalysisServiceImpl implements IFranchiseSalesAnalysisService{
	
	@Inject
	private FranchiseSalesAnalysisMapper mapper; 
	/**
	 *	가맹점매출분석페이지 들어갔을때 페이징처리를위한 COUNT 메소드
	 */
	@Override
	public int selectCountFrcs(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO) {
		
		return mapper.selectCountFrcs(pagingVO);
	}
	@Override
	public List<FranchiseSalesAnalysisVO> selectFrcsList(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO) {
		return mapper.selectFrcsList(pagingVO);
	}

	
}
