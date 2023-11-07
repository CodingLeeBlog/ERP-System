package kr.or.ddit.service.owner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsInquiryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsInquiryService {

	public List<FrcsInquiryVO> frcsInqList(String frcsId);
	public ServiceResult inqInsert(HttpServletRequest req, FrcsInquiryVO frcsInqVO);
	public FrcsInquiryVO frcsInqDetail(String inqryNo);
	public FrcsInquiryVO selectInq(String inqryNo);
	public ServiceResult frcsInqUpdate(HttpServletRequest req, FrcsInquiryVO frcsInquiryVO);
	public ServiceResult frcsInqDelete(HttpServletRequest req, String inqryNo);
	public int selectInqCount(OwnerPaginationInfoVO<FrcsInquiryVO> pagingVO);
	public List<FrcsInquiryVO> selectInqList(OwnerPaginationInfoVO<FrcsInquiryVO> pagingVO);
	public AttachVO selectFileInfo(int attachNo);

}
