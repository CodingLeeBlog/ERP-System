package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OpenPlanVO;

public interface OpenPlanMapper {

	public int selectOpenPlanCount(HeadPaginationInfoVO<OpenPlanVO> pagingVO);

	public List<OpenPlanVO> selectOpenPlanList(HeadPaginationInfoVO<OpenPlanVO> pagingVO);

	public void planRegister(OpenPlanVO openPlanVO);

	public void planUpdate(OpenPlanVO openPlanVO);

	public void insertFcmg(OpenPlanVO openPlanVO);

}
