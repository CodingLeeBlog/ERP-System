package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsInquiryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsInquiryMapper {

	public List<FrcsInquiryVO> frcsInqList(String frcsId);
	public int inqInsert(FrcsInquiryVO frcsInqVO);
	public FrcsInquiryVO frcsInqDetail(String inqryNo);
	public int frcsInqUpdate(FrcsInquiryVO frcsInquiryVO);
	public int frcsInqDelete(String inqryNo);
	public int selectInqCount(OwnerPaginationInfoVO<FrcsInquiryVO> pagingVO);
	public List<FrcsInquiryVO> selectInqList(OwnerPaginationInfoVO<FrcsInquiryVO> pagingVO);
	public void insertInqFile(AttachVO attachVO);
	public AttachVO selectFileInfo(int attachNo);
	public FrcsInquiryVO selectInq(String inqryNo);
	public void deleteInqFileByInqNo(String inqryNo);
	public AttachVO selectInqFile(Integer integer);
	public void deleteInqFile(Integer integer);

}
