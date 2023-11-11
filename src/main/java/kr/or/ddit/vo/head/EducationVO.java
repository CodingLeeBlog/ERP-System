package kr.or.ddit.vo.head;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class EducationVO {
	
	private String frcsId;
	private String frcsName;
	private String eduContent;
	private Date eduSdate;
	private Date eduFdate;
	private String eduFnshyn;
	private String eduRemark;
	private String tableName;
	private int rnum;
	
	private Integer[] delBoardNo;
	private MultipartFile[] boFile;
	private List<AttachVO> educationFileList;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> educationFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				AttachVO attachVO = new AttachVO(item);
				educationFileList.add(attachVO);
			}
			this.educationFileList = educationFileList;
		}
	}
	
}

