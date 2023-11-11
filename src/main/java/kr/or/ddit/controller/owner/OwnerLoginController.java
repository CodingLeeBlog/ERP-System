package kr.or.ddit.controller.owner;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.or.ddit.service.head.IOfficeService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.owner.IFrcsBillService;
import kr.or.ddit.service.owner.IFrcsDailySaleService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsInquiryService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.service.owner.IFrcsOfficialDocService;
import kr.or.ddit.service.owner.IFrcsOperationProfitService;
import kr.or.ddit.service.owner.IFrcsReservationService;
import kr.or.ddit.service.owner.IFrcsReviewService;
import kr.or.ddit.service.owner.IFrcsTradingService;
import kr.or.ddit.vo.head.MenuVO;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.FrcsReviewVO;
import kr.or.ddit.vo.owner.OperationProfitVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerLoginController {

	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@Inject
	private IFrcsReviewService reviewService;
	
	@Inject
	private IFrcsReservationService resvService;
	
	@Inject
	private IOfficeService officeService;
	
	@Inject
	private IFrcsTradingService tradService;
	
	@Inject
	private IFrcsBillService billService;
	
	@Inject
	private IFrcsOperationProfitService operService;
	
	@Inject
	private IFrcsDailySaleService dailyService;

	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/home.do", method= RequestMethod.GET)
	public String ownermainForm(Model model) {
		
		//헤더 상단 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		// 컨텐트 환영합니다 영역
		FranchiseVO frcs = myPageService.detail(frcsId);
		model.addAttribute("frcs", frcs);
		
		// 금일 예약 현황
		int resvCount = resvService.selectCount(frcsId);
		model.addAttribute("resvCount", resvCount);
		
		// 새로운 리뷰(답변하지 않은 리뷰)
		int reviewCount = reviewService.selectCount(frcsId);
		model.addAttribute("reviewCount", reviewCount);
		
		// 금일 받은 트레이딩 요청
		int tradCnt = tradService.selectCount(frcsId);
		model.addAttribute("tradCnt", tradCnt);
		
		// 금일 받은 공문
		int headDocCount = officeService.selectCount(frcsId);
		model.addAttribute("headDocCount", headDocCount);
		
		// 공과금 차트
		// 내 가맹점 평균 통계 가져오기
		FrcsPublicDuesVO average = billService.average(frcsId);
		// 전체 가맹점 평균 통계 가져오기
		FrcsPublicDuesVO totalAverage = billService.totalAverage();
		model.addAttribute("totalAverage",totalAverage);
		model.addAttribute("average",average);
      
      // 순이익 통계
      List<OperationProfitVO> monthsList = operService.getOperationProfitChart(frcsId);
      model.addAttribute("monthsList",monthsList);
      model.addAttribute("frcsId",frcsId);
      
      // 인기 메뉴 차트
      Gson gson = new Gson();
      List<FrcsDailySalesVO> popularMenu = dailyService.getPopularMenu(frcsId);
      String popularMenuList = gson.toJson(popularMenu);
      model.addAttribute("popularMenuList", popularMenuList);
      
      

      return "owner/main/home";
	}
}
