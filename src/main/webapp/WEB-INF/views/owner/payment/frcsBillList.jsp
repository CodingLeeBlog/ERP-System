<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<input type="hidden" value="${frcsId }" id="frcsId">
<input type="hidden" value="${yearMonth }" id="monthInfo">
<div class="content-page">
	<div class="content">
		<div class="container-fluid">
		    <div class="row">
		        <div class="col-12">
				    <div class="page-title-box">
				        <div class="page-title-right">
				            <ol class="breadcrumb m-0">
				                <li class="breadcrumb-item"><a href="javascript: void(0);">홈</a></li>
				                <li class="breadcrumb-item"><a href="javascript: void(0);">납부</a></li>
				                <li class="breadcrumb-item active">본사 청구액 납부</li>
				            </ol>
				        </div>
				        <h4 class="page-title">본사 청구액 납부</h4>
				    </div>
				</div>
		
            	<div class="row">
                       <div class="col-12">
                           <div class="card">
                               <div class="card-body">
                                   <div class="row">
                                       <div class="col-lg-6">
                                           <div class="table-responsive">
                                           			<div class="d-flex justify-content-end">
                                           			</div>	
                                           		<div>
 				                          		<h3 class="my-1" style="text-align:center">
 				                          		<a href="javascript:void(0);" id="leftMonth">
 				                          		<i class="me-3 ri-arrow-left-s-line" style="font-size: 20px"></i>
 				                          		</a>${yearMonth }월 청구서
 				                          		<a href="javascript:void(0);" id="rightMonth">
 				                          		<i class="ms-3 ri-arrow-right-s-line" style="font-size: 20px"></i></a></h3>
 				                          		</div>
 				                          		<br>
 				                          		
                                               <table class="table table-borderless table-nowrap table-centered table-hover">
                                                   <thead class="table-light">
                                                       <tr>
                                                           <th style="text-align:center">항목</th>
                                                           <th style="text-align:center">금액</th>
                                                           <th style="width: 30px;"></th>
                                                       </tr>
                                                   </thead>
                                                   <tbody>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">1. 가맹비</td>
                                                           <td style="text-align:center"><fmt:formatNumber value="${billVO.frcsAmt }" type="number"/>(원)</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon" id="frcsAmtI"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">2. 로열티</td>
                                                           <td style="text-align:center"><fmt:formatNumber value="${billVO.frcsRowal }" type="number"/>(원)</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon" id="frcsRowalI"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">3. 제품 구입비</td>
                                                           <td style="text-align:center"><fmt:formatNumber value="${billVO.orderAmt }" type="number"/>(원)<td>
                                                               <a href="javascript:void(0);" class="action-icon" id="orderAmtI"><i class="mdi mdi-eye"></i></a>
                                                           </td> 
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">4. 트레이딩 추가결제비</td>
                                                           <td style="text-align:center"><fmt:formatNumber value="${billVO.tradAdd }" type="number"/>(원)</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon" id="tradAddI"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">5. 트레이딩 삭감비</td>
                                                           <td style="text-align:center">-<fmt:formatNumber value="${billVO.tradRedct }" type="number"/>(원)</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon" id="tradRedctI"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
