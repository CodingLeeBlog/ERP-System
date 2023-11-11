package kr.or.ddit.vo.head;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class MenuVO {
	
	public String menuCd;
	public String menuName;
	public int menuPrice;
	public String menuDes;
	public String menuCg;
	public String menuState;
	public Date menuRsdate;
	public Date menuDeldate;
	public String tableName;
	private int rnum;
	
	private Integer[] delBoardNo;
	private MultipartFile[] boFile;
	private List<AttachVO> menuFileList;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> menuFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				AttachVO attachVO = new AttachVO(item);
				menuFileList.add(attachVO);
			}
			this.menuFileList = menuFileList;
		}
	}
	
}
