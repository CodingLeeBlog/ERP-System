package kr.or.ddit.vo.owner;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class FrcsMenuIngredientVO {

	private String menuCd; // 메뉴코드
	private String vdprodCd;	// 제품코드
	private int ingreQy;	// 제품사용수량
	private int menuQy; 	// 메뉴주문수량 
	private int hdforwardPrice;	// 출고 당시 단가 > 출고 테이블에 넣으려고
	
	private String frcsId;
	private Date selngDate;
	private Timestamp selngDate2;
	
}
