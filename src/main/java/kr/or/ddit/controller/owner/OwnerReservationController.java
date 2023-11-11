package kr.or.ddit.controller.owner;

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
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.service.owner.IFrcsReservationService;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsReservationVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerReservationController {

	@Inject
	private IFrcsReservationService service;
	
	@Inject
	private IMemberService memService;
	
	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value = "/resv.do", method = RequestMethod.GET)
	public String ownerResvList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		OwnerPaginationInfoVO<FrcsReservationVO> pagingVO = new OwnerPaginationInfoVO<FrcsReservationVO>();
		
		// 검색이 이루어지면 아래가 실행됨
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setFrcsId(frcsId);
		pagingVO.setCurrentPage(currentPage); // startRow, endRow, startPage, endPage가 결정
		int totalRecord = service.selectResvCount(pagingVO);//총게시글수
		
		pagingVO.setTotalRecord(totalRecord); // totalPage 결정
		// 예약 리스트
		List<FrcsReservationVO> resvList = service.selectResvList(pagingVO);
		pagingVO.setDataList(resvList);
		
		log.info("ownerResvList->resvList : " + resvList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		// 예약 메뉴 상세보기 
//		List<FrcsReservationVO> frcsResvMenuList = service.frcsResvList(frcsId);

//		for (FrcsReservationVO frcsReservationVO : resvList) {
//			String resvNo = frcsReservationVO.getResvNo();
//			log.info("예약번호출력" + resvNo);
//			List<FrcsReservationVO> frcsResvMenuList = service.frcsResvList(resvNo);
//			log.info("메뉴상세" + frcsResvMenuList);
//			model.addAttribute("resvMenuList", frcsResvMenuList);
//		}
		
		// 회원 상세보기
		for(FrcsReservationVO frcsResvVO : resvList) {
			String memId = frcsResvVO.getMemId();
			MemberVO memberVO = memService.selectMember(memId);
			model.addAttribute("member", memberVO);
		}
		
		return "owner/reservation/resvList";
	}
	
	// 예약 취소하기
	@ResponseBody
	@RequestMapping(value = "/rsevDelete.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsReservationVO>> ownerResvDelete(
			@RequestBody List<FrcsReservationVO> rsevDelList,
			RedirectAttributes ra) {
		
		for(FrcsReservationVO frcsResvVO : rsevDelList) {
			String resvNo = frcsResvVO.getResvNo();
			ServiceResult result = service.rsevDelete(resvNo);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "예약취소가 완료되었습니다!");
			}else {
				ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			}
		}
		return new ResponseEntity<List<FrcsReservationVO>>(HttpStatus.OK);
	}
	
	// 예약상태 업데이트
//	@ResponseBody
//	@RequestMapping(value = "/rsevStateUpdate.do", method = RequestMethod.POST)
//	public ResponseEntity<List<FrcsReservationVO>> ownerResvStateUpdate(
//			@RequestBody List<FrcsReservationVO> resvStateUpdate,
//			RedirectAttributes ra) {
//		
//		for(FrcsReservationVO frcsResvVO : resvStateUpdate) {
////			String resvState = frcsResvVO.getResvState();
//			String resvNo = frcsResvVO.getResvNo();
//			ServiceResult result = service.resvStateUpdate(resvNo);
//			if(result.equals(ServiceResult.OK)) {
//				ra.addFlashAttribute("message", "상태 업데이트가 완료되었습니다!");
//			}else {
//				ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
//			}
//		}
//		return new ResponseEntity<List<FrcsReservationVO>>(HttpStatus.OK);
//	}
	
	@RequestMapping(value = "/resvUpdate.do", method = RequestMethod.POST)
	public String ownerResvUpdate(
			RedirectAttributes ra,
			FrcsReservationVO frcsResvVO, Model model) {
		
		String goPage = "";
		ServiceResult result = service.resvUpdate(frcsResvVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "수정이 완료되었습니다!");
			goPage = "redirect:/owner/resv.do";
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "owner/reservation/resvList";
		}
		return goPage;
	}
}
