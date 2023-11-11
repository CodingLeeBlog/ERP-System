package kr.or.ddit.service.owner.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsTradingMapper;
import kr.or.ddit.service.owner.IFrcsTradingService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import kr.or.ddit.vo.owner.TradingVO;

@Service
public class FrcsTradingServiceImpl implements IFrcsTradingService {

	@Inject
	private FrcsTradingMapper mapper;
	
	// 내 가맹점 위치 조회
	@Override
	public FranchiseVO getLocation(String frcsId) {
		return mapper.getLocation(frcsId);
	}
	
	// 모든 가맹점 정보 가져오기
	@Override
	public List<FranchiseVO> getAllFrcsList() {
		return mapper.getAllFrcsList();
	}

	// 주변 가맹점 재고 현황 가져오기
	@Override
	public List<FrcsInventoryVO> getNearInventList(String searchWord, String searchType, List<Object> nearList) {
		
		List<FrcsInventoryVO> getNearInventList = new ArrayList<FrcsInventoryVO>();
		
		for(int i=0; i<nearList.size(); i++) {
		    String frcsId = nearList.get(i).toString();
	        List<FrcsInventoryVO> inventList = mapper.getInventList(searchWord, searchType, frcsId);
	        getNearInventList.addAll(inventList);
	    }
	
		return getNearInventList;
	}

	// 트레이딩 신청
	@Override
	public ServiceResult tradingInsert(TradingVO tradVO, AlarmVO alarmVO) {
		
		ServiceResult result = null;
		
		String vdprodCd = tradVO.getVdprodCd();
		
		int hdforwardPrice = mapper.getHdforwardPrice(vdprodCd);	// 제품가격
		int tradQy = tradVO.getTradQy();	// 트레이딩 수량
		
		tradVO.setTradAmt(hdforwardPrice*tradQy);
		
		int status = mapper.tradingInsert(tradVO);
		
		if(status>0) {
			result = ServiceResult.OK;
			// 트레이딩 주고 받는 알람데이터 넣기
			String frcsId = tradVO.getFrcsId(); //답변자의 가맹점 코드
			String frcsId2 = tradVO.getFrcsId2(); //답변자의 가맹점 코드
			String tradNo = tradVO.getTradNo(); // 답변 번호
			alarmVO.setAnsNo(tradNo);
//			//1) FROM
			String getFrcsId = this.mapper.getMemFrcs(frcsId); //가맹점 코드를 mem_Id로 만들기 위함
			alarmVO.setMemId(getFrcsId);
			//2) WHAT
			alarmVO.setTblName("TRADING");
			alarmVO.setTblNo(tradNo);
//			//3) TO
			String receiveMemId = this.mapper.getReceiveMemId(frcsId2);
//			
			alarmVO.setReceiveMemId(receiveMemId);
//			
//			// 알람데이터 넣기 
			mapper.insertAlarm(alarmVO);
			
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}


	// 트레이딩 신청내역 페이징1
	@Override
	public int selectTradeCount(OwnerPaginationInfoVO<TradingVO> pagingVO) {
		return mapper.selectTradeCount(pagingVO);
	}

	// 트레이딩 신청내역 페이징2
	@Override
	public List<TradingVO> selectTradingHistoryList(OwnerPaginationInfoVO<TradingVO> pagingVO) {
		return mapper.selectTradingHistoryList(pagingVO);
	}

	// 트레이딩 성공 시 각 가맹점 재고 수량 반영
	@Override
	public ServiceResult tradingSuccess(FrcsInventoryVO inventVO) {
		ServiceResult result = null;
		int status = 0;
		String tradNo = inventVO.getTradNo();
		
		// 재고 - 처리 
		int plus = mapper.tradingMinus(inventVO);
		
		if(plus>0) {
			// 재고 + 처리
			status = mapper.tradingPlus(inventVO);
		}
		
		if(status > 0) {
			// 상태  update
			mapper.updateStatus(tradNo);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}

		return result;
	}

	// 트레이딩 거절
	@Override
	public ServiceResult tradingRefuse(TradingVO tradVO) {
		ServiceResult result = null;
		
		int status = mapper.tradingRefuse(tradVO);
		
		if(status>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	// 금일 들어온 트레이딩 수
	@Override
	public int selectCount(String frcsId) {
		return mapper.selectCount(frcsId);
	}

	// 트레이딩 상세내역
	@Override
	public FrcsInventoryVO getDetail(FrcsInventoryVO frcsInventVO) {
		return mapper.getDetail(frcsInventVO);
	}

	// 트레이딩 상세내역(응답)
	@Override
	public FrcsInventoryVO getReqDetail(FrcsInventoryVO frcsInventVO) {
		return mapper.getReqDetail(frcsInventVO);
	}

	
}
