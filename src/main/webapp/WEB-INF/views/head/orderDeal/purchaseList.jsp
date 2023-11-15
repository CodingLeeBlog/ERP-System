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
                  <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">본사의 매입내역을 조회합니다.</div>
               </div>
               <div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
                  주문거래관리 / &nbsp;<span class="text-decoration-underline">매입내역관리</span>
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
                                        <div class="col-3">
                                            <div class="input-group">
                                                <label for="inputPassword2" class="visually-hidden">Search</label>
                                              <input type="search" class="form-control" id="inputPassword2" placeholder="Search">
                                                <button type="button" class="btn btn-secondary">검색</button>
                                            </div>
                                      </div>
                                      <div class="col-2">
                                            <div class="col-12">
                                               <span style="color: red; font-weight: bold;">11월 TOTAL :</span><span id="monthTotal" style="font-weight: bold;">
                                               <fmt:formatNumber value="${thisMonth }" type="number"/>(원)   
                                               </span>      
                                            </div>
                                            <div class="col-12">
                                               <span style="color: red; font-weight: bold;">금일 TOTAL :</span><span id="dayTotal" style="font-weight: bold;">
                                               <fmt:formatNumber value="${thisDay }" type="number"/>(원)
                                               </span>
                                            </div>
                                          
                                      </div>
                                      <sec:csrfInput/>
                                  </form>                            
                              </div>
                              
                              <div class="col-xl-2">
                                  <div class="text-xl-end mt-xl-0 mt-2">
                                        <button id="orderBtn" type="button" class="btn btn-success mb-2 fw-bold">발주하기</button>
                                  </div>
                              </div><!-- end col-->
                          </div>
                     
                     <c:set value="${pagingVO.dataList }" var="dataList"/>
                     
                          <div class="table-responsive">
                          
                              <table id="myTable" class="table table-centered table-nowrap mb-0 table-hover">
                                  <thead class="table-light">
                                      <tr>
                                            <th></th>
                                          <th style="text-align:center; width:100px;">순번</th>
                                            <th style="text-align:center; width:200px;">거래처코드</th>
                                          <th style="text-align:center; width:200px;">거래처명</th>
                                          <th style="text-align:center; width:200px;">발주일자</th>
                                            <th style="text-align:center; width:200px;">거래처주소</th>
                                            <th style="text-align:center; width:200px;">상태</th>
                                            <th style="text-align:center; width:200px;">총주문금액</th>
                                          <th style="text-align:center; width:50px;">상세</th>
                                          <th style="text-align:center; width:50px;">주문취소</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                  <c:forEach items="${dataList }" var="list" varStatus="status">
                                      <tr class="trlist">
                                         <td><input class="orderNo" type="hidden" value="${list.hdorderNo }"></td>
                                          <td style="text-align:center">${list.rnum }</td>
                                            <td style="text-align:center">${list.vdCode }</td>
                                          <td style="text-align:center">${list.vdName }</td>
                                            <td style="text-align:center">${list.hdorderDate }</td>
                                         <td style="text-align:center">${list.vdAdd1 }&nbsp;${list.vdAdd2 }</td>
                                         <td style="text-align:center">${list.hdorderConfm }</td>
                                            <td class="price" style="text-align:center">
                                            <fmt:formatNumber value="${list.hdordertotalPrice }" type="number" />(원)
                                            </td>
                                          <td class="detailBtn" style="text-align:center;">
