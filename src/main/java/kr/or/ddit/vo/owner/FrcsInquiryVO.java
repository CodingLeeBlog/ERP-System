package kr.or.ddit.vo.owner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class FrcsInquiryVO {
	private String inqryNo;
	private String frcsId;
	private String inqryTtl;
	private String inqryCn;
	private Date inqryYmd;
	private String inqryYn;
	private String tableName;
	
	private Integer[] delInqNo;
	private MultipartFile[] boFile;
	private List<AttachVO> inqFileList;
	
	// form.jsp에서 넘어와 boFile에 바인딩되는 데이터를  
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
