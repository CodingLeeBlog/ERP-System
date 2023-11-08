package kr.or.ddit.service.owner.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsBillMapper;
import kr.or.ddit.service.owner.IFrcsBillService;
import kr.or.ddit.vo.head.FeeVO;
import kr.or.ddit.vo.owner.FrcsBillVO;
import kr.or.ddit.vo.owner.FrcsPublicDuesVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

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
		
		System.out.println(duesVO);
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
	public List<FrcsBillVO> headBillList(String frcsId, Date thisMonth) {
		
		List<FrcsBillVO> billList = new ArrayList<FrcsBillVO>();
		FeeVO feeVO = new FeeVO(); // 본사 가맹비 총괄
		FrcsBillVO billVO = new FrcsBillVO(); // 가맹비 상세
		
		int frcsRowal = mapper.getfrcsRowal(frcsId,thisMonth);	// 로얄티
		int orderAmt = mapper.getorderAmt(frcsId,thisMonth);	// 제품구입비
		int tradAdd = mapper.gettradAdd(frcsId,thisMonth);		// 트레이딩 추가결제비
//		int tradRedct = mapper.gettradRedct(frcsId,thisMonth);	// 트레이딩 삭감비
		
		// 미납금과 연체는 일단.. 나중에...
		
		// 총 청구금액
		int feeTotalpay = (frcsRowal + orderAmt+ tradAdd);	
		
		// feeVO에 total금액, 납부기준일, 청구일자 세팅
		// 납부기준일은 다음달 15일, 청구일자는 다음달 1일
//		System.out.println(thisMonth);	// 2023/10/01
		
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(thisMonth);
		cal1.add(cal1.MONTH, 1);	// 월에 1을 더함
		
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(thisMonth);
		cal2.add(cal2.MONTH, 1);	// 월에 1을 더함
		cal2.add(cal2.DAY_OF_MONTH, 14);	// 일에 14일을 더함
		
		
		Date feeDday = cal1.getTime();	// 청구일자
		Date feeChargedate = cal2.getTime(); // 납부기준일
		
//		System.out.println("feeDday"+ feeDday);
//		System.out.println("feeChargedate" + feeChargedate);
		
		feeVO.setFeeTotalpay(feeTotalpay);
		feeVO.setFeeDday(feeDday);
		feeVO.setFeeChargedate(feeChargedate);
		feeVO.setFrcsId(frcsId);
		
		// 만약에 가맹비 총괄 테이블이 존재하지 않는다면 
		// 가맹비 총괄 테이블에 데이터를 넣고
		// 만약에 가맹비 총괄 테이블에 데이터가 이미 존재한다면
		// 가맹비 총괄 테이블 데이터를 수정한다. (총금액만)
		
		
		// 가맹비 총괄 테이블이 존재하는지 안하는지 먼저 체크하는 방법
		// frcsId와 청구일자로 존재하는지 체크
		int duplicationCheck = mapper.dupliCheck(feeVO);
		
		// 이미 데이터가 존재한다면
		if(duplicationCheck > 0) {
			
			
		}else {	// 데이터가 존재하지 않는다면
			// 본사 가맹비총괄 테이블에 데이터 넣기...
			int status = mapper.insertFee(feeVO);
		}
		
		return billList;
	}
}
