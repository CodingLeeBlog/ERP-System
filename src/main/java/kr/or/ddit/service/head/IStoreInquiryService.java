package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.TotalInfoVO;

public interface IStoreInquiryService {

	public int selectTotalFrcsCount(HeadPaginationInfoVO<TotalInfoVO> pagingVO);

	public List<TotalInfoVO> selectTotalFrcsList(HeadPaginationInfoVO<TotalInfoVO> pagingVO);

	// 액셀에 업로드/내려받기할 데이터
	public List<TotalInfoVO> storeList();
	public ServiceResult registerExcel(TotalInfoVO store);

	// 가맹점상세조회 데이터
	public TotalInfoVO selectMemberDetail(String memId);
	public TotalInfoVO selectFrcsDetail(String frcsName);
}
