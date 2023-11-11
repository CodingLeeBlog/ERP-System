<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<input type="hidden" id="frcsId" value="${frcsId }">
<div class="content-page">
  <div class="content">
      <div class="container-fluid">
      	<div class="row">
              <div class="col-12">
                  <div class="page-title-box">                      
                   <div class="page-title-box">
                     <div class="page-title-right">
                         <ol class="breadcrumb m-0">
                             <li class="breadcrumb-item"><a href="javascript: void(0);">엘리할머니맥주</a></li>
                             <li class="breadcrumb-item active">가맹점주페이지</li>
                         </ol>
                     </div>
                      <h4 class="page-title"><span class="text-primary">${frcs.frcsName }</span> 가맹점주님 환영합니다!</h4>
                 </div>              
                  </div>
              </div>
          </div>

		<div class="row">
	        <div class="col-xxl-9">
	            <div class="row">
	                <div class="col-sm-6 col-xl-3 mb-3">
	                    <div class="card mb-0 h-100">
	                            
                            <div class="card-body text-center">
                            	<a href="/owner/resv.do" class="link-primary">
					               <i class="ri-calendar-2-line text-muted font-24"></i>
					               <h2><span>${resvCount }</span></h2>
					               <p class="text-muted font-15 mb-0">금일 예약 현황</p>
				               </a>
				           	</div>
	                            
	                    </div> <!-- end card -->
	                </div> <!-- end col -->
	
	                <div class="col-sm-6 col-xl-3 mb-3">
	                    <div class="card mb-0 h-100">
	                         
	                    	<div class="card-body text-center">
		                        <a href="/owner/review.do" class="link-primary">
									<i class="ri-chat-smile-3-line text-muted font-24"></i>
									<h2><span>${reviewCount }</span></h2>
									<p class="text-muted font-15 mb-0">새로운 리뷰</p>
					           	</a>
				           	</div>
<!-- 	                            <h4 class="header-title">Admin Template</h4> -->
<!-- 	                            <h5 class="text-muted fw-normal mt-0 text-truncate" title="Campaign Sent">New Task Assign</h5> -->
	
	                    </div> <!-- end card -->
	                </div> <!-- end col -->
	
	                <div class="col-sm-6 col-xl-3 mb-3">
	                    <div class="card mb-0 h-100">
	                        <div class="card-body text-center">
	                        	<a href="/owner/tradingList.do" class="link-primary">
									<i class="ri-arrow-left-right-line text-muted font-24"></i>
									<h2><span>${tradCnt }</span></h2>
									<p class="text-muted font-15 mb-0">받은 트레이딩 요청</p>
				                </a>
				           	</div>
	                    </div> <!-- end card -->
	                </div> <!-- end col -->
	
	                <div class="col-sm-6 col-xl-3 mb-3">
	                    <div class="card mb-0 h-100">
	                        <div class="card-body text-center">
	                        	<a href="/owner/doc.do" class="link-primary">
					                <i class="ri-mail-send-line text-muted font-24"></i>
					                <h2><span>${headDocCount }</span></h2>
					                <p class="text-muted font-15 mb-0">금일 받은 공문</p>
					                <!-- 공문데이터 확인해보고 입력하기 -->
				                </a>
				           	</div>
	                    </div> <!-- end card -->
	                </div> <!-- end col -->
	            </div> <!-- end row -->
	
	            <div class="row">
	                <div class="col-xl-4">
	                    <div class="card h-100">
                        <div class="card-body">
                            <h4 class="header-title mb-4">인기 메뉴 TOP 10</h4>
                            <div dir="ltr">
                                <div class="chartjs-chart mb-1 mt-4">
                              		<canvas id="popularMenu" data-colors="#fff3de,#cef5ea,#fedee5,#ebeff2,#e3e5fd" style="display: block; box-sizing: border-box;"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
	                </div>
	                <div class="col-xl-8">
                  		<div class=" p-3 mt-lg-0 rounded card h-100">
                        	<h4 class="header-title mb-4">손익 분석 차트</h4>
	              				<div dir="ltr">
	                 		    <div class="chartjs-chart mb-1">
	                     		<canvas id="monthChart" data-colors="#727cf5,#0acf97" style="box-sizing: border-box; display: block;"></canvas>
               					</div>
	            			  </div>
	                   	  </div>
	                  </div>
	            </div>
	        </div>
	        
	        <div class="col-xxl-3">
	            <div class="card" style="height:450px;">
		                <div class="alert alert-warning border-0 rounded-0" role="alert">
		                    <i class="ri-bar-chart-box-line me-1 h4 align-middle"></i><b></b>전체 가맹점 평균 공과금 대비 내 가맹점 평균 공과금입니다.
		                </div>
		                <div class="card-body pt-1" style="display: flex; flex-direction: column; justify-content: center;">
		                    <div class="d-flex align-items-center border border-light rounded p-2 mb-2">
		                        <div class="flex-shrink-0 me-2">
		                            <i class="ri-drop-line widget-icon rounded-circle bg-info-lighten text-info"></i>
		                        </div>
		                        
                                <c:set value="${((totalAverage.duesWater-average.duesWater)/totalAverage.duesWater)*-100 }" var="duesW"/>
				                <c:set value="${((totalAverage.duesElcty-average.duesElcty)/totalAverage.duesElcty)*-100 }" var="duesE"/>
				                <c:set value="${((totalAverage.duesGas-average.duesGas)/totalAverage.duesGas)*-100 }" var="duesG"/>
				                <c:set value="${((totalAverage.duesMtht-average.duesMtht)/totalAverage.duesMtht)*-100 }" var="duesM"/>
		                        
		                        <div class="flex-grow-1">
		                            <h5 class="fw-semibold my-0">수도세</h5>
		                            <p class="mb-0"><span><fmt:formatNumber value="${average.duesWater }" type="currency"/>원</span>
		                            <c:if test="${duesW ge 0}">
		                            <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesW }"/>%</span>
		                            </c:if>
		                            <c:if test="${duesW le 0}">
		                            <span class="text-danger me-2"><i class="mdi mdi-arrow-down-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesW }"/>%</span>
		                            </c:if>
		                            </p>
		                        </div>
		                    </div>
		                    
		                    <div class="d-flex align-items-center border border-light rounded p-2 mb-2">
		                        <div class="flex-shrink-0 me-2">
		                            <i class="ri-flashlight-line widget-icon rounded-circle bg-warning-lighten text-warning"></i>
		                        </div>
		                        <div class="flex-grow-1">
		                            <h5 class="fw-semibold my-0">전기세</h5>
		                            <p class="mb-0"><span><fmt:formatNumber value="${average.duesElcty }" type="currency"/>원</span>
		                            <c:if test="${duesE ge 0}">
		                            <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesE }"/>%</span>
		                            </c:if>
		                            <c:if test="${duesE le 0}">
		                            <span class="text-danger me-2"><i class="mdi mdi-arrow-down-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesE }"/>%</span>
		                            </c:if>
		                            </p>
		                        </div>
		                    </div>
		
		                    <div class="d-flex align-items-center border border-light rounded p-2 mb-2">
		                        <div class="flex-shrink-0 me-2">
		                            <i class="ri-fire-line widget-icon rounded-circle bg-danger-lighten text-danger"></i>
		                        </div>
		                        <div class="flex-grow-1">
		                            <h5 class="fw-semibold my-0">가스비</h5>
		                            <p class="mb-0"><span><fmt:formatNumber value="${average.duesGas }" type="currency"/>원</span>
		                            <c:if test="${duesG ge 0}">
		                            <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesG }"/>%</span>
		                            </c:if>
		                            <c:if test="${duesG le 0}">
		                            <span class="text-danger me-2"><i class="mdi mdi-arrow-down-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesG }"/>%</span>
		                            </c:if>
		                            </p>
		                        </div>
		                    </div>
		
		                    <div class="d-flex align-items-center border border-light rounded p-2">
		                        <div class="flex-shrink-0 me-2">
		                            <i class="ri-building-line widget-icon rounded-circle bg-success-lighten text-success"></i>
		                        </div>
		                        <div class="flex-grow-1">
		                            <h5 class="fw-semibold my-0">월세</h5>
		                            <p class="mb-0"><span><fmt:formatNumber value="${average.duesMtht }" type="currency"/>원</span>
		                            <c:if test="${duesM ge 0}">
		                            <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesM }"/>%</span>
		                            </c:if>
		                            <c:if test="${duesM le 0}">
		                            <span class="text-danger me-2"><i class="mdi mdi-arrow-down-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesM }"/>%</span>
		                            </c:if>
		                            </p>
		                        </div>
		                    </div>
		                </div>
		           	</div>
	       		   <div class="">
                  		<div class="rounded card text-center" style="height: 216px;">
                        	<h4 class="header-title mb-3 alert alert-warning border-0 rounded-0">가맹점 영업안내</h4>
                        	<span style="color:red;">영업 시간</span>
                        	<span>Open : 16:00    Close : 04:00</span>
                        	<span style="color:red;">정기 휴무일</span>
                        	<span>매월 2째주 월요일</span>
                        	<a href="/owner/mypageDetail.do" class="link-primary mt-2">
                        	<span class="fs-5 text" style="color:#0ACF97;">가맹정보 확인하기</span>
                        	</a>
           			  		</div>
                  	  </div>
                 </div>
      		 </div>
	    </div>
      </div>
      
      
			
