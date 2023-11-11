package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.owner.FrcsCheckMapper;
import kr.or.ddit.service.owner.IFrcsCheckService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InspectionVO;

@Service
public class FrcsCheckServiceImpl implements IFrcsCheckService {

	@Inject
	private FrcsCheckMapper mapper;

	@Override
	public List<InspectionVO> selectFrcsCheckList(HeadPaginationInfoVO<InspectionVO> pagingVO) {
		return mapper.selectFrcsCheckList(pagingVO);
	}

	@Override
	public AttachVO selectFileInfo(int attachNo) {
		return mapper.selectFileInfo(attachNo);
	}
	
}
