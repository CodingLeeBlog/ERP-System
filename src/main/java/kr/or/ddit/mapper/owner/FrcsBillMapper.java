package kr.or.ddit.mapper.owner;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.head.FeeVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsBillMapper {

	// 공과금 납부내역 조회
	public List<FrcsPublicDuesVO> duesList(String memId);
	
	// 공과금 등록
	public void duesRegister(FrcsPublicDuesVO duesVO);

	// 공과금 납부년월 중복체크
	public int duesPaydeCheck(FrcsPublicDuesVO duesVO);

	// memId로 프랜차이즈 아이디 얻어오기
	public String frcsIdInfo(String memId);

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

	// 가맹비 총괄 테이블에 데이터 insert
	public int insertFee(FeeVO feeVO);


	
}
