package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.EducationMapper;
import kr.or.ddit.service.head.IEducationService;
import kr.or.ddit.vo.head.EducationVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;

@Service
public class EducationServiceImpl implements IEducationService {

	@Inject
	private EducationMapper educationmapper;
	
	@Override
	public int selectEducationCount(HeadPaginationInfoVO<EducationVO> pagingVO) {
		return educationmapper.selectEducationCount(pagingVO);
	}

	@Override
	public List<EducationVO> selectEducationList(HeadPaginationInfoVO<EducationVO> pagingVO) {
		return educationmapper.selectEducationList(pagingVO);
	}

}
