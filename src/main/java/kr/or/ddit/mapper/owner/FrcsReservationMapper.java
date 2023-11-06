package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FrcsReservationVO;

public interface FrcsReservationMapper {

	public List<FrcsReservationVO> frcsResvList(String frcsId);
	public int resvStateUpdate(String resvNo);

}
