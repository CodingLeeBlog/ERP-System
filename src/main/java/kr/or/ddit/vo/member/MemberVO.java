package kr.or.ddit.vo.member;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String memId;
	private String memPw;
	private String memName;
	private String memBir;
	private String memTel;
	private String memEmail;
	private int memRescnt;
	private int memRevcnt;
	private String memGrade;
	private String memPost;
	private String memAdd1;
	private String memAdd2;
	private String memRole;
	private String memPosition;
	private Date memRegdate;
	private String enabled;
	private String ownerId;
	List<MemberAuthVO> authList;
}
