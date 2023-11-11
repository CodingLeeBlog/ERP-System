package kr.or.ddit.mapper.head;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InventoryUpdateVO;
import kr.or.ddit.vo.head.StoreOrderHistoryVO;
import kr.or.ddit.vo.head.TotalInfoVO;

public interface StoreMapper {
	
	// 가맹점조회 
	public int selectTotalFrcsCount(HeadPaginationInfoVO<TotalInfoVO> pagingVO);
	public List<TotalInfoVO> selectTotalFrcsList(HeadPaginationInfoVO<TotalInfoVO> pagingVO);

	// 가맹점 주문내역
	public int totalOrderCount(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO);
	public String selectTotalPrice(String price);
	public List<StoreOrderHistoryVO> selectTotalOrderList(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO);
	// select박스 안에들어갈 내용
	public List<StoreOrderHistoryVO> selectFrcsNameList(StoreOrderHistoryVO soh);
	// 가맹점 주문상세
	public int selectOrderListDetailsCount(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO);
	public List<StoreOrderHistoryVO> selectOrderListDetails(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO);
	
	public List<StoreOrderHistoryVO> selectCheckOne(String frcsorderNo);
	

	
	// 가맹점 승인처리시
	public int updateOrderDetails(StoreOrderHistoryVO soh);
	// 가맹점 FRCS_INVENTORY 업데이트
	public List<InventoryUpdateVO> selectFrcsQy(StoreOrderHistoryVO soh);
	public void updateFrcsInventory(InventoryUpdateVO qy);
	// 본사 HEAD_INVENTORY 업데이트
	public List<InventoryUpdateVO> selectHeadQy(StoreOrderHistoryVO soh);
	public void updateHeadInventory(InventoryUpdateVO qy);
	// 반려 버튼클릭시 모달창에 데이터불러오기
	public StoreOrderHistoryVO frcsOrderDetails(StoreOrderHistoryVO storeOrderHistoryVO);
	// 반려사유 입력 후 확인버튼 눌렀을때 업데이트
	public int updateImpossibleOrder(StoreOrderHistoryVO soh);
	
	// 액셀 업로드 / 다운로드할 데이터
	public List<TotalInfoVO> storeList();
	public int registerFranchiseExcel(TotalInfoVO store);
//	public int registerFrcsIpmgExcel(TotalInfoVO store);
	public int registerMemberExcel(TotalInfoVO store);
	
	// 가맹점 상세조회 데이터
	public TotalInfoVO selectMemberDetail(String memId);
	public TotalInfoVO selectFrcsDetail(String frcsName);
	
	// 최근3일간 가맹점주문 count
	public int selectOrderCnt();
	
	//알림
	public void insertAlarm(AlarmVO alarmVO);
	public String getReceiveMemId(String frcsId);
	public String getMemFrcs(String frcsId);
}
