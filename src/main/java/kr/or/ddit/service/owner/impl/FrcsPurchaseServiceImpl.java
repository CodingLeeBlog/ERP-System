package kr.or.ddit.service.owner.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.owner.FrcsPurchaseMapper;
import kr.or.ddit.service.owner.IFrcsPurchaseService;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;

@Service
public class FrcsPurchaseServiceImpl implements IFrcsPurchaseService {

	@Inject
	private FrcsPurchaseMapper mapper;
	
	
	// 매입 분석 (한달) 첫 로드 시
	@Override
	public List<FrcsOrderDetailVO> getOnePurchase(String frcsId, Date thisMonth) {
		
		List<FrcsOrderDetailVO> onePurchase = mapper.getOnePurchase(frcsId,thisMonth);
		
		return onePurchase;
	}

	// 매입 분석 (한달) ajax
	@Override
	public List<FrcsOrderDetailVO> getOnePurchaseList(FrcsOrderDetailVO orderVO) {
		
		String frcsId = orderVO.getFrcsId();
		String thisMonthStr = orderVO.getThisMonth();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	   
		
		List<FrcsOrderDetailVO> onePurchase = mapper.getOnePurchase(frcsId,thisMonth);
		
		return onePurchase;
	}

	// 매입 분석 3개월 ajax
	@Override
	public List<FrcsOrderDetailVO> getThreePurchaseList(FrcsOrderDetailVO orderVO) {
		
		String frcsId = orderVO.getFrcsId();
		String thisMonthStr = orderVO.getThisMonth();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	   
		
		List<FrcsOrderDetailVO> threePurchase = mapper.getThreePurchase(frcsId,thisMonth);
		
		return threePurchase;
	}

	// 매입 분석 6개월 ajax
	@Override
	public List<FrcsOrderDetailVO> getSixPurchaseList(FrcsOrderDetailVO orderVO) {
		String frcsId = orderVO.getFrcsId();
		String thisMonthStr = orderVO.getThisMonth();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	   
		
		List<FrcsOrderDetailVO> sixPurchase = mapper.getSixPurchase(frcsId,thisMonth);
		
		return sixPurchase;
	}

	// 매입 차트 12개월
	@Override
	public List<FrcsOrderDetailVO> getPurchaseChart(String frcsId) {

		List<FrcsOrderDetailVO> monthsList = new ArrayList<FrcsOrderDetailVO>();
		
		// 현재 날짜 구하기
		LocalDate now = LocalDate.now();
		int year = now.getYear(); 	// 올해
		
		String str = "";
		
		for(int i=1; i<13; i++) {
			FrcsOrderDetailVO orderVO = new FrcsOrderDetailVO();
			
			if(i<10) {
				str = year+"/"+"0"+i+"/01";
			}else {
				str = year+"/"+i+"/01";
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date thisMonth = null;
			
			try {
				thisMonth = sdf.parse(str);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			int totalPrice = mapper.getTotalPurchse(frcsId,thisMonth);
			
			orderVO.setTotalPrice(totalPrice);
			monthsList.add(orderVO);
		}
		
		return monthsList;
	}
}
