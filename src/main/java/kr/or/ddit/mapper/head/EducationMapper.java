package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.EducationVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;

public interface EducationMapper {

	public int selectEducationCount(HeadPaginationInfoVO<EducationVO> pagingVO);

	public List<EducationVO> selectEducationList(HeadPaginationInfoVO<EducationVO> pagingVO);

}
