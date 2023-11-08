<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
                                                           <td style="text-align:center"><fmt:formatNumber value="${billVO.frcsAmt }" type="currency"/></td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">2. 로열티</td>
                                                           <td style="text-align:center">${billVO.frcsRowal } </td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">3. 제품 구입비</td>
                                                           <td style="text-align:center">${billVO.orderAmt }</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">4. 트레이딩 추가결제비</td>
                                                           <td style="text-align:center">${billVO.tradAdd }</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">5. 트레이딩 삭감비</td>
                                                           <td style="text-align:center">${billVO.tradRedct }</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">6. 미납금</td>
                                                           <td style="text-align:center">${billVO.frcsNonPayment }</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                   	   <tr>
                                                   	   	   <td style="text-align:left">7. 연체이자</td>
                                                           <td style="text-align:center">${billVO.frcsbillOverdue }</td>
                                                      	   <td>
                                                               <a href="javascript:void(0);" class="action-icon"><i class="mdi mdi-eye"></i></a>
                                                           </td>
                                                   	   </tr>
                                                 </tbody>
                                       		</table>
                                       </div> 
                                       <div class="row mt-4">
                                           <div class="col-sm-6">
<%--                                                	<h4>총계 : <fmt:formatNumber value="${allPrice }" type="currency"/></h4> --%> 
                                           </div>
                                           <div class="col-sm-6">
                                               <div class="text-sm-end">
                                               	<button class="btn btn-warning" id="payBtn"><i class="mdi mdi-cart-plus me-1"></i>납부</button>
                                               </div>
                                           </div>
                                       </div>
                                       </div>
                                       <div class="col-lg-6">
                                      	  <div class="border p-3 mt-4 mt-lg-0 rounded" style="height:100%">
                                            <h4 class="header-title mb-3">일별 매출 그래프</h4>
												차트...
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
	var payBtn = $("#payBtn"); 	// 납부 버튼
	
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
	
// 	payBtn.on("click",function(){
		
// 	// 날짜 체크를해서 다음 달 11월 1일이 되어야지만 납부버튼을 누를 수 있게
		
		
// 	});
	
});
</script>