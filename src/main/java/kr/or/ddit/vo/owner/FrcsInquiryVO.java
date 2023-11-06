package kr.or.ddit.vo.owner;

import java.util.Date;

import lombok.Data;

@Data
public class FrcsInquiryVO {
	private String inqryNo;
	private String frcsId;
	private String inqryTtl;
	private String inqryCn;
	private Date inqryYmd;
	private String inqryYn;
	private String tableName;
}
