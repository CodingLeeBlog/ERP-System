package kr.or.ddit.vo.owner;

import java.util.Date;

import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class FrcsPublicDuesVO {
	private String duesPayde;
	private String frcsId;
	private int duesElcty;
	private int duesWater;
	private int duesGas;
	private int duesMtht;
	private Date duesDate;
	private String duesMthtYN;
	
} 	
