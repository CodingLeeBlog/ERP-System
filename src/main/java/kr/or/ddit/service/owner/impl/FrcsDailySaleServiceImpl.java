package kr.or.ddit.service.owner.impl;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.owner.FrcsDailyMapper;
import kr.or.ddit.service.owner.IFrcsDailySaleService;
import kr.or.ddit.vo.owner.FrcsDailySalesVO;
import kr.or.ddit.vo.owner.FrcsMenuIngredientVO;
import kr.or.ddit.vo.owner.FrcsMenuVO;
import kr.or.ddit.vo.owner.FrcsOrderDetailVO;
import kr.or.ddit.vo.owner.OwnerPaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		int count = 0;
		for(int i=0; i<salesList.size(); i++) {	// 매출등록한 메뉴수만큼 for문을 돌려
			FrcsDailySalesVO salesVO = salesList.get(i);
			String frcsId= salesVO.getFrcsId();
			int status = mapper.insertDailySales(salesVO);	// 일일 메뉴 등록

			// 일일 메뉴 등록에 성공하면
			if(status > 0) {
				String menuCd = salesVO.getMenuCd();	// 메뉴코드
				int menuQy = salesVO.getSelngQy();		// 메뉴판매갯수
				Date selngDate = salesVO.getSelngDate(); // 일일매출에 넣었던 날짜 데이터
				
				// Date타입을 문자열로 바꾸고 > 문자열중 .을 기준으로 나눠서 
				SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm:ss.SSSSSS");
				String selngDateStr = sdf.format(selngDate);
//				System.out.println("selngDateStr : " + selngDateStr);
//				String preStr = selngDateStr.substring(0,16);	// 23/10/24 09:00:00
//				String postStr = selngDateStr.substring(16); // .0000000000
//				String str[] = StringUtils.split(selngDateStr,'.');
//				String preStr = str[0];	// 23/10/24 09:00:00
//				String postStr = str[1];// 0000000000
//				postDouble = Double.parseDouble(postStr);	// 0.0
//				System.out.println("preStr" + preStr);
				
				
				// 메뉴코드당 필요한 재료들을 찾는다...
				List<FrcsMenuIngredientVO> ingredList = mapper.selectMenu(menuCd);
				
					for(int j=0; j<ingredList.size(); j++) {	// 재료 리스트만큼 for문
						FrcsMenuIngredientVO ingredVO = ingredList.get(j);	
						ingredVO.setFrcsId(frcsId);	
						ingredVO.setMenuQy(menuQy);	// 메뉴 판매개수
						ingredVO.setSelngDate(selngDate);	// 날짜 범위를 주기위한 조건 값(datepicker로 선택한 날짜)	
						
						// 날짜, 가맹점ID, 메뉴코드가 일치하는 데이터들 중, 가장 최신의 데이터 1개를 가져온다.
						String dlivyDate = mapper.selectRecentDelivery(ingredVO);
						
						String resultLine = "";
						String frontDateText = "";
						if(StringUtils.isBlank(dlivyDate)) {	// 처음 등록
							frontDateText = selngDateStr.split("\\.")[0];
							count++;
						}else {	// 기존것 가지고 재등록
							String[] splitData = dlivyDate.split("\\.");
							frontDateText = splitData[0];
							int after = Integer.parseInt(splitData[1]);
							count = after = after + 1;
						}
						
						if(count < 10) {	// 1의자리
							resultLine = "00000" + count;
						}else if(count > 9 && count < 100) {	// 10의자리
							resultLine = "0000" + count;
						}else if(count > 99 && count < 1000) {	// 100의자리
							resultLine = "000" + count;
						}else {									// 1000의자리
							resultLine = "00" + count;
						}
						
						selngDateStr = frontDateText + "."+ resultLine;
						
						mapper.minusInvent(ingredVO);	// 재고 -처리
					
						
						DateFormat df = new SimpleDateFormat("yy/MM/dd HH:mm:ss.SSSSSS");
						try {
							Date date = df.parse(selngDateStr);
							long time = date.getTime();
							
							Timestamp selngDate2 = new Timestamp(time);
							
							ingredVO.setSelngDate2(selngDate2);
							mapper.plusDelivery(ingredVO);
						} catch (ParseException e) {
							e.printStackTrace();
						}
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
		int count = 0;	// 중복 안되게 count처리하는
		
		for(int i=0; i<salesList.size(); i++) {		// 등록 메뉴개수
			FrcsDailySalesVO salesVO = salesList.get(i);
			String frcsId = salesVO.getFrcsId();
			
			String selngDateStr = salesVO.getSelngDateStr();	// string 타입으로 들어온 날짜 (타임스탬프 형식)
			
			Date selngDate = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");	// 내역 조회 및 새로운 내역 insert를 위해 
			try {
				selngDate = sdf.parse(selngDateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			System.out.println(selngDate);
			salesVO.setSelngDate(selngDate);
//			
//			// 매출 수정 전 메뉴와 메뉴 갯수 확인
			List<FrcsDailySalesVO> beforeList = mapper.getBeforeCount(salesVO);
//			
			// 매출내역에 해당 메뉴가 존재하지 않는다면
			if(beforeList.isEmpty()) {
				int newInsertStatus = mapper.insertDailySales(salesVO);	// 일일 매출 등록
				
				// 일일 매출테이블에 insert를 성공하면
				if(newInsertStatus > 0) {
					String menuCd = salesVO.getMenuCd();	// 메뉴코드
					int menuQy = salesVO.getSelngQy();		// 메뉴판매갯수
					
					// 메뉴코드로 필요한 재료들 찾기..
					List<FrcsMenuIngredientVO> ingredList = mapper.selectMenu(menuCd);
					
					for (int j = 0; j < ingredList.size(); j++) {
	                    FrcsMenuIngredientVO ingredVO = ingredList.get(j);
	                    ingredVO.setFrcsId(frcsId);
	                    ingredVO.setMenuQy(menuQy);
	                    ingredVO.setSelngDate(selngDate); 	
	                    
	                    // 날짜, 가맹점Id, 메뉴코드가 일치하는 데이터들 중 가장 최신의 데이터 1개를 가져온다.
	                    String dlivyDate = mapper.selectRecentDelivery(ingredVO);
	                    
	                    String resultLine = "";
	                    String frontDateText = "";
	                    
	                    // 비어있다면 처음 등록하는 제품
	                    if(StringUtils.isBlank(dlivyDate)) {
	                    	frontDateText = selngDateStr.split("\\.")[0];
	                    	count++;
	                    }else {	// 기존것 가지고 재등록
	                    	String []splitDate = dlivyDate.split("\\.");
	                    	frontDateText = splitDate[0];
	                    	int after = Integer.parseInt(splitDate[1]);
	                    	count = after = after + 1;
	                    }
	                    
	                    if(count<10) {	// 1의 자리
	                    	resultLine = "00000"+count;
	                    }else if(count > 9 && count < 100){	// 10의 자리
	                    	resultLine = "0000"+count;
	                    }else if(count > 99 && count < 1000) {	// 100의 자리
	                    	resultLine = "000"+count;
	                    }else {		// 1000의 자리
	                    	resultLine = "00"+count;
	                    }
	                    
	                    selngDateStr = frontDateText + "." + resultLine;
	                    
	                    mapper.minusInvent(ingredVO);	// 재고 - 처리
	                    
	                    
	                    DateFormat df = new SimpleDateFormat("yy/MM/dd HH:mm:ss.SSSSSS");
	                    try {
	                    	Date date = df.parse(selngDateStr);
	                    	long time = date.getTime();
	                    	
	                    	Timestamp selngDate2 = new Timestamp(time);
	                    	
	                    	ingredVO.setSelngDate2(selngDate2);
	                    	mapper.plusDelivery(ingredVO);
	                    }catch(ParseException e) {
	                    	e.printStackTrace();
	                    }
	                }
	                result = ServiceResult.OK;
	            } else {
	                result = ServiceResult.FAILED;
	                break;
				}
		
			// 매출내역에 이미 해당 메뉴가 존재한다면
			}else {
				for(int z=0; z<beforeList.size(); z++) {	// 이건 사실상 무조건 1?
					
					System.out.println("beforeList.size() : " + beforeList.size());
					System.out.println("수정 전 메뉴와 메뉴 갯수 : " + beforeList.get(z).getMenuCd());
					System.out.println("수정 전 메뉴와 메뉴 갯수 : " + beforeList.get(z).getSelngQy());
					int beforeCount = beforeList.get(z).getSelngQy();	// 이전 갯수

				// 일일 매출은 업데이트 해주고
				int updateStatus = mapper.updateSales(salesVO);	
				
				// 일일 매출 업데이트 성공 시
				if(updateStatus > 0 ) {
					
					// 수정 후 메뉴와 메뉴 개수를 체크
					List<FrcsDailySalesVO> afterList = mapper.getBeforeCount(salesVO);
					
					for(int k=0; k<afterList.size(); k++) {	// 이것도 사실상 1?
						System.out.println("수정 후 메뉴와 메뉴 갯수 : " + afterList.get(k).getMenuCd());
						System.out.println("수정 후 메뉴와 메뉴 갯수 : " + afterList.get(k).getSelngQy());
						int afterCount = afterList.get(k).getSelngQy();
						String menuCd = afterList.get(k).getMenuCd();
						
						int cnt = beforeCount- afterCount;
						
						// count가 양수라면 팔린 메뉴개수를 줄인것
						// 그만큼 다시 재고현황을 플러스 처리 / 출고테이블에는 마이너스로 insert
						// count가 음수라면 팔린 메뉴개수를 늘린것
						// 그만큼 재고현황을 마이너스 처리 / 출고테이블에는 플러스로 insert
						 
						// 메뉴코드로 필요한 재료들 찾기..
						List<FrcsMenuIngredientVO> ingredList = mapper.selectMenu(menuCd);
						
							for(int y=0; y<ingredList.size(); y++) {	// 재료 리스트만큼 for문
								FrcsMenuIngredientVO ingredVO = ingredList.get(y);	
								ingredVO.setFrcsId(frcsId);	
								ingredVO.setMenuQy(-cnt);	// 메뉴 판매개수
								ingredVO.setSelngDate(selngDate);
								
								 // 날짜, 가맹점Id, 메뉴코드가 일치하는 데이터들 중 가장 최신의 데이터 1개를 가져온다.
			                    String dlivyDate = mapper.selectRecentDelivery(ingredVO);
			                    
			                    String resultLine = "";
			                    String frontDateText = "";
			                    
			                    int count2 = 0;
			                    
			                    // 비어있다면 처음 등록하는 제품
			                    if(StringUtils.isBlank(dlivyDate)) {
			                    	frontDateText = selngDateStr.split("\\.")[0];
			                    	count2++;
			                    }else {	// 기존것 가지고 재등록
//			                    	String []splitDate = dlivyDate.split("\\.");
			                    	frontDateText = dlivyDate.substring(0,19);
			                    	String temp = dlivyDate.substring(20,23);
			                    	System.out.println("frontDateText : " + frontDateText);
			                    	System.out.println("temp : " + temp);
			                    	int after = Integer.parseInt(temp);
			                    	System.out.println("after : " + after);
//			                    	frontDateText = splitDate[0];
//			                    	int after = Integer.parseInt(splitDate[1]);
			                    	System.out.println("after : " + after);
			                    	count2 = after = after + 1;
			                    	System.out.println("count : " + count2);
			                    }
			                    
			                    if(count2<10) {	// 1의 자리
			                    	resultLine = "00"+count2;
			                    }else if(count > 9 && count2 < 100){	// 10의 자리
			                    	resultLine = "0"+count2;
			                    }else {		// 1000의 자리
			                    	resultLine = ""+count2;
			                    }
			                    
			                    selngDateStr = frontDateText + "." + resultLine;
			                    System.out.println("selngDateStr : " + selngDateStr);
								mapper.minusInvent(ingredVO);	// 재고 -처리
						
								DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
								
								try {
									Date date = df.parse(selngDateStr);
									long time = date.getTime();
									
									Timestamp selngDate2 = new Timestamp(time);

									ingredVO.setSelngDate2(selngDate2);
									mapper.plusDelivery(ingredVO);
								} catch (ParseException e) {
									e.printStackTrace();
								}
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

	// 주간차트를 위한 데이터 불러오기
	@Override
	public int[] getDate(String frcsId) {
		
		int[] chartArr = new int[14];
		int index = 0;
		
		// 지난주 월요일부터 이번주 일요일까지 데이터 돌림
		for(int i=-7; i<7; i++) {
			FrcsDailySalesVO salesVO = new FrcsDailySalesVO();
			salesVO.setCnt(i);
			salesVO.setFrcsId(frcsId);
			int price = mapper.getDate(salesVO);
			chartArr[index] = price;
			index++;
		}
		return chartArr;
	}

	// 인기 메뉴
	@Override
	public List<FrcsDailySalesVO> getPopularMenu(String frcsId) {
		return mapper.getPopularMenu(frcsId);
	}

	// 엑셀 다운로드
	@Override
	public List<FrcsDailySalesVO> getDailySalesCellList(String frcsId) {
		return mapper.getDailySalesCellList(frcsId);
	}
}




