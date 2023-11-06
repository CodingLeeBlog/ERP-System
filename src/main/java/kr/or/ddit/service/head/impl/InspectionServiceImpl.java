package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.InspectionMapper;
import kr.or.ddit.service.head.IInspectionService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InspectionVO;

@Service
public class InspectionServiceImpl implements IInspectionService {
	
	@Inject
	private InspectionMapper inspectionMapper;

	@Override
	public int selectInspectionCount(HeadPaginationInfoVO<InspectionVO> pagingVO) {
		return inspectionMapper.selectInspectionCount(pagingVO);
	}

	@Override
	public List<InspectionVO> selectInspectionList(HeadPaginationInfoVO<InspectionVO> pagingVO) {
		return inspectionMapper.selectInspectionList(pagingVO);
	}

	@Override
	public AttachVO selectFileInfo(int attachNo) {
		return inspectionMapper.selectFileInfo(attachNo);
	}

}
