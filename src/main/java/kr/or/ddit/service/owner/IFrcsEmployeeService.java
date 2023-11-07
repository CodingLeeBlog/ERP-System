package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;

public interface IFrcsEmployeeService {

	public List<FrcsEmployeeVO> frcsEmpList(String frcsId);
	public ServiceResult frcsEmpInsert(FrcsEmployeeVO frcsEmpVO);
	public ServiceResult empDelete(String frcsEmpCd);
	public ServiceResult empUpdate(FrcsEmployeeVO frcsEmpVO);

}
