package kr.or.ddit.vo.head;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class DashboardVO {

	private String frcsId;
	private String frcsName;
	private String frcsTel;
	private int frcsorderAmt;
	private String frcsorderDate;
	
	private String frcsPost;
	private String frcsAdd1;
	private String frcsAdd2;
	private String frcsOpdate;
	
	//공문
	private String frcsOfldcNo;
	private String frcsOfldcSndpty;
	private String frcsOfldcRcvr;
	private String frcsOfldcTtl;
	private String frcsOfldcCn;
	private Date frcsOfldcDspymd;
	private Date frcsOfldcRecymd;
	private String tableName;
	
	//창업
	private int ownerId;
	private int ownerNo;
	private String ownerName;
	private String ownerPost;
	private String ownerAdd1;
	private String ownerAdd2;
	private String ownerArea;
	private String ownerDong;
	private String ownerInfocontent;
	private String ownerConst; //추후에 sql 계약완료 아닌사람으로 할지말지 결정
	private String ownerTelyn;
	private String ownerYn;
	private Date ownerRgdate;
	
	
	
	

	
}
