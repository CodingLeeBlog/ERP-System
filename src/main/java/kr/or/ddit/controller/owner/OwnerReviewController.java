package kr.or.ddit.controller.owner;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsReviewService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import kr.or.ddit.vo.owner.FrcsReviewVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerReviewController {

	@Inject
	private IFrcsReviewService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/review.do", method = RequestMethod.GET )
	public String ownerReviewList(String reviewNo, Model model) {
		String frcsId = idService.getFrcsId();
		List<FrcsReviewVO> frcsReviewList = service.frcsReviewList(frcsId);
		model.addAttribute("reviewList", frcsReviewList);
		return "owner/review/reviewList";
	}
	
	@RequestMapping(value = "/reviewAnsInsert.do", method = RequestMethod.POST)
	public String ownerReviewAnsInsert(
			RedirectAttributes ra,
			FrcsReviewVO frcsReviewVO, Model model, AlarmVO alarmVO) {
		String goPage = "";
		String frcsId = idService.getFrcsId();
		frcsReviewVO.setFrcsId(frcsId); //로그인한 사용자 설정
		ServiceResult result = service.reviewAnsInsert(frcsReviewVO, alarmVO);
		if(result.equals(ServiceResult.OK)) {
			service.reviewYnUpdate(frcsReviewVO); // 리뷰 답변여부 Y로 업데이트!
			ra.addFlashAttribute("message", "답변 등록 완료!");
			goPage = "redirect:/owner/review.do";
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요.");
			goPage = "owner/review/reviewList";
		}
		
		return goPage;
	}
	
	@RequestMapping(value = "/reviewAnsUpdate.do", method = RequestMethod.POST)
	public String ownerReviewAnsUpdate(
			RedirectAttributes ra,
			FrcsReviewVO frcsReviewVO, Model model) {
		String goPage = "";
		ServiceResult result = service.reviewAnsUpdate(frcsReviewVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "답변 수정 완료!");
			goPage = "redirect:/owner/review.do";
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요.");
			goPage = "owner/review/reviewList";
		}
		
		return goPage;
	}
	
	// reviewNo가 pk니까 id검증할 필요는 없겠지?
	@ResponseBody
	@RequestMapping(value = "/reviewDelete.do", method = RequestMethod.POST)
	public  ResponseEntity<List<FrcsReviewVO>> ownerReviewDelete(
			@RequestBody List<FrcsReviewVO> reviewDelList,
			RedirectAttributes ra) {
		
		for(FrcsReviewVO frcsReviewVO : reviewDelList) {
			log.info("" + frcsReviewVO.getReviewNo());
			String reviewNo = frcsReviewVO.getReviewNo();
			ServiceResult result = service.reviewDelete(reviewNo);
			service.reviewAnsDelete(reviewNo);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
			}else {
				ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			}
		}
		
		return new ResponseEntity<List<FrcsReviewVO>>(HttpStatus.OK) ;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectAlarm.do", method = RequestMethod.POST)
	public List<AlarmVO> selectAlarm(@RequestBody Map<String, String> map) {

	    String memId = map.get("memId").toString();
		String frcsId = idService.getFrcsId();

	    int alarmCnt = service.selectAlarm(memId);

	    List<AlarmVO> alarm = service.selectAlarmList(frcsId);
	    if (alarm != null && alarm.size() > 0) {
	        alarm.get(0).setAlarmCnt(alarmCnt);
	    }
	    log.info("알람 개수  : >>>>>>>> " + alarmCnt);
	    return alarm;
	}
	
	@RequestMapping(value = "/updateAlarm.do")
	public String updateAlarm(int alarmNo) {
		log.info("updateAlarm에서 넘어오는지 확인 >>>>>>>>>>>>>>>>>> "+alarmNo);
		service.updateAlarm(alarmNo);
		return "redirect:/owner/home.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "/clearAllNotifications.do", method = RequestMethod.POST)
		public ResponseEntity<ServiceResult> clearAllNotifications(@RequestBody Map<String, String> map) {
		
		String frcsId = idService.getFrcsId();
			
		ServiceResult result = service.clearAllNotifications(frcsId);
		    
			return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
		
	
}
