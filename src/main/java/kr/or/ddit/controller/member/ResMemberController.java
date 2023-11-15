package kr.or.ddit.controller.member;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.member.IMemberReviewService;
import kr.or.ddit.service.member.IMyCouponService;
import kr.or.ddit.service.owner.IFrcsMenuService;
import kr.or.ddit.service.owner.ISeatService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.member.MyCouponVO;
import kr.or.ddit.vo.member.ResVO;
import kr.or.ddit.vo.member.ReviewVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import kr.or.ddit.vo.owner.FrcsSeatVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/elly")
public class ResMemberController {

	@Inject
	private IFrcsMenuService menuService;
	
	@Inject
	private ISeatService seatService;
	
	@Inject
	private IMyCouponService mycouponService;
	
	@Inject
	private IMemberReviewService memberreviewService;
	
	/**
	 * 매장을 선택 후 예약 페이지 리턴 기능
	 * 
	 * @param memId
	 * @param frcsId
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/store/res.do", method = RequestMethod.GET)
	public String mapForm(String memId, String frcsId, String frcsName, Model model) {
		
		// 마른안주 메뉴 리스트 조회 기능
		List<FrcsMenuVO> dryfrcsMenuList = menuService.dryfrcsMenuList(frcsId);
		model.addAttribute("dryfrcsMenuList", dryfrcsMenuList);

		// 튀김안주 메뉴 리스트 조회 기능
		List<FrcsMenuVO> friedfrcsMenuList = menuService.friedfrcsMenuList(frcsId);
		model.addAttribute("friedfrcsMenuList", friedfrcsMenuList);
		
		// 식사안주 메뉴 리스트 조회 기능
		List<FrcsMenuVO> mainfrcsMenuList = menuService.mainfrcsMenuList(frcsId);
		model.addAttribute("mainfrcsMenuList", mainfrcsMenuList);
		
		// 주류 메뉴 리스트 조회 기능
		List<FrcsMenuVO> drinkfrcsMenuList = menuService.drinkfrcsMenuList(frcsId);
		model.addAttribute("drinkfrcsMenuList", drinkfrcsMenuList);
		
		// 좌석 리스트 조회 기능
		List<FrcsSeatVO> frcsSeatList = seatService.frcsSeatList(frcsId);
		model.addAttribute("seatlist", frcsSeatList);
		model.addAttribute("frcsId", frcsId);
		model.addAttribute("frcsName", frcsName);
		
		// 쿠폰 리스트 조회 기능
		List<MyCouponVO> couponList = mycouponService.myCouponList(memId);
		int mycouponCnt = couponList.size();
		model.addAttribute("couponList", couponList);
		model.addAttribute("mycouponCnt", mycouponCnt);
		
		return "mainhome/store/resForm";
	}
	
	/**
	 * 예약 페이지 회원 예약 기능
	 * 
	 * @param resVO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/store/res.do", method = RequestMethod.POST)
	public ResponseEntity<ServiceResult> frcsOrder(@RequestBody ResVO resVO, AlarmVO alarmVO) {

		ServiceResult result = menuService.resRegister(resVO, alarmVO);
	    
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	/**
	 * 매장 페이지에서 리뷰 등록 기능
	 * 예약을 했을 경우 리뷰 버튼이 생기고 예약을 안 했을 경우 기존 예약 버튼 생성
	 * 
	 * @param ra
	 * @param alarmVO
	 * @param reviewVO
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/store/review.do")
	public ResponseEntity<ServiceResult> reviewSuccess(
			@RequestBody ReviewVO reviewVO, AlarmVO alarmVO, ResVO resVO, Model model
			) {
		
		ServiceResult result = memberreviewService.create(reviewVO, resVO, alarmVO);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	/**
	 * 비동기처리로 인한 삭제
	 * 매장 페이지에서 리뷰 등록 기능
	 * 예약을 했을 경우 리뷰 버튼이 생기고 예약을 안 했을 경우 기존 예약 버튼 생성
	 * 
	 * @param ra
	 * @param alarmVO
	 * @param reviewVO
	 * @param model
	 * @return
	 */
//	@RequestMapping(value = "/store/review.do" , method = RequestMethod.POST)
//	public String reviewSuccess(
//			RedirectAttributes ra,
//			AlarmVO alarmVO, ReviewVO reviewVO, ResVO resVO, Model model
//			) {
//		
//		String goPage = "";
//		
//		Map<String, String> errors = new HashMap<String, String>();
//		
//		if(StringUtils.isBlank(reviewVO.getReviewContent())) {
//			errors.put("reviewText", "리뷰를 입력해주세요");
//		}
//		if(errors.size() > 0) {
//			model.addAttribute("errors", errors);
//			model.addAttribute("review", reviewVO);
//			goPage = "";
//		}else {
//			ServiceResult result = memberreviewService.create(reviewVO, resVO, alarmVO);
//			if(result.equals(ServiceResult.OK)) {
//				ra.addFlashAttribute("message", "리뷰등록이 완료되였습니다!");
//				goPage = "redirect:/elly/mypage/review.do?memId=" + reviewVO.getMemId();
//			}else {
//				model.addAttribute("bodyText", "register-page");
//				model.addAttribute("message", "서버 에러, 다시 시도해주세요!");
//				model.addAttribute("review", reviewVO);
//				goPage = "";
//			}
//			
//		}
//		
//		return goPage;
//	}
	
//	@PreAuthorize("hasRole('ROLE_MEMBER')")
//	@ResponseBody
//	@RequestMapping(value = "/store/mycoupon.do")
//	public ResponseEntity<List<MyCouponVO>> myCouponList(@RequestBody Map <String,String> map){
//		
//		List<MyCouponVO> result = new ArrayList<>();
//		
//		String memId = map.get("memId").toString();
//
//		result = mycouponService.myCouponList(memId);
//		
//		return new ResponseEntity<List<MyCouponVO>>(result, HttpStatus.OK);
//	}
	
	
	//일반 홈페이지 알림 시작
	@ResponseBody
	@RequestMapping(value = "/selectAlarm.do", method=  RequestMethod.POST)
	public List<AlarmVO> selectAlarmList(@RequestBody Map<String, String> map) {
		String memId = map.get("memId").toString();
		List<AlarmVO> alarm = memberreviewService.selectAlarmList(memId);
		return alarm;
		
	}
	
	//리뷰확인시 update 처리로 db에 'Y'로 변경
	@RequestMapping(value = "/updateAlarm.do")
	public String updateAlarm(int alarmNo) {
		memberreviewService.updateAlarm(alarmNo);
		return "redirect:/elly/main.do";
	}
	
	
	//1개 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteAlarm.do", method = RequestMethod.POST)
		public ResponseEntity<ServiceResult> deleteAlarm(@RequestBody Map<String, String> map) {
		int alarmNo = Integer.parseInt(map.get("alarmNo").toString());
		ServiceResult result = memberreviewService.deleteAlarm(alarmNo);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	//전체 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteclearAllAlarm.do", method = RequestMethod.POST)
		public ResponseEntity<ServiceResult> deleteclearAllAlarm(@RequestBody Map<String, String> map) {
		String memId = map.get("memId").toString();
		ServiceResult result = memberreviewService.deleteclearAllAlarm(memId);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}

		
}
