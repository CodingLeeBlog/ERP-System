package kr.or.ddit.vo.owner;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.AttachVO;
import lombok.Data;

@Data
public class OwnerVO {
	private int ownerId;
	private int ownerNo;
	private String ownerName;
	private String ownerBir;
	private String ownerTel;
	private String ownerEmail;
	private String ownerPost;
	private String ownerAdd1;
	private String ownerAdd2;
	private String ownerArea;
	private String ownerDong;
	private String ownerMoney;
	private String ownerBuilding;
	private String ownerBuildingadd;
	private String ownerExp;
	private String ownerHopetime;
	private String ownerInfocontent;
	private String ownerContentdetail;
	private String ownerConst;
	private String ownerTelyn;
	private String ownerYn;
	private Date ownerRgdate;
	private String tableName;
	private int rnum;
	
	private Integer[] delBoardNo;
	private MultipartFile[] boFile;
	private List<AttachVO> counselFileList;
	
	public void setBoFile(MultipartFile[] boFile) {
		this.boFile = boFile;
		if(boFile != null) {
			List<AttachVO> counselFileList = new ArrayList<AttachVO>();
			for(MultipartFile item : boFile) {
				if(StringUtils.isBlank(item.getOriginalFilename())) {
					continue;
				}
				AttachVO attachVO = new AttachVO(item);
				counselFileList.add(attachVO);
			}
			this.counselFileList = counselFileList;
		}
	}
	
}
