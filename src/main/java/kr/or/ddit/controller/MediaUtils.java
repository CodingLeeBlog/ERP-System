package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;



public class MediaUtils {
	/**
	 * MediaUtils 자바 클래스 객체는 
	 * MediaUtils.getMediaType(...) 으로 사용 하셔야 합니다.
	 * MediaUtils utils = new MediaUtils(); 이렇게 인스턴스를 생성 하시면 안됨니다.
	 */
	private MediaUtils() {
		throw new IllegalStateException("Utility class");
	}
	
	private static Map<String, MediaType> mediaMap;
	
	// static 그룹 선언
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
		mediaMap.put("PDF", MediaType.APPLICATION_PDF);
	}
	
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}
