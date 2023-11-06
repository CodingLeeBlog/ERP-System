package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FranchiseVO;

public interface FrcsListMapper {

	public List<FranchiseVO> findStore(FranchiseVO franchise);

}
