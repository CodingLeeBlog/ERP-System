package kr.or.ddit.controller.head;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.or.ddit.service.head.IDashboardService;
import kr.or.ddit.vo.head.DashboardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Controller
@RequestMapping("/head")
public class HeadDashBoardController {
	
	@Inject
	private IDashboardService service;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/dashboard.do")
	public String dashBoard(Model model) {
		log.info("본사메인페이지 dashBoard() GET -> 시작");
		
		int orderCount = service.selectOrderCount();
		log.debug("최근3일간 가맹점주문 COUNT -> {}", orderCount);
		
		List<DashboardVO> dataList = service.selectOrderFrcsList();
		log.debug("받아온 최근가맹점 주문 리스트 -> {}",dataList);
		
		int openCount = service.selectOpenFranchiseCount();
		log.debug("받아온 최근3개월간 오픈한 매장 count -> {}",openCount);
		
		List<DashboardVO> openFranchise = service.selectOpenFranchiseDate();
		log.debug("최근3개월간 오픈한 매장 리스트 -> {}",openFranchise);
		
		List<DashboardVO> officeLetterList = service.selectOfficeLetterList();
		log.debug("공문 리스트 -> {}",officeLetterList);
		
		int officeLetterCount = service.selectOfficeLetterCount();
		log.debug("공문 카운트 -> {}", officeLetterCount);
		
		List<DashboardVO> counselList = service.selectCounselList();
		log.debug("창업 리스트 -> {}",counselList);

		int counselCount = service.selectCounselCount();
		log.debug("공문 카운트 -> {}", counselCount);
		
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("dataList", dataList);
		model.addAttribute("openCount", openCount);
		model.addAttribute("openFranchise", openFranchise);
		model.addAttribute("officeLetterCount", officeLetterCount);
		model.addAttribute("officeLetterList", officeLetterList);
		model.addAttribute("counselList", counselList);
		model.addAttribute("counselCount", counselCount);
		
		return "head/dashboard/headDashBoard";
	}
	
}