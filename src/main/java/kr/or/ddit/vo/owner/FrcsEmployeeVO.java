package kr.or.ddit.vo.owner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class FrcsEmployeeVO {
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private String frcsEmpCd;
	private String frcsId;
	private String frcsEmpNm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date frcsEmpBrdt;
	private String frcsEmpTelno;
	private int frcsEmpSalary;
	private String frcsEmpRspofc;
	private String frcsEmpYn;
	private String tableName;
//	private String frcsEmpProfileimg;
//	private MultipartFile frcsEmpProfileimg;
	private String empImg1;
	private String empImg2;
	private String empImg3;
	private String empImg4;
	private MultipartFile boFile1;
	private MultipartFile boFile2;
	private MultipartFile boFile3;
	private MultipartFile boFile4;
	
//	private MultipartFile imgFile;
	
//	private Integer[] delEmpNo;
//	private MultipartFile[] boFile;
	private List<AttachVO> empFileList;
	
	// 직원파일을 한번에 배열로 받아서 0번째는 프로필, 1번째는 보건증, 등등 
	// jsp에서 넘어와 boFile에 바인딩되는 데이터를  
	public void setBoFile(MultipartFile[] boFile) {
//		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> empFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				
				AttachVO attachVO = new AttachVO(item);
				empFileList.add(attachVO);
			}
//			this.empFileList = empFileList;
		}
	}
}
