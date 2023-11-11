package kr.or.ddit.vo.head;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class OfficeLetterVO {

	private int hdLtno;
	private String hdLttitle;
	private String hdLtsender;
	private String hdLtcontent;
	private Date hdLtsdate;
	private Date hdLtrdate;
	private String tableName;
	private String hdLtstate;
	private int rnum;
	
	private Integer[] delBoardNo;
	private MultipartFile[] boFile;
	private List<AttachVO> officeLetterFileList;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> officeLetterFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				AttachVO attachVO = new AttachVO(item);
				officeLetterFileList.add(attachVO);
			}
			this.officeLetterFileList = officeLetterFileList;
		}
	}

}
