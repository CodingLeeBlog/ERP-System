package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsOfficialDocVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsOfficialDocMapper {

	public int selectOfldcCount(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO);
	public List<FrcsOfficialDocVO> selectOfldcList(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO);
	public int ofldcInsert(FrcsOfficialDocVO frcsOfldcVO);
	public void insertOfldcFile(AttachVO attachVO);
	public FrcsOfficialDocVO selectOfldc(String frcsOfldcNo);
	public void deleteOfldcFileByfrcsOfldcNo(String frcsOfldcNo);
	public int frcsOfldcDelete(String frcsOfldcNo);

}
