package kr.or.ddit.vo.owner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class FrcsOfficialDocVO {

	private String frcsOfldcNo;
	private String frcsOfldcSndpty;
	private String frcsOfldcRcvr;
	private String frcsOfldcTtl;
	private String frcsOfldcCn;
	private Date frcsOfldcDspymd;
	private Date frcsOfldcRecymd;
	private String tableName;
	
	private Integer[] delOfldcNo;
	private MultipartFile[] boFile;
	private List<AttachVO> ofldcFileList;
	
	// form.jsp에서 넘어와 boFile에 바인딩되는 데이터를  
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> ofldcFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				
				AttachVO attachVO = new AttachVO(item);
				ofldcFileList.add(attachVO);
			}
			this.ofldcFileList = ofldcFileList;
		}
	}
}
