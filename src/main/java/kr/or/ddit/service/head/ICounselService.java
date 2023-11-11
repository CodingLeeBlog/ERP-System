package kr.or.ddit.service.head;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerVO;

public interface ICounselService {

	public int selectCounselCount(HeadPaginationInfoVO<OwnerVO> pagingVO);
	public List<OwnerVO> selectCounselList(HeadPaginationInfoVO<OwnerVO> pagingVO);
	public OwnerVO counselDetail(OwnerVO ownerVO);
	public void counselUpdate(HttpServletRequest req, OwnerVO ownerVO);
	public void counselRegister(FranchiseVO frcsVO);
	public ServiceResult frcsCheck(String frcsName);
	public String makeFrcsId();
	public String getFrcsId(int ownerId);

}
