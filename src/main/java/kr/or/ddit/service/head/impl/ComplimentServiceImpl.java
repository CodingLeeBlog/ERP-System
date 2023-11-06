package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.ComplimentMapper;
import kr.or.ddit.service.head.IComplimentService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.ProposalVO;

@Service
public class ComplimentServiceImpl implements IComplimentService {
	
	@Inject
	private ComplimentMapper complimentMapper;

	@Override
	public int selectComplimentCount(HeadPaginationInfoVO<ProposalVO> pagingVO) {
		return complimentMapper.selectComplimentCount(pagingVO);
	}

	@Override
	public List<ProposalVO> selectComplimentList(HeadPaginationInfoVO<ProposalVO> pagingVO) {
		return complimentMapper.selectComplimentList(pagingVO);
	}

	@Override
	public ProposalVO selectCompliment(int tableNo) {
		return complimentMapper.selectCompliment(tableNo);
	}

}
