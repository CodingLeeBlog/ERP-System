package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FrcsAttendanceManagementVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;

public interface FrcsAttendanceMapper {

	public List<FrcsAttendanceManagementVO> findAll(String frcsId);

	public int insert(FrcsAttendanceManagementVO frcsAttendanceManagementVO);

	public int update(FrcsAttendanceManagementVO frcsAttendanceManagementVO);

	public int delete(String valueOf);

	public List<FrcsEmployeeVO> getMemFrcsList(String frcsId);

	public String getFrcsEmpNm(String frcsEmpCd);

}
