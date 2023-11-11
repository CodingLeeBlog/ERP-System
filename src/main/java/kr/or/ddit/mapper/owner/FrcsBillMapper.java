package kr.or.ddit.mapper.owner;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.head.FeeVO;
import kr.or.ddit.vo.owner.FrcsBillVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import kr.or.ddit.vo.owner.TradingVO;

public interface FrcsBillMapper {

	// 공과금 납부내역 조회
	public List<FrcsPublicDuesVO> duesList(String memId);
	
	// 공과금 등록
	public void duesRegister(FrcsPublicDuesVO duesVO);

	// 공과금 납부년월 중복체크
	public int duesPaydeCheck(FrcsPublicDuesVO duesVO);

	// memId로 프랜차이즈 아이디 얻어오기
	public String frcsIdInfo(String memId);
	
	// 내 가맹점 공과금 평균 
	public FrcsPublicDuesVO average(String memId);

	// 전체 가맹점 평균 공과금액 가져오기
	public FrcsPublicDuesVO totalAverage();

	// 공과금 삭제
	public void duesRemove(@Param("duesPayde")String duesPayde, @Param("frcsId")String frcsId);

	// 페이징
	public int selectDuesCount(OwnerPaginationInfoVO<FrcsPublicDuesVO> pagingVO);

	// 페이징
	public List<FrcsPublicDuesVO> selectDuesList(OwnerPaginationInfoVO<FrcsPublicDuesVO> pagingVO);

	// 납부내역 상세 조회
	public FrcsPublicDuesVO duesDetail(@Param("duesPayde")String duesPayde, @Param("frcsId")String frcsId);

	// 납부내역 수정
	public void duesUpdate(FrcsPublicDuesVO duesVO);

	// 차트 정보 ajax
	public List<FrcsPublicDuesVO> getData(String frcsId);

	// 로열티 3%
	public int getfrcsRowal(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 제품구입비
	public int getorderAmt(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 트레이딩 추가결제비
	public int gettradAdd(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 트레이딩 삭감비
	public int gettradRedct(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);
	
	// 가맹비 총괄 테이블에 이미 데이터가 들어가있는지 중복 체크
	public int dupliCheck(FeeVO feeVO);
	
	// 가맹비 총괄 테이블에 이미 있다면 총 금액만 update
	public int updateFee(FeeVO feeVO);

	// 가맹비 총괄 테이블에 없다면 데이터 insert
	public int insertFee(FeeVO feeVO);

	// 총괄 테이블 pk 가져오기
	public String getFeecode(FeeVO feeVO);

	// 가맹비 디테일 테이블에 데이터 insert
	public void insertDetail(FrcsBillVO billVO);

	// 가맹비 디테일 테이블에 데이터 update
	public void updateDetail(FrcsBillVO billVO);

	// 납부일자 받아오기
	public Date getSettleDate(FeeVO feeVO);

	// 트레이딩 상세내역(내가 요청한거)
	public List<TradingVO> getTradDetail(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);

	// 트레이딩 상세내역(내가 보내준거)
	public List<TradingVO> getTradMinDetail(@Param("frcsId")String frcsId, @Param("thisMonth")Date thisMonth);


	

	
}
