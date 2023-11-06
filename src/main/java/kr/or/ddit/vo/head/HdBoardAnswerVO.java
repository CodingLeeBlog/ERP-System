package kr.or.ddit.vo.head;

import java.util.Date;

import lombok.Data;

@Data
public class HdBoardAnswerVO {

	private int tableNo;
	private String memId;
	private Date ansDate;
	private String ansId;
	private String ansState;
	private String ansContent;
	
}
