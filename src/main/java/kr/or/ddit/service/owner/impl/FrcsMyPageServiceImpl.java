package kr.or.ddit.service.owner.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	public void update(FranchiseVO franchiseVO) {
		mapper.update(franchiseVO);
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
