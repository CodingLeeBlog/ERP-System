package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InspectionVO;

public interface FrcsCheckMapper {

	public List<InspectionVO> selectFrcsCheckList(HeadPaginationInfoVO<InspectionVO> pagingVO);
	public AttachVO selectFileInfo(int attachNo);

}
