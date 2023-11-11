package kr.or.ddit.service.head.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.StoreMapper;
import kr.or.ddit.service.head.IStoreInquiryService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.TotalInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StoreInquiryServiceImpl implements IStoreInquiryService{

	@Inject
	private StoreMapper mapper;

	@Override
	public int selectTotalFrcsCount(HeadPaginationInfoVO<TotalInfoVO> pagingVO) {
		return mapper.selectTotalFrcsCount(pagingVO);
	}

	@Override
	public List<TotalInfoVO> selectTotalFrcsList(HeadPaginationInfoVO<TotalInfoVO> pagingVO) {
		return mapper.selectTotalFrcsList(pagingVO);
	}

	// Excel
	@Override
	public List<TotalInfoVO> storeList() {
		log.info("StoreInquiryServiceImpl->storeList()에 왔다");
		return mapper.storeList();
	}
	// Excel
	@Override
	public ServiceResult registerExcel(TotalInfoVO store) {
		
		ServiceResult result = null;
		
		try {
			log.info("registerExcel() -> 시작");
			int updateFranchise = mapper.registerFranchiseExcel(store);
//			int updateFrcsIpmg = mapper.registerFrcsIpmgExcel(store);
			int updateMember = mapper.registerMemberExcel(store);
			log.debug("엑셀 업로드 조회 결과 : {}", updateFranchise);
			if(updateFranchise > 0 && updateMember > 0) {
				result = ServiceResult.OK;
				log.debug("result값 -> {}", result);
			}else {
				result = ServiceResult.FAILED;
			}
		} catch (Exception e) {
			log.error("엑셀업로드 서비스임플에서 에러발생 " , e);
		}
		
		return result;
	}

	// 가맹점상세조회 데이터
	@Override
	public TotalInfoVO selectMemberDetail(String memId) {
		return mapper.selectMemberDetail(memId);
	}
	@Override
	public TotalInfoVO selectFrcsDetail(String frcsName) {
		return mapper.selectFrcsDetail(frcsName);
	}
	
	
}
