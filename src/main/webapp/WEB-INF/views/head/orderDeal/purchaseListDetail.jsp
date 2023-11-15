<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- Start Content-->
<div class="content-page">
   <div class="content">
      <!-- Start Content-->
      <div class="container-fluid">

      <!-- start page title -->
      <div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
         <div class="row ">
               <div class="card-body col-4 align-items-center">
                  <div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">매입내역관리</div>
                  <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">본사의 매입상세를 조회합니다.</div>
               </div>
               <div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
                  주문거래관리 / &nbsp;<span class="text-decoration-underline">매입내역상세</span>
               </div>
            </div>
         </div>
            <!-- end page title -->

            <div class="row">
              <div class="col-12">
                  <div class="card">
                      <div class="card-body">
                          <div class="row mb-2">
                              <div class="col-xl-10">
                                  <form id="searchForm" method="post" class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
                                  <input type="hidden" name="page" id="page"/>
                                      <!-- Predefined Date Ranges -->
                                        <div class="col-2">
                                                <input class="form-control" id="example-date" type="date" name="date">
                                        </div>
                                        <div class="col-auto">
                                            <span>~</span>
                                        </div>
                                        <div class="col-2">
                                                <input class="form-control" id="example-date" type="date" name="date">
                                        </div>
                                      <div class="col-2">
                                          <div class="d-flex align-items-center">
                                              <label for="status-select" class="col-3">거래처</label>
                                              <select class="form-select" id="status-select">
                                                  <option selected>선택해주세요</option>
                                                  <option value="1">대전대흥점</option>
                                                  <option value="2">대전선화점</option>
                                              </select>
                                          </div>
                                      </div>
                                        <div class="col-4">
                                            <div class="input-group">
                                                <label for="inputPassword2" class="visually-hidden">Search</label>
                                              <input type="search" class="form-control" id="inputPassword2" placeholder="Search">
                                                <button type="button" class="btn btn-secondary">검색</button>
                                            </div>
                                      </div>
                                      <sec:csrfInput/>
                                  </form>                            
                              </div>
                              
                              <div class="col-xl-2">
                                  <div class="text-xl-end mt-xl-0 mt-2">
                                      <a href="/head/purchaseList.do"><button type="button" class="btn btn-success mb-2 fw-bold">뒤로가기</button></a>
                                  </div>
                              </div><!-- end col-->
                          </div>
                     
                     <c:set value="${pagingVO.dataList }" var="dataList"/>
                     
                          <div class="table-responsive">
                          
                              <table class="table table-centered table-nowrap mb-0 table-hover">
                                  <thead class="table-light">
                                      <tr>
                                          <th style="text-align:center; width:100px;">순번</th>
                                            <th style="text-align:center; width:150px;">발주번호</th>
                                          <th style="text-align:center; width:100px;">제품코드</th>
                                            <th style="text-align:center; width:150px;">제품명</th>
                                            <th style="text-align:center; width:150px;">입고일자</th>
                                          <th style="text-align:center; width:150px;">주문수량</th>
                                            <th style="text-align:center; width:150px;">가격</th>
                                            <th style="text-align:center; width:150px;">제품총계</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                  <c:forEach items="${dataList }" var="list" varStatus="status">
                                      <tr class="trlist">
                                          <td style="text-align:center">${list.rnum }</td>
                                            <td style="text-align:center">${list.hdorderNo }</td>
                                          <td style="text-align:center">${list.vdprodCd }</td>
                                         <td style="text-align:center">${list.vdprodName }</td>
                                         <td style="text-align:center">
                                         <fmt:formatDate value="${list.hdrcvinDate }" pattern="yy/MM/dd"/>
                                         
                                         </td>
                                            <td style="text-align:center">
	                                            <fmt:formatNumber value="${list.hdorderQy }" type="number" />(EA)
                                            </td>
                                            <td class="price" style="text-align:center">
                                             <fmt:formatNumber value="${list.hdrcvPrice }" type="number" />(원)
                                            </td>
                                            <td style="text-align:center">
                                            <fmt:formatNumber value="${list.hdordertotalPrice }" type="number" />(원)	
                                            </td>
                                      </tr>
                                      </c:forEach>
                                        <tr>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center; color: brown; font-weight: bold;">총계 :</td>
                                            <td id="totalPrices" style="text-align:center; color: brown; font-weight: bold;">0 (원)</td>
                                        </tr>
                                  </tbody>
                              </table>
                          </div>
                          <br>
                        <nav aria-label="Page navigation example" id="pagingArea">
                          ${pagingVO.pagingHTML }
                        </nav>
                     
                      </div> <!-- end card-body-->
                      
                  </div> <!-- end card-->
              </div> <!-- end col -->
          </div>

             <!-- 모달 창 -->
            

        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <script>document.write(new Date().getFullYear())</script> © Hyper - Coderthemes.com
                    </div>
                    <div class="col-md-6">
                        <div class="text-md-end footer-links d-none d-md-block">
                            <a href="javascript: void(0);">About</a>
                            <a href="javascript: void(0);">Support</a>
                            <a href="javascript: void(0);">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->


        </div>
        <!-- End Container-fluid-->
   </div>
   <!-- content -->
</div>
<!-- content-page -->

<script type="text/javascript">
   $(function(){
      var searchForm = $("#searchForm");
      
      // a 태그를 클릭하면 이벤트 실행
      $("#pagingArea").on("click","a", function(event){
         event.preventDefault();
         var pageNo = $(this).data("page");
         searchForm.find("#page").val(pageNo);
         searchForm.submit();
      });
      
      var trlist = $(".trlist");
      var totalPrice = 0;
      
      trlist.each(function(){
    	  var priceText = $(this).find("td:eq(7)").text().trim();
    	  var price = parseInt(priceText.replace(/,/g, '')); // 쉼표를 제거하고 숫자로 변환
    	  totalPrice += price;
      });
      
      console.log(totalPrice);
      
      var totalPrices = $("#totalPrices");
      totalPrices.html(totalPrice.toLocaleString() + "(원)");
   });
</script>