package kr.or.ddit.service.head;

import java.util.List;
import java.util.Map;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.StoreOrderHistoryVO;

public interface IStoreService {

	// 가맹점 주문내역
	public int totalOrderCount(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO);
	public List<StoreOrderHistoryVO> selectTotalOrderList(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO);
	// select박스 안에들어갈 가맹점이름
	public List<StoreOrderHistoryVO> selectFrcsNameList(StoreOrderHistoryVO soh);
	// 가맹점 주문상세
	public int selectOrderListDetailsCount(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO);
	public List<StoreOrderHistoryVO> selectOrderListDetails(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO);
	
	public List<StoreOrderHistoryVO> selectCheckOne(String frcsorderNo);
	
	// 승인처리시 발주번호 처리
	public ServiceResult updateOrderDetails(StoreOrderHistoryVO soh, AlarmVO alarmVO);
	
	// 반려버튼 클릭 후 모달창에 데이터 불러오기
	public StoreOrderHistoryVO frcsOrderDetails(StoreOrderHistoryVO storeOrderHistoryVO);
	// 반려사유 기입 후 확인버튼 눌렀을때 업데이트
	public ServiceResult updateImpossibleOrder(StoreOrderHistoryVO soh);
	// 최근3일간 가맹점주문 COUNT
	public int selectOrderCnt();

}
