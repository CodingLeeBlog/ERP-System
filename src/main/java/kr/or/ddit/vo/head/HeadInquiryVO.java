package kr.or.ddit.vo.head;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class HeadInquiryVO {
	private String inqryNo;
	private String frcsId;
	private String inqryTtl;
	private String inqryCn;
	private Date inqryYmd;
	private String inqryYn;
	private String tableName;
	
	private String ansContent;
	private Date ansRegdate;
	private String ansId;                                                                                                                                                                                                                                                                                                                                                                                                                                
	
	private Integer[] delInqNo;
	private MultipartFile[] boFile;
	private List<AttachVO> inqFileList;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> inqFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				
				AttachVO attachVO = new AttachVO(item);
				inqFileList.add(attachVO);
			}
			this.inqFileList = inqFileList;
		}
	}
}
