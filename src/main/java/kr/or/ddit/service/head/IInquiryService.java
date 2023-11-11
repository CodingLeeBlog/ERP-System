package kr.or.ddit.service.head;

import java.util.List;

import kr.or.ddit.vo.head.HeadInquiryVO;
import kr.or.ddit.vo.member.PaginationInfoVO;

public interface IInquiryService {

	public int selectInquiryCount(PaginationInfoVO<HeadInquiryVO> pagingVO);

	public List<HeadInquiryVO> selectInquiryList(PaginationInfoVO<HeadInquiryVO> pagingVO);

	public HeadInquiryVO inquiryDetail(String inqryNo);

}
