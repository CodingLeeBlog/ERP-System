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
				                <li class="breadcrumb-item"><a href="javascript: void(0);">매입/매출 분석</a></li>
				                <li class="breadcrumb-item active">매출 총이익 분석</li>
				            </ol>
				        </div>
				        <h4 class="page-title">매출 총이익 분석</h4>
				        <p>단위기간별 매출액(메뉴판매액)에서 매입가(발주금액)을 제외한 매출 총이익을 확인할 수 있습니다.</p>
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
		 				                          		<ul class="nav nav-pills bg-nav-pills nav-justified mb-3 mx-0">
														    <li class="nav-item" id="oneMonth">
														        <a href="javascript:void(0);" data-bs-toggle="tab" aria-expanded="true" class="nav-link rounded-0 active">
														            <i class="mdi mdi-home-variant d-md-none d-block"></i>
														            <span class="d-none d-md-block">1개월</span>
														        </a>
														    </li>
														    <li class="nav-item" id="threeMonth">
														        <a href="javascript:void(0);" data-bs-toggle="tab" aria-expanded="false" class="nav-link rounded-0">
														            <i class="mdi mdi-account-circle d-md-none d-block"></i>
														            <span class="d-none d-md-block">3개월</span>
														        </a>
														    </li>
														    <li class="nav-item" id="sixMonth">
														        <a href="javascript:void(0);" data-bs-toggle="tab" aria-expanded="false" class="nav-link rounded-0">
														            <i class="mdi mdi-settings-outline d-md-none d-block"></i>
														            <span class="d-none d-md-block">6개월</span>
														        </a>
														    </li>
														</ul>
                                           			</div>	
                                           		<div>
 				                          		<h3 class="my-1" style="text-align:center" id="mainText">
 				                          		<a href="javascript:void(0);" id="leftMonth">
 				                          		<i class="me-3 ri-arrow-left-s-line" style="font-size: 20px"></i></a>${yearMonth }월 매출 총이익 분석 
 				                          		<a href="javascript:void(0);" id="rightMonth">
 				                          		<i class="ms-3 ri-arrow-right-s-line" style="font-size: 20px"></i></a></h3>
 				                          		</div>
 				                          		<br>
 				                          		
                                               <table class="table table-borderless table-nowrap table-centered table-hover">
                                                   <thead class="table-light">
                                                       <tr>
                                                           <th style="text-align:center">항목</th>
                                                           <th style="text-align:center">금액</th>
                                                       </tr>
                                                   </thead>
                                                   <tbody>
                                                   <c:set value="0" var="allPrice"/>
                                                   <c:set value="${oneTotalProfit }" var="oneList"/>
                                                   <c:choose>
                                                   		<c:when test="${empty oneList }">
	                                                   		<tr>
	                                                           <td style="text-align:center" colspan="3">
	                                                           	    집계된 월 매출총이익이 존재하지 않습니다.
	                                                           </td>
	                                                       </tr>
                                                   		</c:when>
                                                   		<c:otherwise>
                                                   			   <tr>
		                                                           <td style="text-align:center">
		                                                           	  매출액
		                                                           </td>
		                                                           <td style="text-align:center" id="totalPriceTd"><fmt:formatNumber value="${oneList.totalPrice }" type="number"/>(원)</td>
		                                                       </tr>
		                                                       <tr>
		                                                           <td style="text-align:center">
		                                                           	  매입가
		                                                           </td>
		                                                           <td style="text-align:center" id="totalorderPriceTd">-<fmt:formatNumber value="${oneList.totalorderPrice }" type="number"/>(원)        
		                                                           </td>
		                                                       </tr>
                                                   		</c:otherwise>
                                                 </c:choose>
                                                 </tbody>
                                       		</table>
                                       </div> 
                                       <div class="row mt-4">
                                           <div class="col-sm-6">
                                           </div>
                                           <div class="col-sm-6">
                                               <div class="text-sm-end" id="total">
                                                  	<h4>총계 : <fmt:formatNumber value="${oneList.totalPrice-oneList.totalorderPrice }" type="number"/>(원)</h4>
                                               </div>
                                           </div>
                                       </div>
                                       </div>
	
                                       <div class="col-lg-6">
                                      	  <div class="border p-3 mt-4 mt-lg-0 rounded" style="height:100%">
                                            <h4 class="header-title mb-4">월별 차트</h4>
					                            <div dir="ltr">
					                                <div class="mt-3 chartjs-chart">
					                                    <canvas id="monthChart" data-colors="#727cf5,#0acf97" style="box-sizing: border-box; display: block; height: 320px; width: 795px;" width="795" height="320"></canvas>
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
</div>
<script type="text/javascript">
$(function(){
	var oneMonth = $("#oneMonth");	// 1개월
	var threeMonth = $("#threeMonth");	// 3개월
	var sixMonth = $("#sixMonth");	// 6개월
	var leftMonth = $("#leftMonth");	// 이전달 클릭
	var rightMonth = $("#rightMonth");	// 다음달 클릭
	var monthInfo = $("#monthInfo").val();	// 현재 페이지 달 정보
	var frcsId = $("#frcsId").val();	// 프랜차이즈 아이디
	var mainText = $("#mainText");	// 제목
	var totalPriceTd = $("#totalPriceTd");	// 매출액
	var totalorderPriceTd = $("#totalorderPriceTd");	// 매입가
	var total = $("#total");	// 총계
	
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
		
		location.href = "/owner/totalProfit.do?yearMonth="+str;
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
		
		location.href = "/owner/totalProfit.do?yearMonth="+str;
	});
	
	
	// 1개월, 3개월, 6개월별로 데이터를 가져오기위한...
	function getData(monthParam){
		
		var data = {
			thisMonth : monthInfo,
			frcsId : frcsId
		};
		
		console.log(data);
		
		$.ajax({
			type : "post",
			url : "/owner/totalProfit/"+monthParam+".do",
			data : JSON.stringify(data),
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			contentType : "application/json; charset=utf-8",
			success : function(res){
				
				console.log(res);
				var thisMonth = res.thisMonth;
				var intTotalPrice = res.totalPrice;	// 매출
				var intTotalorderPrice = res.totalorderPrice;	// 매입
				var totalPrice = intTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var totalorderPrice =intTotalorderPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				var minus = intTotalPrice-intTotalorderPrice;
				var intTotal = minus.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
				var year =  thisMonth.split("/")[0];	 // 년
				var month = thisMonth.split("/")[1];	 // 월
				
				var intYear = parseInt(year);
				var intMonth = parseInt(month);
				
				
				if(monthParam === "oneMonth"){
					var str = "";
					str += '<a href="javascript:void(0);" id="leftMonth">';
	           		str += '<i class="me-3 ri-arrow-left-s-line" style="font-size: 20px"></i></a>';
	           		str += +year+"/"+month+ "월 매출 총이익 분석";
	           		str += '<a href="javascript:void(0);" id="rightMonth">';
	           		str +='<i class="ms-3 ri-arrow-right-s-line" style="font-size: 20px"></i></a>'
				}

				
				// 3개월
				if(monthParam === "threeMonth"){
					var str = "";
					// 1월이면
					if(intMonth == 1){
						str += '<a href="javascript:void(0);" id="leftMonth">';
		           		str += '<i class="me-3 ri-arrow-left-s-line" style="font-size: 20px"></i></a>';
		           		str += (intYear-1)+"/11~"+year+"/"+month+ "월 매출 총이익 분석";
		           		str += '<a href="javascript:void(0);" id="rightMonth">';
		           		str +='<i class="ms-3 ri-arrow-right-s-line" style="font-size: 20px"></i></a>'
					}else if(intMonth == 2){	// 2월이면
						str += '<a href="javascript:void(0);" id="leftMonth">';
		           		str += '<i class="me-3 ri-arrow-left-s-line" style="font-size: 20px"></i></a>';
		           		str += (intYear-1)+"/12~"+year+"/"+month+ "월 매출 총이익 분석";
		           		str += '<a href="javascript:void(0);" id="rightMonth">';
		           		str +='<i class="ms-3 ri-arrow-right-s-line" style="font-size: 20px"></i></a>'
					}else{
						str += '<a href="javascript:void(0);" id="leftMonth">';
		           		str += '<i class="me-3 ri-arrow-left-s-line" style="font-size: 20px"></i></a>';
		           		str += year+"/0"+(intMonth-2)+"~"+year+"/"+month+ "월 매출 총이익 분석";
		           		str += '<a href="javascript:void(0);" id="rightMonth">';
		           		str +='<i class="ms-3 ri-arrow-right-s-line" style="font-size: 20px"></i></a>'
					}
				}
				
				
				// 6개월
				if(monthParam == "sixMonth"){
					var pre = 0;
					var str = "";
					
					if((intMonth+7)<13){
						intYear= intYear-1;
						pre = intMonth+7;
						if(pre < 10){
							pre = "0"+pre;
						}
					}else{
						pre = (intMonth+7)-12;
						if(pre < 10){
							pre = "0"+pre;
						}
					}
					str += '<a href="javascript:void(0);" id="leftMonth">';
	           		str += '<i class="me-3 ri-arrow-left-s-line" style="font-size: 20px"></i></a>';
	           		str += intYear+"/"+pre+"~"+year+"/"+month+ "월 매출 총이익 분석";
	           		str += '<a href="javascript:void(0);" id="rightMonth">';
	           		str +='<i class="ms-3 ri-arrow-right-s-line" style="font-size: 20px"></i></a>'
				}
				
				mainText.html(str);
				
				var totalStr = "";
				totalStr += "<h4>총계 : "+intTotal+"(원)</h4>"
				console.log(totalPrice)
				
				totalPriceTd.text(totalPrice+"(원)");	// 매출액
				totalorderPriceTd.text("-"+totalorderPrice+"(원)");	// 매입가
				total.html(totalStr);	// 총계
			}
		});
		
	}
	
	oneMonth.on("click",function(){
		getData("oneMonth");
	});
	
	threeMonth.on("click",function(){
		getData("threeMonth");
	});
	
	sixMonth.on("click",function(){
		getData("sixMonth");
	});
	
	
	// 매출 총이익 12개월 차트
	var totalProfitChart  = [];
	var totalProfitChartThree = [];
	
	for(var i=0; i<12; i++){
		totalProfitChart.push(0);	
	}
	
	$.ajax({
		type : "post",
		url : "/owner/totalProfit/chart.do",
		beforeSend : function(xhr){	// csrf토큰 보내기 위함
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
		},
		data : {frcsId : frcsId},
		success : function(res){
			console.log(res);
			for(var i=0; i<res.length; i++){
				totalProfitChart[i]= res[i].totalResult;
			}
			console.log(totalProfitChart);
			
			
		    // 캔버스 엘리먼트 설정
			var ctx = document.getElementById('monthChart').getContext('2d');
		    
			// 월별
		    var months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
			
			var chart = new Chart(ctx,{
				type : "bar",
				data : {
					labels: months,
				    datasets:[
			            {
			                label: '매출 총이익',
			                data: totalProfitChart,
			                backgroundColor: 'rgba(255, 99, 132, 0.2)',
			                borderColor: 'rgba(255, 99, 132, 1)',
			                borderWidth: 1
			            }
			        ]
				},
				options: {
			        responsive: true,
			        scales: {
			            x: {
			                title: {
			                    display: true,
			                    text: '월'
			                }
			            },
			            y: {
			                beginAtZero: true,
			                title: {
			                    display: true,
			                    text: '금액'
			                },
			                grid: {
			                    display: false
			                }
			            }
			        }
			    }
			});
		}
	});
	
});
</script>