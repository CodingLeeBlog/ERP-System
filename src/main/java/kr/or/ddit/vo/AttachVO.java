package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;


import org.apache.commons.io.FileUtils;
import lombok.Data;

@Data
public class AttachVO {
	private MultipartFile item;
	private Integer attachNo;
	private Integer fileNo;
	private String attachOrgname;
	private String attachSavename;
	private String tableName;
	private String tablePk;
	private String attachMime;
	private Long attachSize;
	private String thumbImg;
	private String attachFancysize;
	 
	public AttachVO() {}
	public AttachVO(MultipartFile item) {
		this.item = item;
		this.attachOrgname = item.getOriginalFilename();
		this.attachSize = item.getSize();
		this.attachMime = item.getContentType();
		
		// 파일 사이즈의 근사치를 얻어올수 있다.(KB, MB, GB인지 파악하기위해)
		this.attachFancysize = FileUtils.byteCountToDisplaySize(attachSize); 
	}
}
