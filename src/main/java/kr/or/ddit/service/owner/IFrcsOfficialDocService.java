package kr.or.ddit.service.owner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsOfficialDocVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsOfficialDocService {

	public int selectOfldcCount(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO);
	public List<FrcsOfficialDocVO> selectOfldcList(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO);
	public ServiceResult ofldcInsert(HttpServletRequest req, FrcsOfficialDocVO frcsOfldcVO, AlarmVO alarmVO);
	public FrcsOfficialDocVO selectOfldc(String frcsOfldcNo);
	public ServiceResult frcsOfldcDelete(HttpServletRequest req, String frcsOfldcNo);
	public List<FrcsOfficialDocVO> selectHdList(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO);
	public AttachVO selectFileInfo(int attachNo);

}
