package kr.or.ddit.service.owner;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.member.PaginationInfoVO;
import kr.or.ddit.vo.owner.FrcsAttendanceManagementVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.FrcsRestDayVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface IFrcsRestDay {

	// DB에 저장되어 있는 정보 가지고오기
	public List<FrcsRestDayVO> findAll(String frcsId);

	//저장
	public int insert(FrcsRestDayVO frcsRestDayVO);

	//수정
	public int update(FrcsRestDayVO frcsRestDayVO);

	//삭제
	public int delete(String valueOf);


}
