package kr.or.ddit.mapper.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadLtDetailVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;

public interface OfficeLetterMapper {

	public List<OfficeLetterVO> selectLetterList(HeadPaginationInfoVO<OfficeLetterVO> pagingVO);
	public int selectLetterCount(HeadPaginationInfoVO<OfficeLetterVO> pagingVO);
	public List<FranchiseVO> getFrcsName();
	public void officeLetterRegister(OfficeLetterVO officeLetterVO);
	public void officeLetterAttachRegister(AttachVO attachVO);
	public void officeLetterDelete(int hdLtno);
	public void officeLtDetailRegister(HeadLtDetailVO headLtDetailVO);
	public OfficeLetterVO officeLetterDetail(OfficeLetterVO officeLetterVO);
	public void deleteChildRecords(int hdLtno);
	public void officeLetterUpdate(OfficeLetterVO officeLetterVO);

}
