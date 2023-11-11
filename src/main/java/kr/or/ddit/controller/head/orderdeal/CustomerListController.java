package kr.or.ddit.controller.head.orderdeal;

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
import kr.or.ddit.service.head.ICustomerService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.VendorVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
public class CustomerListController {

	@Inject
	private ICustomerService service;
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/customerList.do")
	public String customerList(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false) String searchVendor,
			@RequestParam(required = false) String  searchCategory,
			Model model) {
		log.info("customerList() GET -> 시작");
		
		HeadPaginationInfoVO<VendorVO> pagingVO = new HeadPaginationInfoVO<VendorVO>();
		
		if(StringUtils.isNotBlank(searchVendor)) {
			pagingVO.setSearchVendor(searchVendor);
		}
		
		if(StringUtils.isNotBlank(searchCategory)) {
			pagingVO.setSearchCategory(searchCategory);
		}
		
		pagingVO.setCurrentPage(currentPage);
		int totalRecord = service.selectTotalVendorCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);
		List<VendorVO> dataList = service.selectTotalVendorList(pagingVO);
		pagingVO.setDataList(dataList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		return "head/orderDeal/customerList";
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/vendorList.do")
	public ResponseEntity<List<VendorVO>> vendorList(
			@RequestBody VendorVO vendorVO,
			Model model){
		
		log.info("vendorList 시작 -> selectNotTransactionList");
		
		log.debug("거래처등록 분류선택 후 거래처리스트 뽑아오기 vendorVO -> {}", vendorVO.toString());
		
		List<VendorVO> selectNotTransactionList = service.selectCategoryList(vendorVO);
		
		return new ResponseEntity<List<VendorVO>>(selectNotTransactionList, HttpStatus.OK);
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/vendorNameSelect.do")
	public ResponseEntity<VendorVO> vendorNameSelect(@RequestBody VendorVO vendorVO){
		
		VendorVO vendorInfoList = service.selectVendorName(vendorVO);
		return new ResponseEntity<VendorVO>(vendorInfoList, HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/customerListRegister.do", method = RequestMethod.GET)
	public String customerListRegister(Model model) {
		log.info("customerListRegister() GET -> 시작");
		return "head/orderDeal/customerListRegister";
	}
	
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/vendorRegister.do", consumes = "application/json; charset=UTF-8")
	public ResponseEntity<String> vendorRegister(
			@RequestBody List<VendorVO> vendorVO,
			Model model) {
		log.info("vendorRegister() GET -> 시작");
		
		if(vendorVO.size() != 0) {
			for (VendorVO data : vendorVO) {
				log.info("vdprodCd : " + data.getVdprodCd() + ", vdCode : " + data.getVdCode() + ", vdprodName : " + data.getVdprodName());
				log.info("vdremainQy : " + data.getVdremainQy() + ", vdforwardPrice : " + data.getVdforwardPrice() + ", vdprodLifestartday : " + data.getVdprodLifestartday());
				log.info("vdprodLifeendday : " + data.getVdprodLifeendday() + ", vdrtrcvPrice : " + data.getVdrtrcvPrice() + ", vdmaxQy : " + data.getVdmaxQy());
			}
		}
		
		service.registVendor(vendorVO);
		
//		List<VendorVO> registVendor = service.registVendor(vendorVO);
		
		String result = "OK";
		
		return new ResponseEntity<String>("{\"result\":\"" + result + "\"}", HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/vendorUpdate.do", method = RequestMethod.POST)
	public String vendorUpate(Model model, VendorVO vendorVO) {
		log.info("vendorUpate() -> 도착");
		log.info("Received vendorVO: " + vendorVO.toString());
		
		VendorVO vendor = service.selectVendor(vendorVO.getVdCode());
		model.addAttribute("vendor", vendor);
		
		return "head/orderDeal/customerListUpdate";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/vendorUpdateFinish.do", method = RequestMethod.POST)
	public String vendorUpdateFinish(Model model, VendorVO vendorVO) {
		log.info("vendorUpdateFinish() -> 도착");
		log.info("Received vendorVO: " + vendorVO.toString());
		
		service.updateVendor(vendorVO);
		
		return "redirect:/head/customerList.do";
	}
	
	@PreAuthorize("hasRole('ROLE_HEAD')")
	@RequestMapping(value = "/vendorDelete.do", method = RequestMethod.POST)
	public String vendorDelete(
			RedirectAttributes ra,
			Model model, VendorVO vendorVO) {
		
		log.info("vendorDelete.do() -> 도착");
		log.info("vendorVO: " + vendorVO.toString());
		
		String goPage = "";
		
		String vdCode = vendorVO.getVdCode().toString();
		
		log.info("vdCode -> " + vdCode);
		ServiceResult result = service.deleteVendor(vdCode);
		
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "삭제가 완료 되었습니다.");
//			String location = "/head/customerList.do";
//			ra.addFlashAttribute("location", location);
			goPage = "redirect:/head/customerList.do";
		}else {
			ra.addFlashAttribute("message", "서버에러, 다시 시도해주세요!!");
			goPage = "redirect:/head/customerList.do";
		}
		
		return goPage;
	}
	
  }
