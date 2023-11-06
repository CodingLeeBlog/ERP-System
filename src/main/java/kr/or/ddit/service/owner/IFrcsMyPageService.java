package kr.or.ddit.service.owner;

import kr.or.ddit.vo.owner.FranchiseVO;

public interface IFrcsMyPageService {

	public FranchiseVO detail(String frcsId);
//	public ServiceResult update(HttpServletRequest req, FranchiseVO franchiseVO);
	public void update(FranchiseVO franchiseVO);

}
