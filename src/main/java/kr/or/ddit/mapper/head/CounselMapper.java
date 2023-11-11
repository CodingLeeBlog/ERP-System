package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.OwnerVO;

public interface CounselMapper {

	public int selectCounselCount(HeadPaginationInfoVO<OwnerVO> pagingVO);
	public List<OwnerVO> selectCounselList(HeadPaginationInfoVO<OwnerVO> pagingVO);
	public OwnerVO counselDetail(OwnerVO ownerVO);
	public void counselUpdate(OwnerVO ownerVO);
	public void counselAttachRegister(AttachVO attachVO);
	public void counselRegister(FranchiseVO frcsVO);
	public FranchiseVO frcsCheck(String frcsName);
	public String getFrcsId(int ownerId);

}
