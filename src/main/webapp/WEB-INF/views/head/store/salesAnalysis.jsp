<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid mb-3">

		<!-- start page title -->
		<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">매출분석</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">가맹점의 매출정보를 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						매장관리 / &nbsp;<span class="text-decoration-underline">매출분석</span>
					</div>
				</div>
			</div>
            <!-- end page title -->

            <div class="row">
                <div class="col-lg-6 bg-white">
                	<div class="p-5 mt-2">
                		<div class="row">
                			<div class="col text-center d-flex justify-content-center align-items-center" style="height:50px; font-size: 17px; font-family: 'GmarketSansMedium'; background-color: #242424; color: white;">과목</div>
                			<div class="col text-center d-flex justify-content-center align-items-center" style="height:50px; font-size: 17px; font-family: 'GmarketSansMedium'; background-color: #242424; color: white;">금액(원)</div>
                		</div>
                		<div class="row">
                			<!-- 가맹+로얄+승인된 가격(가맹점판매-입고단가) -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			매출액
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<fmt:formatNumber value="${feeVO.yearTotalPrice }" type="number"></fmt:formatNumber> (원)
                			</div>
                		</div>
                		<div class="row">
                			<!-- 가맹점에 판매한 총 금액 - 출고단가 * 주문수량 -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			제품판매액
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<fmt:formatNumber value="${feeVO.yearTotalselngPrice }" type="number"></fmt:formatNumber> (원)
                			</div>
                		</div>
                		<div class="row">
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			판매비와 관리비
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
							가맹비 + 로얄티 + 인건비
                			</div>
                		</div>
                		<div class="row">
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			가맹비
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
								<fmt:formatNumber value="${feeVO.yearTotalfrcsAmt }" type="number"></fmt:formatNumber> (원)
                			</div>
                		</div>
                		<div class="row">
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			로얄티
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<fmt:formatNumber value="${feeVO.yearTotalfrcsRowal }" type="number"></fmt:formatNumber> (원)
                			</div>
                		</div>
                		<div class="row">
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			인건비
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                			하드코딩
                			</div>
                		</div>
                		<div class="row">
                			<!-- 매출액 - 매입가 -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			매출원가
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<fmt:formatNumber value="${feeVO.yearTotalsalePrice }" type="number"></fmt:formatNumber> (원)
                			</div>
                		</div>
                		<div class="row">
							<!-- 입고단가 * 주문수량(headorder테이블) -->                		
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			매입가
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<fmt:formatNumber value="${feeVO.yearTotalpurchasePrice }" type="number"></fmt:formatNumber> (원)
                			</div>
                		</div>
                		<div class="row">
                			<!-- 매출액 - 매입가 - 인건비 -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			영업이익
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<fmt:formatNumber value="${feeVO.yearTotalprofitPrice }" type="number"></fmt:formatNumber> (원)
                			</div>
                		</div>
                		<div class="row">
                			<!-- 영업이익 - 세금(10%) -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			당기순이익
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<fmt:formatNumber value="${feeVO.yearTotalincomePrice }" type="number"></fmt:formatNumber> (원)
                			</div>
                		</div>
                	</div>
                </div><!-- end col-->
                
