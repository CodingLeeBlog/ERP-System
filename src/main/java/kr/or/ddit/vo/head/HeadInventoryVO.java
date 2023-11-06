package kr.or.ddit.vo.head;

import lombok.Data;

@Data
public class HeadInventoryVO {
	private String vdprodCd;
	private String vdprodName;
	private String hdmaxQy;
	private String hdremainQy;
	private String hdforwardPrice;
	private String hdrtrcvPrice;
	private String vdCode;
	
	private String vdremainQy;
	private String vdforwardPrice;
	private String vdprodLifestartday;
	private String vdprodLifeendday;
}
