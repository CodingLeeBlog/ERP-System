package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FrcsSeatVO;

public interface SeatMapper {

	public void seatRegister(FrcsSeatVO seat);
	public int seatDelete(String frcsId);
	public List<FrcsSeatVO> frcsSeatList(String frcsId);


}