<script type="text/javascript">
var frcsId = $("#frcsId").val();
var popularMenuList = ${popularMenuList};	// 인기메뉴

// 순이익 12개월 차트
var operationProfitChart  = [];

for(var i=0; i<12; i++){
	operationProfitChart.push(0);	
}

$.ajax({
	type : "post",
	url : "/owner/operationProfit/chart.do",
	beforeSend : function(xhr){	// csrf토큰 보내기 위함
		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
	},
	data : {frcsId : frcsId},
	success : function(res){
		console.log(res);
		for(var i=0; i<res.length; i++){
			operationProfitChart[i]= res[i].currentIncome;
		}
//			console.log(totalProfitChart);
		
		
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
		                label: '순이익',
		                data: operationProfitChart,
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

	
	var popularMenuName = [];
	var popularMenuCnt = [];
	
	console.log("popularMenuList : " + popularMenuList);
	console.log("popularMenuList : " + popularMenuList.length);
	
	for(var i=0; i<10; i++){
		console.log("popularMenuList(name) : " + popularMenuList[i].name);
		console.log("popularMenuList(value) : " + popularMenuList[i].value);
		popularMenuName.push(popularMenuList[i].name);
		popularMenuCnt.push(popularMenuList[i].value);
	}
	
	console.log("popularMenuName : " + popularMenuName);
	console.log("popularMenuCnt : " + popularMenuCnt);
	
	// 인기 메뉴 가져오기
	var ctx = document.getElementById('popularMenu').getContext('2d');

	var chart = new Chart(ctx,{
		 type: 'doughnut',
		  data: {
		    labels: popularMenuName,  // 날짜 라벨 배열 사용
		    datasets: [{
		      data: popularMenuCnt,  // 값 배열 사용
		      backgroundColor: ['#C4CDFF', '#B8E8FF', '#FFEFB8', '#FEDEFF', '#d5d4ff', '#c8f0fa', '#ffcccc', '#d6f6ff', '#e3fade', '#ffdfb8'],
		    }]
		  },
		  options: {
		  }
		});

</script>

