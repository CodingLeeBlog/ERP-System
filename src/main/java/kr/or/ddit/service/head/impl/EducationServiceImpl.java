package kr.or.ddit.service.head.impl;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.EducationMapper;
import kr.or.ddit.service.head.IEducationService;
import kr.or.ddit.vo.head.EducationVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;

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

//	@Override
//	public void educationRegister(EducationVO educationVO) {
//	    // educationVO에서 frcsId를 사용하여 frcsName을 설정
//	    String frcsId = educationVO.getFrcsId();
//	    String frcsName = educationmapper.selectFrcsName(frcsId); // educationMapper에 selectFrcsName 메서드를 호출
//	    educationVO.setFrcsName(frcsName); // frcsName을 educationVO에 설정
//
//	    // 나머지 데이터를 educationVO에서 가져와서 저장
//	    Date eduSdate = educationVO.getEduSdate();
//	    Date eduFdate = educationVO.getEduFdate();
//	    String eduFnshyn = educationVO.getEduFnshyn();
//	    String eduRemark = educationVO.getEduRemark();
//
//	    // educationVO 객체에 모든 필요한 데이터가 설정되었으므로 데이터를 저장
//	    educationmapper.educationRegister(educationVO);
//	}

	@Override
	public EducationVO educationDetail(EducationVO educationVO) {
		return educationmapper.educationDetail(educationVO);
	}

	@Override
	public void educationRegister(EducationVO educationVO) {
		educationmapper.educationRegister(educationVO);
	}

	@Override
	public void educationUpdate(EducationVO educationVO) {
		educationmapper.educationUpdate(educationVO);
		
	}


}
