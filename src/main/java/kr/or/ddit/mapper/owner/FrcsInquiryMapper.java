package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FrcsInquiryVO;

public interface FrcsInquiryMapper {

	public List<FrcsInquiryVO> frcsInqList(String frcsId);
	public int inqInsert(FrcsInquiryVO frcsInqVO);
	public FrcsInquiryVO frcsInqDetail(String inqryNo);
	public int frcsInqUpdate(FrcsInquiryVO frcsInquiryVO);
	public int frcsInqDelete(String inqryNo);

}
