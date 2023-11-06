package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.OfficeLetterMapper;
import kr.or.ddit.service.head.IOfficeService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.OfficeLetterVO;
import kr.or.ddit.vo.owner.FranchiseVO;

@Service
public class OfficeServiceImpl implements IOfficeService {

	@Inject
	private OfficeLetterMapper officeLetterMapper;
	
	@Override
	public List<OfficeLetterVO> selectLetterList(HeadPaginationInfoVO<OfficeLetterVO> pagingVO) {
		return officeLetterMapper.selectLetterList(pagingVO);
	}

	@Override
	public int selectLetterCount(HeadPaginationInfoVO<OfficeLetterVO> pagingVO) {
		return officeLetterMapper.selectLetterCount(pagingVO);
	}

	@Override
	public void officeLetterRegister(OfficeLetterVO officeLetterVO) {
		officeLetterMapper.officeLetterRegister(officeLetterVO);
	}

	@Override
	public List<FranchiseVO> getFrcsName() {
		return officeLetterMapper.getFrcsName();
	}

}
