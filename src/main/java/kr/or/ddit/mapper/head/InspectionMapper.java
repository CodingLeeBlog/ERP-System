package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InspectionVO;

public interface InspectionMapper {

	public int selectInspectionCount(HeadPaginationInfoVO<InspectionVO> pagingVO);

	public List<InspectionVO> selectInspectionList(HeadPaginationInfoVO<InspectionVO> pagingVO);

	public AttachVO selectFileInfo(int attachNo);

}
