package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsInventoryMapper;
import kr.or.ddit.service.owner.IFrcsInventoryService;
import kr.or.ddit.vo.head.HeadInventoryVO;
import kr.or.ddit.vo.owner.DeliveryVO;
import kr.or.ddit.vo.owner.FrcsInventoryVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FrcsInventoryServiceImpl implements IFrcsInventoryService{

	@Inject
	private FrcsInventoryMapper mapper;

	@Override
	public List<FrcsInventoryVO> getInventList(String frcsId) {
		return mapper.getInventList(frcsId);
	}

	@Override
	public int selectInventCount(OwnerPaginationInfoVO<FrcsInventoryVO> pagingVO) {
		return mapper.selectInventCount(pagingVO);
	}

	@Override
	public List<FrcsInventoryVO> selectInventList(OwnerPaginationInfoVO<FrcsInventoryVO> pagingVO) {
		return mapper.selectInventList(pagingVO);
	}

	@Override
	public ServiceResult inventUpdate(FrcsInventoryVO inventVO) {
		ServiceResult result = null;
		
		// 업데이트 전 재고 수량 체크
		int preInventQy = mapper.preInventQy(inventVO);
		
		int status = mapper.inventUpdate(inventVO);
		if(status > 0) {
			result = ServiceResult.OK;
			// 업데이트 후 재고 수량 체크
			int postInventQy = mapper.postInventQy(inventVO);
			
			int resultQy = preInventQy- postInventQy;
			
			if(resultQy > 0) {
			// 업데이트 전 재고수량 - 업데이트 후 재고수량을 뺐을 때 +이면 재고를 줄였다는 의미
			// 출고 테이블에 데이터 추가
				DeliveryVO delVO = new DeliveryVO();
				delVO.setFrcsId(inventVO.getFrcsId());
				delVO.setVdprodCd(inventVO.getVdprodCd());
				delVO.setDlivyQy(resultQy);
				delVO.setDlivyPrice(inventVO.getHdforwardPrice());
				mapper.deliveryInsert(delVO);
			}else if(resultQy < 0) {
			// 업데이트 전 재고수량 - 업데이트 후 재고수량을 뺐을 때 -이면 재고를 늘렸다는 의미
			// 입고 테이블에 데이터가 추가 되어야하는데
				
			}
			
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 재고 초기 셋팅
	@Override
	public ServiceResult beginSetting(String frcsId) {
		ServiceResult result = null;
		int status = 0;
		
		// 본사 재고 테이블을 for문을 돌려서 본사 재고 품목 갯수만큼 setting을 해준다.
		List<HeadInventoryVO> headVO = mapper.getVdprodCd();
		
		for(int i=0; i<headVO.size(); i++) {
			String vdprodCd = headVO.get(i).getVdprodCd();
			status = mapper.beginSetting(frcsId,vdprodCd);

			if(status > 0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
			
		}
		
		
		return result;
	}

	// 신규 제품 업데이트
	@Override
	public ServiceResult inventAdd(String frcsId) {
		ServiceResult result = null;
		int status = 0;
		
		// 본사 재고 테이블을 for문을 돌려서 본사 재고 품목을 가져온다
		List<HeadInventoryVO> headVO = mapper.getVdprodCd();
		log.info(headVO.toString());
		
		// 내 가맹점에 해당 품목이 있는지 check
		for(int i=0; i<headVO.size(); i++) {
			String vdprodCd = headVO.get(i).getVdprodCd();
			int cnt = mapper.getInventCheck(vdprodCd, frcsId);
			
			// 체크해서 없으면 insert, 있으면 pass
			if(cnt > 0) {
				
			}else {
				status = mapper.newInventInsert(vdprodCd,frcsId);
				if(status>0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAILED;
				}
			}
		}
		return result;
	}
}
