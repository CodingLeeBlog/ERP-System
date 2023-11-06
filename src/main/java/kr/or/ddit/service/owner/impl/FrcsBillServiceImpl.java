package kr.or.ddit.service.owner.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsBillMapper;
import kr.or.ddit.service.owner.IFrcsBillService;
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

	// 납부 등록
	@Override
	public void duesRegister(FrcsPublicDuesVO duesVO) {
		mapper.duesRegister(duesVO);
		
	}

	// 납부년월 년월별로 한개만 등록할 수 있게 중복체크
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

	// 납부내역 삭제
	@Override
	public void duesRemove(String duesPayde, String frcsId) {
		mapper.duesRemove(duesPayde,frcsId);
	}

	// 페이징 (총 게시물 갯수)
	@Override
	public int selectDuesCount(OwnerPaginationInfoVO<FrcsPublicDuesVO> pagingVO) {
		return mapper.selectDuesCount(pagingVO);
	}

	// 페이징처리
	@Override
	public List<FrcsPublicDuesVO> selectDuesList(OwnerPaginationInfoVO<FrcsPublicDuesVO> pagingVO) {
		return mapper.selectDuesList(pagingVO);
	}

	// 납부내역 상세조회
	@Override
	public FrcsPublicDuesVO duesDetail(String duesPayde, String frcsId) {
		return mapper.duesDetail(duesPayde,frcsId);
	}

	// 납부내역 수정
	@Override
	public void duesUpdate(FrcsPublicDuesVO duesVO) {
		// 기존 납부내역을 삭제하고 다시 등록..
		
		System.out.println(duesVO);
		String duesPayde = duesVO.getDuesPayde();
		String frcsId = duesVO.getFrcsId();
		
		mapper.duesRemove(duesPayde,frcsId);
		mapper.duesRegister(duesVO);
	}

	// 차트 
	@Override
	public List<FrcsPublicDuesVO> getData(String frcsId) {
		return mapper.getData(frcsId);
	}
}
