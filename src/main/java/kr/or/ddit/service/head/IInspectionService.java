package kr.or.ddit.service.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InspectionVO;
import kr.or.ddit.vo.owner.FranchiseVO;

public interface IInspectionService {

	public int selectInspectionCount(HeadPaginationInfoVO<InspectionVO> pagingVO);
	public List<InspectionVO> selectInspectionList(HeadPaginationInfoVO<InspectionVO> pagingVO);
	public AttachVO selectFileInfo(int attachNo);
	public void inspectionRegister(HttpServletRequest req, InspectionVO inspectionVO);
	public List<InspectionVO> getDetail(String frcsId);
	public List<FranchiseVO> getSearch(String searchWord);

}
