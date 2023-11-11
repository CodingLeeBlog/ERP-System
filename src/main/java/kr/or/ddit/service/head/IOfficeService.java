package kr.or.ddit.service.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadLtDetailVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;

public interface IOfficeService {

	public List<OfficeLetterVO> selectLetterList(HeadPaginationInfoVO<OfficeLetterVO> pagingVO);
	public int selectLetterCount(HeadPaginationInfoVO<OfficeLetterVO> pagingVO);
	public void officeLetterRegister(HttpServletRequest req, OfficeLetterVO officeLetterVO);
	public void officeLetterDelete(int hdLtno);
	public void officeLtDetailRegister(List<HeadLtDetailVO> requestBody, AlarmVO alarmVO);
	public OfficeLetterVO officeLetterDetail(OfficeLetterVO officeLetterVO);
	public void officeLetterUpdate(OfficeLetterVO officeLetterVO);
	public OfficeLetterVO officeLetterDetail(int hdLtno);
	public List<FranchiseVO> getseFrcsName();
	public List<FranchiseVO> getdjFrcsName();
	public List<FranchiseVO> getbsFrcsName();
	public List<FranchiseVO> getdgFrcsName();
	public List<FranchiseVO> getgjFrcsName();
	public AttachVO selectFileInfo(int attachNo);
	public List<FranchiseVO> getAllFrcs();
	public int selectCount(String frcsId);

}
