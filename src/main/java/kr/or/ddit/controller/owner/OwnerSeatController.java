package kr.or.ddit.controller.owner;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.service.owner.ISeatService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsSeatVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerSeatController {
	
	@Inject
	private ISeatService service;
	
	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IFrcsMyPageService myPageService;
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value="/seat.do", method = RequestMethod.GET )
	public String ownerSeatContent(Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
				
		List<FrcsSeatVO> frcsSeatList = service.frcsSeatList(frcsId);
		model.addAttribute("list", frcsSeatList);
		return "owner/info/seatContent";
	}
	
	@RequestMapping(value="/seatArrangement.do", method = RequestMethod.GET )
	public String ownerSeatArrangement() {
		return "owner/info/notiles/seatArrangement";
	}
	
	@ResponseBody
	@RequestMapping(value="/seatArrangement.do", method = RequestMethod.POST )
	public ResponseEntity<List<FrcsSeatVO>> ownerSeatRegister(
			@RequestBody List<FrcsSeatVO> frcsSeatList) {
//		log.info(frcsSeatList.get(0).toString());
		
		for(FrcsSeatVO seatVO : frcsSeatList) {
			
			log.info("seatCd : " + seatVO.getSeatCd());
			log.info("seatId : " + idService.getFrcsId());
			log.info("seatStyle : " + seatVO.getSeatStyle());
			
			String seatCd = seatVO.getSeatCd();
			String frcsId = idService.getFrcsId();
			String seatStyle = seatVO.getSeatStyle();
			
			FrcsSeatVO seat = new FrcsSeatVO();
			seat.setSeatCd(seatCd);
			seat.setFrcsId(frcsId);
			seat.setSeatStyle(seatStyle);
			
			service.seatRegister(seat);
		}
		
		return new ResponseEntity<List<FrcsSeatVO>>(HttpStatus.OK);
	}
	
	@RequestMapping(value="/seatDelete.do", method = RequestMethod.POST )
	public String ownerSeatDelete(
			RedirectAttributes ra) {
		String goPage = "";
		String frcsId = idService.getFrcsId();
		ServiceResult result = service.seatDelete(frcsId);
		log.info("값 " + result.toString());
		/* 값이 왜 FAILED 일까..? */ 
		if(result.equals(ServiceResult.OK)) {
//			ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
			goPage = "redirect:/owner/seat.do";
		}else if(result.equals(ServiceResult.NOTEXIST)) {
//			ra.addFlashAttribute("message", "삭제할 좌석이 없습니다.좌석을 등록해주세요!");
			goPage = "redirect:/owner/seat.do";
		}else {
//			ra.addFlashAttribute("message", "삭제할 좌석이 없습니다.좌석을 등록해주세요!");
			goPage = "redirect:/owner/seat.do";
		}
		return goPage;
	}
	
}
