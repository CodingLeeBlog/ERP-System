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
import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsReservationService;
import kr.or.ddit.vo.member.MemberVO;
import kr.or.ddit.vo.owner.FrcsReservationVO;
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
	
	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value = "/resv.do", method = RequestMethod.GET)
	public String ownerResvList(Model model) {
		String frcsId = idService.getFrcsId();
		List<FrcsReservationVO> frcsResvList = service.frcsResvList(frcsId);
		model.addAttribute("resvList", frcsResvList);
		
		for(FrcsReservationVO frcsResvVO : frcsResvList) {
			String memId = frcsResvVO.getMemId();
			MemberVO memberVO = memService.selectMember(memId);
			model.addAttribute("member", memberVO);
		}
		
		return "owner/reservation/resvList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/rsevStateUpdate.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsReservationVO>> ownerResvStateUpdate(
			@RequestBody List<FrcsReservationVO> resvStateUpdate,
			RedirectAttributes ra) {
		
		for(FrcsReservationVO frcsResvVO : resvStateUpdate) {
//			String resvState = frcsResvVO.getResvState();
			String resvNo = frcsResvVO.getResvNo();
			ServiceResult result = service.resvStateUpdate(resvNo);
			if(result.equals(ServiceResult.OK)) {
				ra.addFlashAttribute("message", "상태 업데이트가 완료되었습니다!");
			}else {
				ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			}
		}
		return new ResponseEntity<List<FrcsReservationVO>>(HttpStatus.OK);
	}
}
