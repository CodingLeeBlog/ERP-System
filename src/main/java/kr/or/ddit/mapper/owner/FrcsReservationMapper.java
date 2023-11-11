package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FrcsReservationVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsReservationMapper {

	public List<FrcsReservationVO> frcsResvList(String resvNo);
	public int resvStateUpdate(String resvNo);
	public int selectResvCount(OwnerPaginationInfoVO<FrcsReservationVO> pagingVO);
	public List<FrcsReservationVO> selectResvList(OwnerPaginationInfoVO<FrcsReservationVO> pagingVO);
	public int resvUpdate(FrcsReservationVO frcsResvVO);
	public int selectCount(String frcsId);
	public int rsevDelete(String resvNo);

}
