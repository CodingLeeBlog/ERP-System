package kr.or.ddit.service.owner.impl;

import javax.inject.Inject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.owner.FrcsIdMapper;
import kr.or.ddit.service.owner.IFrcsIdService;

@Service
public class FrcsIdServiceImpl implements IFrcsIdService {

	@Inject
	private FrcsIdMapper mapper;

	@Override
	public String getFrcsId() {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String memId = user.getUsername();
		String frscId = mapper.getFrcsId(memId);
		
		return frscId;
	}
	
	
}
