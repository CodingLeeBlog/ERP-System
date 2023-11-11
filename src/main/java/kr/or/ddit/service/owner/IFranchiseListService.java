package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FranchiseVO;

public interface IFranchiseListService {

	public List<FranchiseVO> findStore(FranchiseVO franchise);

//	public FranchiseVO selectone(String email);

}
