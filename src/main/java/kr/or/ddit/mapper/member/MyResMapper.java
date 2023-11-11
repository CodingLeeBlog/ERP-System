package kr.or.ddit.mapper.member;

import java.util.List;

import kr.or.ddit.vo.member.PayVO;
import kr.or.ddit.vo.member.ResVO;

public interface MyResMapper {

	public List<ResVO> myResList(String memId);

	public void myResUpdate(PayVO payVO);

	public void myResDelete(PayVO payVO);

	public void myResMenuDelete(PayVO payVO);

	public void myResReviewUpdate(ResVO resVO);

}