<%--                                              <a href="/head/storeOrderHistoryDetails.do?frcsId=${focus.frcsId }&frcsorderDate=${focus.frcsorderDate }"><button type="button" class="btn btn-danger fw-bold">상세보기</button></a> --%>
                                             <a href="/head/purchaseListDetail.do?hdorderNo=${list.hdorderNo }">
                                             <c:if test="${list.hdorderConfm eq '승인'}"><button type="button" class="detail btn btn-primary fw-bold">주문상세</button></c:if>
                                             <c:if test="${list.hdorderConfm eq '취소'}"><button type="button" class="cancelDetail btn btn-secondary fw-bold">주문상세</button></c:if>
                                             </a>
                                             <c:if test="${list.hdorderConfm eq '반려'}"><button type="button" class="cancelReason btn btn-info fw-bold" data-bs-toggle="modal" data-bs-target="#bs-example-modal-lg">반려사유</button>
                                             <div id="bs-example-modal-lg" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                                     <div class="modal-dialog modal-sm modal-dialog-centered">
                                         <div class="modal-content">
                                             <div class="modal-body p-4">
                                                 <div class="text-center">
                                                     <i class="ri-alert-line h1 text-warning"></i>
                                                     <h3 class="mt-2">반려사유</h3>
                                                     <h4 class="mt-3">${list.hdorderReturn }</h4>
                                                     <button type="button" class="btn btn-warning my-2" data-bs-dismiss="modal">확인</button>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                  </div>
                                             </c:if>
                                          </td>
                                          <td class="cancelBtn" style="text-align:center;">
                                             <button type="button" class="cancel btn btn-danger fw-bold">취소</button>
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
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
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
         var hdorderConfm = $(this).closest("tr").find("td:eq(6)").text(); // 승인/반려 상태
         
         if(hdorderConfm === "승인"){
            totalPrice += price;  
         }
         
      });
      
      console.log(totalPrice);
      
      var totalPrices = $("#totalPrices");
      totalPrices.html(totalPrice.toLocaleString() + "(원)");
      
      $("#orderBtn").on("click", function(){
         location.href= '/head/purchaseListOrder.do'; 
      })
      
      $(".detailBtn").on("click", ".cancelDetail", function(){
         var hdorderConfm = $(this).closest("tr").find("td:eq(6)").text(); // 승인/반려 상태
         var hdorderConfmBtn = $(this).closest("tr").find("td:eq(8)").text().trim(); // 상세 버튼 텍스트
         
         if(hdorderConfm === '취소'){
            return false;
         }
      });
      
      $(".cancelBtn").on("click", ".cancel", function(){
         var vdCode = $(this).closest("tr").find("td:eq(2)").text();      // 거래처코드
         var vdName = $(this).closest("tr").find("td:eq(3)").text();      // 거래처명
         var hdorderDate = $(this).closest("tr").find("td:eq(4)").text();   // 발주일자
         var hdorderConfm = $(this).closest("tr").find("td:eq(6)").text(); // 승인/반려 상태
         var hdorderConfmBtn = $(this).closest("tr").find("td:eq(8)").text().trim(); 
         var hdNo = $(this).closest("tr").find(".orderNo").val();      // 발주번호
         
         console.log(vdCode);
         console.log(vdName);
         console.log(hdorderDate);
         console.log(hdorderConfm);
         console.log(hdNo);
         console.log(hdorderConfmBtn);
         
         if(hdorderConfm === '승인'){
            Swal.fire({
                  title: "취소하시겠습니까?",
                  text: "다시 되돌릴 수 없습니다. 신중하세요.",
                  input: 'text',
                  inputPlaceholder:'취소사유 입력',
                  icon: "warning",
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: "확인",
                  cancelButtonText: "취소",
                  // 확인 버튼 시 반려처리
                  preConfirm: function() {
                     
                     var hdorderNo = {"hdorderNo" : hdNo};
                     
                     $.ajax({
                          type: "POST",
                          url : "/head/updateCancelOrderList.do",
                          beforeSend : function(xhr){   // csrf토큰 보내기 위함
                         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");   //key value로 보낸다.
                      },
                      contentType : "application/json; charset=utf-8",
                          data : JSON.stringify(hdorderNo),
                      success: function (res) {
                           if(res === "OK"){
                              
                              Swal.fire({
                                   title: "알림",
                                   text: "취소처리 되었습니다",
                                   confirmButtonText: "확인",
                                   icon: "success",
                                   preConfirm: function () {
                                       location.href = "/head/purchaseList.do";
                                   }
                               });
                           }
                      }
                       });
                     
                     
                  },
              });
             // SweetAlarm 끝
             
         }
      });
      
   // 페이지 접속 또는 새로고침 시 행마다 반복하며 조건에맞는 행은 체크박스 disable, line-through처리
     $('.trlist').each(function() {
         var statusCheck = $(this).closest('tr').find('td:eq(6)').text().trim();
         
         if (statusCheck === "취소" || statusCheck === "반려") {
             $(this).closest('tr').css('text-decoration', 'line-through');
         }
     });
      
   });
   
   
</script>