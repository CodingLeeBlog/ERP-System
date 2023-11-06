package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.DeliveryVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsInventoryMapper {

	public List<FrcsInventoryVO> getInventList(String memId);

	public int selectInventCount(OwnerPaginationInfoVO<FrcsInventoryVO> pagingVO);

	public List<FrcsInventoryVO> selectInventList(OwnerPaginationInfoVO<FrcsInventoryVO> pagingVO);

	// 재고 변경 전 재고 수량 체크
	public int preInventQy(FrcsInventoryVO inventVO);

	// 재고 업데이트
	public int inventUpdate(FrcsInventoryVO inventVO);

	// 재고 변경 후 재고 수량 체크
	public int postInventQy(FrcsInventoryVO inventVO);

	// 재고 수량 줄였으면 출고에 insert
	public void deliveryInsert(DeliveryVO delVO);

}
