package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsReservationMapper;
import kr.or.ddit.service.owner.IFrcsReservationService;
import kr.or.ddit.vo.owner.FrcsReservationVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Service
public class FrcsReservationServiceImpl implements IFrcsReservationService {

	@Inject
	private FrcsReservationMapper mapper;

	@Override
	public List<FrcsReservationVO> frcsResvList(String resvNo) {
		return mapper.frcsResvList(resvNo);
	}

	@Override
	public ServiceResult resvStateUpdate(String resvNo) {
		ServiceResult result = null;
		int status = mapper.resvStateUpdate(resvNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public int selectResvCount(OwnerPaginationInfoVO<FrcsReservationVO> pagingVO) {
		return mapper.selectResvCount(pagingVO);
	}

	@Override
	public List<FrcsReservationVO> selectResvList(OwnerPaginationInfoVO<FrcsReservationVO> pagingVO) {
		return mapper.selectResvList(pagingVO);
	}

	@Override
	public ServiceResult resvUpdate(FrcsReservationVO frcsResvVO) {
		ServiceResult result = null;
		int status = mapper.resvUpdate(frcsResvVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public int selectCount(String frcsId) {
		return mapper.selectCount(frcsId);
	}

	@Override
	public ServiceResult rsevDelete(String resvNo) {
		ServiceResult result = null;
		int status = mapper.rsevDelete(resvNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}


}
