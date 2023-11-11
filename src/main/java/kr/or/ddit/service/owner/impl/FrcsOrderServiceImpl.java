package kr.or.ddit.service.owner.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsOrderMapper;
import kr.or.ddit.service.owner.IFrcsOrderService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FrcsAutoOrderVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;
import kr.or.ddit.vo.owner.FrcsOrderVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Service
public class FrcsOrderServiceImpl implements IFrcsOrderService{
	
	@Inject
	private FrcsOrderMapper mapper;


	@Override
	public List<FrcsInventoryVO> getInventList(String frcsId) {
		return mapper.getInventList(frcsId);
	}

	@Override
	public List<FrcsInventoryVO> inventSearch(String searchWord, String searchType, String frcsId) {
		return mapper.inventSearch(searchWord,searchType,frcsId);
	}

	@Override
	public String getFrcsId(String memId) {
		return mapper.getFrcsId(memId);
	}

	@Override
	public ServiceResult orderInsert(FrcsOrderVO frcsOrderVO, AlarmVO alarmVO) {
		ServiceResult result = null;
		
		// 발주 테이블
		int status = mapper.orderInsert(frcsOrderVO);
		
		// 알람데이터 넣기 
		String frcsId = frcsOrderVO.getFrcsId(); //답변자의 가맹점 코드
		String frcsOrderNo = frcsOrderVO.getFrcsOrderNo(); //공문 번호 
		//1) FROM
		String memIdfrcs = this.mapper.getMemFrcs(frcsId); //가맹점 코드를 mem_Id로 만들기 위함
		alarmVO.setMemId(memIdfrcs);
		//2) WHAT
		alarmVO.setTblName("FRCSORDER");
		alarmVO.setTblNo(frcsOrderNo+"");
		//3) TO
		String receiveMemId = this.mapper.getReceiveMemId(frcsOrderNo);
		alarmVO.setReceiveMemId(receiveMemId);
		// 알람데이터 넣기 
		mapper.insertAlarm(alarmVO);
		 
		// 발주 테이블 성공했으면
		if(status > 0) {

		List<FrcsOrderDetailVO> orderList = frcsOrderVO.getOrderDetailList();
		
		// 발주 상세테이블
		 for(int i=0; i<orderList.size(); i++) {
			FrcsOrderDetailVO frcsOrderDetailVO = orderList.get(i);
			frcsOrderDetailVO.setFrcsId(frcsOrderVO.getFrcsId());
	    	mapper.orderDetailInsert(frcsOrderDetailVO);
	    	result = ServiceResult.OK;
		    }
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	// 발주 내역 페이징 처리
	@Override
	public int selectOrderCount(OwnerPaginationInfoVO<FrcsOrderVO> pagingVO) {
		return mapper.selectOrderCount(pagingVO);
	}
	
	// 발주 내역 페이징 처리
	@Override
	public List<FrcsOrderVO> selectOrderList(OwnerPaginationInfoVO<FrcsOrderVO> pagingVO) {
		return mapper.selectOrderList(pagingVO);
	}

	// 발주 취소
	@Override
	public ServiceResult orderCancel(String frcsOrderNo) {
		ServiceResult result = null;

		int status = mapper.orderCancel(frcsOrderNo);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	@Override
	public List<FrcsInventoryVO> getSearch(String searchWord) {
		return mapper.getSearch(searchWord);
	}

	// 자동 발주 목록 페이징 처리
	@Override
	public int selectAutoOrderCount(OwnerPaginationInfoVO<FrcsAutoOrderVO> pagingVO) {
		return mapper.selectAutoOrderCount(pagingVO);
	}

	// 자동 발주 목록 페이징 처리
	@Override
	public List<FrcsAutoOrderVO> selectAutoOrderList(OwnerPaginationInfoVO<FrcsAutoOrderVO> pagingVO) {
		return mapper.selectAutoOrderList(pagingVO);
	}

	// 자동 발주 등록
	@Override
	public ServiceResult insertAutoOrder(FrcsAutoOrderVO autoVO) {
		ServiceResult result = null;
		int status = mapper.insertAutoOrder(autoVO);
		
			if(status > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
			
		return result;
	}

	// 자동 발주 활성화 비활성화 설정
	@Override
	public ServiceResult disabledAutoOrder(FrcsAutoOrderVO autoVO) {
		
		ServiceResult result = null;
		int status = mapper.disabledAutoOrder(autoVO);
		
			if(status > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
			
		return result;
	}

	// 발주 하단에 자동발주내역 자동 등록
	@Override
	public List<FrcsInventoryVO> getAutoList(String frcsId) {
		return mapper.getAutoList(frcsId);
	}

	// 발주 상세 내역 조회
	@Override
	public FrcsOrderVO getDetail(String frcsOrderNo) {
		return mapper.getDetail(frcsOrderNo);
	}

	// 자동발주 중복체크
	@Override
	public ServiceResult autoOrderCheck(FrcsAutoOrderVO autoVO) {
		ServiceResult result = null;
		
		int status = mapper.autoOrderCheck(autoVO);
		if(status > 0) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		
		return result;
	}

	
	// 자동발주 수정
	@Override
	public ServiceResult autoOrderUpdate(FrcsAutoOrderVO autoVO) {
		ServiceResult result = null;
		
		int status = mapper.autoOrderUpdate(autoVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	// 발주 상세내역 엑셀 다운로드
	@Override
	public List<FrcsOrderVO> getOrderList(String frcsId) {
		return mapper.getOrderList(frcsId);
	}
}
