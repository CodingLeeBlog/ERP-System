package kr.or.ddit.controller.owner;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
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
import kr.or.ddit.service.owner.IFrcsEmployeeService;
import kr.or.ddit.service.owner.IFrcsIdService;
import kr.or.ddit.service.owner.IFrcsMyPageService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsEmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerEmployeeController {

	@Inject
	private IFrcsEmployeeService service;

	@Inject
	private IFrcsIdService idService;
	
	@Inject
	private IFrcsMyPageService myPageService;

	@PreAuthorize("hasRole('ROLE_OWNER')")
	@RequestMapping(value = "/emp.do", method = RequestMethod.GET)
	public String ownerEmpList(Model model) {
		
		//헤더 오른쪽 관리자 영역
		String frcsId = idService.getFrcsId();
		FranchiseVO frcsHead = myPageService.headerDetail(frcsId);
		model.addAttribute("frcsHead", frcsHead);
		
		List<FrcsEmployeeVO> frcsEmpList = service.frcsEmpList(frcsId);
		model.addAttribute("empList", frcsEmpList);

		/* 첨부파일을 가져오기 위한 */
		FrcsEmployeeVO frcsEmpVO = new FrcsEmployeeVO();
		for (FrcsEmployeeVO empVO : frcsEmpList) {
			String empCd = empVO.getFrcsEmpCd();
			log.debug("empCd 확인하기 -> {}", empCd);

			frcsEmpVO = service.selectEmp(empCd);
			log.debug("frcsEmpVO 확인하기 -> {}", frcsEmpVO);
		}
		model.addAttribute("frcsEmpVO", frcsEmpVO);

		return "owner/employee/empList";
	}

	@RequestMapping(value = "/empInsert.do", method = RequestMethod.POST)
	public String ownerEmpInsert(HttpServletRequest req, RedirectAttributes ra, FrcsEmployeeVO frcsEmpVO, Model model) {

		String goPage = "";
		Map<String, String> errors = new HashMap<String, String>();
		if (StringUtils.isBlank(frcsEmpVO.getFrcsEmpNm())) {
			errors.put("frcsEmpNm", "이름을 입력해주세요.");
		}
		if (StringUtils.isBlank(frcsEmpVO.getFrcsEmpTelno())) {
			errors.put("frcsEmpTelno", "연락처를 입력해주세요.");
		}
		if (frcsEmpVO.getFrcsEmpBrdt() == null) {
			errors.put("frcsEmpTelno", "생년월일을 입력해주세요.");
		}
		if (frcsEmpVO.getFrcsEmpSalary() <= 0) {
			errors.put("frcsEmpSalary", "급여를 입력해주세요.");
		}

		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("frcsEmpVO", frcsEmpVO);
			goPage = "owner/employee/empList";
		} else {
			String frcsId = idService.getFrcsId();
			frcsEmpVO.setFrcsId(frcsId);
			ServiceResult result = service.frcsEmpInsert(req, frcsEmpVO);
			if (result.equals(ServiceResult.OK)) {
//				ra.addFlashAttribute("message", "등록 완료!");
				goPage = "redirect:/owner/emp.do";
			} else {
				model.addAttribute("message", "서버에러, 다시 시도해주세요.");
				goPage = "owner/employee/empList";
			}
		}
		return goPage;
	}

	@RequestMapping(value = "/empUpdate.do", method = RequestMethod.POST)
	public String ownerEmpUpdate(HttpServletRequest req, RedirectAttributes ra, FrcsEmployeeVO frcsEmpVO, Model model) {

		String goPage = "";
		ServiceResult result = service.empUpdate(req, frcsEmpVO);
		if (result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "수정이 완료되었습니다!");
			goPage = "redirect:/owner/emp.do";
		} else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "owner/employee/empList";
		}
		return goPage;
	}

	@ResponseBody
	@RequestMapping(value = "/empDelete.do", method = RequestMethod.POST)
	public ResponseEntity<List<FrcsEmployeeVO>> ownerEmpDelete(@RequestBody List<FrcsEmployeeVO> empDelList,
			HttpServletRequest req, RedirectAttributes ra) {

		for (FrcsEmployeeVO frcsEmpVO : empDelList) {
			String frcsEmpCd = frcsEmpVO.getFrcsEmpCd();
			ServiceResult result = service.empDelete(req, frcsEmpCd);
			if (result.equals(ServiceResult.OK)) {
//				ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
			} else {
//				ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			}
		}
		return new ResponseEntity<List<FrcsEmployeeVO>>(HttpStatus.OK);
	}

	@RequestMapping(value = "/empDownload.do", method = RequestMethod.GET)
	public void fileDownload(String attachFile, HttpServletResponse response) throws IOException {

		// 서버에 저장되어 있는 Root 경로 
		String rootPath = "D:\\99.JSP_SPRING\\02.SPRING2\\workspace_spring2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Elemental\\";
		// attachFile =
		// /resources/upload/file/23/3b1a73b5-84ed-4a2a-9b62-2b26c91904a9_보건증.txt

		// 물리적으로 저장되어 있는 전체 파일 경로 + 파일명
		String fileFile = String.format("%s%s", rootPath, attachFile);

		byte[] fileByte = FileUtils.readFileToByteArray(new File(fileFile));
		
		String fileName = FilenameUtils.getName(fileFile);

        //파일유형설정
        response.setContentType("application/octet-stream"); 
        //파일길이설정
        response.setContentLength(fileByte.length);
        //데이터형식/성향설정 (attachment: 첨부파일)
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName,"UTF-8")+"\";");
        //내용물 인코딩방식설정
        response.setHeader("Content-Transfer-Encoding", "binary");
        //버퍼의 출력스트림을 출력
        response.getOutputStream().write(fileByte);
        
        //버퍼에 남아있는 출력스트림을 출력
        response.getOutputStream().flush();
        //출력스트림을 닫는다
        response.getOutputStream().close();
	}

}
