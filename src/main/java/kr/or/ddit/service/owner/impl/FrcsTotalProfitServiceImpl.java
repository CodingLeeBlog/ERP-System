package kr.or.ddit.service.owner.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.owner.FrcsTotalProfitMapper;
import kr.or.ddit.service.owner.IFrcsTotalProfitService;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FrcsTotalProfitServiceImpl implements IFrcsTotalProfitService {

	@Inject
	private FrcsTotalProfitMapper mapper;
	
// 매출 총이익 분석 (한달)
	@Override
	public FrcsDailySalesVO getTotalOneMonthList(String frcsId, Date thisMonth) {
		
		FrcsDailySalesVO oneTotalProfit = new FrcsDailySalesVO();
		
		// 총 매출액
		int totalPrice = mapper.getTotalSales(frcsId,thisMonth);		
		
		// 총 매입금액
		int totalorderPrice = mapper.getPurchase(frcsId,thisMonth);
		
		oneTotalProfit.setTotalPrice(totalPrice);
		oneTotalProfit.setTotalorderPrice(totalorderPrice);
		
		return oneTotalProfit;
	}
	
	
	// 매출 총이익 분석 (ajax 한달)
	@Override
	public FrcsDailySalesVO getOneTotal(FrcsDailySalesVO salesVO) {
		
		String frcsId = salesVO.getFrcsId();
		String thisMonthStr = salesVO.getThisMonth();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	                                                                                                  
		
		// 총 매출액
		int totalPrice = mapper.getTotalSales(frcsId,thisMonth);		
				
		// 총 매입금액
		int totalorderPrice = mapper.getPurchase(frcsId,thisMonth);
				
		salesVO.setTotalPrice(totalPrice);
		salesVO.setTotalorderPrice(totalorderPrice);
		
		return salesVO;
	}
	
	// 매출 총이익 분석 (3개월)
	@Override
	public FrcsDailySalesVO getThreeTotal(FrcsDailySalesVO salesVO) {
		
		String frcsId = salesVO.getFrcsId();
		String thisMonthStr = salesVO.getThisMonth();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	                                                                                                  
		
		// 총 매출액
		int totalPrice = mapper.getThreeTotalSales(frcsId, thisMonth);
		
		// 총 매입금액
		int totalorderPrice = mapper.getThreePurchase(frcsId, thisMonth);
		
		salesVO.setTotalPrice(totalPrice);
		salesVO.setTotalorderPrice(totalorderPrice);
		
		return salesVO;
	}
	
	// 매출 총이익 분석 (6개월)
	@Override
	public FrcsDailySalesVO getSixTotal(FrcsDailySalesVO salesVO) {

		String frcsId = salesVO.getFrcsId();
		String thisMonthStr = salesVO.getThisMonth();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	                           
		
		// 총 매출액
		int totalPrice = mapper.getSixTotalSales(frcsId, thisMonth);
		
		// 총 매입금액
		int totalorderPrice = mapper.getSixPurchase(frcsId, thisMonth);
		
		salesVO.setTotalPrice(totalPrice);
		salesVO.setTotalorderPrice(totalorderPrice);
		
		return salesVO;
	}
	
	// 매출 총이익 12개월 차트
	@Override
	public List<FrcsDailySalesVO> getTotalProfitChart(String frcsId) {
		
		List<FrcsDailySalesVO> monthsList = new ArrayList<FrcsDailySalesVO>();
		
		
		// 현재 날짜 구하기
		LocalDate now = LocalDate.now();
		int year = now.getYear(); 	// 올해
		
		String str = "";
		
		for(int i=1; i<13; i++) {
			FrcsDailySalesVO salesVO = new FrcsDailySalesVO();
			
			if(i<10) {
				str = year+"/"+"0"+i+"/01";
			}else {
				str = year+"/"+i+"/01";
			}
			
			log.info(str);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date thisMonth = null;
			
			try {
				thisMonth = sdf.parse(str);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			// 총 매출액
			int totalPrice = mapper.getTotalSales(frcsId,thisMonth);		
					
			// 총 매입금액
			int totalorderPrice = mapper.getPurchase(frcsId,thisMonth);
			
			// 매출액 - 매입금액
			int totalResult = totalPrice-totalorderPrice;
			
			log.info("totalResult : "+ totalResult);
			salesVO.setTotalResult(totalResult);
			monthsList.add(salesVO);
			log.info("salesVO : "+ salesVO);
		}
		
		log.info("monthsList : "+ monthsList);
		return monthsList;
	}
}
