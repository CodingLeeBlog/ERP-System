package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.MaintenancecostMapper;
import kr.or.ddit.service.head.IMaintenancecostService;
import kr.or.ddit.vo.head.FeeVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.StoreOrderHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MaintenancecostServiceImpl implements IMaintenancecostService{

	@Inject
	private MaintenancecostMapper mapper;

	// 관리비관리 메인화면페이지 totalRecord
	@Override
	public int selectMainCount(HeadPaginationInfoVO<FeeVO> pagingVO) {
		return mapper.selectMainCount(pagingVO);
	}

	// 관리비관리 메인화면페이지 리스트
	@Override
	public List<FeeVO> selectMainList(HeadPaginationInfoVO<FeeVO> pagingVO) {
		
		List<FeeVO> selectMainList = mapper.selectMainList(pagingVO);
		
		for (FeeVO feeVO : selectMainList) {
			
			String frcsId = feeVO.getFrcsId();
			
			// 한 가맹점의 관리비 미납횟수 카운트
			List<FeeVO> feVO = mapper.selectNonPaymentCount(frcsId);
			
			for (FeeVO feeVO2 : feVO) {
				
				int nonpaymentCount = feeVO2.getNonpaymentCount();
				
				feeVO.setNonpaymentCount(nonpaymentCount);
			}
		}
		
		
		return selectMainList;
	}

	// 관리비관리 상세화면페이지 totalRecord
	@Override
	public int selectDetailCount(HeadPaginationInfoVO<FeeVO> pagingVO) {
		return mapper.selectDetailCount(pagingVO);
	}

	// 관리비관리 상세화면리스트
	@Override
	public List<FeeVO> selectDetailList(HeadPaginationInfoVO<FeeVO> pagingVO) {
		
		List<FeeVO> dataList = mapper.selectDetailList(pagingVO);
		
		for (FeeVO feeVO : dataList) {
			
			int nonpayTotal = 0;
			
			String frcsId = feeVO.getFrcsId();
			int frcsAmt = feeVO.getFrcsAmt();
			int frcsRowal = feeVO.getFrcsRowal();
			int orderAmt = feeVO.getOrderAmt();
			int frcsbillOverdue = feeVO.getFrcsbillOverdue();
			
			int tradAdd = feeVO.getTradAdd();
			int tradRedct = feeVO.getTradRedct();
			
			log.info("MaintenancecostServiceImpl 클래스 시작!!");
			log.info("=========관리비관리 상세화면 데이터==========");
			log.debug("가맹점코드(frcsId) -> {}",frcsId);
			log.debug("가맹비(frcsAmt) -> {}",frcsAmt);
			log.debug("로얄티(frcsRowal) -> {}",frcsRowal);
			log.debug("제품구입비(orderAmt) -> {}",orderAmt);
			log.debug("연체이자(frcsbillOverdue) -> {}",frcsbillOverdue);
			log.info("=========관리비관리 상세화면 데이터==========");
			
			// 트레이딩추가결재금액이 있으면 미납입금에 합산
			if(tradAdd != 0 && tradRedct == 0) {
				nonpayTotal += frcsAmt + frcsRowal + orderAmt;
				nonpayTotal += frcsbillOverdue + tradAdd;
				log.debug("트레이딩추가결재금액포함 미납총액(nonpayTotal) -> {}",nonpayTotal);
			// 트레이딩삭감금액이 있으면 미납입금에서 마이너스
			}else if(tradRedct != 0 && tradAdd == 0) {
				nonpayTotal += frcsAmt + frcsRowal + orderAmt;
				nonpayTotal += frcsbillOverdue - tradRedct;
				log.debug("트레이딩삭감비포함 미납총액(nonpayTotal) -> {}",nonpayTotal);
			}
			
			
			feeVO.setNonpayTotal(nonpayTotal);
			
			String frcsNonpaydate = "";
			StoreOrderHistoryVO sohVO = new StoreOrderHistoryVO();
			sohVO.setFrcsId(frcsId);
			log.info("=========관리비관리 상세화면 모달창 데이터==========");
			log.debug("가맹점코드(frcsId) -> {}",frcsId);
			log.info("=========관리비관리 상세화면 모달창 데이터==========");
			
			// 미납내역 상세 발주내역 불러오기
			String date = feeVO.getFrcsNonpaydate();
			String[] frcsdate = date.split("/");
			for (int i = 0; i < frcsdate.length; i++) {
				if(frcsdate[i].equals("01") || frcsdate[i].equals("02") || frcsdate[i].equals("03") ||
						frcsdate[i].equals("04") ||frcsdate[i].equals("05") ||frcsdate[i].equals("06") ||
						frcsdate[i].equals("07") ||frcsdate[i].equals("08") ||frcsdate[i].equals("09") ||
						frcsdate[i].equals("10") ||frcsdate[i].equals("11") ||frcsdate[i].equals("12")) {
					frcsNonpaydate = frcsdate[i];
					sohVO.setFrcsNonpaydate(frcsNonpaydate);
				}
			}
			log.debug("가맹점 미납월(frcsNonpaydate) -> {}",frcsNonpaydate);
			
			List<StoreOrderHistoryVO> modalData = mapper.selectModalOrderList(sohVO);
			log.debug("불러온 미납월의 발주데이터(modalData) -> {}",modalData);
			
			feeVO.setModalData(modalData);
		}
		
		return dataList;
	}

	@Override
	public List<StoreOrderHistoryVO> selectModalData(StoreOrderHistoryVO sohVO) {
		return mapper.selectModalData(sohVO);
	}

	
}
