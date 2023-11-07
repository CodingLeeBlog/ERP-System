package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsEmployeeMapper;
import kr.or.ddit.service.owner.IFrcsEmployeeService;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;

@Service
public class FrcsEmployeeServiceImpl implements IFrcsEmployeeService {
	
	@Inject
	private FrcsEmployeeMapper mapper;

	@Override
	public List<FrcsEmployeeVO> frcsEmpList(String frcsId) {
		return mapper.frcsEmpList(frcsId);
	}

	@Override
	public ServiceResult frcsEmpInsert(FrcsEmployeeVO frcsEmpVO) {
		ServiceResult result = null;
		int status = mapper.frcsEmpInsert(frcsEmpVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult empDelete(String frcsEmpCd) {
		ServiceResult result = null;
		int status = mapper.empDelete(frcsEmpCd);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult empUpdate(FrcsEmployeeVO frcsEmpVO) {
		ServiceResult result = null;
		int status = mapper.empUpdate(frcsEmpVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	
}
