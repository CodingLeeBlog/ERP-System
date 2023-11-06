package kr.or.ddit.vo.head;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class ProposalVO {
	
	private int tableNo;
	private String memId;
	private String field;
	private String boardTitle;
	private String boardContent;
	private String boardState;
	private int boardCount;
	private Date boardRegdate;
	private int rnum;
	private int rnum2;
	
	private String ansId;
	private String ansContent;
	private Date ansDate;
	private String ansState;

	private Integer[] delBoardNo;
	private MultipartFile[] boFile;
	private List<AttachVO> proposalFileList;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> proposalFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				AttachVO attachVO = new AttachVO(item);
				proposalFileList.add(attachVO);
			}
			this.proposalFileList = proposalFileList;
		}
	}
	
}
