package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.owner.FrcsReservationVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsReservationService {

	public List<FrcsReservationVO> frcsResvList(String frcsId);
	public ServiceResult resvStateUpdate(String resvNo);
	public int selectResvCount(OwnerPaginationInfoVO<FrcsReservationVO> pagingVO);
	public List<FrcsReservationVO> selectResvList(OwnerPaginationInfoVO<FrcsReservationVO> pagingVO);
	public ServiceResult resvUpdate(FrcsReservationVO frcsResvVO);

}
