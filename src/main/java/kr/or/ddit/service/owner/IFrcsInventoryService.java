package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsInventoryService {

	public List<FrcsInventoryVO> getInventList(String memId);

	public int selectInventCount(OwnerPaginationInfoVO<FrcsInventoryVO> pagingVO);

	public List<FrcsInventoryVO> selectInventList(OwnerPaginationInfoVO<FrcsInventoryVO> pagingVO);

	public ServiceResult inventUpdate(FrcsInventoryVO inventVO);

	// 재고 초기 세팅
	public ServiceResult beginSetting(String frcsId);

	// 신규 제품 업데이트
	public ServiceResult inventAdd(String frcsId);

//	public void deliveryMinInsert(FrcsInventoryVO frcsVO);

}
