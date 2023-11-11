package kr.or.ddit.mapper.owner;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FrcsAutoOrderVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;
import kr.or.ddit.vo.owner.FrcsOrderVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsOrderMapper {
	
	// 발주 가능 리스트 조회 (페이징x)
	public List<FrcsInventoryVO> getInventList(String frcsId);
	
	// 검색
	public List<FrcsInventoryVO> inventSearch(@Param("searchWord")String searchWord, @Param("searchType")String searchType, @Param("frcsId")String frcsId);

	// 프랜차이즈 아이디 얻기
	public String getFrcsId(String memId);
	
	// 발주
	public int orderDetailInsert(FrcsOrderDetailVO detailVO);
	public int orderInsert(FrcsOrderVO frcsOrderVO);

	// 발주 내역 리스트 (페이징o)
	public int selectOrderCount(OwnerPaginationInfoVO<FrcsOrderVO> pagingVO);
	public List<FrcsOrderVO> selectOrderList(OwnerPaginationInfoVO<FrcsOrderVO> pagingVO);

	// 발주 취소
	public int orderCancel(String frcsOrderNo);

	// 자동발주 모달창 안 제품 검색
	public List<FrcsInventoryVO> getSearch(String searchWord);

	// 자동발주 목록 리스트 페이징
	public int selectAutoOrderCount(OwnerPaginationInfoVO<FrcsAutoOrderVO> pagingVO);
	public List<FrcsAutoOrderVO> selectAutoOrderList(OwnerPaginationInfoVO<FrcsAutoOrderVO> pagingVO);

	// 자동발주 등록
	public int insertAutoOrder(FrcsAutoOrderVO autoVO);

	// 자동발주 상태변경
	public int disabledAutoOrder(FrcsAutoOrderVO autoVO);

	// 발주 리스트에 자동발주 자동 추가
	public List<FrcsInventoryVO> getAutoList(String frcsId);

	// 발주 상세 내역 조회 (모달)
	public FrcsOrderVO getDetail(String frcsOrderNo);

	// 자동발주 중복체크
	public int autoOrderCheck(FrcsAutoOrderVO autoVO);

	// 자동발주 수정
	public int autoOrderUpdate(FrcsAutoOrderVO autoVO);
	
	//알림
	public void insertAlarm(AlarmVO alarmVO);
	public String getReceiveMemId(String frcsOrderNo);
	public String getMemFrcs(String frcsId);

	// 발주 상세 내역 (엑셀 다운로드)
	public List<FrcsOrderVO> getOrderList(String frcsId);


	
}
