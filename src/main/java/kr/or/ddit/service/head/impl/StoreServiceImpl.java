package kr.or.ddit.service.head.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.StoreMapper;
import kr.or.ddit.service.head.IStoreService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.InventoryUpdateVO;
import kr.or.ddit.vo.head.StoreOrderHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StoreServiceImpl implements IStoreService{
	
	@Inject
	private StoreMapper mapper;

	// 가맹점 주문내역
	@Override
	public int totalOrderCount(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO) {
		return mapper.totalOrderCount(pagingVO);
	}
	@Override
	public List<StoreOrderHistoryVO> selectTotalOrderList(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO) {
		
		return mapper.selectTotalOrderList(pagingVO);
	}
	@Override
	public List<StoreOrderHistoryVO> selectFrcsNameList(StoreOrderHistoryVO soh) {
		return mapper.selectFrcsNameList(soh);
	}
	@Override
	public int selectOrderListDetailsCount(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO) {
		return mapper.selectOrderListDetailsCount(pagingVO);
	}
	@Override
	public List<StoreOrderHistoryVO> selectOrderListDetails(HeadPaginationInfoVO<StoreOrderHistoryVO> pagingVO) {
		return mapper.selectOrderListDetails(pagingVO);
	}
	@Override
	public List<StoreOrderHistoryVO> selectCheckOne(String frcsorderNo) {
		return mapper.selectCheckOne(frcsorderNo);
	}
	
	// 승인처리시 진행하는 로직
	@Override
	public ServiceResult updateOrderDetails(StoreOrderHistoryVO soh, AlarmVO alarmVO) {
		
		ServiceResult result = null;
		
		String frcsId = soh.getFrcsId().toString();
		
		// 가맹점재고 수량 업데이트
		List<InventoryUpdateVO> frcs = mapper.selectFrcsQy(soh);
		for (InventoryUpdateVO  qy : frcs) {
			String vdprodCd = qy.getVdprodCd();
			int invntryQy = qy.getInvntryQy();
			int frcsorderQy = qy.getFrcsorderQy();
			
			invntryQy += frcsorderQy;
			
			System.out.println("가맹점 재고수량 -> " + invntryQy);
			
			qy.setFrcsId(frcsId);
			qy.setVdprodCd(vdprodCd);
			qy.setInvntryQy(invntryQy);
			
			mapper.updateFrcsInventory(qy);
		}
		// 본사 재고 수량 업데이트
		
		List<InventoryUpdateVO> head = mapper.selectHeadQy(soh);
		for (InventoryUpdateVO qy : head) {
			String vdprodCd = qy.getVdprodCd();
			int hdremainQy = qy.getHdremainQy();
			int frcsorderQy = qy.getFrcsorderQy();
			
			hdremainQy -= frcsorderQy;
			
			System.out.println("본사 재고수량 -> " + hdremainQy);
			
			qy.setVdprodCd(vdprodCd);
			qy.setHdremainQy(hdremainQy);
			
			mapper.updateHeadInventory(qy);
		}
		
		// 가맹점 발주테이블 승인여부 '승인'으로 업데이트
		int status = mapper.updateOrderDetails(soh);
		
		if(status > 0) {
			result = ServiceResult.OK;
			
			// 알람데이터 넣기 
			String frcsorderNo = soh.getFrcsorderNo(); //발주 번호 
			//1) FROM
			String memIdfrcs = this.mapper.getMemFrcs(frcsId); //mem_Id로 만들기 위함
			alarmVO.setMemId(memIdfrcs);
			//2) WHAT
			alarmVO.setTblName("FRCSORDER");
			alarmVO.setTblNo(frcsorderNo);
			//3) TO
			String receiveMemId = this.mapper.getReceiveMemId(frcsId);
			alarmVO.setReceiveMemId(receiveMemId);
			// 알람데이터 넣기 
			mapper.insertAlarm(alarmVO);
			
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	// 반려버튼 클릭시 데이터 받아오기
	@Override
	public StoreOrderHistoryVO frcsOrderDetails(StoreOrderHistoryVO storeOrderHistoryVO) {
		
		return mapper.frcsOrderDetails(storeOrderHistoryVO);
	}
	
	// 반려모달에서 확인버튼을 눌렀을때 최종 업데이트 처리
	@Override
	public ServiceResult updateImpossibleOrder(StoreOrderHistoryVO soh) {
		
		ServiceResult result = null;
		
		int status = mapper.updateImpossibleOrder(soh); 
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	@Override
	public int selectOrderCnt() {
		return mapper.selectOrderCnt();
	}
	
	
}
