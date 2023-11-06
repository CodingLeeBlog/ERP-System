package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.ProposalVO;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.PaginationInfoVO;

public interface ProposalMapper {


	public int selectProposalCount(HeadPaginationInfoVO<ProposalVO> pagingVO);

	public List<ProposalVO> selectProposalList(HeadPaginationInfoVO<ProposalVO> pagingVO);

	public ProposalVO selectProposal(int tableNo);

	public int proposalInsert(ProposalVO proposalVO);

	public void ansStateUpdate(ProposalVO proposalVO);

}
