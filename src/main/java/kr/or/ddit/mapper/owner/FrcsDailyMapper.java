package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsMenuIngredientVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsDailyMapper {

	// 일일 매출 전체 리스트 페이징
	public int selectDailySalesCount(OwnerPaginationInfoVO<FrcsDailySalesVO> pagingVO);
	public List<FrcsDailySalesVO> selectDailySalesList(OwnerPaginationInfoVO<FrcsDailySalesVO> pagingVO);

	// 일일 매출 리스트 출력
	public List<FrcsDailySalesVO> getDailySalesList(String frcsId);

	// 가맹점 메뉴 정보
	public List<FrcsMenuVO> getMenu(String frcsId);

	// 가맹점 일일 매출 등록 전 중복 체크
	public int dailyInsertCheck(FrcsDailySalesVO saleVO);
	
	// 가맹점 일일 매출 등록
	public int insertDailySales(FrcsDailySalesVO salesVO);

	// 메뉴 별 재료 조회
	public List<FrcsMenuIngredientVO> selectMenu(String menuCd);

	// 재고 마이너스 처리
	public void minusInvent(FrcsMenuIngredientVO ingredVO); 
	
	// 출고 테이블 insert
	public void plusDelivery(FrcsMenuIngredientVO ingredVO);
	
	// 일일 매출 수정을 위해 이미 들어가 있는 정보 추출
	public List<FrcsDailySalesVO> getUpdateForm(FrcsDailySalesVO saleVO);
	
	// 일일 매출 삭제 전 숫자 카운트
	public List<FrcsDailySalesVO> getBeforeCount(FrcsDailySalesVO salesVO);




}
