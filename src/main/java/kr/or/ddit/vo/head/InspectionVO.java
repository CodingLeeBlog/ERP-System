package kr.or.ddit.vo.head;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class InspectionVO {

	private String frcsId;
	private String ipCode;
	private int ipStts;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ipDate;
	private String tableName;
	private String stEduFnshYn;
	private String frcsName;
	private int attachNo;
	private int rnum;
	
	private Integer[] delBoardNo;
	private MultipartFile[] boFile;
	private List<AttachVO> inspectionFileList;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> inspectionFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				AttachVO attachVO = new AttachVO(item);
				inspectionFileList.add(attachVO);
			}
			this.inspectionFileList = inspectionFileList;
		}
	}
}
