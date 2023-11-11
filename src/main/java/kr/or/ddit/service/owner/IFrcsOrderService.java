package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FrcsAutoOrderVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.FrcsOrderVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsOrderService {

	public List<FrcsInventoryVO> getInventList(String memId);
	public List<FrcsInventoryVO> inventSearch(String searchWord, String searchType, String frcsId);
	public String getFrcsId(String memId);
	public ServiceResult orderInsert(FrcsOrderVO frcsOrderVO, AlarmVO alarmVO);

	// 발주 페이징 처리
	public int selectOrderCount(OwnerPaginationInfoVO<FrcsOrderVO> pagingVO);
	public List<FrcsOrderVO> selectOrderList(OwnerPaginationInfoVO<FrcsOrderVO> pagingVO);
	
	// 발주 취소
	public ServiceResult orderCancel(String frcsOrderNo);
	
	// 자동 발주 모달 창 안 제품 검색 
	public List<FrcsInventoryVO> getSearch(String searchWord);
	
	// 자동 발주 페이징 처리
	public int selectAutoOrderCount(OwnerPaginationInfoVO<FrcsAutoOrderVO> pagingVO);
	public List<FrcsAutoOrderVO> selectAutoOrderList(OwnerPaginationInfoVO<FrcsAutoOrderVO> pagingVO);
	
	// 자동발주 등록
	public ServiceResult insertAutoOrder(FrcsAutoOrderVO autoVO);
	
	// 자동발주 상태변경
	public ServiceResult disabledAutoOrder(FrcsAutoOrderVO autoVO);
	
	// 발주리스트에 자동발주 자동추가
	public List<FrcsInventoryVO> getAutoList(String frcsId);
	
	// 발주 상세 내역 조회(모달)
	public FrcsOrderVO getDetail(String frcsOrderNo);
	
	// 자동발주 중복 체크
	public ServiceResult autoOrderCheck(FrcsAutoOrderVO autoVO);
	
	// 자동발주 수정
	public ServiceResult autoOrderUpdate(FrcsAutoOrderVO autoVO);
	
	// 발주 상세내역 페이지 엑셀 다운로드
	public List<FrcsOrderVO> getOrderList(String frcsId);
}
