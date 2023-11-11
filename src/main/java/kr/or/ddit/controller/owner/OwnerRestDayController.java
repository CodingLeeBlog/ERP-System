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
import kr.or.ddit.service.owner.IFrcsRestDay;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsAttendanceManagementVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;
import kr.or.ddit.vo.owner.FrcsRestDayVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerRestDayController {

	@Inject
	private IFrcsRestDay service;
	
	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	//main
	@RequestMapping(value="/restDay.do")
	public String ownerAttendanceCal(FrcsRestDayVO frcsRestDayVO, Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		frcsRestDayVO.setFrcsId(frcsId); // 로그인한 사용자 설정
	    
		return "owner/info/daysCalendar";
	}
	
	// 이벤트 조회
	@GetMapping("/restDaySelect.do")
	@ResponseBody
	public List<Map<String, Object>> showAllEventInUpdate(FrcsRestDayVO frcsRestDayVO,
			Model model) throws Exception{
		
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Object> hash = new HashMap<>();
		
		String frcsId = idService.getFrcsId();
		frcsRestDayVO.setFrcsId(frcsId); // 로그인한 사용자 설정
	    
		List<FrcsRestDayVO> list = service.findAll(frcsId); //전체 조회
		
			
		for(FrcsRestDayVO attendance : list) {
			hash.put("id", attendance.getRstdeNo());
			hash.put("title", attendance.getRstdeTtl());
			hash.put("start", attendance.getRstdeStymd());
			hash.put("end", attendance.getRstdeEnymd());
			hash.put("backgroundColor", attendance.getRstdeColor()); //색상
			
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		log.info("jsonArrCheck:{}",jsonArr);
		return jsonArr;
	}
	
	// 이벤트 등록
	@PostMapping("/restDayInsert.do")
	@ResponseBody
	public String addEvent(@RequestBody Map<String, Object> param, Model model) {
		
		String frcsId = idService.getFrcsId();
		
		//calendar 사용 시 필요한 형식
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);

		 String eventName = param.get("title").toString();
		 String startDateString = param.get("start").toString();
    	 String endDateString = param.get("end").toString();
    	 String rstdeColor = param.get("rstdeColor").toString();
	           
           LocalDateTime startDateUTC = LocalDateTime.parse(startDateString, dateTimeFormatter);
           LocalDateTime endDateUTC = LocalDateTime.parse(endDateString, dateTimeFormatter);
           
           LocalDateTime startDate = startDateUTC.plusHours(9);
           LocalDateTime endDate = endDateUTC.plusHours(9);
           
           FrcsRestDayVO frcsRestDayVO = new FrcsRestDayVO();
           

           frcsRestDayVO.setRstdeTtl(eventName);
           frcsRestDayVO.setRstdeStymd(String.valueOf(startDate));
           frcsRestDayVO.setRstdeEnymd(String.valueOf(endDate));
           frcsRestDayVO.setFrcsId(frcsId);
           frcsRestDayVO.setRstdeColor(rstdeColor);

        this.service.insert(frcsRestDayVO);
        
        return "success";
	}
	
	// 이벤트 삭제
	@DeleteMapping("/restDayDelete.do")
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
			return "owner/restDay.do";	
		}else {
			return "owner/restDayUpdate.do";
		}
	}
	
	// 이벤트 수정
	@PatchMapping("/restDayUpdate.do")
	@ResponseBody
	public String modifyEvent(@RequestBody List<Map<String, Object>>param) {
		
		String frcsId = idService.getFrcsId();
		
		int result = 0;
		
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
		
		for(Map<String, Object> list : param) {
			
			String rstdeNo = (String) list.get("rstdeNo"); //근태번호
			String eventName = (String)list.get("rstdeTtl"); // 이름 받아오기
			String startDateString = (String)list.get("start"); // 시작 시간
			String endDateString = (String)list.get("end"); // 끝나는 시간
			
			String oldStartString = (String)list.get("oldStart");
			String oldEndString = (String)list.get("oldEnd");
			
			LocalDateTime modifiedStartDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime modifiedEndDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
            LocalDateTime oldStart = LocalDateTime.parse(oldStartString, dateTimeFormatter);
            LocalDateTime oldEnd = LocalDateTime.parse(oldEndString, dateTimeFormatter);
            
            FrcsRestDayVO frcsRestDayVO = new FrcsRestDayVO();
            frcsRestDayVO.setRstdeTtl(eventName);
            frcsRestDayVO.setRstdeStymd(String.valueOf(modifiedStartDate));
            frcsRestDayVO.setRstdeEnymd(String.valueOf(modifiedEndDate));
            frcsRestDayVO.setOldRstdeStymd(String.valueOf(oldStart));
            frcsRestDayVO.setOldRstdeEnymd(String.valueOf(oldEnd));
            
            frcsRestDayVO.setRstdeNo(rstdeNo);
            frcsRestDayVO.setFrcsId(frcsId);
            
           result =  this.service.update(frcsRestDayVO);
		}
		
		if(result>0) {
			return "owner/restDay.do";	
		}else {
			return "owner/restDayUpdate.do";
		}
	}
}