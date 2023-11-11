package kr.or.ddit.mapper.owner;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;

public interface FrcsEmployeeMapper {

	public List<FrcsEmployeeVO> frcsEmpList(String frcsId);
	public int frcsEmpInsert(FrcsEmployeeVO frcsEmpVO);
	public int empDelete(String frcsEmpCd);
	public int empUpdate(FrcsEmployeeVO frcsEmpVO);
	public void insertEmpFile(AttachVO attachVO);
	public AttachVO selectFileInfo(int attachNo);
	public AttachVO selectEmpFile(Integer integer);
	public void deleteEmpFile(Integer integer);
	public void deleteEmpFileCustom(@Param("tablePk") String tablePk, @Param("order") int order);
	public FrcsEmployeeVO selectEmp(String frcsId);
	public void deleteEmpFileByEmpCd(String tablePk);
	public List<FrcsEmployeeVO> frcsEmpFileList(String frcsId);

}
