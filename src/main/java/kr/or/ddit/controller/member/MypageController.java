package kr.or.ddit.controller.member;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

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
import kr.or.ddit.service.member.ICompliBoardService;
import kr.or.ddit.service.member.IMemberPayService;
import kr.or.ddit.service.member.IMemberReviewService;
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMyCouponService;
import kr.or.ddit.service.member.IMyResService;
import kr.or.ddit.vo.member.BoardVO;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.member.MyCouponVO;
import kr.or.ddit.vo.member.PaginationInfoVO;
import kr.or.ddit.vo.member.PayVO;
import kr.or.ddit.vo.member.ResVO;
import kr.or.ddit.vo.member.ReviewVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/elly")
public class MypageController {
	
	@Inject
	private ICompliBoardService compliboardService;
	
	@Inject
	private IMyResService myresService;
	
	@Inject
	private IMyCouponService mycouponService;
	
	@Inject
	private IMemberReviewService myreviewService;
	
	@Inject
	private IMemberService memberService;
	
	@Inject
	private IMemberPayService memberpayService;
	

	/**
	 * 회원페이지(Mypage) 메인화면
	 * 
	 * @param currentPage
	 * @param memId
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/mypage.do" , method = RequestMethod.GET)
	public String MypageForm(
			@RequestParam(name = "page", required = false, defaultValue = "1")int currentPage,
			String memId, Model model
			){
		
		PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<BoardVO>();
				
		pagingVO.setCurrentPage(currentPage);  
		int totalRecord = compliboardService.myBoardCount(pagingVO); //총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord); //totalPage 결정
		List<BoardVO> dataList = compliboardService.myBoardList(pagingVO);
		
		List<BoardVO> mydataList = new ArrayList<>();
		for(BoardVO board : dataList) {
			if(memId.equals(board.getMemId())) {
				mydataList.add(board);
			}
		}
		
		pagingVO.setDataList(mydataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		// 나의 예약 내역
		List<ResVO> resList = myresService.myResList(memId);
		int myresCnt = resList.size();
		model.addAttribute("resList", resList);
		model.addAttribute("myresCnt", myresCnt);
		
		// 나의 쿠폰 내역
		List<MyCouponVO> couponList = mycouponService.myCouponList(memId);
		int mycouponCnt = couponList.size();
		model.addAttribute("couponList", couponList);
		model.addAttribute("mycouponCnt", mycouponCnt);
		
		// 나의 리뷰 내역
		List<ReviewVO> reviewList = myreviewService.myReviewList(memId);
		int myreviewCnt = reviewList.size();
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("myreviewCnt", myreviewCnt);
		
		MemberVO memberVO = memberService.selectMember(memId);
		model.addAttribute("memberVO", memberVO);
		
		return "mypage/member/mypage/home";
	}
	
	/**
	 * 회원페이지(Mypage) 메인화면 게시판 페이지네이션 기능
	 * 
	 * @param currentPage
	 * @param searchStatus
	 * @param searchWord
	 * @param memId
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/mypage.do" , method = RequestMethod.POST)
	public String MypageSearch(
			@RequestParam(name = "page", required = false, defaultValue = "1")int currentPage,
			@RequestParam(required = false) String searchStatus,
			@RequestParam(required = false) String searchWord,
			String memId, Model model
			){
		
		PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<BoardVO>();
			
		
		if(StringUtils.isNotBlank(searchStatus)) {
			pagingVO.setSearchStatus(searchStatus);
			model.addAttribute("searchStatus", searchStatus);
		}
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);  
		int totalRecord = compliboardService.myBoardCount(pagingVO); //총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord); //totalPage 결정
		List<BoardVO> dataList = compliboardService.myBoardList(pagingVO);
		
		List<BoardVO> mydataList = new ArrayList<>();
		for(BoardVO board : dataList) {
			if(memId.equals(board.getMemId())) {
				mydataList.add(board);
			}
		}
		
		pagingVO.setDataList(mydataList);
		
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("pagingVO", pagingVO);
		
		// 나의 예약 내역
		List<ResVO> resList = myresService.myResList(memId);
		model.addAttribute("resList", resList);
		
		// 나의 쿠폰 내역
		List<MyCouponVO> couponList = mycouponService.myCouponList(memId);
		model.addAttribute("couponList", couponList);
		
		return "mypage/member/mypage/home";
	}
	
	/**
	 * 회원페이지(Mypage) Aside 회원 예약 게시판 조회 기능
	 * 
	 * @param memId 회원 정보 조회떄 사용할 변수 memId
	 * @param model 페이지 리턴시 jsp(view)에 전달할 데이터
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/mypage/res.do" , method = RequestMethod.GET)
	public String mypageResList(String memId, Model model){
		
		// 나의 예약 내역
		List<ResVO> resList = myresService.myResList(memId);
		int myresCnt = resList.size();
		model.addAttribute("resList", resList);
		model.addAttribute("myresCnt", myresCnt);
		
		// 나의 쿠폰 내역
		List<MyCouponVO> couponList = mycouponService.myCouponList(memId);
		int mycouponCnt = couponList.size();
		model.addAttribute("couponList", couponList);
		model.addAttribute("mycouponCnt", mycouponCnt);
		
		// 나의 리뷰 내역
		List<ReviewVO> reviewList = myreviewService.myReviewList(memId);
		int myreviewCnt = reviewList.size();
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("myreviewCnt", myreviewCnt);
		
		MemberVO memberVO = memberService.selectMember(memId);
		model.addAttribute("memberVO", memberVO);
		
		return "mypage/member/mypage/myresList";
	}
	
	/**
	 * 회원페이지(Mypage) Aside 회원 쿠폰 게시판 조회 기능
	 * 
	 * @param memId 회원 정보 조회떄 사용할 변수 memId
	 * @param model 페이지 리턴시 jsp(view)에 전달할 데이터
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/mypage/coupon.do" , method = RequestMethod.GET)
	public String mypageCouponList(String memId, Model model){
		
		// 나의 예약 내역
		List<ResVO> resList = myresService.myResList(memId);
		int myresCnt = resList.size();
		model.addAttribute("resList", resList);
		model.addAttribute("myresCnt", myresCnt);
		
		// 나의 쿠폰 내역
		List<MyCouponVO> couponList = mycouponService.myCouponList(memId);
		int mycouponCnt = couponList.size();
		model.addAttribute("couponList", couponList);
		model.addAttribute("mycouponCnt", mycouponCnt);

		// 나의 리뷰 내역
		List<ReviewVO> reviewList = myreviewService.myReviewList(memId);
		int myreviewCnt = reviewList.size();
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("myreviewCnt", myreviewCnt);
		
		MemberVO memberVO = memberService.selectMember(memId);
		model.addAttribute("memberVO", memberVO);
		
		return "mypage/member/mypage/mycouponList";
	}
	
	/**
	 * 회원페이지(Mypage) Aside 회원 리뷰 게시판 조회 기능
	 * 
	 * @param memId 회원 정보 조회떄 사용할 변수 memId
	 * @param model 페이지 리턴시 jsp(view)에 전달할 데이터
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/mypage/review.do" , method = RequestMethod.GET)
	public String mypageReviewList(String memId, Model model){
		
		// 나의 예약 내역
		List<ResVO> resList = myresService.myResList(memId);
		int myresCnt = resList.size();
		model.addAttribute("resList", resList);
		model.addAttribute("myresCnt", myresCnt);
		
		// 나의 쿠폰 내역
		List<MyCouponVO> couponList = mycouponService.myCouponList(memId);
		int mycouponCnt = couponList.size();
		model.addAttribute("couponList", couponList);
		model.addAttribute("mycouponCnt", mycouponCnt);
		
		// 나의 리뷰 내역
		List<ReviewVO> reviewList = myreviewService.myReviewList(memId);
		int myreviewCnt = reviewList.size();
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("myreviewCnt", myreviewCnt);
		
		MemberVO memberVO = memberService.selectMember(memId);
		model.addAttribute("memberVO", memberVO);
		
		return "mypage/member/mypage/myreviewList";
	}
	
	
	/**
	 * 회원페이지(Mypage) Aside 회원 게시판 조회 기능
	 * 
	 * @param memId 회원 정보 조회떄 사용할 변수 memId
	 * @param model 페이지 리턴시 jsp(view)에 전달할 데이터
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/mypage/update.do" , method = RequestMethod.GET)
	public String memberInfoUpdateForm(String memId, Model model){
		
		MemberVO memberVO = memberService.selectMember(memId);
		
		model.addAttribute("memberVO", memberVO);
		
		return "mainhome/register/myupdateForm";
	}
	
	
	/**
	 * 회원페이지(Mypage) 회원정보 수정 기능
	 * 
	 * @param ra
	 * @param memberVO 회원 정보를 담을 객체VO
	 * @param model	페이지 리턴시 jsp(view)에 전달할 데이터
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/mypage/update.do" , method = RequestMethod.POST)
	public String memberInfoUpdate(
			RedirectAttributes ra,
			MemberVO memberVO, Model model
			){
		
		String goPage = "";
				
		ServiceResult result = memberService.memberUpdate(memberVO);
		
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "회원 정보 변경이 완료되였습니다!");
			goPage = "redirect:/elly/mypage.do?memId=" + memberVO.getMemId();
		}else {
			model.addAttribute("bodyText", "register-page");
			model.addAttribute("message", "서버 에러, 다시 시도해주세요!");
			model.addAttribute("member", memberVO);
			goPage = "redirect:/elly/mypage/update.do";
		}
		
		return goPage;
	}
	
	/**
	 * 회원페이지(Mypage) Aside 회원 게시판 조회 기능
	 * 
	 * @param currentPage
	 * @param searchType
	 * @param searchStatus
	 * @param searchWord
	 * @param memId
	 * @param model 페이지 리턴시 jsp(view)에 전달할 데이터
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/mypage/board.do")
		public String boardList(
			@RequestParam(name = "page", required = false, defaultValue = "1")int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchStatus,
			@RequestParam(required = false) String searchWord,
			String memId, Model model
			){
			
			PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<BoardVO>();
					
			if(StringUtils.isNotBlank(searchStatus)) {
				pagingVO.setSearchStatus(searchStatus);
				model.addAttribute("searchStatus", searchStatus);
			}
			
			// 검색이 이뤄지면 아래가 실행됨
			if(StringUtils.isNotBlank(searchWord)) {
				pagingVO.setSearchType(searchType);
				pagingVO.setSearchWord(searchWord);
				model.addAttribute("searchType", searchType);
				model.addAttribute("searchWord", searchWord);
			}
			
			pagingVO.setCurrentPage(currentPage);  
			int totalRecord = compliboardService.myBoardCount(pagingVO); //총 게시글 수
			
			pagingVO.setTotalRecord(totalRecord); //totalPage 결정
			List<BoardVO> dataList = compliboardService.myBoardList(pagingVO);
			
			List<BoardVO> mydataList = new ArrayList<>();
			for(BoardVO board : dataList) {
				if(memId.equals(board.getMemId())) {
					mydataList.add(board);
				}
			}
			
			pagingVO.setDataList(mydataList);
			
			model.addAttribute("pagingVO", pagingVO);
			
			
		return "mypage/member/mypage/mypageBoard";
	}
	
	/**
	 * 회원페이지 예약 결제 기능
	 * 
	 * @param payVO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/pay.do")
	public ResponseEntity<ServiceResult> registerPay (@RequestBody	PayVO payVO){
		
		ServiceResult result = memberpayService.create(payVO);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
		
	}
	
	/**
	 * 회원페이지 기존 예약 결제 취소 기능
	 * 
	 * @param payVO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/cancel.do")
	public ResponseEntity<ServiceResult> cancelPay (@RequestBody PayVO payVO){
		
		ServiceResult result = memberpayService.delete(payVO);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
		
	}
	
	/**
	 * 회원이 쿠폰 등록시 쿠폰 등록 및 중복 등록 방지 기능
	 * 
	 * @param mycouponVO
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/mypage/mycpninsert.do")
	public ResponseEntity<ServiceResult> registerCpn (@RequestBody MyCouponVO mycouponVO){
		
		ServiceResult result = mycouponService.create(mycouponVO);
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
		
	}
}
