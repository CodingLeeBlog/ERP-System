package kr.or.ddit.service.owner.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsDailyMapper;
import kr.or.ddit.service.owner.IFrcsDailySaleService;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsMenuIngredientVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;

@Service
public class FrcsDailySaleServiceImpl implements IFrcsDailySaleService {

	@Inject
	private FrcsDailyMapper mapper;

	// 일일 매출 전체 리스트 페이징
	@Override
	public int selectDailySalesCount(OwnerPaginationInfoVO<FrcsDailySalesVO> pagingVO) {
		return mapper.selectDailySalesCount(pagingVO);
	}
	
	// 일일 매출 전체 리스트 페이징
	@Override
	public List<FrcsDailySalesVO> selectDailySalesList(OwnerPaginationInfoVO<FrcsDailySalesVO> pagingVO) {
		return mapper.selectDailySalesList(pagingVO);
	}
	
	// 일일 매출 리스트 출력(오늘)
	@Override
	public List<FrcsDailySalesVO> getDailySalesList(String frcsId) {
		return mapper.getDailySalesList(frcsId);
	}
	
	// 가맹점 메뉴 정보
	@Override
	public List<FrcsMenuVO> getMenu(String frcsId) {
		return mapper.getMenu(frcsId);
	}

	// 일일 매출 등록 전 날짜 중복 체크
	@Override
	public ServiceResult dailyInsertCheck(FrcsDailySalesVO saleVO) {
		
		ServiceResult result = null;
		
		int status = mapper.dailyInsertCheck(saleVO);
		
		if(status > 0) {
			result = ServiceResult.EXIST;
		}else {
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}
	
	// 일일 매출 등록
	@Override
	public ServiceResult insertDailySales(List<FrcsDailySalesVO> salesList) {
		ServiceResult result = null;
		
		int cnt = 1;
		for(int i=0; i<salesList.size(); i++) {
			FrcsDailySalesVO salesVO = salesList.get(i);
			String frcsId= salesVO.getFrcsId();
			int status = mapper.insertDailySales(salesVO);	// 일일 메뉴 등록

			if(status > 0) {
				String menuCd = salesVO.getMenuCd();	// 메뉴코드
				int menuQy = salesVO.getSelngQy();		// 메뉴판매갯수
				Date selngDate = salesVO.getSelngDate();	// 일일 매출 날짜
				
				// 메뉴코드로 필요한 재료들 찾기..
				List<FrcsMenuIngredientVO> ingredList = mapper.selectMenu(menuCd);
				
					for(int j=0; j<ingredList.size(); j++) {	// 재료 리스트만큼 for문
						FrcsMenuIngredientVO ingredVO = ingredList.get(j);	
						ingredVO.setFrcsId(frcsId);	
						ingredVO.setMenuQy(menuQy);	// 메뉴 판매개수
						

						 
						// selngDate 겹치지 않게 1초씩 증가
						if(i>=1) {
							Calendar cal = Calendar.getInstance();
							cal.setTime(selngDate);
							cal.add(Calendar.SECOND, cnt++);
							selngDate = cal.getTime();
							ingredVO.setSelngDate(selngDate);
						}else {
							ingredVO.setSelngDate(selngDate);	// 판매 날짜
						}
						
						mapper.minusInvent(ingredVO);	// 재고 -처리
						mapper.plusDelivery(ingredVO); // 출고 테이블에 insert
					}
					result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
	}

	// 일일 매출 수정을 위해 이미 들어가 있는 정보 추출
	@Override
	public List<FrcsDailySalesVO> getUpdateForm(FrcsDailySalesVO saleVO) {
		
		return mapper.getUpdateForm(saleVO);
	}

	// 일일 매출 수정
	@Override
	public ServiceResult updateDailySales(List<FrcsDailySalesVO> salesList) {
		ServiceResult result = null;
		
		for(int i=0; i<salesList.size(); i++) {
//			
			FrcsDailySalesVO salesVO = salesList.get(i);
			String frcsId = salesVO.getFrcsId();
			
			String selngDateStr = salesVO.getSelngDateStr();
			Date selngDate = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			
			try {
				selngDate = sdf.parse(selngDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			System.out.println(selngDate);
			salesVO.setSelngDate(selngDate);
			
//			// 매출 수정 전 메뉴와 메뉴 갯수 확인
			List<FrcsDailySalesVO> beforeList = mapper.getBeforeCount(salesVO);
//			
			// 매출내역이 존재하지 않는다면
			if(beforeList.isEmpty()) {
				
				int newInsertStatus = mapper.insertDailySales(salesVO);
				
				// 일일 매출테이블에 insert를 성공하면
				if(newInsertStatus > 0) {
					
					String menuCd = salesVO.getMenuCd();	// 메뉴코드
					int menuQy = salesVO.getSelngQy();		// 메뉴판매갯수
//					String frcsId = salesVO.getFrcsId();	// 가맹점코드
					
					// 메뉴코드로 필요한 재료들 찾기..
					List<FrcsMenuIngredientVO> ingredList = mapper.selectMenu(menuCd);
					
					for (int j = 0; j < ingredList.size(); j++) {
	                    FrcsMenuIngredientVO ingredVO = ingredList.get(j);
	                    ingredVO.setFrcsId(frcsId);
	                    ingredVO.setMenuQy(menuQy);
	                    
	                    Calendar cal = Calendar.getInstance();
	                    cal.setTime(selngDate);
	                    cal.add(Calendar.MINUTE, i * 10 + j);
	                    ingredVO.setSelngDate(cal.getTime());

	                    mapper.minusInvent(ingredVO);
	                    mapper.plusDelivery(ingredVO);
	                }
	                result = ServiceResult.OK;
	            } else {
	                result = ServiceResult.FAILED;
	                break;
				}
			// 매출내역이 이미 존재한다면
			}else {
				for(int z=0; z<beforeList.size(); z++) {
					System.out.println("수정 전 메뉴와 메뉴 갯수 : " + beforeList.get(z).getMenuCd());
					System.out.println("수정 전 메뉴와 메뉴 갯수 : " + beforeList.get(z).getSelngQy());
					int beforeCount = beforeList.get(z).getSelngQy();

				// update해주고
				int updateStatus = mapper.updateSales(salesVO);
				
				if(updateStatus > 0 ) {
					// 수정 후 메뉴와 메뉴 개수를 체크
					// 매출 수정 전 메뉴와 메뉴 갯수 확인
					List<FrcsDailySalesVO> afterList = mapper.getBeforeCount(salesVO);
					
					for(int k=0; k<afterList.size(); k++) {
						System.out.println("수정 후 메뉴와 메뉴 갯수 : " + afterList.get(k).getMenuCd());
						System.out.println("수정 후 메뉴와 메뉴 갯수 : " + afterList.get(k).getSelngQy());
						int afterCount = afterList.get(k).getSelngQy();
						String menuCd = afterList.get(k).getMenuCd();
						
						int count = beforeCount- afterCount;
						
						// count가 양수라면 팔린 메뉴개수를 줄인것
						// 그만큼 다시 재고현황을 플러스 처리 / 출고테이블에는 마이너스로 insert
						// count가 음수라면 팔린 메뉴개수를 늘린것
						// 그만큼 재고현황을 마이너스 처리 / 출고테이블에는 플러스로 insert
						
						// 메뉴코드로 필요한 재료들 찾기..
						List<FrcsMenuIngredientVO> ingredList = mapper.selectMenu(menuCd);
						
							for(int y=0; y<ingredList.size(); y++) {	// 재료 리스트만큼 for문
								FrcsMenuIngredientVO ingredVO = ingredList.get(y);	
								ingredVO.setFrcsId(frcsId);	
								ingredVO.setMenuQy(count);	// 메뉴 판매개수

							// selngDate 겹치지 않게 1초씩 증가
								Calendar cal = Calendar.getInstance();
								cal.setTime(selngDate);
								cal.add(Calendar.MINUTE, i * 33 + k);
								selngDate = cal.getTime();
								ingredVO.setSelngDate(selngDate);
								
							mapper.minusInvent(ingredVO);	// 재고 -처리
							mapper.plusDelivery(ingredVO); // 출고 테이블에 insert
						}
					}
					result = ServiceResult.OK;
			
				}else {
					result = ServiceResult.FAILED;
					break;
				}
			}
		}
	}
		return result;
	}
}


//	@Override
//	public ServiceResult updateDailySales(List<FrcsDailySalesVO> salesList) {
//		ServiceResult result = null;
//		
//		System.out.println("salesList.size() : " + salesList.size());
//		
//		// 넘어온 데이터의 수만큼 for문을 돌려 vo객체에 하나씩 담아줌
//		for(int i=0; i<salesList.size(); i++) {
//			System.out.println(salesList.get(0));
//			System.out.println(salesList.get(1));
//			FrcsDailySalesVO salesVO = salesList.get(i);
//			System.out.println("salesVO : "+ salesVO);
//
//			// vo객체에 메뉴코드, 메뉴가격, 메뉴개수가 들어있음.
//			// 매출 수정 전 메뉴와 메뉴 갯수 확인
//			List<FrcsDailySalesVO> beforeList = mapper.getBeforeCount(salesVO);
//			
//			for(int j=0; j<beforeList.size(); j++) {
//				
//			System.out.println("beforeList : " + beforeList);
//			System.out.println("수정 전 메뉴와 메뉴 갯수 : " + beforeList.get(j).getMenuCd());
//			System.out.println("수정 전 메뉴와 메뉴 갯수 : " + beforeList.get(j).getSelngQy());
//			}
//		}
//		
//		
//		
//		// 매출 삭제
//		
//		// 매출 삭제 후 메뉴 수 확인
//		
//		// 수정 전 메뉴수에서 매출 수정 후를 뺐을때 0보다 작으면 메뉴를 추가한것이니
//		// 그만큼 더 재고 -처리하고 출고테이블에 insert해준다.
//		
//		// 수정 전 메뉴수에서 매출 수정 후를 뺐을 때 0보다 크면 메뉴를 줄인것이니
//		// 그만큼 재고를 +처리하고 출고테이블에도 -처리 해준다.
//		
//		return result;
//	}

//	// 모달창 메뉴 검색
//	@Override
//	public List<FrcsMenuVO> getMenuSearchList(String frcsId, String inputText) {
//		return mapper.getMenuSearchList(frcsId, inputText);
//	}




