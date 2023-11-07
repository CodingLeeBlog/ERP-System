package kr.or.ddit.service.owner.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsTradingMapper;
import kr.or.ddit.service.owner.IFrcsTradingService;
import kr.or.ddit.vo.owner.FranchiseVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.TradingVO;

@Service
public class FrcsTradingServiceImpl implements IFrcsTradingService {

	@Inject
	private FrcsTradingMapper mapper;
	
	// 내 가맹점 위치 조회
	@Override
	public FranchiseVO getLocation(String frcsId) {
		return mapper.getLocation(frcsId);
	}
	
	// 모든 가맹점 정보 가져오기
	@Override
	public List<FranchiseVO> getAllFrcsList() {
		return mapper.getAllFrcsList();
	}

	// 주변 가맹점 재고 현황 가져오기
	@Override
	public List<FrcsInventoryVO> getNearInventList(String searchWord, String searchType, List<Object> nearList) {
		
		List<FrcsInventoryVO> getNearInventList = new ArrayList<FrcsInventoryVO>();
		
		for(int i=0; i<nearList.size(); i++) {
			String frcsId = nearList.get(i).toString();
			FrcsInventoryVO inventVO = mapper.getInventList(searchWord,searchType,frcsId);
			getNearInventList.add(inventVO);
		}
		
		return getNearInventList;
	}

	// 트레이딩 신청
	@Override
	public ServiceResult tradingInsert(TradingVO tradVO) {
		
		ServiceResult result = null;
		
		String vdprodCd = tradVO.getVdprodCd();
		
		int hdforwardPrice = mapper.getHdforwardPrice(vdprodCd);	// 제품가격
		int tradQy = tradVO.getTradQy();	// 트레이딩 수량
		
		tradVO.setTradAmt(hdforwardPrice*tradQy);
		
		int status = mapper.tradingInsert(tradVO);
		
		if(status>0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	
}
