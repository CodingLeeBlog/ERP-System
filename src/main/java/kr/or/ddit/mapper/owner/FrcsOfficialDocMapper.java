package kr.or.ddit.mapper.owner;

import java.util.List;

import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsOfficialDocVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

public interface FrcsOfficialDocMapper {

	public int selectOfldcCount(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO);
	public List<FrcsOfficialDocVO> selectOfldcList(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVO);
	public int ofldcInsert(FrcsOfficialDocVO frcsOfldcVO);
	public void insertOfldcFile(AttachVO attachVO);
	public FrcsOfficialDocVO selectOfldc(String frcsOfldcNo);
	public void deleteOfldcFileByfrcsOfldcNo(String frcsOfldcNo);
	public int frcsOfldcDelete(String frcsOfldcNo);
	public AttachVO selectFileInfo(int attachNo);
	
	//알림
	public void insertAlarm(AlarmVO alarmVO);
	public String getReceiveMemId(String frcsOfldcNo);
	public String getMemFrcs(String frcsId);
	public List<FrcsOfficialDocVO> selectHdList(OwnerPaginationInfoVO<FrcsOfficialDocVO> pagingVOF);

}
