package kr.or.ddit.service.owner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.owner.FranchiseVO;

public interface IFrcsMyPageService {

	public FranchiseVO detail(String frcsId);
	public ServiceResult update(HttpServletRequest req, FranchiseVO franchiseVO);
	public FranchiseVO headerDetail(String frcsId);
	public List<FranchiseVO> frcsHeaderList(String frcsId);

}
