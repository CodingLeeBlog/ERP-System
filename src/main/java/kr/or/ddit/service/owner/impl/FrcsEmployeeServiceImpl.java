package kr.or.ddit.service.owner.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.owner.FrcsEmployeeMapper;
import kr.or.ddit.service.owner.IFrcsEmployeeService;

@Service
public class FrcsEmployeeServiceImpl implements IFrcsEmployeeService {
	
	@Inject
	private FrcsEmployeeMapper mapper;
	
}
