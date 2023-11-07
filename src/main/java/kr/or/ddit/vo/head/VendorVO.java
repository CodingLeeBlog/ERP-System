package kr.or.ddit.vo.head;

import java.util.List;

import lombok.Data;

@Data
public class VendorVO {

	private String vdCode;
	private String vdName;
	private String vdPhone;
	private String vdPost;
	private String vdAdd1;
	private String vdAdd2;
	private String vdManager;
	private String vdEmail;
	private String vdCategory;


	private String hdmaxQy;
	private String hdremainQy;
	private String hdforwardPrice;
	private String hdrtrcvPrice;
	private String hdprodLifestartday;
	private String hdprodLifeendday;
	
	private String vdprodCd;
	private String vdprodName;
	private String vdmaxQy;
	private String vdremainQy;
	private String vdforwardPrice;
	private String vdrtrcvPrice;
	private String vdprodLifestartday;
	private String vdprodLifeendday;
	private String vdEtc;
	

	
	private String result;
	private List<HeadInventoryVO> headInventoryList;
//	private List<VendorInventoryVO> vendorInventoryList;
	private int rnum;
	private int startRow;		// 시작 row
	private int endRow;			// 끝 row
	private boolean success;
	
	private String searchVendor;
	private String searchCategory;
}