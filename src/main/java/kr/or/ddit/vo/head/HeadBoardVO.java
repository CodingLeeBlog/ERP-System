package kr.or.ddit.vo.head;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class HeadBoardVO {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String tableName;
	private Date boardRegdate;
	private int boardHit;
	//페이징 처리 시 활용
	private int rnum;
	//뷰의 테이블에서 순번으로 활용
	private int rnum2;
	
	private Integer[] delNoticeNo;
	private MultipartFile[] boFile;
	private List<AttachVO> noticeFileList;
	
	// form.jsp에서 넘어와 boFile에 바인딩되는 데이터를  
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> noticeFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				
				AttachVO attachVO = new AttachVO(item);
				noticeFileList.add(attachVO);
			}
			this.noticeFileList = noticeFileList;
		}
	}
}
