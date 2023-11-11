package kr.or.ddit.service.head;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.head.SalesAnalysisMapper;
import kr.or.ddit.vo.head.HeadMonthVO;

@Service
public class SalesAnalysisServiceImpl implements ISalesAnalysisService {

	@Inject
	private SalesAnalysisMapper mapper;

	/**
	 * 본사매출 페이지 로드시 서비스 로직
	 * for문을 통해 리스트를 조회하고
	 * case문을 통해 해당하는 월별 데이터 대입
	 * 향상된 for문을 통해 최종 선택할 월의 데이터 리턴
	 * return List<HeadMonthVO> 타입으로 리턴 
	 */
	@Override
	public List<HeadMonthVO> headmonthChart() {
		
		List<HeadMonthVO> headmonthVO = mapper.headmonthChart();
		
		List<HeadMonthVO> headmonthList = new ArrayList<HeadMonthVO>();
		
		for(int i = 0; i < headmonthVO.size(); i++) {
			
			HeadMonthVO monthVO = new HeadMonthVO();
			
			switch(i) {
				case 0 :
					// 1월 담을 변수
					String janmonth = headmonthVO.get(0).getMonth();
					int janfrcsAmt = headmonthVO.get(0).getMonthfrcsAmt();
					int janpurchasePrice = headmonthVO.get(0).getMonthpurchasePrice();
					int janfrcsRowal = (int) (headmonthVO.get(0).getMonthfrcsRowal()*0.03);
					int janfrcsorderAmt = headmonthVO.get(0).getMonthfrcsorderAmt();
					int janspersonalCost = headmonthVO.get(0).getMonthfrcspersonalCost();
					
					// 1월 담을 객체
					monthVO.setMonth(janmonth);
					monthVO.setMonthtotalPrice(janfrcsAmt + janfrcsRowal + janfrcsorderAmt - janpurchasePrice);
					monthVO.setMonthtotalselngPrice(janfrcsorderAmt - janpurchasePrice);
					monthVO.setMonthfrcsorderAmt(janfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(janfrcsAmt + janfrcsRowal + janspersonalCost);
					monthVO.setMonthfrcsAmt(janfrcsAmt);
					monthVO.setMonthfrcsRowal(janfrcsRowal);
					monthVO.setMonthfrcspersonalCost(janspersonalCost);
					monthVO.setMonthCogs(janfrcsAmt + janfrcsRowal + janfrcsorderAmt - janpurchasePrice - janpurchasePrice);
					monthVO.setMonthpurchasePrice(janpurchasePrice);
					int janprofitPrice = monthVO.getMonthCogs() - janspersonalCost;
					monthVO.setMonthtotalprofitPrice(janprofitPrice);
					int janincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(janincomePrice);
					break;
				case 1 :
					int febfrcsAmt = 0;
					for(int a = 0; a < 2; a++ ) {
						febfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 2월 담을 변수
					String febmonth = headmonthVO.get(1).getMonth();
					int febpurchasePrice = headmonthVO.get(1).getMonthpurchasePrice();
					int febfrcsRowal = (int) (headmonthVO.get(1).getMonthfrcsRowal()*0.03);
					int febfrcsorderAmt = headmonthVO.get(1).getMonthfrcsorderAmt();
					int febfrcspersonalCost = headmonthVO.get(1).getMonthfrcspersonalCost();
					
					// 2월 담을 객체
					monthVO.setMonth(febmonth);
					monthVO.setMonthtotalPrice(febfrcsAmt + febfrcsRowal + febfrcsorderAmt - febpurchasePrice);
					monthVO.setMonthtotalselngPrice(febfrcsorderAmt - febpurchasePrice);
					monthVO.setMonthfrcsorderAmt(febfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(febfrcsAmt + febfrcsRowal + febfrcspersonalCost);
					monthVO.setMonthfrcsAmt(febfrcsAmt);
					monthVO.setMonthfrcsRowal(febfrcsRowal);
					monthVO.setMonthfrcspersonalCost(febfrcspersonalCost);
					monthVO.setMonthCogs(febfrcsAmt + febfrcsRowal + febfrcsorderAmt - febpurchasePrice - febpurchasePrice);
					monthVO.setMonthpurchasePrice(febpurchasePrice);
					int febprofitPrice = monthVO.getMonthCogs() - febfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(febprofitPrice);
					int febincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(febincomePrice);
					break;
				case 2 :
					int marfrcsAmt = 0;
					for(int a = 0; a < 3; a++ ) {
						marfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 3월 담을 변수
					String marmonth = headmonthVO.get(2).getMonth();
					int marpurchasePrice = headmonthVO.get(2).getMonthpurchasePrice();
					int marfrcsRowal = (int) (headmonthVO.get(2).getMonthfrcsRowal()*0.03);
					int marfrcsorderAmt = headmonthVO.get(2).getMonthfrcsorderAmt();
					int marfrcspersonalCost = headmonthVO.get(2).getMonthfrcspersonalCost();
					
					// 3월 담을 객체
					monthVO.setMonth(marmonth);
					monthVO.setMonthtotalPrice(marfrcsAmt + marfrcsRowal + marfrcsorderAmt - marpurchasePrice);
					monthVO.setMonthtotalselngPrice(marfrcsorderAmt - marpurchasePrice);
					monthVO.setMonthfrcsorderAmt(marfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(marfrcsAmt + marfrcsRowal + marfrcspersonalCost);
					monthVO.setMonthfrcsAmt(marfrcsAmt);
					monthVO.setMonthfrcsRowal(marfrcsRowal);
					monthVO.setMonthfrcspersonalCost(marfrcspersonalCost);
					monthVO.setMonthCogs(marfrcsAmt + marfrcsRowal + marfrcsorderAmt - marpurchasePrice - marpurchasePrice);
					monthVO.setMonthpurchasePrice(marpurchasePrice);
					int marprofitPrice = monthVO.getMonthCogs() - marfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(marprofitPrice);
					int marincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(marincomePrice);
					break;
				case 3 :
					int aprfrcsAmt = 0;
					for(int a = 0; a < 4; a++ ) {
						aprfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
	
					// 4월 담을 변수
					String aprmonth = headmonthVO.get(3).getMonth();
					int aprpurchasePrice = headmonthVO.get(3).getMonthpurchasePrice();
					int aprfrcsRowal = (int) (headmonthVO.get(3).getMonthfrcsRowal()*0.03);
					int aprfrcsorderAmt = headmonthVO.get(3).getMonthfrcsorderAmt();
					int aprfrcspersonalCost = headmonthVO.get(3).getMonthfrcspersonalCost();
					
					// 4월 담을 객체
					monthVO.setMonth(aprmonth);
					monthVO.setMonthtotalPrice(aprfrcsAmt + aprfrcsRowal + aprfrcsorderAmt - aprpurchasePrice);
					monthVO.setMonthtotalselngPrice(aprfrcsorderAmt - aprpurchasePrice);
					monthVO.setMonthfrcsorderAmt(aprfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(aprfrcsAmt + aprfrcsRowal + aprfrcspersonalCost);
					monthVO.setMonthfrcsAmt(aprfrcsAmt);
					monthVO.setMonthfrcsRowal(aprfrcsRowal);
					monthVO.setMonthfrcspersonalCost(aprfrcspersonalCost);
					monthVO.setMonthCogs(aprfrcsAmt + aprfrcsRowal + aprfrcsorderAmt - aprpurchasePrice - aprpurchasePrice);
					monthVO.setMonthpurchasePrice(aprpurchasePrice);
					int aprprofitPrice = monthVO.getMonthCogs() - aprfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(aprprofitPrice);
					int aprincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(aprincomePrice);
					break;
				case 4 :
					int mayfrcsAmt = 0;
					for(int a = 0; a < 5; a++ ) {
						mayfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 5월 담을 변수
					String maymonth = headmonthVO.get(4).getMonth();
					int maypurchasePrice = headmonthVO.get(4).getMonthpurchasePrice();
					int mayfrcsRowal = (int) (headmonthVO.get(4).getMonthfrcsRowal()*0.03);
					int mayfrcsorderAmt = headmonthVO.get(4).getMonthfrcsorderAmt();
					int mayfrcspersonalCost = headmonthVO.get(4).getMonthfrcspersonalCost();
					
					// 5월 담을 객체
					monthVO.setMonth(maymonth);
					monthVO.setMonthtotalPrice(mayfrcsAmt + mayfrcsRowal + mayfrcsorderAmt - maypurchasePrice);
					monthVO.setMonthtotalselngPrice(mayfrcsorderAmt - maypurchasePrice);
					monthVO.setMonthfrcsorderAmt(mayfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(mayfrcsAmt + mayfrcsRowal + mayfrcspersonalCost);
					monthVO.setMonthfrcsAmt(mayfrcsAmt);
					monthVO.setMonthfrcsRowal(mayfrcsRowal);
					monthVO.setMonthfrcspersonalCost(mayfrcspersonalCost);
					monthVO.setMonthCogs(mayfrcsAmt + mayfrcsRowal + mayfrcsorderAmt - maypurchasePrice - maypurchasePrice);
					monthVO.setMonthpurchasePrice(maypurchasePrice);
					int mayprofitPrice = monthVO.getMonthCogs() - mayfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(mayprofitPrice);
					int mayincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(mayincomePrice);
					break;
				case 5 :
					int junfrcsAmt = 0;
					for(int a = 0; a < 6; a++ ) {
						junfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 6월 담을 변수 
					String junmonth = headmonthVO.get(5).getMonth();
					int junpurchasePrice = headmonthVO.get(5).getMonthpurchasePrice();
					int junfrcsRowal = (int) (headmonthVO.get(5).getMonthfrcsRowal()*0.03);
					int junfrcsorderAmt = headmonthVO.get(5).getMonthfrcsorderAmt();
					int junfrcspersonalCost = headmonthVO.get(5).getMonthfrcspersonalCost();
					
					// 6월 담을 객체
					monthVO.setMonth(junmonth);
					monthVO.setMonthtotalPrice(junfrcsAmt + junfrcsRowal + junfrcsorderAmt - junpurchasePrice);
					monthVO.setMonthtotalselngPrice(junfrcsorderAmt - junpurchasePrice);
					monthVO.setMonthfrcsorderAmt(junfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(junfrcsAmt + junfrcsRowal + junfrcspersonalCost);
					monthVO.setMonthfrcsAmt(junfrcsAmt);
					monthVO.setMonthfrcsRowal(junfrcsRowal);
					monthVO.setMonthfrcspersonalCost(junfrcspersonalCost);
					monthVO.setMonthCogs(junfrcsAmt + junfrcsRowal + junfrcsorderAmt - junpurchasePrice - junpurchasePrice);
					monthVO.setMonthpurchasePrice(junpurchasePrice);
					int junprofitPrice = monthVO.getMonthCogs() - junfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(junprofitPrice);
					int junincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(junincomePrice);
					break;
				case 6 :
					int julyfrcsAmt = 0;
					for(int a = 0; a < 7; a++ ) {
						julyfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 7월 담을 변수
					String julymonth = headmonthVO.get(6).getMonth();
					int julypurchasePrice = headmonthVO.get(6).getMonthpurchasePrice();
					int julyfrcsRowal = (int) (headmonthVO.get(6).getMonthfrcsRowal()*0.03);
					int julyfrcsorderAmt = headmonthVO.get(6).getMonthfrcsorderAmt();
					int julyfrcspersonalCost = headmonthVO.get(6).getMonthfrcspersonalCost();
					
					// 7월 담을 객체
					monthVO.setMonth(julymonth);
					monthVO.setMonthtotalPrice(julyfrcsAmt + julyfrcsRowal + julyfrcsorderAmt - julypurchasePrice);
					monthVO.setMonthtotalselngPrice(julyfrcsorderAmt - julypurchasePrice);
					monthVO.setMonthfrcsorderAmt(julyfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(julyfrcsAmt + julyfrcsRowal + julyfrcspersonalCost);
					monthVO.setMonthfrcsAmt(julyfrcsAmt);
					monthVO.setMonthfrcsRowal(julyfrcsRowal);
					monthVO.setMonthfrcspersonalCost(julyfrcspersonalCost);
					monthVO.setMonthCogs(julyfrcsAmt + julyfrcsRowal + julyfrcsorderAmt - julypurchasePrice - julypurchasePrice);
					monthVO.setMonthpurchasePrice(julypurchasePrice);
					int julyprofitPrice = monthVO.getMonthCogs() - julyfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(julyprofitPrice);
					int julyincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(julyincomePrice);
					break;
				case 7 :
					int augfrcsAmt = 0;
					for(int a = 0; a < 8; a++ ) {
						augfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 8월 담을 변수
					String augmonth = headmonthVO.get(7).getMonth();
					int augpurchasePrice = headmonthVO.get(7).getMonthpurchasePrice();
					int augfrcsRowal = (int) (headmonthVO.get(7).getMonthfrcsRowal()*0.03);
					int augfrcsorderAmt = headmonthVO.get(7).getMonthfrcsorderAmt();
					int augfrcspersonalCost = headmonthVO.get(7).getMonthfrcspersonalCost();
					
					// 8월 담을 객체
					monthVO.setMonth(augmonth);
					monthVO.setMonthtotalPrice(augfrcsAmt + augfrcsRowal + augfrcsorderAmt - augpurchasePrice);
					monthVO.setMonthtotalselngPrice(augfrcsorderAmt - augpurchasePrice);
					monthVO.setMonthfrcsorderAmt(augfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(augfrcsAmt + augfrcsRowal + augfrcspersonalCost);
					monthVO.setMonthfrcsAmt(augfrcsAmt);
					monthVO.setMonthfrcsRowal(augfrcsRowal);
					monthVO.setMonthfrcspersonalCost(augfrcspersonalCost);
					monthVO.setMonthCogs(augfrcsAmt + augfrcsRowal + augfrcsorderAmt - augpurchasePrice - augpurchasePrice);
					monthVO.setMonthpurchasePrice(augpurchasePrice);
					int augprofitPrice = monthVO.getMonthCogs() - augfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(augprofitPrice);
					int augincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(augincomePrice);
					break;
				case 8 :
					int sepfrcsAmt = 0;
					for(int a = 0; a < 9; a++ ) {
						sepfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 9월 담을 변수
					String sepmonth = headmonthVO.get(8).getMonth();
					int seppurchasePrice = headmonthVO.get(8).getMonthpurchasePrice();
					int sepfrcsRowal = (int) (headmonthVO.get(8).getMonthfrcsRowal()*0.03);
					int sepfrcsorderAmt = headmonthVO.get(8).getMonthfrcsorderAmt();
					int sepfrcspersonalCost = headmonthVO.get(8).getMonthfrcspersonalCost();
					
					// 9월 담을 객체
					monthVO.setMonth(sepmonth);
					monthVO.setMonthtotalPrice(sepfrcsAmt + sepfrcsRowal + sepfrcsorderAmt - seppurchasePrice);
					monthVO.setMonthtotalselngPrice(sepfrcsorderAmt - seppurchasePrice);
					monthVO.setMonthfrcsorderAmt(sepfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(sepfrcsAmt + sepfrcsRowal + sepfrcspersonalCost);
					monthVO.setMonthfrcsAmt(sepfrcsAmt);
					monthVO.setMonthfrcsRowal(sepfrcsRowal);
					monthVO.setMonthfrcspersonalCost(sepfrcspersonalCost);
					monthVO.setMonthCogs(sepfrcsAmt + sepfrcsRowal + sepfrcsorderAmt - seppurchasePrice - seppurchasePrice);
					monthVO.setMonthpurchasePrice(seppurchasePrice);
					int sepprofitPrice = monthVO.getMonthCogs() - sepfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(sepprofitPrice);
					int sepincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(sepincomePrice);
					break;
				case 9 :
					int octfrcsAmt = 0;
					for(int a = 0; a < 10; a++ ) {
						octfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 10월 담을 변수
					String octmonth = headmonthVO.get(9).getMonth();
					int octpurchasePrice = headmonthVO.get(9).getMonthpurchasePrice();
					int octfrcsRowal = (int) (headmonthVO.get(9).getMonthfrcsRowal()*0.03);
					int octfrcsorderAmt = headmonthVO.get(9).getMonthfrcsorderAmt();
					int octfrcspersonalCost = headmonthVO.get(9).getMonthfrcspersonalCost();
					
					// 10월 담을 객체
					monthVO.setMonth(octmonth);
					monthVO.setMonthtotalPrice(octfrcsAmt + octfrcsRowal + octfrcsorderAmt - octpurchasePrice);
					monthVO.setMonthtotalselngPrice(octfrcsorderAmt - octpurchasePrice);
					monthVO.setMonthfrcsorderAmt(octfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(octfrcsAmt + octfrcsRowal + octfrcspersonalCost);
					monthVO.setMonthfrcsAmt(octfrcsAmt);
					monthVO.setMonthfrcsRowal(octfrcsRowal);
					monthVO.setMonthfrcspersonalCost(octfrcspersonalCost);
					monthVO.setMonthCogs(octfrcsAmt + octfrcsRowal + octfrcsorderAmt - octpurchasePrice - octpurchasePrice);
					monthVO.setMonthpurchasePrice(octpurchasePrice);
					int octprofitPrice = monthVO.getMonthCogs() - octfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(octprofitPrice);
					int octincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(octincomePrice);
					break;
				case 10 :
					int novfrcsAmt = 0;
					for(int a = 0; a < 11; a++ ) {
						novfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 11월 담을 변수
					String novmonth = headmonthVO.get(10).getMonth();
					int novpurchasePrice = headmonthVO.get(10).getMonthpurchasePrice();
					int novfrcsRowal = (int) (headmonthVO.get(10).getMonthfrcsRowal()*0.03);
					int novfrcsorderAmt = headmonthVO.get(10).getMonthfrcsorderAmt();
					int novfrcspersonalCost = headmonthVO.get(10).getMonthfrcspersonalCost();
					
					// 11월 담을 객체
					monthVO.setMonth(novmonth);
					monthVO.setMonthtotalPrice(novfrcsAmt + novfrcsRowal + novfrcsorderAmt - novpurchasePrice);
					monthVO.setMonthfrcsorderAmt(novfrcsorderAmt);
					monthVO.setMonthtotalselngPrice(novfrcsorderAmt - novpurchasePrice);
					monthVO.setMonthtotalselngPersonal(novfrcsAmt + novfrcsRowal + novfrcspersonalCost);
					monthVO.setMonthfrcsAmt(novfrcsAmt);
					monthVO.setMonthfrcsRowal(novfrcsRowal);
					monthVO.setMonthfrcspersonalCost(novfrcspersonalCost);
					monthVO.setMonthCogs(novfrcsAmt + novfrcsRowal + novfrcsorderAmt - novpurchasePrice - novpurchasePrice);
					monthVO.setMonthpurchasePrice(novpurchasePrice);
					int novprofitPrice = monthVO.getMonthCogs() - novfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(novprofitPrice);
					int novincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(novincomePrice);
					break;
				case 11 :
					int decfrcsAmt = 0;
					for(int a = 0; a < 12; a++ ) {
						decfrcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
					}
					
					// 12월 담을 변수
					String decmonth = headmonthVO.get(11).getMonth();
					int decpurchasePrice = headmonthVO.get(11).getMonthpurchasePrice();
					int decfrcsRowal = (int) (headmonthVO.get(11).getMonthfrcsRowal()*0.03);
					int decfrcsorderAmt = headmonthVO.get(11).getMonthfrcsorderAmt();
					int decfrcspersonalCost = headmonthVO.get(11).getMonthfrcspersonalCost();
					
					// 12월 담을 객체
					monthVO.setMonth(decmonth);
					monthVO.setMonthtotalPrice(decfrcsAmt + decfrcsRowal + decfrcsorderAmt - decpurchasePrice);
					monthVO.setMonthtotalselngPrice(decfrcsorderAmt - decpurchasePrice);
					monthVO.setMonthfrcsorderAmt(decfrcsorderAmt);
					monthVO.setMonthtotalselngPersonal(decfrcsAmt + decfrcsRowal + decfrcspersonalCost);
					monthVO.setMonthfrcsAmt(decfrcsAmt);
					monthVO.setMonthfrcsRowal(decfrcsRowal);
					monthVO.setMonthfrcspersonalCost(decfrcspersonalCost);
					monthVO.setMonthCogs(decfrcsAmt + decfrcsRowal + decfrcsorderAmt - decpurchasePrice - decpurchasePrice);
					monthVO.setMonthpurchasePrice(decpurchasePrice);
					int decprofitPrice = monthVO.getMonthCogs() - decfrcspersonalCost;
					monthVO.setMonthtotalprofitPrice(decprofitPrice);
					int decincomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
					monthVO.setMonthtotalincomePrice(decincomePrice);
					break;
			}
			headmonthList.add(monthVO);
		}
		return headmonthList;
	}
	
	/**
	 * 해당년도 선택할 월별 총계
	 * for문을 통해 리스트를 조회하고
	 * 향상된 for문을 통해 최종 선택할 월의 데이터 리턴
	 * return HeadMonthVO 타입으로 리턴
	 */
	@Override
	public HeadMonthVO selectheadmonthChart(HeadMonthVO month) {
		
		List<HeadMonthVO> headmonthVO = mapper.headmonthChart();
		
		List<HeadMonthVO> headmonthList = new ArrayList<HeadMonthVO>();
		
		for(int i = 0; i < headmonthVO.size(); i++) {
			
			HeadMonthVO monthVO = new HeadMonthVO();
			
			int frcsAmt = 0;
		    for (int a = 0; a <= i; a++) {
		    	frcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
		    }

		    String months = headmonthVO.get(i).getMonth();
		    int purchasePrice = headmonthVO.get(i).getMonthpurchasePrice();
		    int frcsRowal = (int) (headmonthVO.get(i).getMonthfrcsRowal() * 0.03);
		    int frcsorderAmt = headmonthVO.get(i).getMonthfrcsorderAmt();
		    int frcspersonalCost = headmonthVO.get(i).getMonthfrcspersonalCost();

		    monthVO.setMonth(months);
		    monthVO.setMonthtotalPrice(frcsAmt + frcsRowal + frcsorderAmt - purchasePrice);
		    monthVO.setMonthtotalselngPrice(frcsorderAmt - purchasePrice);
		    monthVO.setMonthfrcsorderAmt(frcsorderAmt);
		    monthVO.setMonthtotalselngPersonal(frcsAmt + frcsRowal + frcspersonalCost);
		    monthVO.setMonthfrcsAmt(frcsAmt);
		    monthVO.setMonthfrcsRowal(frcsRowal);
		    monthVO.setMonthfrcspersonalCost(frcspersonalCost);
		    monthVO.setMonthCogs(frcsAmt + frcsRowal + frcsorderAmt - purchasePrice - purchasePrice);
		    monthVO.setMonthpurchasePrice(purchasePrice);
			int profitPrice = monthVO.getMonthCogs() - frcspersonalCost;
			monthVO.setMonthtotalprofitPrice(profitPrice);
			int incomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
			monthVO.setMonthtotalincomePrice(incomePrice);
		    
			headmonthList.add(monthVO);
		}
		
		HeadMonthVO selectmonth = null;
		
		for(HeadMonthVO selectheadmonth : headmonthList) {
			if(selectheadmonth.getMonth().equals(month.getMonth())) {
				selectmonth = selectheadmonth;
				break;
			}
		}
		return selectmonth;
	}

	/**
	 * 해당년도 all 선택시 ajax 서비스 로직
	 * for문을 통해 리스트를 조회하고
	 * 향상된 for문을 통해 최종 선택할 월의 데이터 리턴
	 * return HeadMonthVO 타입으로 리턴
	 */
	@Override
	public List<HeadMonthVO> allheadmonthChart() {
		
		List<HeadMonthVO> headmonthVO = mapper.headmonthChart();
		
		List<HeadMonthVO> headmonthList = new ArrayList<HeadMonthVO>();
		
		for(int i = 0; i < headmonthVO.size(); i++) {
			
			HeadMonthVO monthVO = new HeadMonthVO();
			
			int frcsAmt = 0;
		    for (int a = 0; a <= i; a++) {
		    	frcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
		    }

		    String months = headmonthVO.get(i).getMonth();
		    int purchasePrice = headmonthVO.get(i).getMonthpurchasePrice();
		    int frcsRowal = (int) (headmonthVO.get(i).getMonthfrcsRowal() * 0.03);
		    int frcsorderAmt = headmonthVO.get(i).getMonthfrcsorderAmt();
		    int frcspersonalCost = headmonthVO.get(i).getMonthfrcspersonalCost();

		    monthVO.setMonth(months);
		    monthVO.setMonthtotalPrice(frcsAmt + frcsRowal + frcsorderAmt - purchasePrice);
		    monthVO.setMonthtotalselngPrice(frcsorderAmt - purchasePrice);
		    monthVO.setMonthfrcsorderAmt(frcsorderAmt);
		    monthVO.setMonthtotalselngPersonal(frcsAmt + frcsRowal + frcspersonalCost);
		    monthVO.setMonthfrcsAmt(frcsAmt);
		    monthVO.setMonthfrcsRowal(frcsRowal);
		    monthVO.setMonthfrcspersonalCost(frcspersonalCost);
		    monthVO.setMonthCogs(frcsAmt + frcsRowal + frcsorderAmt - purchasePrice - purchasePrice);
		    monthVO.setMonthpurchasePrice(purchasePrice);
			int profitPrice = monthVO.getMonthCogs() - frcspersonalCost;
			monthVO.setMonthtotalprofitPrice(profitPrice);
			int incomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
			monthVO.setMonthtotalincomePrice(incomePrice);
		    
			headmonthList.add(monthVO);
		}
		return headmonthList;
	}

	/**
	 * 해당년도 분기 선택시 ajax 서비스 로직
	 * for문을 통해 리스트를 조회하고
	 * 향상된 for문을 통해 최종 선택할 월의 데이터 리턴
	 * return HeadMonthVO 타입으로 리턴
	 */
	@Override
	public List<HeadMonthVO> quarterheadmonthChart() {
		
		List<HeadMonthVO> headmonthVO = mapper.headmonthChart();
		
		List<HeadMonthVO> headmonthList = new ArrayList<HeadMonthVO>();
		
		for(int i = 0; i < headmonthVO.size(); i++) {
			
			HeadMonthVO monthVO = new HeadMonthVO();
			
			int frcsAmt = 0;
		    for (int a = 0; a <= i; a++) {
		    	frcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
		    }

		    String months = headmonthVO.get(i).getMonth();
		    int purchasePrice = headmonthVO.get(i).getMonthpurchasePrice();
		    int frcsRowal = (int) (headmonthVO.get(i).getMonthfrcsRowal() * 0.03);
		    int frcsorderAmt = headmonthVO.get(i).getMonthfrcsorderAmt();
		    int frcspersonalCost = headmonthVO.get(i).getMonthfrcspersonalCost();

		    monthVO.setMonth(months);
		    monthVO.setMonthtotalPrice(frcsAmt + frcsRowal + frcsorderAmt - purchasePrice);
		    monthVO.setMonthtotalselngPrice(frcsorderAmt - purchasePrice);
		    monthVO.setMonthfrcsorderAmt(frcsorderAmt);
		    monthVO.setMonthtotalselngPersonal(frcsAmt + frcsRowal + frcspersonalCost);
		    monthVO.setMonthfrcsAmt(frcsAmt);
		    monthVO.setMonthfrcsRowal(frcsRowal);
		    monthVO.setMonthfrcspersonalCost(frcspersonalCost);
		    monthVO.setMonthCogs(frcsAmt + frcsRowal + frcsorderAmt - purchasePrice - purchasePrice);
		    monthVO.setMonthpurchasePrice(purchasePrice);
			int profitPrice = monthVO.getMonthCogs() - frcspersonalCost;
			monthVO.setMonthtotalprofitPrice(profitPrice);
			int incomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
			monthVO.setMonthtotalincomePrice(incomePrice);
		    
			headmonthList.add(monthVO);
		}
		return headmonthList;
	}

	@Override
	public List<HeadMonthVO> quarterheadmonthChartDetails(HeadMonthVO quater) {
		List<HeadMonthVO> headmonthVO = mapper.quarterheadmonthChartDetails(quater);
		
		List<HeadMonthVO> quaterheadmonthList = new ArrayList<HeadMonthVO>();
		
		for(int i = 0; i < headmonthVO.size(); i++) {
			
			HeadMonthVO monthVO = new HeadMonthVO();
			
			int frcsAmt = 0;
		    for (int a = 0; a <= i; a++) {
		    	frcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
		    }

		    String months = headmonthVO.get(i).getMonth();
		    int purchasePrice = headmonthVO.get(i).getMonthpurchasePrice();
		    int frcsRowal = (int) (headmonthVO.get(i).getMonthfrcsRowal() * 0.03);
		    int frcsorderAmt = headmonthVO.get(i).getMonthfrcsorderAmt();
		    int frcspersonalCost = headmonthVO.get(i).getMonthfrcspersonalCost();

		    monthVO.setMonth(months);
		    monthVO.setMonthtotalPrice(frcsAmt + frcsRowal + frcsorderAmt - purchasePrice);
		    monthVO.setMonthtotalselngPrice(frcsorderAmt - purchasePrice);
		    monthVO.setMonthfrcsorderAmt(frcsorderAmt);
		    monthVO.setMonthtotalselngPersonal(frcsAmt + frcsRowal + frcspersonalCost);
		    monthVO.setMonthfrcsAmt(frcsAmt);
		    monthVO.setMonthfrcsRowal(frcsRowal);
		    monthVO.setMonthfrcspersonalCost(frcspersonalCost);
		    monthVO.setMonthCogs(frcsAmt + frcsRowal + frcsorderAmt - purchasePrice - purchasePrice);
		    monthVO.setMonthpurchasePrice(purchasePrice);
			int profitPrice = monthVO.getMonthCogs() - frcspersonalCost;
			monthVO.setMonthtotalprofitPrice(profitPrice);
			int incomePrice = (int) (monthVO.getMonthtotalprofitPrice() - (monthVO.getMonthtotalprofitPrice()*0.1)); 
			monthVO.setMonthtotalincomePrice(incomePrice);
		    
		    quaterheadmonthList.add(monthVO);
		}
		return quaterheadmonthList;
	}
	
	

	/**
	 * 해당년도 선택할 월별 총계
	 * for문을 통해 리스트를 조회하고
	 * case문을 통해 해당하는 월별 데이터 대입
	 * 향상된 for문을 통해 최종 선택할 월의 데이터 리턴
	 * return HeadMonthVO 타입으로 리턴
	 */
//	@Override
//	public HeadMonthVO selectheadmonthChart(HeadMonthVO month) {
//		
//		List<HeadMonthVO> headmonthVO = mapper.headmonthChart();
//		
//		List<HeadMonthVO> headmonthList = new ArrayList<HeadMonthVO>();
//		
//		for(int i = 0; i < headmonthVO.size(); i++) {
//			
//			HeadMonthVO monthVO = new HeadMonthVO();
//			
//			int frcsAmt = 0;
//		    for (int a = 0; a <= i; a++) {
//		    	frcsAmt += headmonthVO.get(a).getMonthfrcsAmt();
//		    }
//
//		    String months = headmonthVO.get(i).getMonth();
//		    int purchasePrice = headmonthVO.get(i).getMonthpurchasePrice();
//		    int frcsRowal = (int) (headmonthVO.get(i).getMonthfrcsRowal() * 0.03);
//		    int frcsorderAmt = headmonthVO.get(i).getMonthfrcsorderAmt();
//		    int frcspersonalCost = headmonthVO.get(i).getMonthfrcspersonalCost();
//
//		    monthVO.setMonth(months);
//		    monthVO.setMonthtotalPrice(frcsAmt + frcsRowal + frcsorderAmt - purchasePrice);
//		    monthVO.setMonthtotalselngPrice(frcsorderAmt - purchasePrice);
//		    monthVO.setMonthtotalselngPersonal(frcsAmt + frcsRowal + frcspersonalCost);
//		    monthVO.setMonthfrcsAmt(frcsAmt);
//		    monthVO.setMonthfrcsRowal(frcsRowal);
//		    monthVO.setMonthfrcspersonalCost(frcspersonalCost);
//		    monthVO.setMonthpurchasePrice(purchasePrice);
//		    monthVO.setMonthfrcsorderAmt(frcsorderAmt);
//		    
//			headmonthList.add(monthVO);
//		}
//		
//		HeadMonthVO selectmonth = null;
//		
//		for(HeadMonthVO selectheadmonth : headmonthList) {
//			if(selectheadmonth.getMonth().equals(month.getMonth())) {
//				selectmonth = selectheadmonth;
//				break;
//			}
//		}
//		return selectmonth;
//	}

//	/**
//	 * 본사 매출 서비스 로직
//	 * 
//	 * @param FeeVO
//	 */
//	@Override
//	public FeeVO headChart() {
//		
//		FeeVO feeVO = new FeeVO();
//		
//		// 본사 년도별 총 (가맹비, 로얄티, 승인된 가격, 매입가) 조회
//		HeadSalesTotalVO headyeartotalVO = mapper.headyeartotalChart();
//		int yearTotalfrcsAmt = headyeartotalVO.getYearTotalfrcsAmt();
//		int yearTotalfrcsRowal = headyeartotalVO.getYearTotalfrcsRowal();
//		int yearTotalselngPrice = headyeartotalVO.getYearTotalselngPrice();
//		int yearTotalpurchasePrice = headyeartotalVO.getYearTotalpurchasePrice();
//		
//		feeVO.setYearTotalfrcsAmt(yearTotalfrcsAmt); // 년도별 총 가맹비
//		feeVO.setYearTotalfrcsRowal(yearTotalfrcsRowal); // 년도별 총 로얄티
//		feeVO.setYearTotalselngPrice(yearTotalselngPrice); // 년도별 총 승인된 가격
//		feeVO.setYearTotalPrice(yearTotalfrcsAmt + yearTotalfrcsRowal + yearTotalselngPrice); // 년도별 총 매출액
//		feeVO.setYearTotalpurchasePrice(yearTotalpurchasePrice); // 년도별 총 매입가
//		
//		// 본사 년도별 총 매출 원가
//		int yearTotalsalePrice = feeVO.getYearTotalPrice()-feeVO.getYearTotalpurchasePrice();
//		
//		feeVO.setYearTotalsalePrice(yearTotalsalePrice);
//		feeVO.setYearTotalprofitPrice(yearTotalsalePrice);
//		feeVO.setYearTotalincomePrice(yearTotalsalePrice - (int)(yearTotalsalePrice*0.1));
//		
//		return feeVO;
//	}
//
//	/**
//	 * 본사 해당년도의 월별 총 매출액 서비스 로직 (1개월 단위)
//	 *
//	 */
//	@Override
//	public List<FeeVO> allmonthheadChart() {
//		
//		List<FeeVO> allmontfeeVO = new ArrayList<FeeVO>();
//		
//		List<HeadSalesTotalVO> headallmonthtotalVO = mapper.allmonthtotalChart();
//		
//		for(int i = 0; i < headallmonthtotalVO.size(); i++) {
//			HeadSalesTotalVO headallmonthtotal = headallmonthtotalVO.get(i);
//			int monthTotalfrcsAmt = headallmonthtotal.getAllmonthfrcsAmt();
//			int monthTotalfrcsRowal = headallmonthtotal.getAllmonthfrcsRowal();
//			int monthTotalselngPrice = headallmonthtotal.getAllmonthselngPrice();
//			
//			int monthTotalPrice = monthTotalfrcsAmt + monthTotalfrcsRowal + monthTotalselngPrice;
//			
//			FeeVO feeVO = new FeeVO();
//			feeVO.setMonthTotalselngPrice(monthTotalselngPrice);
//			feeVO.setMonthTotalfrcsAmt(monthTotalfrcsAmt);
//			feeVO.setMonthTotalfrcsRowal(monthTotalfrcsRowal);
//			feeVO.setMonthTotalPrice(monthTotalPrice);
//			
//			allmontfeeVO.add(feeVO);
//		}
//		return allmontfeeVO;
//	}
//
//	/**
//	 * 본사 해당년도의 월별 총 매출액 서비스 로직 (1개월 단위) - 비동기처리
//	 */
//	@Override
//	public List<FeeVO> allmonthheadChart1(HeadSalesTotalVO headsalesTotalVO) {
//		
//		List<FeeVO> allmontfeeVO = new ArrayList<FeeVO>();
//		
//		String year = headsalesTotalVO.getYear();
//		String startyear = year + "-01" + "-01";
//		String endyear = year + "-12" + "-31";
//		
//		headsalesTotalVO.setStartYear(startyear);
//		headsalesTotalVO.setEndYear(endyear);
//		
//		List<HeadSalesTotalVO> headallmonthtotalVO = mapper.allmonthtotalChart1(headsalesTotalVO);
//		
//		for(int i = 0; i < headallmonthtotalVO.size(); i++) {
//			HeadSalesTotalVO headallmonthtotal = headallmonthtotalVO.get(i);
//			int monthTotalfrcsAmt = headallmonthtotal.getAllmonthfrcsAmt();
//			int monthTotalfrcsRowal = headallmonthtotal.getAllmonthfrcsRowal();
//			int monthTotalselngPrice = headallmonthtotal.getAllmonthselngPrice();
//			
//			int monthTotalPrice = monthTotalfrcsAmt + monthTotalfrcsRowal + monthTotalselngPrice;
//			
//			FeeVO feeVO = new FeeVO();
//			feeVO.setMonthTotalselngPrice(monthTotalselngPrice);
//			feeVO.setMonthTotalfrcsAmt(monthTotalfrcsAmt);
//			feeVO.setMonthTotalfrcsRowal(monthTotalfrcsRowal);
//			feeVO.setMonthTotalPrice(monthTotalPrice);
//			
//			allmontfeeVO.add(feeVO);
//		}
//		return allmontfeeVO;
//	}

}
