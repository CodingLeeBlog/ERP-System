package kr.or.ddit.service.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.head.EducationVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;

public interface IEducationService {

	public int selectEducationCount(HeadPaginationInfoVO<EducationVO> pagingVO);

	public List<EducationVO> selectEducationList(HeadPaginationInfoVO<EducationVO> pagingVO);

	public void educationRegister(EducationVO educationVO);

	public EducationVO educationDetail(EducationVO educationVO);

	public void educationUpdate(EducationVO educationVO);



}
