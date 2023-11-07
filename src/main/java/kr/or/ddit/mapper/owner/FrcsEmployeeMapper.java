package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FrcsEmployeeVO;

public interface FrcsEmployeeMapper {

	public List<FrcsEmployeeVO> frcsEmpList(String frcsId);
	public int frcsEmpInsert(FrcsEmployeeVO frcsEmpVO);
	public int empDelete(String frcsEmpCd);
	public int empUpdate(FrcsEmployeeVO frcsEmpVO);

}
