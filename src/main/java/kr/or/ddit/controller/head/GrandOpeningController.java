package kr.or.ddit.controller.head;

import java.io.IOException;

import org.springframework.core.io.UrlResource;
import org.springframework.core.io.support.ResourceRegion;
import org.springframework.http.HttpRange;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.MediaTypeFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.common.base.Optional;
import com.google.common.net.HttpHeaders;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/head")
@RequiredArgsConstructor
public class GrandOpeningController {
	
    private String url = "https://www.youtube.com/watch?v=G0w6lT-FZhY";

	@RequestMapping(value = "/education.do", method=RequestMethod.GET)
	public String education(Model model) {
		log.info("Education(): 시작");
		return "head/grandopening/education";
	}
	
	@RequestMapping(value = "/educationVideo.do", method=RequestMethod.GET)
	public String educationVideo(Model model) {
		log.info("educationVideo(): 시작");
		return "head/grandopening/educationVideo";
	}
	
	@RequestMapping(value = "/plan.do", method=RequestMethod.GET)
	public String plan(Model model) {
		log.info("Plan(): 시작");
		return "head/grandopening/plan";
	}
	
	@RequestMapping(value = "/facility.do", method=RequestMethod.GET)
	public String facility(Model model) {
		log.info("Facility(): 시작");
		return "head/grandopening/facility";
	}
}
