package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.SeatMapper;
import kr.or.ddit.service.owner.ISeatService;
import kr.or.ddit.vo.owner.FrcsSeatVO;

@Service
public class SeatServiceImpl implements ISeatService {

	@Inject
	private SeatMapper mapper;

	@Override
	public void seatRegister(FrcsSeatVO seat) {
		mapper.seatRegister(seat);
	}

	@Override
	public ServiceResult seatDelete(String frcsId) {
		ServiceResult result = null;
		mapper.seatDelete(frcsId);
		int status = mapper.seatDelete(frcsId);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public List<FrcsSeatVO> frcsSeatList(String frcsId) {
		return mapper.frcsSeatList(frcsId);
	}

}