<%--                 <c:set value="${allmonthfeeVO }" var="allmonthfeeVO"/> --%>
<%--                	<c:forEach items="${allmonthfeeVO}" var="allmonth"> --%>
<%--                		<div>${allmonth.monthTotalselngPrice }</div> --%>
<!--                		<div></div> -->
<%-- 				</c:forEach> --%>
                <div class="col-lg-6">
                	<div class="row mt-4">
                		<div class="col">매출분석</div>
                		<div class="col d-flex justify-content-end">
                			<div class="chartBtnGrp">
                 			<button id="allMonth" data-type="all" type="button" class="btn btn-soft-primary btn-sm">ALL</button>
                 			<button id="oneMonth" data-type="third" type="button" class="btn btn-soft-secondary btn-sm ms-1">분기</button>
                			</div>
                		</div>
                	</div>
                	<div class="row">
                		<div class="col-4" id="test"></div>
               			<div class="col mt-4 mb-4 d-flex justify-content-center align-items-center">
                			<i class="me-3 ri-arrow-left-s-line" id="leftYear" style="font-size: 30px"></i>
                 		<div id="calYear" class="" style="font-size: 30px; font-family: 'GmarketSansMedium';"></div>
                			<i class="ms-3 ri-arrow-right-s-line" id="rightYear" style="font-size: 30px"></i>
               			</div>
                 	<div class="col-4"></div>
                	</div>
               		<div class="pt-4"></div>
                	<div id="chart-body">
						<canvas id="myChart" width="785px" height="500px"></canvas>
                	</div>
                </div><!-- end col-->
			</div>
            <!-- end row-->

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
<script>
$(function(){
	
	var date = new Date();
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var year = date.getFullYear();

	// 페이지 호출시 보여줄 그래프
	$("#calYear").html(year)
	var ctx = $('#myChart');
	var arr = new Array();
    <c:set value="${allmonthfeeVO }" var="allmonthfeeVO"/>
       	<c:forEach items="${allmonthfeeVO}" var="allmonth">
       	arr.push({price : "${allmonth.monthTotalPrice }"});
	</c:forEach>
	new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
	        datasets: [{
	            label: '# 매출액',
	            data: [0, 0, 0, 0, 0, 0, 0, 0, arr[0].price, arr[1].price, 0, 0],
	            borderWidth: 2
	        }]
	    },
	    options: {
	    	responsive: false,
	        scales: {
	            y: {
	                beginAtZero: true
	            }
	        }
	    }
	});
	
	$("#leftYear").on("mouseover", function(){
		$("#leftYear").css("transform", "scale(1.5)")
	});
	
	$("#leftYear").on("mouseout", function(){
		$("#leftYear").css("transform", "")
	});
	
	$("#rightYear").on("mouseover", function(){
		$("#rightYear").css("transform", "scale(1.5)")
	});
	
	$("#rightYear").on("mouseout", function(){
		$("#rightYear").css("transform", "")
	});
	
	// 1년 단위로 감소
	$("#leftYear").on("click", function(){
		var calYear = $("#calYear").html();
		var old_calYear = parseInt(calYear)
		var new_calYear = old_calYear-1
		$("#calYear").html(new_calYear);
		newYearChart();
	});
	
	// 1년 단위로 증가
	$("#rightYear").on("click", function(){
		var calYear = $("#calYear").html();
		var old_calYear = parseInt(calYear)
		var new_calYear = old_calYear+1
		$("#calYear").html(new_calYear);
		
		if(new_calYear === parseInt(year)+1){
			$("#calYear").html(old_calYear);
			alert("잘못된 접근입니다")
		}else{
			newYearChart();
		}
		
	});
	
	$("#oneMonth").on("click", function(){
		
		newMonthChart();
		
		var type = $(this).data("type");
		
		$.ajax({
			type : "post",
			url : "/head/month/salesAnalysis.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data : JSON.stringify(type),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				if(res === "OK"){

				}
			}
		});
	});
	
	$("#oneMonth").on("click", function(){
		
		newMonthChart();
		
		var type = $(this).data("type");
		
		$.ajax({
			
		});
	});
	
	function newYearChart(){
		removeYearChart();
		var canvas = '<canvas id="myChart" width="785px" height="500px"></canvas>'
		$("#chart-body").html(canvas);
		
		var new_ctx = $('#myChart');
		
		new Chart(new_ctx, {
		    type: 'bar',
		    data: {
		        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		        datasets: [{
		            label: ' 매출액',
		            data: [3, 3, 3, 5, 2, 3, 3, 3, 3, 5, 2, 3],
		            borderWidth: 2
		        }]
		    },
		    options: {
		    	responsive: false,
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
	}
	
	function removeYearChart(){
		ctx.remove();
	}
	
	function newMonthChart(){
		removeMonthChart();
		var canvas = '<canvas id="myChart" width="785px" height="500px"></canvas>'
		$("#chart-body").html(canvas);
		
		var new_ctx = $('#myChart');
		
		new Chart(new_ctx, {
		    type: 'bar',
		    data: {
		        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		        datasets: [{
		            label: ' 매출액',
		            data: [3, 3, 3, 5, 2, 3, 3, 3, 3, 5, 2, 3],
		            borderWidth: 2
		        }]
		    },
		    options: {
		    	responsive: false,
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		});
	}
	
	function removeMonthChart(){
		ctx.remove();
	}
	
});
</script>
