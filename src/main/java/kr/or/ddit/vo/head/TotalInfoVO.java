package kr.or.ddit.vo.head;

import java.util.Date;
import java.util.List;

import kr.or.ddit.vo.member.MemberAuthVO;
import lombok.Data;

@Data
public class TotalInfoVO {
	
	private String frcsId;
	private String frcsName;
	private String frcsState;
	private String frcsTel;
	private Date frcsStdate;
	private Date frcsEnddate;
	private String frcsPost;
	private String frcsAdd1;
	private String frcsAdd2;
	private String frcsSttime;
	private String frcsEndtime;
	private Date frcsCdate;
	private Date frcsInsdate;
	private Date frcsInedate;
	private Date frcsOpdate;
	private String frOpdate;
	private double frcsXmap;
	private double frcsYmap;
	private int frcsStar;
	private int frcsPsncpa;
	
	private int ipStts;
	private Date ipDate;
	private String tableName;
	private String stEduFnshYn;
	private int rnum;
	
	private String memId;
	private String memPw;
	private String memName;
	private Date memBir;
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
