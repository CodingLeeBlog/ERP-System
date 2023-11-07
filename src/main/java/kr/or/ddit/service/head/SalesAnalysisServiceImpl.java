package kr.or.ddit.service.head;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.SalesAnalysisMapper;
import kr.or.ddit.vo.head.FeeVO;
import kr.or.ddit.vo.head.HeadSalesTotalVO;

@Service
public class SalesAnalysisServiceImpl implements ISalesAnalysisService {

	@Inject
	private SalesAnalysisMapper mapper;

	/**
	 * 본사 매출 서비스 로직
	 * 
	 * @param FeeVO
	 */
	@Override
	public FeeVO headChart() {
		
		FeeVO feeVO = new FeeVO();
		
		// 본사 년도별 총 (가맹비, 로얄티, 승인된 가격, 매입가) 조회
		HeadSalesTotalVO headyeartotalVO = mapper.headyeartotalChart();
		int yearTotalfrcsAmt = headyeartotalVO.getYearTotalfrcsAmt();
		int yearTotalfrcsRowal = headyeartotalVO.getYearTotalfrcsRowal();
		int yearTotalselngPrice = headyeartotalVO.getYearTotalselngPrice();
		int yearTotalpurchasePrice = headyeartotalVO.getYearTotalpurchasePrice();
		
		feeVO.setYearTotalfrcsAmt(yearTotalfrcsAmt); // 년도별 총 가맹비
		feeVO.setYearTotalfrcsRowal(yearTotalfrcsRowal); // 년도별 총 로얄티
		feeVO.setYearTotalselngPrice(yearTotalselngPrice); // 년도별 총 승인된 가격
		feeVO.setYearTotalPrice(yearTotalfrcsAmt + yearTotalfrcsRowal + yearTotalselngPrice); // 년도별 총 매출액
		feeVO.setYearTotalpurchasePrice(yearTotalpurchasePrice); // 년도별 총 매입가
		
		// 본사 년도별 총 매출 원가
		int yearTotalsalePrice = feeVO.getYearTotalPrice()-feeVO.getYearTotalpurchasePrice();
		
		feeVO.setYearTotalsalePrice(yearTotalsalePrice);
		feeVO.setYearTotalprofitPrice(yearTotalsalePrice);
		feeVO.setYearTotalincomePrice(yearTotalsalePrice - (int)(yearTotalsalePrice*0.1));
		
		return feeVO;
	}

	@Override
	public List<FeeVO> allmonthheadChart() {
		
		List<FeeVO> allmontfeeVO = new ArrayList<FeeVO>();
		
		List<HeadSalesTotalVO> headallmonthtotalVO = mapper.allmonthtotalChart();
		
		for(int i = 0; i < headallmonthtotalVO.size(); i++) {
			HeadSalesTotalVO headallmonthtotal = headallmonthtotalVO.get(i);
			int monthTotalfrcsAmt = headallmonthtotal.getAllmonthfrcsAmt();
			int monthTotalfrcsRowal = headallmonthtotal.getAllmonthfrcsRowal();
			int monthTotalselngPrice = headallmonthtotal.getAllmonthselngPrice();
			
			int monthTotalPrice = monthTotalfrcsAmt + monthTotalfrcsRowal + monthTotalselngPrice;
			
			FeeVO feeVO = new FeeVO();
			feeVO.setMonthTotalselngPrice(monthTotalselngPrice);
			feeVO.setMonthTotalfrcsAmt(monthTotalfrcsAmt);
			feeVO.setMonthTotalfrcsRowal(monthTotalfrcsRowal);
			feeVO.setMonthTotalPrice(monthTotalPrice);
			
			allmontfeeVO.add(feeVO);
		}
		return allmontfeeVO;
	}

	@Override
	public ServiceResult headmonthChart() {
		ServiceResult result = null;
		
		
		return null;
	}


	

}
