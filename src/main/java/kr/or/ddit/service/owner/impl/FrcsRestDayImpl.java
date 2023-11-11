package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsAttendanceMapper;
import kr.or.ddit.mapper.owner.FrcsRestDayMapper;
import kr.or.ddit.service.owner.IFrcsRestDay;
import kr.or.ddit.vo.owner.FrcsRestDayVO;


@Service
public class FrcsRestDayImpl implements IFrcsRestDay {

	@Inject
	private FrcsRestDayMapper mapper;

	//등록
	@Override
	public int insert(FrcsRestDayVO frcsRestDayVO) {
		return this.mapper.insert(frcsRestDayVO);
	}

	@Override
	public List<FrcsRestDayVO> findAll(String frcsId) {
		return this.mapper.findAll(frcsId);
	}

	@Override
	public int update(FrcsRestDayVO frcsRestDayVO) {
		return this.mapper.update(frcsRestDayVO);
	}

	@Override
	public int delete(String valueOf) {
		return this.mapper.delete(valueOf);
	}


}
