package kr.or.ddit.vo.owner;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FrcsOrderVO {

	private String frcsOrderNo;
	private Date frcsOrderDate;
	private int frcsOrderAmt;
	private String frcsOrderConfm;
	private Date frcsOrderConfmDate;
	private String frcsOrderReturn;
	private String autoOrderNo;
	private String frcsId;
	private String frcsOrderName;

	public List<FrcsOrderDetailVO> orderDetailList;
}
