package kr.or.ddit.service.owner.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.owner.FrcsSalesAnalysisMapper;
import kr.or.ddit.service.owner.IFrcsSalesAnalysisService;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;

@Service
public class FrcsSalesAnalysisServiceImpl implements IFrcsSalesAnalysisService {

	@Inject
	private FrcsSalesAnalysisMapper mapper;
	
	// 매출액 분석 (한달)
	@Override
	public List<FrcsDailySalesVO> getOneMonthData(String frcsId, Date thisMonth) {
		return mapper.getOneMonthData(frcsId,thisMonth);
	}

	// 1개월 매출 분석 ajax
	@Override
	public List<FrcsDailySalesVO> getOneSalesAnalysis(FrcsDailySalesVO salesVO) {
		
		String frcsId = salesVO.getFrcsId();
		String thisMonthStr = salesVO.getThisMonth();
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	   
		
		List<FrcsDailySalesVO> oneSalesAnalysis = mapper.getOneMonthData(frcsId,thisMonth);
		
		return oneSalesAnalysis;
	}

	// 3개월 매출 분석 
	@Override
	public List<FrcsDailySalesVO> getThreeSalesAnalysis(FrcsDailySalesVO salesVO) {
		
		String frcsId = salesVO.getFrcsId();
		String thisMonthStr = salesVO.getThisMonth();
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	   
		List<FrcsDailySalesVO> threeSalesAnalysis = mapper.getThreeSalesAnalysis(frcsId,thisMonth);
		
		return threeSalesAnalysis;
	}

	// 6개월 매출 분석 
	@Override
	public List<FrcsDailySalesVO> getSixSalesAnalysis(FrcsDailySalesVO salesVO) {
		String frcsId = salesVO.getFrcsId();
		String thisMonthStr = salesVO.getThisMonth();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	   
		List<FrcsDailySalesVO> sixSalesAnalysis = mapper.getSixSalesAnalysis(frcsId,thisMonth);
		
		return sixSalesAnalysis;
	}

	@Override
	public List<FrcsDailySalesVO> getsalesAnalysisChart(String frcsId) {
		
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
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			Date thisMonth = null;
			
			try {
				thisMonth = sdf.parse(str);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			int totalPrice = mapper.getTotalSalesAnalysis(frcsId,thisMonth);
			
			salesVO.setTotalPrice(totalPrice);
			monthsList.add(salesVO);
		}
		
		return monthsList;
	}


}
