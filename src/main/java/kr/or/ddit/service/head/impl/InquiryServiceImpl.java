package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.InquiryMapper;
import kr.or.ddit.service.head.IInquiryService;
import kr.or.ddit.vo.head.HeadInquiryVO;
import kr.or.ddit.vo.member.PaginationInfoVO;
import kr.or.ddit.vo.owner.FrcsInquiryVO;

@Service
public class InquiryServiceImpl implements IInquiryService {

	@Inject
	private InquiryMapper inquirymapper;
	
	@Override
	public int selectInquiryCount(PaginationInfoVO<HeadInquiryVO> pagingVO) {
		return inquirymapper.selectInquiryCount(pagingVO);
	}

	@Override
	public List<HeadInquiryVO> selectInquiryList(PaginationInfoVO<HeadInquiryVO> pagingVO) {
		return inquirymapper.selectInquiryList(pagingVO);
	}

	@Override
	public HeadInquiryVO inquiryDetail(String inqryNo) {
		return inquirymapper.inquiryDetail(inqryNo);

	}

}