<!--                                                    	   <tr> -->
<!--                                                    	   	   <td style="text-align:left">6. 미납금</td> -->
<%--                                                            <td style="text-align:center"><fmt:formatNumber value="${billVO.frcsNonPayment }" type="currency"/></td> --%>
<!--                                                       	   <td> -->
<!--                                                                <a href="javascript:void(0);" class="action-icon"><i class="mdi mdi-eye"></i></a> -->
<!--                                                            </td> -->
<!--                                                    	   </tr> -->
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">6. 연체이자</td>
                                                           <td style="text-align:center" id="overdues"><fmt:formatNumber value="${billVO.frcsbillOverdue }" type="number"/>(원)</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon" id="frcsbillOverdueI"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                 </tbody>
                                       		</table>
                                       </div> 
                                           <div class="col-sm-12">
                                               <div class="text-sm-end">
                                       	    	<h4>총계 : <fmt:formatNumber value="${billVO.feeTotalPay }" type="number"/>(원)</h4> 
                                               </div>
                                                <div class="text-sm-end">
                                               <c:if test="${billVO.settleAt eq 'Y' }">
                                               	<button class="btn btn-light"><fmt:formatDate value="${billVO.settleDate }" pattern="yy-MM-dd에 납부된 건입니다"/></button>
                                               </c:if>
                                               <c:if test="${billVO.settleAt ne 'Y' }">
                                               	<button class="btn btn-warning" id="payBtn"><i class="mdi mdi-cart-plus me-1"></i>납부</button>
                                               </c:if>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="col-lg-6">
                                      	  <div class="border p-3 mt-4 mt-lg-0 rounded" style="height:100%">
                                            <h4 class="header-title mb-3">상세내역</h4>
                                            	<div id="detailDiv">
												<p>아이콘 클릭 시 상세내역 보기가 가능합니다.<p>
                                            	</div>
                                      	  </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var oneMonth = $("#oneMonth");	// 1개월
	var threeMonth = $("#threeMonth");	// 3개월
	var leftMonth = $("#leftMonth");	// 이전달 클릭
	var rightMonth = $("#rightMonth");	// 다음달 클릭
	var monthInfo = $("#monthInfo").val();	// 현재 페이지 달 정보
	var frcsId = $("#frcsId").val();	// 프랜차이즈 아이디
	var payBtn = $("#payBtn"); 	// 납부 버튼
	var frcsAmtI = $("#frcsAmtI");
	var frcsRowalI = $("#frcsRowalI");
	var orderAmtI = $("#orderAmtI");
	var tradAddI = $("#tradAddI");
	var tradRedctI = $("#tradRedctI");
	var frcsbillOverdueI = $("#frcsbillOverdueI");
	var detailDiv = $("#detailDiv");
	
	// 왼쪽 버튼을 누르면 현재 페이지의 ${yearMonth }를 가져와서
	// 월 -1 을 해줘야한다.
	// 만약에 월이 1이면 년-1 하고 월을 12로 셋팅을 하게끔
	leftMonth.on("click",function(){
		console.log(monthInfo);	
		var monthStr = ""+ monthInfo;
		var yearMonth = []; 
		var thisYear =  monthStr.split("/")[0];	// 년
		var thisMonth = monthStr.split("/")[1];	// 월
		
		var intYear = parseInt(thisYear);
		var intMonth = parseInt(thisMonth);
		
		console.log(intYear);
		console.log(intMonth);
		
		// location.href에 넣어줄 year와 month
		var year = 0;
		var month = 0;
		
		// 1월이면 전년도 12월로 변경
		if(intMonth == 1){
			year = intYear -1;
			month = 12;
		}else{
			year = intYear;
			month = intMonth- 1;
		}
		
		var str ="";
		if(month<10){
			str = year + "/0" + month;
		}else{
			str = year + "/" + month;
		}
		
		location.href = "/owner/bill.do?yearMonth="+str;
	});
	
	rightMonth.on("click",function(){
		var monthStr = ""+ monthInfo;
		var yearMonth = []; 
		var thisYear =  monthStr.split("/")[0];	// 년
		var thisMonth = monthStr.split("/")[1];	// 월
		
		var intYear = parseInt(thisYear);
		var intMonth = parseInt(thisMonth);
		
		console.log(intYear);
		console.log(intMonth);
		
		// location.href에 넣어줄 year와 month
		var year = 0;
		var month = 0;
		
		// 12월이면 다음년 11월로 변경
		if(intMonth == 12){
			year = intYear +1;
			month = 1;
		}else{
			year = intYear;
			month = intMonth+ 1;
		}
		
		var str ="";
		if(month<10){
			str = year + "/0" + month;
		}else{
			str = year + "/" + month;
		}
		
		location.href = "/owner/bill.do?yearMonth="+str;
	});
	
	payBtn.on("click",function(){
		
	// 날짜 체크를해서 다음 달 11월 1일이 되어야지만 납부버튼을 누를 수 있게
		var today = new Date();
		var year = 	today.getFullYear();
		var month = ('0'+ (today.getMonth()+1)).slice(-2);
		var day = ('0'+today.getDate()).slice(-2);
		
		var sysdate = new Date(year + "/" + month);	// 오늘 날짜
		
		var payable = new Date(monthInfo);
		var payableYear = "";
		var payableM = ('0'+ (payable.getMonth()+1)).slice(-2);
		
		var payableMonth = 0;
		
		if(payableM == 12){
			payableMonth = "01";
			payableYear = parseInt(payable.getFullYear())+1;
		}else{
			payableMonth = parseInt(('0'+ (payable.getMonth()+1)).slice(-2))+1;
			payableYear = payable.getFullYear();
		}
		
		var payableDate = new Date(payableYear + "/" + payableMonth);	// 납부 가능 시작날짜
		
		console.log(payable);
		console.log(payableYear);
		console.log(payableMonth);
	
		var text = "";
		
		if(payableMonth < 10){
			text =  payableYear + "/0" + payableMonth +"/01 부터 납부 가능합니다.";
		}else{
			text = payableYear + "/" + payableMonth +"/01 부터 납부 가능합니다.";
		}
			
		if(sysdate < payableDate){
			Swal.fire({
	            title: "납부 불가",
	            text: text,
	            confirmButtonText: "확인",
	            icon: "error",
	            preConfirm: function () {
	            }
	        });
		}else{
			// 중복 납부한 내역이 있는지 체크
			var str = monthInfo+"월분 청구액을 납부하시겠습니까? <br>";
			str += "<font style='color:red;'>※ 확인 버튼을 누르면 납부를 취소 할 수 없습니다.</font>";
			
			// 이전 날짜면 납부할 수 있게
			Swal.fire({
	            title: "납부 확인",
	            html: str,
	            confirmButtonText: "확인",
	            icon: "info",
	            showCancelButton: true,
	            cancelButtonText: "취소",
	            preConfirm: function () {
	            	
	            	var data = {
	            		frcsId : frcsId,
	            		yearMonth : monthInfo
	            	}
	            	
	            	console.log(data);
	            	
	            	$.ajax({
	            		type : "post",
	            		url : "/owner/bill/insert.do",
	            		data : JSON.stringify(data),
	            		beforeSend : function(xhr){	// csrf토큰 보내기 위함
	            			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
	            		},
	            		contentType : "application/json; charset= utf-8",
	            		success : function(res){
	            			if(res == "OK"){
	            				Swal.fire({
	            		            title: "납부 완료",
	            		            text: "정상적으로 납부되었습니다.",
	            		            confirmButtonText: "확인",
	            		            icon: "success",
	            		            preConfirm: function () {
	            		            	location.href = "/owner/bill.do?yearMonth="+monthInfo;
	            		            }
	            				});
	            			}
            				if(res == "EXIST"){
	            				Swal.fire({
	            		            title: "중복",
	            		            text: "이미 납부된 내역입니다.",
	            		            confirmButtonText: "확인",
	            		            icon: "error",
	            		            preConfirm: function () {
	            		            	location.href = "/owner/bill.do?yearMonth="+monthInfo;
	            		            }
            		            });
	            			}           			
	            		}
	            	});
	            }
	        });
		}
	});
	
	frcsbillOverdueI.on("click",function(){
		detailDiv.empty();
		
			var str = "";
			str +='<table class="table table-borderless table-nowrap table-centered table-hover">';
			str +='<thead class="table-light">';
	        str +='<tr><th style="text-align:center">항목</th>';
	        str +='<th style="text-align:center">금액</th></tr></thead><tbody>';
			str += '<tr><td style="text-align:center">연체이자</td><td style="text-align:center">'+ $("#overdues").text() +'</td>';
			str += '<tr><td style="text-align:center" colspan="2">※연체이자는 15일 이후 납부 시 총 금액의 1% 이자가 발생합니다.</td>';
			str += '</tbody></table>';
			
			detailDiv.html(str);
	});
	
	frcsAmtI.on("click",function(){
		detailDiv.empty();
		var str = "";
		str +='<table class="table table-borderless table-nowrap table-centered table-hover">';
		str +='<thead class="table-light">';
        str +='<tr><th style="text-align:center">항목</th>';
        str +='<th style="text-align:center">금액</th></tr></thead><tbody>';
		str += '<tr><td style="text-align:center">가맹비</td><td style="text-align:center">500,000(원)</td>';
		str += '</tbody></table>';
		
		detailDiv.html(str)		
	});

	// 로열티 상세보기
	frcsRowalI.on("click",function(){
		detailDiv.empty();
		
		// 프랜차이즈 아이디, 해당 월 데이터 보내기
		var data = {
			frcsId : frcsId,
			thisMonth : monthInfo
		}
		
		$.ajax({
			type : "post",
    		url : "/owner/salesAnalysis/oneMonth.do",
    		data : JSON.stringify(data),
    		beforeSend : function(xhr){	// csrf토큰 보내기 위함
    			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
    		},
    		contentType : "application/json; charset= utf-8",
    		success : function(res){
    			console.log(res);
    			
                
    			var totalSales = 0;
    			for(var i=0; i<res.length; i++){
    				totalSales += res[i].totalPrice;
    			}
    			
    			var str = "";
    			str +='<table class="table table-borderless table-nowrap table-centered table-hover">';
    			str +='<thead class="table-light">';
                str +='<tr><th style="text-align:center">항목</th>';
                str +='<th style="text-align:center">금액</th></tr></thead><tbody>';
    			str += '<tr><td style="text-align:center">매출액</td><td style="text-align:center">'+totalSales.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'(원)</td>';
    			str += '<tr><td style="text-align:center">로열티(매출금액의 3%)</td><td style="text-align:center">'+(totalSales*0.03).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'(원)</td>';
    			str += '</tbody></table>';
    			
    			detailDiv.html(str);
    		}
		});
	});
	
	// 제품 구입비 상세보기..
	orderAmtI.on("click",function(){
	
		detailDiv.empty();
		
		// 프랜차이즈 아이디, 해당 월 데이터 보내기
		var data = {
			frcsId : frcsId,
			thisMonth : monthInfo
		}

		$.ajax({
			type : "post",
    		url : "/owner/purchaseAnalysis/oneMonth.do",
    		data : JSON.stringify(data),
    		beforeSend : function(xhr){	// csrf토큰 보내기 위함
    			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
    		},
    		contentType : "application/json; charset= utf-8",
    		success : function(res){
    			console.log(res);
    			
    			var str = "";
    			str +='<div class="card-body py-0" data-simplebar style="max-height: 500px;">';
    			str +='<table class="table table-borderless table-nowrap table-centered table-hover">';
    			str +='<thead class="table-light">';
                str +='<tr><th style="text-align:center">제품명</th>';
                str +='<th style="text-align:center">매입 수량</th>';
                str +='<th style="text-align:center">매입 단가</th>';
                str +='<th style="text-align:center">총 매입 금액</th></tr></thead><tbody>';

                var totalSales = 0;
				for(var i=0; i<res.length; i++){
					
				var hdforwarPrice = res[i].hdforwardPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var totalPrice = res[i].totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var intTotal = parseInt(res[i].totalPrice); 
				
				str += '<tr><td style="text-align:center">'+res[i].vdprodName+'</td>';
                   str += '<td style="text-align:center">'+res[i].frcsOrderQy+'개</td>';
                   str += '<td style="text-align:center">'+hdforwarPrice+'(원)</td>';
                   str += '<td style="text-align:center">'+totalPrice+'(원)</td></tr>';
                   
                   totalSales += intTotal;
			}
				var total = totalSales.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				str += '</tbody></table></div>';
    			str += '<div class="row mt-4"><div class="col-sm-6"></div>';
    			str += '<div class="col-sm-6"><div class="text-sm-end" id="total"><h4>총계 : '+total+'(원)</h4></div></div></div>';
    		
    			detailDiv.html(str);
    		}
		});
	})
	
	tradAddI.on("click",function(){
		detailDiv.empty();
		
		// 프랜차이즈 아이디, 해당 월 데이터 보내기
		var data = {
			frcsId : frcsId,
			thisMonth : monthInfo
		}
		
		// 거래한 가맹점, 거래한 제품, 거래한 제품의 갯수, 거래한 금액
		$.ajax({
			type : "post",
    		url : "/owner/bill/tradDetail.do",
    		data : JSON.stringify(data),
    		beforeSend : function(xhr){	// csrf토큰 보내기 위함
    			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
    		},
    		contentType : "application/json; charset= utf-8",
    		success : function(res){
    			
    			var totalTrad = 0;
    			var str = "";
    			str +='<table class="table table-borderless table-nowrap table-centered table-hover">';
    			str +='<thead class="table-light">';
                str +='<tr><th style="text-align:center">제품명</th>';
                str +='<th style="text-align:center">트레이딩 수량</th>';
                str +='<th style="text-align:center">트레이딩 금액</th></tr></thead><tbody>';
    			
                for(var i=0; i<res.length; i++){
                	var tradAmt = res[i].tradAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    				var tradPrice = parseInt(res[i].tradAmt);
                	
    				str += '<tr><td style="text-align:center">'+res[i].vdprodName+'</td>';
                       str += '<td style="text-align:center">'+res[i].tradQy+'개</td>';
                       str += '<td style="text-align:center">'+tradAmt+'(원)</td></tr>';
                 
                       totalTrad += tradPrice;
                }
                	var total = totalTrad.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            	    str += '</tbody></table>';
         			str += '<div class="row mt-4"><div class="col-sm-6"></div>';
        			str += '<div class="col-sm-6"><div class="text-sm-end" id="total"><h4>총계 : '+total+'(원)</h4></div></div></div>';
        		
            	    detailDiv.html(str);
    		}
		});
	});
	
	tradRedctI.on("click",function(){
		detailDiv.empty();
		
		// 프랜차이즈 아이디, 해당 월 데이터 보내기
		var data = {
			frcsId : frcsId,
			thisMonth : monthInfo
		}
		
		// 거래한 가맹점, 거래한 제품, 거래한 제품의 갯수, 거래한 금액
		$.ajax({
			type : "post",
    		url : "/owner/bill/tradMinDetail.do",
    		data : JSON.stringify(data),
    		beforeSend : function(xhr){	// csrf토큰 보내기 위함
    			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
    		},
    		contentType : "application/json; charset= utf-8",
    		success : function(res){
    			var totalTrad = 0;
    			var str = "";
    			str +='<table class="table table-borderless table-nowrap table-centered table-hover">';
    			str +='<thead class="table-light">';
                str +='<tr><th style="text-align:center">제품명</th>';
                str +='<th style="text-align:center">트레이딩 수량</th>';
                str +='<th style="text-align:center">트레이딩 금액</th></tr></thead><tbody>';
    			
                for(var i=0; i<res.length; i++){
                	var tradAmt = res[i].tradAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    				var tradPrice = parseInt(res[i].tradAmt);
                	
    				str += '<tr><td style="text-align:center">'+res[i].vdprodName+'</td>';
                       str += '<td style="text-align:center">'+res[i].tradQy+'개</td>';
                       str += '<td style="text-align:center">￦'+tradAmt+'</td></tr>';
                 
                       totalTrad += tradPrice;
                }
                	var total = totalTrad.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            	    str += '</tbody></table>';
         			str += '<div class="row mt-4"><div class="col-sm-6"></div>';
        			str += '<div class="col-sm-6"><div class="text-sm-end" id="total"><h4>총계 : '+total+'(원)</h4></div></div></div>';
        		
            	    detailDiv.html(str);
    		}
		});
	});
	
});
</script>