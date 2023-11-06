package kr.or.ddit.service.owner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.owner.FrcsInquiryVO;

public interface IFrcsInquiryService {

	public List<FrcsInquiryVO> frcsInqList(String frcsId);
	public ServiceResult inqInsert(HttpServletRequest req, FrcsInquiryVO frcsInqVO);
	public FrcsInquiryVO frcsInqDetail(String inqryNo);
	public ServiceResult frcsInqUpdate(HttpServletRequest req, FrcsInquiryVO frcsInquiryVO);
	public ServiceResult frcsInqDelete(String inqryNo);

}
