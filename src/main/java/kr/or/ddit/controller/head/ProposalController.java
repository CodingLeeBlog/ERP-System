package kr.or.ddit.controller.head;

import java.util.List;
import java.util.Map;

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
import kr.or.ddit.service.head.IProposalService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.ProposalVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class ProposalController {

	@Inject
	private IProposalService proposalService;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/proposalList.do")
	public String proposalList(
			@RequestParam(name = "page", required = false, defaultValue = "1")int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model
){
		
		HeadPaginationInfoVO<ProposalVO> pagingVO = new HeadPaginationInfoVO<ProposalVO>();
		
		// 검색이 이뤄지면 아래가 실행됨
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);  
		int totalRecord = proposalService.selectProposalCount(pagingVO); //총 게시글 수
		
		pagingVO.setTotalRecord(totalRecord); //totalPage 결정
		List<ProposalVO> dataList = proposalService.selectProposalList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/proposal/list";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/proposalDetail.do")
	public String proposalDetail(@RequestParam int tableNo, Model model) {
	    ProposalVO proposal = proposalService.selectProposal(tableNo);
	    model.addAttribute("proposal", proposal);
	    return "head/proposal/detail"; 
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/proposalInsert.do", method = RequestMethod.POST)
	public String proposalInsert(
			RedirectAttributes ra,
			ProposalVO proposalVO, Model model, AlarmVO alarmVO) {
		proposalVO.setAnsId("admin");

		String goPage = "";
		ServiceResult result = proposalService.proposalInsert(proposalVO, alarmVO);
		if(result.equals(ServiceResult.OK)) {
			proposalService.ansStateUpdate(proposalVO); 
			ra.addFlashAttribute("message", "답변 등록 완료!");
			goPage = "redirect:/head/proposalList.do";
		}else {
			model.addAttribute("message", "서버에러, 다시 시도해주세요.");
			goPage = "head/proposal/detail";
		}
		
		return goPage;
	}
	
	//본사 알림 시작
	@ResponseBody
	@RequestMapping(value = "/selectAlarm.do", method=  RequestMethod.POST)
	public List<AlarmVO> selectAlarm(@RequestBody Map<String, String> map) {
		String memId = map.get("memId").toString();
		List<AlarmVO> alarm = proposalService.selectAlarmList(memId);
	    return alarm;
	}
	
	//알림 읽음처리
	@RequestMapping(value = "/updateAlarm.do")
	public String updateAlarm(int alarmNo) {
		log.info("updateAlar > "+alarmNo);
		proposalService.updateAlarm(alarmNo);
		return "redirect:/head/dashboard.do";
	}
	
	//본사 알람 1개 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteAlarm.do", method = RequestMethod.POST)
		public ResponseEntity<ServiceResult> deleteAlarm(@RequestBody Map<String, String> map) {
		int alarmNo = Integer.parseInt(map.get("alarmNo").toString());
		ServiceResult result = proposalService.deleteAlarm(alarmNo);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	//본사 알람 전체 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteclearAllAlarm.do", method = RequestMethod.POST)
		public ResponseEntity<ServiceResult> deleteclearAllAlarm(@RequestBody Map<String, String> map) {
		String memId = map.get("memId").toString();
		ServiceResult result = proposalService.deleteclearAllAlarm(memId);
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
}
