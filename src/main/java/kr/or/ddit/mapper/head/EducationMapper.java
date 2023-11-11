package kr.or.ddit.mapper.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.head.EducationVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;

public interface EducationMapper {

	public int selectEducationCount(HeadPaginationInfoVO<EducationVO> pagingVO);

	public List<EducationVO> selectEducationList(HeadPaginationInfoVO<EducationVO> pagingVO);

	public void educationRegister(EducationVO educationVO);

	public String selectFrcsName(String frcsId);

	public EducationVO educationDetail(EducationVO educationVO);

	public void educationUpdate(EducationVO educationVO);

}
