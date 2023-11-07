package kr.or.ddit.vo.owner;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FrcsInventoryVO {

	private String frcsId;
	private String vdprodCd;
	private int invntryQy;
	private int proprtQy;
	private Date lastwrhousngDate;
	private String vdprodName;
	private int hdforwardPrice;
	private int dlivyQy;
	private int atorderQy;	// 자동발주
	
	private String frcsName;
	private String frcsAdd1;
}
