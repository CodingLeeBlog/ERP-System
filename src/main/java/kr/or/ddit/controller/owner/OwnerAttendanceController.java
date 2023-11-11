package kr.or.ddit.controller.owner;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsAttendance;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsAttendanceManagementVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerAttendanceController {

	@Inject
	private IFrcsAttendance service;
	
	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	//main
	@RequestMapping(value="/attendance.do")
	public String ownerAttendanceCal(FrcsAttendanceManagementVO frcsAttendanceManagementVO, Model model, FrcsEmployeeVO frcsEmployeeVO) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
	    frcsAttendanceManagementVO.setFrcsId(frcsId); // 로그인한 사용자 설정
	    
	    List<FrcsEmployeeVO> memFrcsList = service.getMemFrcsList(frcsId);
	    
	    model.addAttribute("memFrcsList", memFrcsList);
		
		
		return "owner/attendance/calendar";
	}
	
	// 이벤트 조회
	@GetMapping("/attendanceSelect.do")
	@ResponseBody
	public List<Map<String, Object>> showAllEventInUpdate(FrcsAttendanceManagementVO frcsAttendanceManagementVO,
			Model model, FrcsEmployeeVO frcsEmployeeVO) throws Exception{
		
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Object> hash = new HashMap<>();
		
		String frcsId = idService.getFrcsId();
	    frcsAttendanceManagementVO.setFrcsId(frcsId); // 로그인한 사용자 설정
	    
		List<FrcsAttendanceManagementVO> list = service.findAll(frcsId); //전체 조회
		
			
		for(FrcsAttendanceManagementVO attendance : list) {
			hash.put("id", attendance.getAtndNo());
			hash.put("title", attendance.getAtndTtl() + " " + attendance.getFrcsEmpNm());
			hash.put("start", attendance.getAtndStymd());
			hash.put("end", attendance.getAtndEnymd());
			
			hash.put("backgroundColor", attendance.getAtndColor()); //색상
			
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		log.info("jsonArrCheck:{}",jsonArr);
		return jsonArr;
	}
	
	// 이벤트 등록
	@PostMapping("/attendanceInsert.do")
	@ResponseBody
	public String addEvent(@RequestBody Map<String, Object> param,
			Model model, FrcsEmployeeVO frcsEmployeeVO) {
		
		
		String frcsId = idService.getFrcsId();
		List<FrcsEmployeeVO> memFrcsList = service.getMemFrcsList(frcsId);
		
		model.addAttribute("memFrcsList", memFrcsList);

		//calendar 사용 시 필요한 형식
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);

		 String eventName = param.get("title").toString();
		 String startDateString = param.get("start").toString();
    	 String endDateString = param.get("end").toString();
    	 String frcsEmpCd = param.get("frcsEmpCd").toString();
    	 String atndColor = param.get("atndColor").toString();
	           
           LocalDateTime startDateUTC = LocalDateTime.parse(startDateString, dateTimeFormatter);
           LocalDateTime endDateUTC = LocalDateTime.parse(endDateString, dateTimeFormatter);
           
           LocalDateTime startDate = startDateUTC.plusHours(9);
           LocalDateTime endDate = endDateUTC.plusHours(9);
           
           FrcsAttendanceManagementVO frcsAttendanceManagementVO = new FrcsAttendanceManagementVO();
           

           frcsAttendanceManagementVO.setAtndTtl(eventName);
           frcsAttendanceManagementVO.setAtndStymd(String.valueOf(startDate));
           frcsAttendanceManagementVO.setAtndEnymd(String.valueOf(endDate));
           frcsAttendanceManagementVO.setFrcsEmpCd(frcsEmpCd);
           frcsAttendanceManagementVO.setFrcsId(frcsId);
           frcsAttendanceManagementVO.setAtndColor(atndColor);

        this.service.insert(frcsAttendanceManagementVO);
            
        
        return "success";
	}
	
	// 이벤트 삭제
	@DeleteMapping("/attendanceDelete.do")
	@ResponseBody
	public String deleteEvent(@RequestBody List<Map<String, Object>> param) {
		
		int result = 0;
		
	  DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		
		for(Map<String, Object> list : param) {
		String startDateString =  (String)list.get("start");
						
		LocalDateTime startDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
		
		result = this.service.delete(String.valueOf(startDate));
		}
		
		if(result>0) {
			return "owner/attendance.do";	
		}else {
			return "owner/attendanceUpdate.do";
		}
	}
	
	// 이벤트 수정
	@PatchMapping("/attendanceUpdate.do")
	@ResponseBody
	public String modifyEvent(@RequestBody List<Map<String, Object>>param) {
		String frcsId = idService.getFrcsId();
		
		int result = 0;
		
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		
		for(Map<String, Object> list : param) {
			
			String atndNo = (String) list.get("atndNo"); //근태번호
        	String frcsEmpCd = (String) list.get("frcsEmpCd"); //직원코드
        	String atndTy = (String) list.get("atndTy");  //근태유형
			String eventName = (String)list.get("title"); // 이름 받아오기
			String startDateString = (String)list.get("start"); // 시작 시간
			String endDateString = (String)list.get("end"); // 끝나는 시간
			
			String oldStartString = (String)list.get("oldStart");
			String oldEndString = (String)list.get("oldEnd");
			
			LocalDateTime modifiedStartDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime modifiedEndDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
            LocalDateTime oldStart = LocalDateTime.parse(oldStartString, dateTimeFormatter);
            LocalDateTime oldEnd = LocalDateTime.parse(oldEndString, dateTimeFormatter);
            
            FrcsAttendanceManagementVO frcsAttendanceManagementVO = new FrcsAttendanceManagementVO();
            frcsAttendanceManagementVO.setAtndTtl(eventName);
            frcsAttendanceManagementVO.setAtndStymd(String.valueOf(modifiedStartDate));
            frcsAttendanceManagementVO.setAtndEnymd(String.valueOf(modifiedEndDate));
            frcsAttendanceManagementVO.setOldAtndStymd(String.valueOf(oldStart));
            frcsAttendanceManagementVO.setOldAtndEnymd(String.valueOf(oldEnd));
            
            frcsAttendanceManagementVO.setAtndNo(atndNo);
            frcsAttendanceManagementVO.setFrcsEmpCd(frcsEmpCd);
            frcsAttendanceManagementVO.setFrcsId(frcsId);
            frcsAttendanceManagementVO.setAtndTy(atndTy);
            
           result =  this.service.update(frcsAttendanceManagementVO);
		}
		
		if(result>0) {
			return "owner/attendance.do";	
		}else {
			return "owner/attendanceUpdate.do";
		}
	}
}