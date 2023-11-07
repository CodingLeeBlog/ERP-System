package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.vo.head.EducationVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.MenuVO;

public interface IEducationService {

	public int selectEducationCount(HeadPaginationInfoVO<EducationVO> pagingVO);

	public List<EducationVO> selectEducationList(HeadPaginationInfoVO<EducationVO> pagingVO);


}
