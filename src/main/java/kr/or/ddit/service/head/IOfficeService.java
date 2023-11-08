package kr.or.ddit.service.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.head.HeadLtDetailVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;

public interface IOfficeService {

	public List<OfficeLetterVO> selectLetterList(HeadPaginationInfoVO<OfficeLetterVO> pagingVO);
	public int selectLetterCount(HeadPaginationInfoVO<OfficeLetterVO> pagingVO);
	public List<FranchiseVO> getFrcsName();
	public void officeLetterRegister(HttpServletRequest req, OfficeLetterVO officeLetterVO);
	public void officeLetterDelete(int hdLtno);
	public void officeLtDetailRegister(List<HeadLtDetailVO> requestBody);
	public OfficeLetterVO officeLetterDetail(OfficeLetterVO officeLetterVO);
	public void officeLetterUpdate(OfficeLetterVO officeLetterVO);

}
