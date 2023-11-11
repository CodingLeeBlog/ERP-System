package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.PurchaseVO;

public interface PurchaseMapper {
	
	// 본사가 거래처한테 매입한내역 뿌리기
	public int selectTotalPurchaseCount(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	public List<PurchaseVO> selectTotalPurchaseList(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	// 매입상세내역을 불러와 총계 계산
	public List<PurchaseVO> selectOrderDetail(String hdorderNo);
	// 매입상세내역 데이터뿌리기
	public int selectDetailCount(String hdorderNo);
	public List<PurchaseVO> selectDetailList(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	// 거래처 발주시 분류클릭했을때 거래처의 거래처코드,거래처이름 가져오기
	public List<PurchaseVO> selectDataList(String vdCategory);
	public List<PurchaseVO> selectOrderList(PurchaseVO pcVO);
	
	// HEAD_ORDER 테이블에 INSERT
	public int insertHeadOrder(PurchaseVO pcVO);
	// HEAD_ORDER_DETAIL 테이블에 INSERT
	public int insertOrder(PurchaseVO pcVO);
	// HEAD_INVENTORY 테이블에 발주한 수량만큼 더해주기
	public int updateHeadInventory(PurchaseVO phVO);
	// VENDOR_INVENTORY 테이블에 발주온 수량만큼 빼주기
	public int updateVendorInventory(PurchaseVO pcVendorVO);
	// 제품수량을 업데이트하기위한 셀렉트
	public PurchaseVO selectProduct(String vdprodCd);
	public PurchaseVO selectVendorProduct(String vdprodCd);
	// 발주취소를 눌렀을때 승인상태 취소로 업데이트
	public int updateHeadOrderConfm(String hdorderNo);
	// 본사입고 테이블에 insert
	public int insertHeadReceiving(PurchaseVO insertpcVO);
	
	// 본사 재고리스트
	public int selectHeadInventory(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	public List<PurchaseVO> selectHeadInventoryList(HeadPaginationInfoVO<PurchaseVO> pagingVO);
	
}
