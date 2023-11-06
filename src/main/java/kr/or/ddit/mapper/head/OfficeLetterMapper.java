package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;

public interface OfficeLetterMapper {

	public List<OfficeLetterVO> selectLetterList(HeadPaginationInfoVO<OfficeLetterVO> pagingVO);
	public int selectLetterCount(HeadPaginationInfoVO<OfficeLetterVO> pagingVO);
	public void officeLetterRegister(OfficeLetterVO officeLetterVO);
	public List<FranchiseVO> getFrcsName();

}
