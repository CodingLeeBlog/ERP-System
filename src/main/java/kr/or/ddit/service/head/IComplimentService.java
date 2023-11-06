package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.ProposalVO;

public interface IComplimentService {

	public int selectComplimentCount(HeadPaginationInfoVO<ProposalVO> pagingVO);

	public List<ProposalVO> selectComplimentList(HeadPaginationInfoVO<ProposalVO> pagingVO);

	public ProposalVO selectCompliment(int tableNo);

}
