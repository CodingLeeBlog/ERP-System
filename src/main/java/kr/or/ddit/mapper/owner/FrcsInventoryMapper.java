package kr.or.ddit.mapper.owner;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.head.HeadInventoryVO;
import kr.or.ddit.vo.owner.DeliveryVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsInventoryMapper {

	public List<FrcsInventoryVO> getInventList(String frcsId);

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

	// 본사 재고 코드 다 가져오기
	public List<HeadInventoryVO> getVdprodCd();

	// 본사 재고 코드 수만큼 insert
	public int beginSetting(@Param("frcsId")String frcsId, @Param("vdprodCd")String vdprodCd);

	// 내 가맹점에 본사 제품이 있는지 없는지 체크
	public int getInventCheck(@Param("vdprodCd")String vdprodCd,@Param("frcsId")String frcsId);

	// 없으면 insert
	public int newInventInsert(@Param("vdprodCd")String vdprodCd, @Param("frcsId")String frcsId);

}
