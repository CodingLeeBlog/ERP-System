package kr.or.ddit.service.member;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.member.PayVO;

public interface IMemberPayService {

	public ServiceResult create(PayVO payVO);

	public ServiceResult delete(PayVO payVO);

}
