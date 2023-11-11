package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.PurchaseVO;

public interface IPurchaseService {
	
	// 매입내역관리 메인화면 데이터 뿌리기
	public int selectTotalPurchaseCount(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	public List<PurchaseVO> selectTotalPurchaseList(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	
	// 매입내역관리 상세화면 데이터 뿌리기
	public int selectDetailCount(String hdorderNo);
	public List<PurchaseVO> selectDetailList(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	
	// 거래처 발주시 분류클릭했을때 거래처의 거래처코드,거래처이름 가져오기
	public List<PurchaseVO> selectDataList(String vdCategory);
	public List<PurchaseVO> selectOrderList(PurchaseVO pcVO);
	
	// HEAD_ORDER 테이블에 INSERT
	public ServiceResult insertHeadOrder(PurchaseVO pcVO);
	// HEAD_ORDER_DETAIL 테이블에 INSERT
	public ServiceResult insertOrder(PurchaseVO phVO);
	
	// 발주취소를 눌렀을때 승인상태 취소로 업데이트
	public ServiceResult updateHeadOrderConfm(String hdorderNo);
	
	// 본사재고리스트
	public int selectHeadInventory(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	public List<PurchaseVO> selectHeadInventoryList(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	
}
