package kr.or.ddit.service.owner.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsBillMapper;
import kr.or.ddit.mapper.owner.FrcsSalesAnalysisMapper;
import kr.or.ddit.service.owner.IFrcsBillService;
import kr.or.ddit.vo.head.FeeVO;
import kr.or.ddit.vo.owner.FrcsBillVO;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import kr.or.ddit.vo.owner.TradingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FrcsBillServiceImpl implements IFrcsBillService {

	@Inject
	private FrcsBillMapper mapper;

	@Override
	public List<FrcsPublicDuesVO> duesList(String memId) {
		return mapper.duesList(memId);
	}

	// 공과금 납부 등록
	@Override
	public void duesRegister(FrcsPublicDuesVO duesVO) {
		mapper.duesRegister(duesVO);
		
	}

	// 공과금 납부년월 년월별로 한개만 등록할 수 있게 중복체크
	@Override
	public ServiceResult duesPaydeCheck(FrcsPublicDuesVO duesVO) {
		ServiceResult result = null;
		
		int status = mapper.duesPaydeCheck(duesVO);
		
		if(status > 0) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}

	// memId로 프랜차이즈 아이디 얻어오기
	@Override
	public String frcsIdInfo(String memId) {
		return mapper.frcsIdInfo(memId);
	}
	
	// 내 가맹점 평균 공과금액 가져오기
	@Override
	public FrcsPublicDuesVO average(String memId) {
		return mapper.average(memId);
	}

	// 전체 가맹점 평균 공과금액 가져오기
	@Override
	public FrcsPublicDuesVO totalAverage() {
		return mapper.totalAverage();
	}


	// 공과금 납부내역 삭제
	@Override
	public void duesRemove(String duesPayde, String frcsId) {
		mapper.duesRemove(duesPayde,frcsId);
	}

	// 공과금 페이징 (총 게시물 갯수)
	@Override
	public int selectDuesCount(OwnerPaginationInfoVO<FrcsPublicDuesVO> pagingVO) {
		return mapper.selectDuesCount(pagingVO);
	}

	// 공과금 페이징처리
	@Override
	public List<FrcsPublicDuesVO> selectDuesList(OwnerPaginationInfoVO<FrcsPublicDuesVO> pagingVO) {
		return mapper.selectDuesList(pagingVO);
	}

	// 공과금 납부내역 상세조회
	@Override
	public FrcsPublicDuesVO duesDetail(String duesPayde, String frcsId) {
		return mapper.duesDetail(duesPayde,frcsId);
	}

	// 공과금 납부내역 수정
	@Override
	public void duesUpdate(FrcsPublicDuesVO duesVO) {
		// 기존 납부내역을 삭제하고 다시 등록..
		
		log.info("[duesUpdate] duesVO : " + duesVO);

		String duesPayde = duesVO.getDuesPayde();
		String frcsId = duesVO.getFrcsId();
		
		mapper.duesRemove(duesPayde,frcsId);
		mapper.duesRegister(duesVO);
	}

	// 공과금 차트 
	@Override
	public List<FrcsPublicDuesVO> getData(String frcsId) {
		return mapper.getData(frcsId);
	}

	// 본사 청구 리스트
	@Override
	public FrcsBillVO headBillList(String frcsId, Date thisMonth) {
		
		FeeVO feeVO = new FeeVO(); // 본사 가맹비 총괄
		FrcsBillVO billVO = new FrcsBillVO(); // 가맹비 상세
		
		int frcsRowal = mapper.getfrcsRowal(frcsId,thisMonth);	// 로얄티
		int orderAmt = mapper.getorderAmt(frcsId,thisMonth);	// 제품구입비
		int tradAdd = mapper.gettradAdd(frcsId,thisMonth);		// 트레이딩 추가결제비
		int tradRedct = mapper.gettradRedct(frcsId,thisMonth);	// 트레이딩 삭감비
		int frcsAmt = billVO.getFrcsAmt();
		
		billVO.setFrcsId(frcsId);
		billVO.setFrcsRowal(frcsRowal);
		billVO.setOrderAmt(orderAmt);
		billVO.setTradAdd(tradAdd);
		billVO.setTradRedct(tradRedct);
		billVO.setThisMonth(thisMonth);
		
		// feeVO에 total금액, 납부기준일, 청구일자 세팅
		// 납부기준일은 다음달 15일, 청구일자는 다음달 1일
		log.info("thisMonth : " + thisMonth);
		
		// 청구시작일자 구하기
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(thisMonth);
		cal1.add(cal1.MONTH, 1);	// 월에 1을 더함
		
		// 납부기준일 구하기
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(thisMonth);
		cal2.add(cal2.MONTH, 1);	// 월에 1을 더함
		cal2.add(cal2.DAY_OF_MONTH, 14);	// 일에 14일을 더함
		
		Calendar now = Calendar.getInstance();	// 오늘 날짜
		
		Date feeDday = cal1.getTime();	// 청구일자(1일)
		Date feeChargedate = cal2.getTime(); // 납부기준일(15일)
		Date nowDate = now.getTime();	// 오늘 날짜
		
		log.info("feeDday : " + feeDday);
		log.info("feeChargedate : " + feeChargedate);
		log.info("nowDate : " + nowDate);
		
		feeVO.setFeeChargedate(feeChargedate);
		feeVO.setFrcsId(frcsId);
		
		// 총 청구금액
		int feeTotalpay = (frcsAmt + frcsRowal + orderAmt+ tradAdd) - tradRedct;	
		
//		// 가맹비 총괄 테이블에 데이터가 존재하는지 체크
		int duplicationCheck = mapper.dupliCheck(feeVO);

		if(duplicationCheck>0) {
			billVO.setSettleAt("Y");	// 데이터가 존재하면 납부를 한거기때문에 납부상태 Y로 변경
			
			Date settleDate = mapper.getSettleDate(feeVO);
			log.info("SettleDate : " + settleDate);
			billVO.setSettleDate(settleDate);
			
			if(settleDate.compareTo(feeDday) >=0 && settleDate.compareTo(feeChargedate) <=0) {
				billVO.setFrcsbillOverdue(0);
			}
			
			// 오늘날짜가 청구일자와 같거나 크면서 납부 기준일보다 크면 이자 발생
			if(settleDate.compareTo(feeDday) >=0 && settleDate.compareTo(feeChargedate) > 0) {

			    // feeDday와 nowDate 사이의 월 간격 계산
//			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			    String nowDateStr  = sdf.format(nowDate);
//			    String feeChargedateStr  = sdf.format(feeChargedate);
//			    
//			    String nowMonth = nowDateStr.split("/")[1];			    
//			    String feeChargeMonth = feeChargedateStr.split("/")[1];			    
//			    
//			    log.info("nowDateStr : " +  nowDateStr);
//			    log.info("feeChargedateStr : " +  feeChargedateStr);
//			    log.info("nowMonth : " +  nowMonth);
//			    log.info("feeChargeMonth : " +  feeChargeMonth);

				// 첫 한달은 1% 이자 발생
				int overdue = (int) (feeTotalpay * 0.01);
				
				// 오늘날짜가 납부 기준일보다 2달 이상 지났으면 3% 이자 발생
				billVO.setFrcsbillOverdue(overdue);
				
				feeTotalpay = (frcsAmt + frcsRowal + orderAmt+ tradAdd) - tradRedct + overdue;
				
				// 데이터가 존재하지 않으면 납부하지 않았다는거기때문에
				// 오늘날짜와 납부 기준일, 청구일자를 비교해서 15일이 지났으면 이자 발생
			}
		}else {
			
			// 오늘날짜가 청구일자와 같거나 크면서 납부 기준일보다 같거나 작으면 이자 발생 x
			if(nowDate.compareTo(feeDday) >=0 && nowDate.compareTo(feeChargedate) <=0) {
				billVO.setFrcsbillOverdue(0);
			}
			
			// 오늘날짜가 청구일자와 같거나 크면서 납부 기준일보다 크면 이자 발생
			if(nowDate.compareTo(feeDday) >=0 && nowDate.compareTo(feeChargedate) > 0) {

			    // feeDday와 nowDate 사이의 월 간격 계산
//			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			    String nowDateStr  = sdf.format(nowDate);
//			    String feeChargedateStr  = sdf.format(feeChargedate);
//			    
//			    String nowMonth = nowDateStr.split("/")[1];			    
//			    String feeChargeMonth = feeChargedateStr.split("/")[1];			    
//			    
//			    log.info("nowDateStr : " +  nowDateStr);
//			    log.info("feeChargedateStr : " +  feeChargedateStr);
//			    log.info("nowMonth : " +  nowMonth);
//			    log.info("feeChargeMonth : " +  feeChargeMonth);

				// 첫 한달은 1% 이자 발생
				int overdue = (int) (feeTotalpay * 0.01);
				
				// 오늘날짜가 납부 기준일보다 2달 이상 지났으면 3% 이자 발생
				billVO.setFrcsbillOverdue(overdue);
				
				feeTotalpay = (frcsAmt + frcsRowal + orderAmt+ tradAdd) - tradRedct + overdue;
				
			}
		}
		billVO.setFeeTotalPay(feeTotalpay);
		return billVO;
	}

	// 본사 가맹비 총괄, 가맹비 상세 테이블 insert
	@Override
	public ServiceResult insertBill(FrcsBillVO billVO) {
		
		ServiceResult result = null;
		FeeVO feeVO = new FeeVO(); // 본사 가맹비 총괄

		String frcsId = billVO.getFrcsId();
		String yearMonth = billVO.getYearMonth();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(yearMonth);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	
		
		int frcsRowal = mapper.getfrcsRowal(frcsId,thisMonth);	// 로얄티
		int orderAmt = mapper.getorderAmt(frcsId,thisMonth);	// 제품구입비
		int tradAdd = mapper.gettradAdd(frcsId,thisMonth);		// 트레이딩 추가결제비
		int tradRedct = mapper.gettradRedct(frcsId,thisMonth);	// 트레이딩 삭감비
		int frcsAmt = billVO.getFrcsAmt();
		
		billVO.setFrcsId(frcsId);
		billVO.setFrcsRowal(frcsRowal);
		billVO.setOrderAmt(orderAmt);
		billVO.setTradAdd(tradAdd);
		billVO.setTradRedct(tradRedct);
		billVO.setThisMonth(thisMonth);
		
		int feeTotalpay = (frcsAmt + frcsRowal + orderAmt+ tradAdd) - tradRedct;	

		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(thisMonth);
		cal1.add(cal1.MONTH, 1);	// 월에 1을 더함
		
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(thisMonth);
		cal2.add(cal2.MONTH, 1);	// 월에 1을 더함
		cal2.add(cal2.DAY_OF_MONTH, 14);	// 일에 14일을 더함
		
		Calendar now = Calendar.getInstance();	// 오늘 날짜
		
		Date feeDday = cal1.getTime();	// 청구일자
		Date feeChargedate = cal2.getTime(); // 납부기준일
		Date nowDate = now.getTime();	// 오늘 날짜
		
		log.info("feeDday : " + feeDday);
		log.info("feeChargedate : " + feeChargedate);
		// 오늘날짜가 청구일자와 같거나 크면서 납부 기준일보다 같거나 작으면 이자 발생 x
		if(nowDate.compareTo(feeDday) >=0 && nowDate.compareTo(feeChargedate) <=0) {
			billVO.setFrcsbillOverdue(0);
		}
		
		// 오늘날짜가 청구일자와 같거나 크면서 납부 기준일보다 크면 이자 발생
		if(nowDate.compareTo(feeDday) >=0 && nowDate.compareTo(feeChargedate) > 0) {
	
			// 첫 한달은 1% 이자 발생
			int overdue = (int) (feeTotalpay * 0.01);
			
			// 오늘날짜가 납부 기준일보다 2달 이상 지났으면 3% 이자 발생
			billVO.setFrcsbillOverdue(overdue);
			
			feeTotalpay = (frcsAmt + frcsRowal + orderAmt+ tradAdd) - tradRedct + overdue;
		}
		
		// 총 청구금액
		billVO.setFeeTotalPay(feeTotalpay);
		
		// feeVO에 total금액, 납부기준일, 청구일자 세팅
		// 납부기준일은 다음달 15일, 청구일자는 다음달 1일
		log.info("thisMonth : " + thisMonth);
		
		feeVO.setFeeTotalpay(feeTotalpay);
		feeVO.setFeeDday(feeDday);
		feeVO.setFeeChargedate(feeChargedate);
		feeVO.setFrcsId(frcsId);
		feeVO.setThisMonth(thisMonth);
		
		// 가맹비 총괄 테이블이 존재하는지 안하는지 먼저 체크하는 방법
		// frcsId와 청구일자로 존재하는지 체크
		int duplicationCheck = mapper.dupliCheck(feeVO);
		int status = 0;
		
		if(duplicationCheck > 0) {
			result = ServiceResult.EXIST;
			
		}else {	// 데이터가 존재하지 않는다면
			// 본사 가맹비총괄 테이블에 데이터 넣고 디테일 테이블에도 데이터 넣기
			status = mapper.insertFee(feeVO);
			if(status > 0) {
				mapper.insertDetail(billVO);
				result = ServiceResult.OK;
			}
		}
		
		return result;

}

	// 트레이딩 상세내역
	@Override
	public List<TradingVO> getTradDetail(TradingVO tradVO) {
		
		String frcsId = tradVO.getFrcsId();
		String thisMonthStr = tradVO.getThisMonth();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date thisMonth = null;
		
		try {
			thisMonth = sdf.parse(thisMonthStr);	// 이번달
		} catch (ParseException e) {
			e.printStackTrace();
		}	   
		
		return mapper.getTradDetail(frcsId,thisMonth);
	}
	
	// 트레이딩 상세내역2
		@Override
		public List<TradingVO> getTradMinDetail(TradingVO tradVO) {
			
			String frcsId = tradVO.getFrcsId();
			String thisMonthStr = tradVO.getThisMonth();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
			Date thisMonth = null;
			
			try {
				thisMonth = sdf.parse(thisMonthStr);	// 이번달
			} catch (ParseException e) {
				e.printStackTrace();
			}	   
			
			return mapper.getTradMinDetail(frcsId,thisMonth);
		}
	
	
}
