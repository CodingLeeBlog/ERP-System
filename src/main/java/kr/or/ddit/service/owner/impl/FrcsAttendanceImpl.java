package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsAttendanceMapper;
import kr.or.ddit.service.owner.IFrcsAttendance;
import kr.or.ddit.vo.owner.FrcsAttendanceManagementVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;


@Service
public class FrcsAttendanceImpl implements IFrcsAttendance {

	@Inject
	private FrcsAttendanceMapper mapper;

	//등록
	@Override
	public int insert(FrcsAttendanceManagementVO frcsAttendanceManagementVO) {
		return this.mapper.insert(frcsAttendanceManagementVO);
	}

	@Override
	public List<FrcsAttendanceManagementVO> findAll(String frcsId) {
		return this.mapper.findAll(frcsId);
	}

	@Override
	public int update(FrcsAttendanceManagementVO frcsAttendanceManagementVO) {
		return this.mapper.update(frcsAttendanceManagementVO);
	}

	@Override
	public int delete(String valueOf) {
		return this.mapper.delete(valueOf);
	}

	@Override
	public List<FrcsEmployeeVO> getMemFrcsList(String frcsId) {
		return this.mapper.getMemFrcsList(frcsId);
	}


}
