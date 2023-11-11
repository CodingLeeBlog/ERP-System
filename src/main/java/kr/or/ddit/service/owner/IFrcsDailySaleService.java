package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsDailySaleService {

	// 일일 매출 전체 리스트 페이징
	public int selectDailySalesCount(OwnerPaginationInfoVO<FrcsDailySalesVO> pagingVO);
	public List<FrcsDailySalesVO> selectDailySalesList(OwnerPaginationInfoVO<FrcsDailySalesVO> pagingVO);

	// 일일 매출 리스트 출력
	public List<FrcsDailySalesVO> getDailySalesList(String frcsId);
	
	// 가맹점 메뉴 정보
	public List<FrcsMenuVO> getMenu(String frcsId);

	// 일일 매출 등록 시 날짜 중복 체크
	public ServiceResult dailyInsertCheck(FrcsDailySalesVO saleVO);

	// 일일 매출 등록
	public ServiceResult insertDailySales(List<FrcsDailySalesVO> salesList);
	
	// 일일 매출 수정을 위해 이미 들어가 있는 정보 추출
	public List<FrcsDailySalesVO> getUpdateForm(FrcsDailySalesVO saleVO);
	
	// 일일 매출 수정
	public ServiceResult updateDailySales(List<FrcsDailySalesVO> salesList);
	
	// 주간차트를 위한 데이터불러오기
	public int[] getDate(String frcsId);
	
	// 인기 메뉴
	public List<FrcsDailySalesVO> getPopularMenu(String frcsId);
	
	// 엑셀 다운로드
	public List<FrcsDailySalesVO> getDailySalesCellList(String frcsId);

//	// 모달창 메뉴 검색
//	public List<FrcsMenuVO> getMenuSearchList(String frcsId, String inputText);
//	


}
