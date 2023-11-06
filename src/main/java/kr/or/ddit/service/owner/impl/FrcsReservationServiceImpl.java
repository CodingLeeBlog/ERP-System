package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	
}
