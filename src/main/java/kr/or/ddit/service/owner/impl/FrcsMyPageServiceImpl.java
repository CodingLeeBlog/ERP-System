package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.MyPageMapper;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.owner.FranchiseVO;

@Service
public class FrcsMyPageServiceImpl implements IFrcsMyPageService {

	@Inject
	private MyPageMapper mapper;

	@Override
	public FranchiseVO detail(String frcsId) {
		
		return mapper.detail(frcsId);
	}

	@Override
	public ServiceResult update(HttpServletRequest req, FranchiseVO franchiseVO) {
		ServiceResult result = null;
		int status = mapper.update(franchiseVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public FranchiseVO headerDetail(String frcsId) {
		return mapper.headerDetail(frcsId);
	}

	@Override
	public List<FranchiseVO> frcsHeaderList(String frcsId) {
		return mapper.frcsHeaderList(frcsId);
	}

//	@Override
//	public ServiceResult update(HttpServletRequest req, FranchiseVO franchiseVO) {
//		ServiceResult result = null;
//		int status = mapper.update(franchiseVO);
//		if(status > 0) {
//			result = ServiceResult.OK;
//		}else {
//			result = ServiceResult.FAILED;
//		}
//		return result;
//	}
	
}
