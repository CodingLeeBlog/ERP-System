package kr.or.ddit.service.owner;

import java.util.Date;
import java.util.List;

import kr.or.ddit.vo.owner.OperationProfitVO;

public interface IFrcsOperationProfitService {

	// 순이익 분석 (한달)
	public OperationProfitVO getOneOperation(String frcsId, Date thisMonth);

	// 순이익 분석 1개월  ajax
	public OperationProfitVO getOneTotal(OperationProfitVO operVO);

	// 순이익 분석 3개월
	public OperationProfitVO getThreeTotal(OperationProfitVO operVO);

	// 순이익 분석 6개월
	public OperationProfitVO getSixTotal(OperationProfitVO operVO);

	// 순이익 분석 차트 12개월
	public List<OperationProfitVO> getOperationProfitChart(String frcsId);
}
