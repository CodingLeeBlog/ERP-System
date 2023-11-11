package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.OpenPlanMapper;
import kr.or.ddit.service.head.IOpenPlanService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OpenPlanVO;

@Service
public class OpenPlanServiceImpl implements IOpenPlanService {

	@Inject
	private OpenPlanMapper openplanmapper;

	@Override
	public int selectOpenPlanCount(HeadPaginationInfoVO<OpenPlanVO> pagingVO) {
		return openplanmapper.selectOpenPlanCount(pagingVO);
	}

	@Override
	public List<OpenPlanVO> selectOpenPlanList(HeadPaginationInfoVO<OpenPlanVO> pagingVO) {
		return openplanmapper.selectOpenPlanList(pagingVO);
	}

	@Override
	public void planUpdate(OpenPlanVO openPlanVO) {
		openplanmapper.planUpdate(openPlanVO);
		
		openplanmapper.insertFcmg(openPlanVO);
	}

}
