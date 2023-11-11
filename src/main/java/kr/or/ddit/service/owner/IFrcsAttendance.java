package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.member.PaginationInfoVO;
import kr.or.ddit.vo.owner.FrcsAttendanceManagementVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsAttendance {

	// DB에 저장되어 있는 정보 가지고오기
	public List<FrcsAttendanceManagementVO> findAll(String frcsId);

	//저장
	public int insert(FrcsAttendanceManagementVO frcsAttendanceManagementVO);

	//수정
	public int update(FrcsAttendanceManagementVO frcsAttendanceManagementVO);

	//삭제
	public int delete(String valueOf);

	//직원코드 가져오기
	public List<FrcsEmployeeVO> getMemFrcsList(String frcsId);



}
