package kr.or.ddit.vo.owner;

import lombok.Data;

@Data
public class FrcsSeatVO {
	private String seatCd;
	private String frcsId;
	private int seatXmap;
	private int seatYmap;
	private String seatAngle; //float로 변경할지 고민해볼 것!
}
