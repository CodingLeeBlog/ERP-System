package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.owner.FrcsAttendanceManagementVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;
import kr.or.ddit.vo.owner.FrcsRestDayVO;

public interface FrcsRestDayMapper {

	public List<FrcsRestDayVO> findAll(String frcsId);

	public int insert(FrcsRestDayVO frcsRestDayVO);

	public int update(FrcsRestDayVO frcsRestDayVO);

	public int delete(String valueOf);

}
