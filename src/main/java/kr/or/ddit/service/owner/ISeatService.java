package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.owner.FrcsSeatVO;

public interface ISeatService {

	public void seatRegister(FrcsSeatVO seat);
	public ServiceResult seatDelete(String frcsId);
	public List<FrcsSeatVO> frcsSeatList(String frcsId);

}
