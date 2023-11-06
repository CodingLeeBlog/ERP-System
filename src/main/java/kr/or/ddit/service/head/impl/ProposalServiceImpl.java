package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.ProposalMapper;
import kr.or.ddit.service.head.IProposalService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.ProposalVO;

@Service
public class ProposalServiceImpl implements IProposalService {

	@Inject
	private ProposalMapper proposalMapper;

	@Override
	public int selectProposalCount(HeadPaginationInfoVO<ProposalVO> pagingVO) {
		return proposalMapper.selectProposalCount(pagingVO);
	}

	@Override
	public List<ProposalVO> selectProposalList(HeadPaginationInfoVO<ProposalVO> pagingVO) {
		return proposalMapper.selectProposalList(pagingVO);
	}

	@Override
	public ProposalVO selectProposal(int tableNo) {
		return proposalMapper.selectProposal(tableNo);
	}

	@Override
	public ServiceResult proposalInsert(ProposalVO proposalVO) {
		ServiceResult result = null;
		int status = proposalMapper.proposalInsert(proposalVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	@Override
	public void ansStateUpdate(ProposalVO proposalVO) {
		proposalMapper.ansStateUpdate(proposalVO);
	}
	
//	@Override
//	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
//		return proposalMapper.selectBoardCount(pagingVO);
//	}
//
//	@Override
//	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO) {
//		return proposalMapper.selectBoardList(pagingVO);
//	}
//
//	@Override
//	public BoardVO selectBoard(int tableNo) {
//		proposalMapper.incrementHit(tableNo);
//		return proposalMapper.selectBoard(tableNo);
//	}
//
//	@Override
//	public ServiceResult insertBoard(HttpServletRequest req, ProposalVO proposalVO) {
//	    ServiceResult result = null;
//	    int status = proposalMapper.insertBoard(proposalVO);
//	    if(status > 0) {
//	        
//	        result = ServiceResult.OK;
//	    } else {
//	        result = ServiceResult.FAILED;
//	    }
//	    return result;
//	}

}
