package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.FranchiseSalesAnalysisMapper;
import kr.or.ddit.service.head.IFranchiseSalesAnalysisService;
import kr.or.ddit.vo.head.FranchiseSalesAnalysisVO;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FranchiseSalesAnalysisServiceImpl implements IFranchiseSalesAnalysisService{
	
	@Inject
	private FranchiseSalesAnalysisMapper mapper; 
	/**
	 *	가맹점매출분석페이지 들어갔을때 페이징처리를위한 COUNT 메소드
	 */
	@Override
	public int selectCountFrcs(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO) {
		
		return mapper.selectCountFrcs(pagingVO);
	}
	@Override
	public List<FranchiseSalesAnalysisVO> selectFrcsList(HeadPaginationInfoVO<FranchiseSalesAnalysisVO> pagingVO) {
		return mapper.selectFrcsList(pagingVO);
	}
	
	// 손익계산서 데이터 서비스로직
	@Override
	public FranchiseSalesAnalysisVO selectAllPrice(FranchiseSalesAnalysisVO fsaVO) {
	
		// 가맹비
		int frcsCost = 500000;
		
		String frcsId = fsaVO.getFrcsId().toString();
		String frcsName = fsaVO.getFrcsName().toString();
		int curMonth = fsaVO.getCurMonth();
		int year = fsaVO.getYear();
		
		log.debug("FranchiseSalesAnalysisServiceImpl -> 데이터 확인");
		log.debug("frcsId 값 -> {}", frcsId);
		log.debug("frcsName 값 -> {}", frcsName);
		log.debug("curMonth 값 -> {}", curMonth);
		log.debug("year 값 -> {}", year);
		log.debug("FranchiseSalesAnalysisServiceImpl -> 데이터 확인 끝");
		
		// return해줄 vo객체
		FranchiseSalesAnalysisVO fsVO = new FranchiseSalesAnalysisVO();
		
		fsVO.setFrcsId(frcsId);
		fsVO.setFrcsName(frcsName);
		fsVO.setCurMonth(curMonth);
		fsVO.setFrcsCost(frcsCost);
		
		// totalPrice를 받아오기위해 (연도, total로 들어옴)
		List<FranchiseSalesAnalysisVO> monthTotal = mapper.selectAllPrice(fsaVO);
		
		for (FranchiseSalesAnalysisVO faVO : monthTotal) {
			
			log.info("매출총액");
			log.info("For문돌면서 조건비교");
			log.debug("year == faVO.getYear() -> {} {}",year , faVO.getYear());
			
			if(year == faVO.getYear()) {
				fsVO.setYear(faVO.getYear());
				fsVO.setTotalPrice(faVO.getTotalPrice());
			}
			log.info("For문돌면서 조건비교 끝");
			
		}
		
		log.debug("fsVO에 세팅잘돼있는지? -> fsVO 값 -> {}", fsVO.toString());
		
		List<FranchiseSalesAnalysisVO> rowal = mapper.selectRowal(fsaVO);
		
		for (FranchiseSalesAnalysisVO faVO : rowal) {
			log.info("로얄티");
			log.info("For문돌면서 조건비교");
			log.debug("year == faVO.getYear() -> {} {}",year , faVO.getYear());
			if(year == faVO.getYear()) {
				fsVO.setYear(faVO.getYear());
				fsVO.setFrcsRowal(faVO.getFrcsRowal());
			}
			log.debug("세팅된 로얄티 -> {}", faVO.getFrcsRowal());
			log.info("For문돌면서 조건비교 끝");
			
		}
		
		// 인건비
		int personCost;	
		
		switch(curMonth) {
		case 1 : 
			personCost = 4302220;
			fsVO.setPersonCost(personCost);
			break;
		case 2 : 
			personCost = 5201100;
			fsVO.setPersonCost(personCost);
			break;
		case 3 : 
			personCost = 4803301;
			fsVO.setPersonCost(personCost);
			break;
		case 4 : 
			personCost = 4677020;
			fsVO.setPersonCost(personCost);
			break;
		case 5 : 
			personCost = 6260521;
			fsVO.setPersonCost(personCost);
			break;
		case 6 : 
			personCost = 5802300;
			fsVO.setPersonCost(personCost);
			break;
		case 7 : 
			personCost = 5920500;
			fsVO.setPersonCost(personCost);
			break;
		case 8 : 
			personCost = 6002200;
			fsVO.setPersonCost(personCost);
			break;
		case 9 : 
			personCost = 4724200;
			fsVO.setPersonCost(personCost);
			break;
		case 10 : 
			personCost = 4563000;
			fsVO.setPersonCost(personCost);
			break;
		case 11 : 
			personCost = 4653000;
			fsVO.setPersonCost(personCost);
			break;
		case 12 : 
			personCost = 4989000;
			fsVO.setPersonCost(personCost);
			break;
		}
		
		// 공과금(수도세 + 전기세 + 가스비 + 월세)
		int dues = 0;	
		String strYear = String.valueOf(year);
		String sMonth = curMonth < 10 ? "0" + curMonth : curMonth + "";
		String yearMonth = strYear + "-" + sMonth;
		log.info("공과금 도출하기위한 조건");
		log.info("yearMonth -> ", yearMonth);
		
		fsVO.setYearMonth(yearMonth);
		
		dues = mapper.selectPublicDuesTotal(fsVO);
		log.debug("세팅된 공과금 합 -> {}", dues);
		
		fsVO.setPublicduesTotal(dues);
		
		// 판매비와관리비
		int variableCost = 0;
			variableCost += fsVO.getFrcsCost() + fsVO.getFrcsRowal();
			variableCost += fsVO.getPersonCost() + fsVO.getPublicduesTotal();
		
		log.debug("세팅된 변동비 합 -> {}", variableCost);
		fsVO.setVariableCost(variableCost);	
		
		// 매입가(가맹점이 본사에게 발주한금액)
		int purchasePrice = mapper.selectPurchasePrice(fsVO);
		log.debug("세팅된 {}월 매입가 -> {}", yearMonth, variableCost);
		fsVO.setPurchasePrice(purchasePrice);
		
		// 매출원가(총매출액 - 매입가)
		int originPrice = fsVO.getTotalPrice() - fsVO.getPurchasePrice();
		log.debug("세팅된 매출원가 -> {}", originPrice);
		fsVO.setOriginPrice(originPrice);
		
		// 영업이익(매출원가 - 판매비와관리비)
		int profitPrice = fsVO.getOriginPrice() - fsVO.getVariableCost();	
		fsVO.setProfitPrice(profitPrice);
		log.debug("세팅된 영업이익 -> {}", profitPrice);
		
		// 당기순이익(영업이익 - 세금(10%))
		int incomePrice = fsVO.getProfitPrice() - (fsVO.getTotalPrice() / 10);
		fsVO.setIncomePrice(incomePrice);
		log.debug("세팅된 당기순이익 -> {}", incomePrice);
		
		return fsVO;
	}
	
	// 해당연도 12개월 차트 데이터
	@Override
	public FranchiseSalesAnalysisVO selectChartSalesData(FranchiseSalesAnalysisVO fsaVO) {
		
		String frcsId = fsaVO.getFrcsId();
		String frcsName = fsaVO.getFrcsName();
		int year = fsaVO.getYear();
		
		log.info("======================================================");
		log.info("차트데이터 불러오는 서비스 frcsId -> {}", frcsId);
		log.info("차트데이터 불러오는 서비스 frcsName -> {}", frcsName);
		log.info("차트데이터 불러오는 서비스 year -> {}", year);
		log.info("======================================================");
		
		FranchiseSalesAnalysisVO frcs = new FranchiseSalesAnalysisVO();
		
		frcs.setFrcsId(frcsId);
		frcs.setFrcsName(frcsName);
		frcs.setYear(year);
		
		for (int i = 1; i <= 12; i++) {
			
			frcs.setCurMonth(i);
			int month = 0;
			if(i == 1) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setJanuary(month);
			}else if(i == 2) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setFebruary(month);
			}else if(i == 3) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setMarch(month);
			}else if(i == 4) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setApril(month);
			}else if(i == 5) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setMay(month);
			}else if(i == 6) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setJune(month);
			}else if(i == 7) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setJuly(month);
			}else if(i == 8) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setAugust(month);
			}else if(i == 9) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setSeptember(month);
			}else if(i == 10) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setOctober(month);
			}else if(i == 11) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setNovember(month);
			}else if(i == 12) {
				month = mapper.selectAllMonthData(frcs);
				frcs.setDecember(month);
			}
			
		}
		
		for (int i = 1; i <= 12 ; i++) {
			
			// 가맹비
			int frcsCost = 500000;
			
//			int curMonth = fsaVO.getCurMonth();
			
			log.info("================================================================");
			log.debug("차트에 그려줄 당기순이익구하기위한 서비스로직 -> 데이터 확인");
			log.debug("frcsId 값 -> {}", frcsId);
			log.debug("frcsName 값 -> {}", frcsName);
			log.debug("curMonth 값 -> {}", i);
			log.debug("year 값 -> {}", year);
			log.debug("차트에 그려줄 당기순이익구하기위한 서비스로직 -> 데이터 확인 끝");
			log.info("================================================================");
			
			// return해줄 vo객체
			FranchiseSalesAnalysisVO fsVO = new FranchiseSalesAnalysisVO();
			
			fsVO.setFrcsId(frcsId);
			fsVO.setFrcsName(frcsName);
			fsVO.setCurMonth(i);
			fsVO.setFrcsCost(frcsCost);
			fsVO.setYear(year); 
			
			// totalPrice를 받아오기위해 (연도, total로 들어옴)
			List<FranchiseSalesAnalysisVO> monthTotal = mapper.selectAllPrice(fsVO);
			
			for (FranchiseSalesAnalysisVO faVO : monthTotal) {
				
				log.info("매출총액");
				log.info("For문돌면서 조건비교");
				log.debug("year == faVO.getYear() -> {} {}",year , faVO.getYear());
				
				if(year == faVO.getYear()) {
					fsVO.setYear(faVO.getYear());
					fsVO.setTotalPrice(faVO.getTotalPrice());
				}
				log.info("For문돌면서 조건비교 끝");
				
			}
			
			log.debug("fsVO에 세팅잘돼있는지? -> fsVO 값 -> {}", fsVO.toString());
			
			List<FranchiseSalesAnalysisVO> rowal = mapper.selectRowal(fsVO);
			
			for (FranchiseSalesAnalysisVO faVO : rowal) {
				log.info("로얄티");
				log.info("For문돌면서 조건비교");
				log.debug("year == faVO.getYear() -> {} {}",year , faVO.getYear());
				if(year == faVO.getYear()) {
					fsVO.setYear(faVO.getYear());
					fsVO.setFrcsRowal(faVO.getFrcsRowal());
				}
				log.debug("세팅된 로얄티 -> {}", faVO.getFrcsRowal());
				log.info("For문돌면서 조건비교 끝");
				
			}
			
			// 인건비
			int personCost;	
			
			switch(i) {
			case 1 : 
				personCost = 4302220;
				fsVO.setPersonCost(personCost);
				break;
			case 2 : 
				personCost = 5201100;
				fsVO.setPersonCost(personCost);
				break;
			case 3 : 
				personCost = 4803301;
				fsVO.setPersonCost(personCost);
				break;
			case 4 : 
				personCost = 4677020;
				fsVO.setPersonCost(personCost);
				break;
			case 5 : 
				personCost = 6260521;
				fsVO.setPersonCost(personCost);
				break;
			case 6 : 
				personCost = 5802300;
				fsVO.setPersonCost(personCost);
				break;
			case 7 : 
				personCost = 5920500;
				fsVO.setPersonCost(personCost);
				break;
			case 8 : 
				personCost = 6002200;
				fsVO.setPersonCost(personCost);
				break;
			case 9 : 
				personCost = 4724200;
				fsVO.setPersonCost(personCost);
				break;
			case 10 : 
				personCost = 4563000;
				fsVO.setPersonCost(personCost);
				break;
			case 11 : 
				personCost = 4653000;
				fsVO.setPersonCost(personCost);
				break;
			case 12 : 
				personCost = 4989000;
				fsVO.setPersonCost(personCost);
				break;
			}
			
			// 공과금(수도세 + 전기세 + 가스비 + 월세)
			int dues = 0;	
			String strYear = String.valueOf(year);
			String sMonth = i < 10 ? "0" + i : i + "";
			String yearMonth = strYear + "-" + sMonth;
			log.info("공과금 도출하기위한 조건");
			log.info("yearMonth -> ", yearMonth);
			
			fsVO.setYearMonth(yearMonth);
			
			dues = mapper.selectPublicDuesTotal(fsVO);
			log.debug("세팅된 공과금 합 -> {}", dues);
			
			fsVO.setPublicduesTotal(dues);
			
			// 판매비와관리비
			int variableCost = 0;
				variableCost += fsVO.getFrcsCost() + fsVO.getFrcsRowal();
				variableCost += fsVO.getPersonCost() + fsVO.getPublicduesTotal();
			
			log.debug("세팅된 변동비 합 -> {}", variableCost);
			fsVO.setVariableCost(variableCost);	
			
			// 매입가(가맹점이 본사에게 발주한금액)
			int purchasePrice = mapper.selectPurchasePrice(fsVO);
			log.debug("세팅된 {}월 매입가 -> {}", yearMonth, variableCost);
			fsVO.setPurchasePrice(purchasePrice);
			
			// 매출원가(총매출액 - 매입가)
			int originPrice = fsVO.getTotalPrice() - fsVO.getPurchasePrice();
			log.debug("세팅된 매출원가 -> {}", originPrice);
			fsVO.setOriginPrice(originPrice);
			
			// 영업이익(매출원가 - 판매비와관리비)
			int profitPrice = fsVO.getOriginPrice() - fsVO.getVariableCost();	
			fsVO.setProfitPrice(profitPrice);
			log.debug("세팅된 영업이익 -> {}", profitPrice);
			
			// 당기순이익(영업이익 - 세금(10%))
			int incomePrice = fsVO.getProfitPrice() - (fsVO.getTotalPrice() / 10);
			if(profitPrice < 0) {
				incomePrice = 0;
			}else {
				fsVO.setIncomePrice(incomePrice);
			}
			log.debug("세팅된 당기순이익 -> {}", incomePrice);
						
			if(i == 1) {
				frcs.setOneIncome(incomePrice);
				log.info("1월 당기순이익 -> ", fsVO.getOneIncome());
			}else if(i == 2) {
				frcs.setTwoIncome(incomePrice);
				log.info("2월 당기순이익 -> ", fsVO.getTwoIncome());
			}else if(i == 3) {
				frcs.setThreeIncome(incomePrice);
				log.info("3월 당기순이익 -> ", fsVO.getThreeIncome());
			}else if(i == 4) {
				frcs.setFourIncome(incomePrice);
				log.info("4월 당기순이익 -> ", fsVO.getFourIncome());
			}else if(i == 5) {
				frcs.setFiveIncome(incomePrice);
				log.info("5월 당기순이익 -> ", fsVO.getFiveIncome());
			}else if(i == 6) {
				frcs.setSixIncome(incomePrice);
				log.info("6월 당기순이익 -> ", fsVO.getSixIncome());
			}else if(i == 7) {
				frcs.setSevenIncome(incomePrice);
				log.info("7월 당기순이익 -> ", fsVO.getSevenIncome());
			}else if(i == 8) {
				frcs.setEightIncome(incomePrice);
				log.info("8월 당기순이익 -> ", fsVO.getEightIncome());
			}else if(i == 9) {
				frcs.setNineIncome(incomePrice);
				log.info("9월 당기순이익 -> ", fsVO.getNineIncome());
			}else if(i == 10) {
				frcs.setTenIncome(incomePrice);
				log.info("10월 당기순이익 -> ", fsVO.getTenIncome());
			}else if(i == 11) {
				frcs.setElevenIncome(incomePrice);
				log.info("11월 당기순이익 -> ", fsVO.getElevenIncome());
			}else if(i == 12) {
				frcs.setTwelveIncome(incomePrice);
				log.info("12월 당기순이익 -> ", fsVO.getTwelveIncome());
			}
			
			
		}
		
		return frcs;
	}

	
}
