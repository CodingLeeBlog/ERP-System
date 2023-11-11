package kr.or.ddit.controller.owner;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.service.owner.IFrcsReviewService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInquiryVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import kr.or.ddit.vo.owner.FrcsReviewVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerReviewController {

	@Inject
	private IFrcsReviewService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/review.do", method = RequestMethod.GET )
	public String ownerReviewList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "content") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		OwnerPaginationInfoVO<FrcsReviewVO> pagingVO = new OwnerPaginationInfoVO<FrcsReviewVO>();
		
		// 검색이 이루어지면 아래가 실행됨
		if(StringUtils.isNotBlank(searchWord)) { //" "이거나 공백문자"" 혹은 null이면 true를 반환
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setFrcsId(frcsId);
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectReviewCount(pagingVO);//총게시글수
		
		pagingVO.setTotalRecord(totalRecord); // totalPage 결정
		List<FrcsReviewVO> reviewList = service.selectReviewList(pagingVO);
		pagingVO.setDataList(reviewList);
		
		model.addAttribute("pagingVO", pagingVO);
		
//		List<FrcsReviewVO> frcsReviewList = service.frcsReviewList(frcsId);
//		model.addAttribute("reviewList", frcsReviewList);
		
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
	
	//가맹점 알람
	@ResponseBody
	@RequestMapping(value = "/selectAlarm.do", method = RequestMethod.POST)
	public List<AlarmVO> selectAlarmList(@RequestBody Map<String, String> map) {

		String memId = map.get("memId").toString();
		List<AlarmVO> alarm = service.selectAlarmList(memId);
		return alarm;
		
	}
	
	@RequestMapping(value = "/updateAlarm.do")
	public String updateAlarm(int alarmNo) {
		log.info("updateAlarm에서 넘어오는지 확인 >>>>>>>>>>>>>>>>>> "+alarmNo);
		service.updateAlarm(alarmNo);
		return "redirect:/owner/home.do";
	}
	
	//가맹점 알람 1개 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteAlarm.do", method = RequestMethod.POST)
		public ResponseEntity<ServiceResult> deleteAlarm(@RequestBody Map<String, String> map) {

		int alarmNo = Integer.parseInt(map.get("alarmNo").toString());
			
		ServiceResult result = service.deleteAlarm(alarmNo);
		    
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
		}
	
	//가맹점 알람 전체 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteclearAllAlarm.do", method = RequestMethod.POST)
		public ResponseEntity<ServiceResult> deleteclearAllAlarm(@RequestBody Map<String, String> map) {
		
		String memId = map.get("memId").toString();
		
		ServiceResult result = service.deleteclearAllAlarm(memId);
		    
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	// 리뷰차트 페이지
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/reviewChart.do", method = RequestMethod.GET )
	public String ownerReviewChart() {
		return "owner/review/reviewChart";
	}
		
	
}
