package kr.or.ddit.controller.head.store;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.head.ISalesAnalysisService;
import kr.or.ddit.vo.head.FeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class SalesAnalysisController {
	
	@Inject
	private ISalesAnalysisService service;

	@RequestMapping(value = "/salesAnalysis.do", method=RequestMethod.GET)
	public String storeDetails(Model model) {
		
		FeeVO feeVO = service.headChart();
		
		List<FeeVO> allmonthfeeVO = service.allmonthheadChart();
		
		model.addAttribute("feeVO", feeVO);
		model.addAttribute("allmonthfeeVO", allmonthfeeVO);
		
		return "head/store/salesAnalysis";
	}
	
	@ResponseBody
	@RequestMapping(value = "/month/salesAnalysis.do")
	public ResponseEntity<ServiceResult> monthSalesDetails(@RequestBody String type){
		
		ServiceResult result = null;
		
		result = service.headmonthChart();
		
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
}
