package kr.or.ddit.service.owner.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.owner.FrcsCheckMapper;
import kr.or.ddit.service.owner.IFrcsCheckService;

@Service
public class FrcsCheckServiceImpl implements IFrcsCheckService {

	@Inject
	private FrcsCheckMapper mapper;
	
}
