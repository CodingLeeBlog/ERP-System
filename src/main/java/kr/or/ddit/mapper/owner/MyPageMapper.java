package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FranchiseVO;

public interface MyPageMapper {

	public FranchiseVO detail(String frcsId);
	public int update(FranchiseVO franchiseVO);
	public FranchiseVO headerDetail(String frcsId);
	public List<FranchiseVO> frcsHeaderList(String frcsId);

}
