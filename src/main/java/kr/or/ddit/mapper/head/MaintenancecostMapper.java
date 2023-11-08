package kr.or.ddit.mapper.head;

import java.util.List;

import kr.or.ddit.vo.head.FeeVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.StoreOrderHistoryVO;

public interface MaintenancecostMapper {

	// 관리비관리 메인화면페이지 totalRecord
	public int selectMainCount(HeadPaginationInfoVO<FeeVO> pagingVO);
	// 관리비관리 메인화면페이지 리스트
	public List<FeeVO> selectMainList(HeadPaginationInfoVO<FeeVO> pagingVO);
	// 관리비 미납횟수 가져오기
	public List<FeeVO> selectNonPaymentCount(String frcsId);
	// 관리비관리 상세화면페이지 totalRecord
	public int selectDetailCount(HeadPaginationInfoVO<FeeVO> pagingVO);
	// 관리비관리 상세화면리스트
	public List<FeeVO> selectDetailList(HeadPaginationInfoVO<FeeVO> pagingVO);
	// 관리비관리 모달창에 띄워줄 데이터
	public List<StoreOrderHistoryVO> selectModalOrderList(StoreOrderHistoryVO sohVO);
	// ajax로 미납내역 모달에 띄워줄 발주내역 상세 리스트 
	public List<StoreOrderHistoryVO> selectModalData(StoreOrderHistoryVO sohVO);

}
