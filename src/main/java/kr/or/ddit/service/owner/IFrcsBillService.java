package kr.or.ddit.service.owner;

import java.util.Date;
import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.member.PaginationInfoVO;
import kr.or.ddit.vo.owner.FrcsBillVO;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import kr.or.ddit.vo.owner.TradingVO;

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
	
	// 내 가맹점 평균 통계
	public FrcsPublicDuesVO average(String memId);
	// 전체 가맹점 평균 통계
	public FrcsPublicDuesVO totalAverage();

	// 본사 청구리스트
	public FrcsBillVO headBillList(String frcsId, Date thisMonth);
	// 본사 가맹비 총괄, 가맹비 상세 테이블 insert
	public ServiceResult insertBill(FrcsBillVO billVO);
	
	// 트레이딩 상세 내역
	public List<TradingVO> getTradDetail(TradingVO tradVO);
	public List<TradingVO> getTradMinDetail(TradingVO tradVO);

}
