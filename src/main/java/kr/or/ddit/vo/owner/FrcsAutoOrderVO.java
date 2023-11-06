package kr.or.ddit.vo.owner;

import lombok.Data;

@Data
public class FrcsAutoOrderVO {

	private String autoorderNo;
	private int atorderStdrqy;
	private	int atorderQy;
	private String atorderAt;
	private String frcsId;
	private String vdprodCd;
	
	private String vdprodName;
	private int hdforwardPrice;
}
