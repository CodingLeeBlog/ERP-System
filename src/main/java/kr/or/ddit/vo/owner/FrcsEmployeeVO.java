package kr.or.ddit.vo.owner;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FrcsEmployeeVO {
//	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private String frcsEmpCd;
	private String frcsId;
	private String frcsEmpNm;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date frcsEmpBrdt;
	private String frcsEmpTelno;
	private int frcsEmpSalary;
	private String frcsEmpRspofc;
	private String frcsEmpYn;
	private String tableName;
	private String frcsEmpProfileimg;
	
}
