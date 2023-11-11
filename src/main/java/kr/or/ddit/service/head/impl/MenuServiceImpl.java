package kr.or.ddit.service.head.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.MenuMapper;
import kr.or.ddit.service.head.IMenuService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.MenuVO;

@Service
public class MenuServiceImpl implements IMenuService {
	
	@Inject
	private MenuMapper menuMapper;

	@Override
	public int selectMenuCount(HeadPaginationInfoVO<MenuVO> pagingVO) {
		return menuMapper.selectMenuCount(pagingVO);
	}

	@Override
	public List<MenuVO> selectMenuList(HeadPaginationInfoVO<MenuVO> pagingVO) {
		return menuMapper.selectMenuList(pagingVO);
	}

	@Override
	public MenuVO menuDetail(String menuCd) {
		return menuMapper.menuDetail(menuCd);
	}

	
//	@Override
//	public void menuUpdate(MenuVO menuVO) {
//		String menuCd = menuVO.getMenuCd();
//		
//		menuMapper.menuDelete(menuCd);
//		menuMapper.menuRegister(menuVO);
//	}


	@Override
	public void menuRegister(HttpServletRequest req, MenuVO menuVO) {
	    // MenuVO를 먼저 저장
	    menuMapper.menuRegister(menuVO);
	    
	    // AttachVO 생성 및 설정
	    List<AttachVO> menuFileList = menuVO.getMenuFileList(); // AttachVO 리스트 가져오기
	    
	    String savePath = "/resources/upload/img/";
	    
	    if (menuFileList != null && !menuFileList.isEmpty()) {
	    	
	    	String saveLocate = req.getServletContext().getRealPath(savePath);
	    	File fileSaveLocate = new File(saveLocate);
	    	if(!fileSaveLocate.exists()) {
	    		fileSaveLocate.mkdirs();
	    	}
	    	
	        for (AttachVO attachVO : menuFileList) {
	            // 파일 업로드 처리 시작
	            String saveName = UUID.randomUUID().toString(); // UUID의 랜덤 파일명 생성
	            saveName = saveName + "_" + attachVO.getAttachOrgname().replaceAll(" ", "_"); // 공백일 때 _로 전부 바꿔준다.
	            
	            attachVO.setTablePk(menuVO.getMenuCd()); // 메뉴 코드를 테이블 PK로 설정
	            attachVO.setFileNo(1);
	            attachVO.setAttachSavename(savePath + saveName); // 파일명 설정

	            File realUploadFile = new File(fileSaveLocate + "/" + saveName);
	            try {
					attachVO.getItem().transferTo(realUploadFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	            
	            // AttachVO를 저장
	            menuMapper.menuAttachRegister(attachVO);
	        }
	    }
	}
	


	@Override
	public void menuDelete(String menuCd) {
		menuMapper.menuChildDelete(menuCd);
		
		menuMapper.menuDelete(menuCd);
	}

	@Override
	public void menuUpdate(MenuVO menuVO) {
		menuMapper.menuUpdate(menuVO);
		
	}
	
	@Override
	public List<MenuVO> getMenuListByCategory(HeadPaginationInfoVO<MenuVO> pagingVO) {
	    return menuMapper.getMenuListByCategory(pagingVO);
	}

	@Override
	public int selectMemberMenuCount(HeadPaginationInfoVO<MenuVO> pagingVO) {
		return menuMapper.selectMemberMenuCount(pagingVO);
	}
	
	@Override
	public AttachVO selectMenuFile(int attachNo) {
		return menuMapper.selectMenuFile(attachNo);
	}

}
