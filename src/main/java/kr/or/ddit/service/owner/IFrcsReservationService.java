package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.owner.FrcsReservationVO;

public interface IFrcsReservationService {

	public List<FrcsReservationVO> frcsResvList(String frcsId);
	public ServiceResult resvStateUpdate(String resvNo);

}
