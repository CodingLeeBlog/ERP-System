package kr.or.ddit.service.owner;

import java.util.Date;
import java.util.List;

import kr.or.ddit.vo.owner.FrcsOrderDetailVO;

public interface IFrcsPurchaseService {

	// 매입 분석 (한달) 기본
	public List<FrcsOrderDetailVO> getOnePurchase(String frcsId, Date thisMonth);

	// 매입 분석 ajax 한달
	public List<FrcsOrderDetailVO> getOnePurchaseList(FrcsOrderDetailVO orderVO);

	// 매입 분석 ajax 3개월
	public List<FrcsOrderDetailVO> getThreePurchaseList(FrcsOrderDetailVO orderVO);

	// 매입 분석 ajax 6개월
	public List<FrcsOrderDetailVO> getSixPurchaseList(FrcsOrderDetailVO orderVO);

	// 매입 차트 12개월
	public List<FrcsOrderDetailVO> getPurchaseChart(String frcsId);
}
