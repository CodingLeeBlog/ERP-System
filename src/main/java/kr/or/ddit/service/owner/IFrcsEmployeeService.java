package kr.or.ddit.service.owner;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;

public interface IFrcsEmployeeService {

	public List<FrcsEmployeeVO> frcsEmpList(String frcsId);
	public ServiceResult frcsEmpInsert(HttpServletRequest req, FrcsEmployeeVO frcsEmpVO);
	public ServiceResult empDelete(HttpServletRequest req, String frcsEmpCd);
	public ServiceResult empUpdate(HttpServletRequest req, FrcsEmployeeVO frcsEmpVO);
	public AttachVO selectFileInfo(int attachNo);
	public FrcsEmployeeVO selectEmp(String frcsId);
	public List<FrcsEmployeeVO> frcsEmpFileList(String frcsId);

}
