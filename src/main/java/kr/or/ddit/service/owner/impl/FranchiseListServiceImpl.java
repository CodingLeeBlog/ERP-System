package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.owner.FrcsListMapper;
import kr.or.ddit.service.owner.IFranchiseListService;
import kr.or.ddit.vo.owner.FranchiseVO;

@Service
public class FranchiseListServiceImpl implements IFranchiseListService {

	@Inject
	private FrcsListMapper frcsListmapper;
	
	@Override
	public List<FranchiseVO> findStore(FranchiseVO franchise) {
		List<FranchiseVO> result = frcsListmapper.findStore(franchise);
		return result;
	}
}
