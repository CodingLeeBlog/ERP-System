package kr.or.ddit.service.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OpenPlanVO;

public interface IOpenPlanService {

	public int selectOpenPlanCount(HeadPaginationInfoVO<OpenPlanVO> pagingVO);
	public List<OpenPlanVO> selectOpenPlanList(HeadPaginationInfoVO<OpenPlanVO> pagingVO);
	public void planUpdate(OpenPlanVO openPlanVO);

}
