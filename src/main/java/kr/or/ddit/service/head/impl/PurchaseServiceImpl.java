package kr.or.ddit.service.head.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.mapper.head.PurchaseMapper;
import kr.or.ddit.service.head.IPurchaseService;
import kr.or.ddit.vo.head.HeadPaginationInfoVO;
import kr.or.ddit.vo.head.PurchaseVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PurchaseServiceImpl implements IPurchaseService{
   
   @Inject
   private PurchaseMapper mapper;
   
   @Override
   public int selectTotalPurchaseCount(HeadPaginationInfoVO<PurchaseVO> pagingVO) {
      return mapper.selectTotalPurchaseCount(pagingVO);
   }

   @Override
   public List<PurchaseVO> selectTotalPurchaseList(HeadPaginationInfoVO<PurchaseVO> pagingVO) {
      
      List<PurchaseVO> dataList = new ArrayList<PurchaseVO>();
      
      List<PurchaseVO> settingTotalPrice = mapper.selectTotalPurchaseList(pagingVO);
      
      Date month = new Date();
      SimpleDateFormat formatter = new SimpleDateFormat("MM");
      String mt = formatter.format(month);
      
      log.debug("Date타입으로 받은 현재 월 -> {}", month);
      log.debug("String으로 변환한 현재 월 -> {}", mt);
      
      for (PurchaseVO pcVO : settingTotalPrice) {
         int total = 0;
         int thisMonth = 0;
         int thisDay = 0;
         
         String hdorderNo = pcVO.getHdorderNo();

         String orderDate = pcVO.getHdorderDate();
         String[] orderMonth = orderDate.split("/");
         String orMonth = orderMonth[1];
         
         List<PurchaseVO> price = mapper.selectOrderDetail(hdorderNo);
         
         for (PurchaseVO pr : price) {
            SimpleDateFormat formated = new SimpleDateFormat("MM/dd");
            String dt = formated.format(month);
            
            String od = pr.getHdorderDate();
            String[] odt = od.split("-");
            String odtt = odt[1];
            String odttd = odt[2];
            
            String[] odttdd = odttd.split(" ");
            String odttddd = odttdd[0];
            
            String presentDay = odtt + "/" + odttddd;
            
            int hdorderQy = pr.getHdorderQy();
            int hdrcvPrice = pr.getHdrcvPrice();
            
            total += (hdorderQy * hdrcvPrice);
            
            // 금월 발주총계
            if(mt.equals(orMonth)) {
               if((pr.getHdorderConfm()).equals("승인")) {
                  int orderQy = pr.getHdorderQy();
                  int hdPrice = pr.getHdrcvPrice();
                  
                  thisMonth += (orderQy * hdPrice);
               }
               
            }
            
            // 금일 발주총계
            if(dt.equals(presentDay)) {
               if((pr.getHdorderConfm()).equals("승인")) {
                  int orderQy = pr.getHdorderQy();
                  int hdPrice = pr.getHdrcvPrice();
                  
                  thisDay += (orderQy * hdPrice);
               }
            }
            
         }
         
         log.debug("세팅되는 total값 -> {}", total);
         
         pcVO.setHdordertotalPrice(total);
         pcVO.setThisMonth(thisMonth);
         pcVO.setThisDay(thisDay);
         
         dataList.add(pcVO);
      }
      
      return dataList;
   }

   // 매입내역관리 상세화면
   @Override
   public int selectDetailCount(String hdorderNo) {
      return mapper.selectDetailCount(hdorderNo);
   }

   @Override
   public List<PurchaseVO> selectDetailList(HeadPaginationInfoVO<PurchaseVO> pagingVO) {
      
      List<PurchaseVO> dataList = mapper.selectDetailList(pagingVO);
      
      for (PurchaseVO pcVO : dataList) {
         int hdorderQy = pcVO.getHdorderQy();
         int hdrcvPrice = pcVO.getHdrcvPrice();
         
         int hdordertotalPrice = (hdorderQy * hdrcvPrice);
         pcVO.setHdordertotalPrice(hdordertotalPrice);
      }
      
      return dataList;
   }

   @Override
   public List<PurchaseVO> selectDataList(String vdCategory) {
      return mapper.selectDataList(vdCategory);
   }

   @Override
   public List<PurchaseVO> selectOrderList(PurchaseVO pcVO) {
      return mapper.selectOrderList(pcVO);
   }

   // HEAD_ORDER 테이블에 INSERT
   @Override
   public ServiceResult insertHeadOrder(PurchaseVO pcVO) {
      ServiceResult result = null;
      
      int status = mapper.insertHeadOrder(pcVO);
      
      if(status > 0) {
         result = ServiceResult.OK;
      }else {
         result = ServiceResult.FAILED;
      }
      
      return result;
   }
   
   // HEAD_ORDER_DETAIL 테이블에 INSERT
   @Override
   public ServiceResult insertOrder(PurchaseVO phVO) {
      ServiceResult result = null;
      int status = mapper.insertOrder(phVO);
      String vdprodCd = phVO.getVdprodCd();
      log.debug("컨트롤러에서 보내준 vdprodCd -> {}",vdprodCd);
      
      PurchaseVO pcVO = new PurchaseVO();
      pcVO = mapper.selectProduct(vdprodCd);
      int originhdremainQy = pcVO.getHdremainQy();
      
      int orderQy = phVO.getHdorderQy();
      log.debug("컨트롤러에서 보내준 orderQy -> {}",orderQy);
      
      PurchaseVO insertpcVO = new PurchaseVO();
      insertpcVO.setVdprodCd(vdprodCd);
      insertpcVO.setHdrcvprodinQy(orderQy);
      
      int headReceiving = mapper.insertHeadReceiving(insertpcVO);
      
      int hdremainQy = (originhdremainQy + orderQy);
      log.debug("본사재고 + 주문수량 : hdremainQy -> {}",hdremainQy);
      // 본사재고에 주문수량 더해주고 phVO파라미터에 세팅
      pcVO.setHdremainQy(hdremainQy);
      int updateHead = mapper.updateHeadInventory(pcVO);
      
      PurchaseVO pcVendorVO = new PurchaseVO();
      pcVendorVO = mapper.selectVendorProduct(vdprodCd);
      int originvdremainQy = pcVendorVO.getVdremainQy();
      
      int vdremainQy = (originvdremainQy - orderQy);
      log.debug("기존거래처재고 - 주문수량재고 : vdremainQy -> {}",vdremainQy);
      // 거래처재고에 주문수량 빼주고 pcVendorVO파라미터에 세팅
      pcVendorVO.setVdremainQy(vdremainQy);
      
      int updateVendor = mapper.updateVendorInventory(pcVendorVO);
      
      if(status > 0 && updateHead > 0 && updateVendor > 0 && headReceiving > 0) {
         result = ServiceResult.OK;
      }else {
         result = ServiceResult.FAILED;
      }
      
      return result;
   }

   @Override
   public ServiceResult updateHeadOrderConfm(String hdorderNo) {
      ServiceResult result = null;
      
      int status = mapper.updateHeadOrderConfm(hdorderNo);
      
      if(status > 0) {
         result = ServiceResult.OK;
      }else {
         result = ServiceResult.FAILED;
      }
      
      return result;
   }

   // 본사재고리스트
   @Override
   public int selectHeadInventory(HeadPaginationInfoVO<PurchaseVO> pagingVO) {
      return mapper.selectHeadInventory(pagingVO);
   }

   @Override
   public List<PurchaseVO> selectHeadInventoryList(HeadPaginationInfoVO<PurchaseVO> pagingVO) {
      return mapper.selectHeadInventoryList(pagingVO);
   }
   
   
}