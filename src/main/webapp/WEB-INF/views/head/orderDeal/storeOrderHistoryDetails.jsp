<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                  <div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">가맹점 주문상세</div>
                  <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">가맹점의 주문내역 상세를 조회합니다.</div>
               </div>
               <div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
                  가맹점주문내역 / &nbsp;<span class="text-decoration-underline">주문내역 상세</span>
               </div>
            </div>
         </div>
            <!-- end page title -->
            
            <c:set value="${pagingVO.dataList }" var="list" />
            
            <div class="row">
              <div class="col-12">
                  <div class="card">
                      <div class="card-body">
                          <div class="row mb-2">
                              <div class="col-xl-10">
                                  <form id="searchForm" method="post" class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
                                  <input type="hidden" id="page" name="page"/>
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
                                              <input name="storeOrderDetailSearch" type="search" class="form-control" id="inputPassword2" placeholder="Search">
                                                <button type="button" class="btn btn-secondary">검색</button>
                                            </div>
                                      </div>
                                      <sec:csrfInput/>
                                  </form>                            
                              </div>

                                <div class="col-xl-2">
                                  <div class="clickBtn text-xl-end mt-xl-0 mt-2">
                                     <button id="commitBtn" data-type="commit" type="button" class="btn btn-info mb-2 fw-bold">승인</button>
                                      <button id="cancleBtn" data-type="cancle" type="button" class="btn btn-danger mb-2 fw-bold">반려</button>
                                      <a href="/head/storeOrderHistory.do"><button type="button" class="btn btn-secondary mb-2 fw-bold">뒤로가기</button></a>
                                  </div>
                              </div><!-- end col-->
                          </div>
      
                          <div id="tableCheck" class="table-responsive">
                          
                              <table class="table table-centered table-nowrap mb-0 table-hover">
                                  <thead class="table-light">
                                      <tr>
                                         <th style="text-align:center; width:20px;">
                                             <div class="form-check">
                                                     <input id="selectAll" name="allCheckbox" type="checkbox" class="form-check-input" value="all">
                                                     <label class="form-check-label" for="customCheck1">&nbsp;</label>
                                                 </div>
                                         </th>
                                          <th style="text-align:center; width:100px;">순번</th>
                                            <th style="text-align:center; width:150px;">발주번호</th>
                                          <th style="text-align:center; width:100px;">가맹점명</th>
                                            <th style="text-align:center; width:150px;">주문일자</th>
<!--                                           <th style="text-align:center; width:150px;">제품명</th> -->
<!--                                             <th style="text-align:center; width:150px;">제품금액</th> -->
<!--                                           <th style="text-align:center; width:150px;">주문수량</th> -->
                                          <th style="text-align:center; width:150px;">총 금액</th>
                                          <th style="text-align:center; width:150px;">상태</th>
                                          
                                      </tr>
                                  </thead>
                                  <tbody id="tbody">
                                     <c:forEach items="${list }" var="detailList" varStatus="status">
                                         <tr class="trData" >
                                            <td style="text-align:center; width:20px;">
                                               <div class="checkList form-check">
                                                         <input type="checkbox" class="chk form-check-input" name="frcsorderNo" value="${detailList.frcsorderNo}">
                                                         <label class="form-check-label" for="checkTd">&nbsp;</label>
                                                     </div>
                                            </td>
                                             <td style="text-align:center; width:100px;">${status.count }</td>
                                               <td style="text-align:center; width:100px;">${detailList.frcsorderNo }</td>
                                             <td style="text-align:center; width:100px;">${detailList.frcsName }</td>
                                            <td style="text-align:center; width:100px;">${detailList.frcsorderDate }</td>
                                             <td style="text-align:center; width:100px;">
                                                <fmt:formatNumber value="${detailList.totalPrice }" type="number"></fmt:formatNumber>(원) 
                                             </td>
                                             <td style="text-align:center; width:100px;">${detailList.frcsorderConfm }</td>
                                         </tr>
                                      </c:forEach>
                                        <tr>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center; width:100px; color: brown; font-weight: bold;">총계 :</td>
                                            <td id="total" style="text-align:center; width:100px; color: brown; font-weight: bold;">0(원)</td>
