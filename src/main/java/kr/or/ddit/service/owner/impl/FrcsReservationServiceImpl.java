package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsReservationMapper;
import kr.or.ddit.service.owner.IFrcsReservationService;
import kr.or.ddit.vo.owner.FrcsReservationVO;

@Service
public class FrcsReservationServiceImpl implements IFrcsReservationService {

	@Inject
	private FrcsReservationMapper mapper;

	@Override
	public List<FrcsReservationVO> frcsResvList(String frcsId) {
		return mapper.frcsResvList(frcsId);
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
	
}
