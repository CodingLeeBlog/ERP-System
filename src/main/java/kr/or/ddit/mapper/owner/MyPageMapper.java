package kr.or.ddit.mapper.owner;

import kr.or.ddit.vo.owner.FranchiseVO;

public interface MyPageMapper {

	public FranchiseVO detail(String frcsId);
//	public int update(FranchiseVO franchiseVO);
	public void update(FranchiseVO franchiseVO);

}
