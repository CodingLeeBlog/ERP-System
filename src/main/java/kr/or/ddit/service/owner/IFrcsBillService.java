package kr.or.ddit.service.owner;

import java.util.Date;
import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.member.PaginationInfoVO;
import kr.or.ddit.vo.owner.FrcsBillVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsBillService {

	public List<FrcsPublicDuesVO> duesList(String memId);
	public void duesRegister(FrcsPublicDuesVO duesVO);
	public ServiceResult duesPaydeCheck(FrcsPublicDuesVO duesVO);
	public String frcsIdInfo(String memId);
	public void duesRemove(String duesPayde, String frcsId);
	public int selectDuesCount(OwnerPaginationInfoVO<FrcsPublicDuesVO> pagingVO);
	public List<FrcsPublicDuesVO> selectDuesList(OwnerPaginationInfoVO<FrcsPublicDuesVO> pagingVO);
	public FrcsPublicDuesVO duesDetail(String duesPayde, String frcsId);
	public void duesUpdate(FrcsPublicDuesVO duesVO);
	
	// 차트를 위한 데이터 가져오기 ajax
	public List<FrcsPublicDuesVO> getData(String frcsId);
	
	// 본사 청구리스트
	public List<FrcsBillVO> headBillList(String frcsId, Date thisMonth);

}