<%--                                                <fmt:formatNumber value="${pagingVO.totalPrice }" type="number"></fmt:formatNumber>(원) --%>
                                            <td style="text-align:center; color: brown; font-weight: bold;"></td>
                                        </tr>
                                  </tbody>
                              </table>
                              
                              <nav aria-label="Page navigation example" id="pagingArea">
                           ${pagingVO.pagingHTML }
                        </nav>
                                             
                          </div>
                          <br>
                           
                           
                           
                      </div> <!-- end card-body-->
                      
                  </div> <!-- end card-->
              </div> <!-- end col -->
          </div>

             <!-- 모달 창 -->
            <div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="standard-modalLabel"><span style="color: brown; font-weight: bold; font-size: large;">반려사유</span></h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header align-items-center">
                                        <label for="billing-phone" class="form-label">선택내역
                                    <span class="text-danger">*</span></label> 
                                        <table class="table table-hover">
                                            <thead>
                                                    <tr>
                                                        <th>순번</th>
                                                        <th>발주번호</th>
                                                        <th>발주일자</th>
                                                        <th>발주총액</th>
                                                    </tr>
                                            </thead>
                                            <tbody id="modalTbody">
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                    <hr>
                                    <div class="card-body">
                                        <div class="mb-2">
                                 <label for="billing-phone" class="form-label">반려사유
                                    <span class="text-danger">*</span></label> 
                                 <input class="form-control" type="text" placeholder="재고부족" id="frcsorderReturn" />
                              </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="modalButton" type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal --> 
           
            <div >
               <input id="frcsorderDataDiv" type="hidden" value="${frcsorderDate }">
               <input id="frcsId" type="hidden" value="${frcsId }">
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
   var checkData = [];
   
   var searchForm = $("#searchForm");
   var trData = $(".trData"); 
   var chk = $(".chk");
   var selectAll = $("#selectAll");
   var total = $("#total");
   var tbody = $("#tableCheck tbody");
   
   var clickBtn = $(".clickBtn");
   var cancelBtn = $("#cancelBtn");
   
   var modal = $("#modal");
   var totalPrice = 0;
   var modalButton = $("#modalButton");

   function formatWon(number) {
	    // 숫자를 한국 표준 통화 형식으로 포맷팅
	    var formattedNumber = new Intl.NumberFormat('ko-KR', {
	      style: 'currency',
	      currency: 'KRW'
	    }).format(number);
	    
	    // "₩" 통화 기호 제거
	    formattedNumber = formattedNumber.replace("₩", "");
	    
	    // "(원)" 추가
	    return formattedNumber + "(원)";
	}
	
	function typeNumber(number) {
	    // 숫자를 한국 표준 통화 형식으로 포맷팅
	    var formattedNumber = new Intl.NumberFormat('ko-KR', {
	      style: 'currency',
	      currency: 'KRW'
	    }).format(number);
	    
	    // "₩" 통화 기호 제거
	    formattedNumber = formattedNumber.replace("₩", "");
	    
	    // "(원)" 추가
	    return formattedNumber;
	}
	
	function typeDate(dateString) {
		  // 입력된 날짜 문자열을 Date 객체로 파싱
		  var date = new Date(dateString);

		  // 년, 월, 일을 가져와서 원하는 형식으로 조합
		  var year = date.getFullYear();
		  var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리로 패딩
		  var day = date.getDate().toString().padStart(2, '0'); // 일자를 2자리로 패딩

		  // 원하는 형식으로 조합해서 반환
		  var formattedDate = year + '/' + month + '/' + day;
		  return formattedDate;
		}
   
   
   clickBtn.on("click", "button", function(){
      var type = $(this).data("type");
      
      var orderData = $("#frcsorderDataDiv").val();
      console.log("orderData : " + orderData);
      
      console.log("배열에담긴 데이터 최종확인",checkData);
      
         
         if(type === "commit"){
            
        	 if(checkData.length == 0){
        		 Swal.fire({
                     title: "ERROR",
                     text: "체크된 데이터가 존재하지 않습니다!",
                     icon: "success",
                     showCancelButton: true,
                     confirmButtonColor: '#3085d6',
                     cancelButtonColor: '#d33',
                     confirmButtonText: "확인",
                     cancelButtonText: "취소",
                     // 확인 버튼 시 가맹점 주문 승인처리
                     preConfirm: function() {}
                 });
        		 return false;
        	 }
        	 
        	 checkData.forEach(function(item) {
                 item.frcsId = $("#frcsId").val();
             });
        	 
        	 console.log("frcsId가 추가됐는지 확인 : ",checkData);
        	 
            Swal.fire({
                  title: "승인하시겠습니까?",
                  text: "다시 되돌릴 수 없습니다. 신중하세요.",
                  icon: "success",
                  showCancelButton: true,
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: "확인",
                  cancelButtonText: "취소",
                  // 확인 버튼 시 가맹점 주문 승인처리
                  preConfirm: function() {
                     
                       $.ajax({
                          type: "POST",
                          url : "/head/commitBtn.do",
                          beforeSend : function(xhr){   // csrf토큰 보내기 위함
                         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");   //key value로 보낸다.
                      },
                      contentType : "application/json; charset=utf-8",
                          data : JSON.stringify(checkData),
                      success: function (res) {
                          console.log(res);
                           if(res === "OK"){
                             Swal.fire({
                                  title: "알림",
                                  text: "승인이 완료되었습니다",
                                  confirmButtonText: "확인",
                                  icon: "success",
                                  preConfirm: function () {
                                      location.href = "/head/storeOrderHistoryDetails.do?frcsId=${frcsId}&frcsorderDate=${frcsorderDate}";
                                  }
                              });
                           }
                          
                      }
                       });
                  },
              });

         }else if(type === "cancle"){
            
            var modalHtml = "";
            
            console.log("받아야하는 -> ", checkData);
            
//             let data = {"checkData":checkData};
            
            if(checkData.length == 0){
       		 Swal.fire({
                    title: "ERROR",
                    text: "체크된 데이터가 존재하지 않습니다!",
                    icon: "success",
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: "확인",
                    cancelButtonText: "취소",
                    // 확인 버튼 시 가맹점 주문 승인처리
                    preConfirm: function() {}
                });
       		 return false;
       	 }
            
            checkData.forEach(function(item) {
                item.frcsId = $("#frcsId").val();
            });
            
            console.log("반려클릭했을시 컨트롤러로 넘어가기전 확인 -> ", checkData);
            
            var frcsorderNo = "";
            for(var a = 0; a < checkData.length; a++){
            	frcsorderNo += checkData[a].frcsorderNo;
            	if(checkData.length > 1){
            		if(checkData.length == a){
            			break;
            		}
            		frcsorderNo += ",";
            	}
            }
            var data = {
            	frcsId : checkData[0].frcsId,
            	frcsorderNo : frcsorderNo
            };
            
            $.ajax({
                    type: "POST",
                    url : "/head/cancleModal.do",
                    beforeSend : function(xhr){   // csrf토큰 보내기 위함
                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");   //key value로 보낸다.
                },
                contentType : "application/json; charset=utf-8",
//                     data : JSON.stringify(checkData),
                    data : JSON.stringify(data),
                success: function (res) {
                    console.log(res);
                   
                   var count = 1;
                   
                    $.each(res, function(idx,storeOrderHistoryVO){
                       modalHtml += "   <tr>";
                        modalHtml += "      <td>" + count + "</td>";
                        modalHtml += "      <td>" + storeOrderHistoryVO.frcsorderNo + "</td>";
                        modalHtml += "      <td>" + storeOrderHistoryVO.frcsorderDate + "</td>";
                        modalHtml += "      <td>" + storeOrderHistoryVO.totalPrice + "</td>";
                        modalHtml += "   </tr>";
                        
                        count++;
                    });
                    
                    $("#modalTbody").html(modalHtml);
                    
                    modalButton.on("click", function(){
                     
                       // 반려사유 값(재고부족 / 유통기한 임박 등)
                       var frcsorderReturn = $("#frcsorderReturn").val();
                       
                       // 반려사유를 기존 checkData에 추가해준다
                       // 기존데이터 : {"frcsorderNo" : 20215-542}
                       // 추가 후 데이터 : {"frcsorderNo" : 20215-542 , "frcsorderReturn" : 재고부족}
                       // 2개 3개를 선택해도 추가 후 데이터 형태로 배열에 push된다.
                       checkData.forEach(function(item) {
                           item.frcsorderReturn = frcsorderReturn;
                       });
                       
                       console.log("modalButton -> ",checkData);
                       
                       Swal.fire({
                            title: "반려하시겠습니까?",
                            text: "다시 되돌릴 수 없습니다. 신중하세요.",
                            icon: "warning",
                            showCancelButton: true,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: "확인",
                            cancelButtonText: "취소",
                            // 확인 버튼 시 반려처리
                            preConfirm: function() {
                               
                                 $.ajax({
                                    type: "POST",
                                    url : "/head/cancleModalButton.do",
                                    beforeSend : function(xhr){   // csrf토큰 보내기 위함
                                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");   //key value로 보낸다.
                                },
                                contentType : "application/json; charset=utf-8",
                                    data : JSON.stringify(checkData),
                                success: function (res) {
                                     if(res === "OK"){
                                       Swal.fire({
                                            title: "알림",
                                            text: "승인이 완료되었습니다",
                                            confirmButtonText: "확인",
                                            icon: "success",
                                            preConfirm: function () {
                                                location.href = "/head/storeOrderHistoryDetails.do?frcsId=${frcsId}&frcsorderDate=${frcsorderDate}";
                                            }
                                        });
                                     }
                                    
                                }
                                 });
                            },
                        });
                       // SweetAlarm 끝
                       
                       
                    });
                    $("#modal").modal("show");
                }
                 });
            
            
            
            
         }
         
      console.log(type);
   });
   
   // a 태그를 클릭하면 이벤트 실행
   $("#pagingArea").on("click","a", function(event){
      event.preventDefault();
      var pageNo = $(this).data("page");
      searchForm.find("#page").val(pageNo);
      searchForm.submit();
   });
   
   $("input[type=checkbox]").on("change", function(){
      var html = "";
      var value = $(this).val();	// frcsorderNo값
      var priceText = "";
      var price = 0;
      // 단일 체크박스를 클릭했을때
      var row = $(this).closest('tr');
//       var priceText = row.find('td:eq(5)').text().trim().replace(/[^0-9.-]+/g, '');
//       var price = parseInt(priceText, 10);
      var data = $(this).val();  // 선택된 체크박스의 행 안에 들어있는 frcsorderNo값
      var sv = selectAll.val();
      console.log("확인하려는 data -> ", data);
      console.log("확인하려는 value -> ", value);
      console.log("확인하려는 sv -> ", sv);
      
      if(value == "all"){
         if($(this).is(":checked")){
            totalPrice = 0;
            checkData = [];
            chk.each(function() {
               var clickCheckbox = $(this);
                  var statusCheck = $(this).closest('tr').find('td:eq(6)').text().trim();
                  if (statusCheck == "대기") {
	            	checkData.push({"frcsorderNo" : clickCheckbox.val()}); // 배열에 발주번호 추가
                     priceText = $(this).closest("tr").find('td:eq(5)').text().trim().replace(/[^0-9.-]+/g, '');
                     price = parseInt(priceText, 10);
                     $(this).prop("checked", selectAll.prop("checked"));
                     
                     var className = "."+$(this).val();
                     $(className).remove();
                     $(".all").remove();
                     
                     $.ajax({
                     type: "POST", 
                        url: "/head/checkOne.do",
                        beforeSend : function(xhr){
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                     },
                        data: {frcsorderNo : clickCheckbox.val()}, // 전송할 데이터
                        success: function(res) {
                           html = "";
                           html += "<tr class='"+data+"' style='background-color:#EEF2F7;'>";
                           html += "   <th style='text-align:center; '></th>";
                           html += "   <th style='text-align:center; '>발주번호</th>";
                           html += "   <th style='text-align:center; '>제품명코드</th>";
                           html += "   <th style='text-align:center; '>제품명</th>";
                           html += "   <th style='text-align:center; '>제품가격</th>";
                           html += "   <th style='text-align:center; '>주문수량</th>";
                           html += "   <th style='text-align:center; '>주문총액</th>";
                           html += "</tr>";
                        
                           $.each(res,function(idx,storeOrderHistoryVO){
                              console.log(storeOrderHistoryVO);
                              html += "<tr class='"+storeOrderHistoryVO.frcsorderNo+"'>";
                              html += "   <td style='text-align:center;'></td>";
                              html += "   <td style='text-align:center;'>"+ storeOrderHistoryVO.frcsorderNo +"</td>";
                              html += "   <td style='text-align:center;'>"+ storeOrderHistoryVO.vdprodCd +"</td>";
                              html += "   <td style='text-align:center;'>"+ storeOrderHistoryVO.vdprodName +"</td>";
                              html += "   <td style='text-align:center;'>"+ formatWon(storeOrderHistoryVO.hdforwardPrice) +"</td>";
                              html += "   <td style='text-align:center;'>"+ typeNumber(storeOrderHistoryVO.frcsorderQy) +"</td>";
                              html += "   <td style='text-align:center;'>"+ formatWon(storeOrderHistoryVO.totalPrice) +"</td>";
                              html += "</tr>";
                           });
                           clickCheckbox.closest('tr').after(html);
                        },
                        error: function(xhr, status, error) {
                            // 오류 발생 시 처리하는 로직
                            console.error(error);
                        }
                  });
                     
                     if(!isNaN(price)){
                      totalPrice += price;
                   } 
                  }
              });
         }else{
            chk.each(function() {
               var statusCheck = $(this).closest('tr').find('td:eq(6)').text().trim();
                  if (statusCheck == "대기") {
                      $(this).prop("checked", selectAll.prop("checked"));
                  }
               
               var deleteId = $(this).val(); 
               $(".all").remove();
               $("."+deleteId).remove();
            });
            priceText = "";
               price = 0;
            totalPrice = 0;
            checkData = [];
         }
      }else{
         priceText = $(this).closest("tr").find('td:eq(5)').text().trim().replace(/[^0-9.-]+/g, '');
           price = parseInt(priceText, 10);
           
           var flag = true;
          chk.each(function() {
               var statusCheck = $(this).closest('tr').find('td:eq(6)').text().trim();
               if (statusCheck == "대기") {
                   if(!$(this).is(":checked")){
                      flag = false;
                   }
               }
           });
          
          if(flag){
             selectAll.prop("checked", true);
          }
           
         if($(this).is(":checked")){
            checkData.push({"frcsorderNo" : data}); // 배열에 발주번호 추가
            var clickCheckbox = $(this);
            
            $.ajax({
               type: "POST", 
                  url: "/head/checkOne.do",
                  beforeSend : function(xhr){
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
               },
                  data: {frcsorderNo : data}, // 전송할 데이터
                  success: function(res) {
                     html = "";
                     html += "<tr class='"+data+"' style='background-color:#EEF2F7;'>";
                     html += "   <th style='text-align:center; '></th>";
                     html += "   <th style='text-align:center; '>발주번호</th>";
                     html += "   <th style='text-align:center; '>제품명코드</th>";
                     html += "   <th style='text-align:center; '>제품명</th>";
                     html += "   <th style='text-align:center; '>제품가격</th>";
                     html += "   <th style='text-align:center; '>주문수량</th>";
                     html += "   <th style='text-align:center; '>주문총액</th>";
                     html += "</tr>";
                  
                     $.each(res,function(idx,storeOrderHistoryVO){
                        console.log(storeOrderHistoryVO);
                        html += "<tr class='"+storeOrderHistoryVO.frcsorderNo+"'>";
                        html += "   <td style='text-align:center;'></td>";
                        html += "   <td style='text-align:center;'>"+ storeOrderHistoryVO.frcsorderNo +"</td>";
                        html += "   <td style='text-align:center;'>"+ storeOrderHistoryVO.vdprodCd +"</td>";
                        html += "   <td style='text-align:center;'>"+ storeOrderHistoryVO.vdprodName +"</td>";
                        html += "   <td style='text-align:center;'>"+ formatWon(storeOrderHistoryVO.hdforwardPrice) +"</td>";
                        html += "   <td style='text-align:center;'>"+ typeNumber(storeOrderHistoryVO.frcsorderQy) +"</td>";
                        html += "   <td style='text-align:center;'>"+ formatWon(storeOrderHistoryVO.totalPrice) +"</td>";
                        html += "</tr>";
                     });
                     clickCheckbox.closest('tr').after(html);
                  },
                  error: function(xhr, status, error) {
                      // 오류 발생 시 처리하는 로직
                      console.error(error);
                  }
            });
            
            if(!isNaN(price)){
               totalPrice += price;
            } 
         }else{
            // 총계 빼기
            if(!isNaN(price)){
               totalPrice -= price;
            } 
         
            // 체크해제시 배열값 제거
            var index = checkData.findIndex(function(item){
               return item.frcsorderNo === data;
            });
         
            if(index != -1){
               checkData.splice(index,1);
            }
         
            console.log("체크 해제됐을때 -> ",checkData);
            // 체크해제시 비동기로 붙인 테이블 제거
            var deleteId = $(this).val();
            $("."+deleteId).remove();
            if($(this).parents("tr").next("tr").attr("class") == "all"){
               $(this).parents("tr").next("tr").remove();
            }
            selectAll.prop("checked", false);
         }
      }
      total.text(totalPrice >= 0 ? totalPrice.toLocaleString() + "(원)" : "0(원)");
   });
   
   // 페이지 접속 또는 새로고침 시 행마다 반복하며 조건에맞는 행은 체크박스 disable, line-through처리
   $('input[type=checkbox][name=frcsorderNo]').each(function() {
       var statusCheck = $(this).closest('tr').find('td:eq(6)').text().trim();
       
       if (statusCheck === "승인" || statusCheck === "취소" || statusCheck === "반려") {
           $(this).prop('disabled', true);
           $(this).closest('tr').css('text-decoration', 'line-through');
       } else {
           $(this).prop('disabled', false);
       }
   });
});
</script>


