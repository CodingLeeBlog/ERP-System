package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InspectionVO;

public interface IFrcsCheckService {

	public List<InspectionVO> selectFrcsCheckList(HeadPaginationInfoVO<InspectionVO> pagingVO);
	public AttachVO selectFileInfo(int attachNo);

}
