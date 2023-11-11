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
                	<div class="ps-5 pe-5 pb-5 mt-2">
	                	<div class="row headmonthtitle">
	               			<div class="col mt-4 mb-4 d-flex justify-content-center align-items-center">
	                			<i class="me-3 ri-arrow-left-s-line" id="leftYear" style="font-size: 30px"></i>
	                 			<div style="font-size: 30px; font-family: 'GmarketSansMedium';">
	                 				<span id="headYear" class=""></span>년 <span id="headMonth" class=""></span>월 매출분석
	                 			</div>
	                			<i class="ms-3 ri-arrow-right-s-line" id="rightYear" style="font-size: 30px"></i>
	               			</div>
	                	</div>
	                	<div class="row headquatertitle" style="display: none;">
	               			<div class="col mt-4 mb-4 d-flex justify-content-center align-items-center">
	                			<i class="me-3 ri-arrow-left-s-line" id="leftQuater" style="font-size: 30px"></i>
	                 			<div style="font-size: 30px; font-family: 'GmarketSansMedium';">
	                 				<span class="quaterYear"></span>년 <span id="quaterstartMonth" class=""></span>월  ~ <span id="quaterendMonth" class=""></span>월 매출분석
	                 			</div>
	                			<i class="ms-3 ri-arrow-right-s-line" id="rightQuater" style="font-size: 30px"></i>
	               			</div>
	                	</div>
                		<div class="row">
                			<div class="col text-center d-flex justify-content-center align-items-center" style="height:50px; font-size: 17px; font-family: 'GmarketSansMedium'; background-color: #242424; color: white;">과목</div>
                			<div class="col text-center d-flex justify-content-center align-items-center" style="height:50px; font-size: 17px; font-family: 'GmarketSansMedium'; background-color: #242424; color: white;">금액(원)</div>
                		</div>
                		<div class="row">
                			<!-- 가맹 + 로얄 + 승인된 가격(가맹점판매-입고단가)-제품판매액 -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			매출액
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<div class="headtmonthtotalPrice"></div>
                			</div>
                		</div>
                		<div class="row">
                			<!-- 가맹점에 판매한 총 금액 - 출고단가 * 주문수량 -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			제품판매액
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<div class="headtmonthtotalselngPrice"></div>
                			</div>
                		</div>
                		<div class="row">
                			<!-- 가맹비 + 로얄티 + 인건비 -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			판매비와 인건비
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
								<div class="headtmonthtotalselngPersonal"></div>
                			</div>
                		</div>
                		<div class="row">
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			가맹비
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
								<div class="headtmonthfrcsAmt"></div>
                			</div>
                		</div>
                		<div class="row">
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			로얄티
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<div class="headtmonthfrcsRowal"></div>
                			</div>
                		</div>
                		<div class="row">
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			인건비
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<div class="headmonthfrcspersonalCost"></div>
                			</div>
                		</div>
                		<div class="row">
                			<!-- 매출액 - 매입가 -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			매출원가
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<div class="headtmonthCogs"></div>
                			</div>
                		</div>
                		<div class="row">
							<!-- 입고단가 * 주문수량(headorder테이블) -->                		
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			매입가
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<div class="headtmonthpurchasePrice"></div>
                			</div>
                		</div>
                		<div class="row">
                			<!-- 매출원가 - 인건비 -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			영업이익
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<div class="headtmonthtotalprofitPrice"></div>
                			</div>
                		</div>
                		<div class="row">
                			<!-- 영업이익 - 세금(10%) -->
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-left: 1px black solid; border-right: 1px black solid; border-bottom: 1px black solid;">
                			당기순이익
                			</div>
                			<div class="col text-left d-flex align-items-center" style="height:50px; font-size: 13px; font-family: 'GmarketSansMedium'; background-color: white; color: black; border-right: 1px black solid; border-bottom: 1px black solid;">
                				<div class="headtmonthtotalincomePrice"></div>
                			</div>
                		</div>
                	</div>
                </div><!-- end col-->
                
                <div class="col-lg-6">
                	<div class="row mt-4">
                		<div class="col"></div>
                		<div class="col d-flex justify-content-end">
                			<div class="chartBtnGrp">
                 				<button id="allMonth" data-type="all" type="button" class="btn btn-soft-primary btn-sm">전체</button>
                 				<button id="quarterMonth" data-type="third" type="button" class="btn btn-soft-secondary btn-sm ms-1">분기</button>
                			</div>
                		</div>
                	</div>
               		<div>
	                	<div class="row">
	                		<div class="col-2"></div>
	               			<div class="col mt-4 mb-4 d-flex justify-content-center align-items-center">
	                 			<div id="calYear" style="font-size: 30px; font-family: 'GmarketSansMedium';"></div>
	               			</div>
	                 		<div class="col-2"></div>
	                	</div>
               		</div>
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
	var month = date.getMonth();
	var day = date.getDate();
	var year = date.getFullYear();

	// 페이지 호출시 보여줄 그래프
	$("#headYear").html(year)
	$("#headMonth").html(month)
	$("#calYear").html(year)
	
	var ctx = $('#myChart');
	var arr = new Array();
	
	// for문을 통해 chart 생성
    <c:set value="${monthList}" var="monthList"/>
  	<c:set value="${thismonth}" var="thismonth"/>
	<c:forEach items="${monthList}" var="month">
       	arr.push({total : "${month.monthtotalPrice}"});
        <c:if test="${month.month eq thismonth}">
        
			$(".headtmonthtotalPrice").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthtotalPrice}")).fadeIn(500);
			})
			
			$(".headtmonthtotalselngPrice").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthtotalselngPrice}")).fadeIn(500);
			})
			
			$(".headtmonthtotalselngPersonal").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthtotalselngPersonal}")).fadeIn(500);
			})
			
			$(".headtmonthfrcsAmt").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthfrcsAmt}")).fadeIn(500);
			})
			
			$(".headtmonthfrcsRowal").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthfrcsRowal}")).fadeIn(500);
			})
			
			$(".headmonthfrcspersonalCost").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthfrcspersonalCost}")).fadeIn(500);
			})
		
			$(".headtmonthCogs").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthCogs}")).fadeIn(500);
			})
			
			$(".headtmonthpurchasePrice").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthpurchasePrice}")).fadeIn(500);
			})
			
			$(".headtmonthtotalprofitPrice").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthtotalprofitPrice}")).fadeIn(500);
			})
			
			$(".headtmonthtotalincomePrice").fadeOut(500, function(){
				$(this).html(formatPrice("${month.monthtotalincomePrice}")).fadeIn(500);
			})
			
    	</c:if>
	</c:forEach>
	
	
	// chart 기능
	new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        datasets: [{
	            label: '# 매출액',
	            data: [arr[0].total, arr[1].total, arr[2].total, arr[3].total, arr[4].total, arr[5].total, arr[6].total, arr[7].total, arr[8].total, arr[9].total, arr[10].total, arr[11].total],
                backgroundColor: 'rgba(182, 225, 233, 1)'
	        }]
	    },
	    options: {
	    	responsive: false,
	        scales: {
	            x: {
	            	beginAtZero: true,
	                title: {
	                	display: true,
	                    text: '월',
						padding : {
							top : 20,
						}
	                }
	            },
	            y: {
	                beginAtZero: true,
	                title: {
	                    display: true,
	                    text: '금액',
						padding : {
							bottom : 20,
						}
	                },
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
	
	// 1개월 단위로 감소
	$("#leftYear").on("click", function(){
		var headMonth = $("#headMonth").html();
		var old_headMonth = parseInt(headMonth)
		var new_headMonth = old_headMonth-1
		$("#headMonth").html(new_headMonth);
		console.log(new_headMonth);
		
		if(parseInt(new_headMonth) < 10){
			new_headMonth = "0" + new_headMonth;
		}
		
		var month = year + "-" + new_headMonth
		
		var data = {
				month : month
		}
		
		$.ajax({
			type : "post",
			url : "/head/month/salesAnalysis.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				
				// 매출액
// 				$(".headtmonthtotalPrice").html(formatPrice(res.monthtotalPrice));
// 				var headtmonthtotalPrice = res.monthtotalPrice
// 				var animationDuration = 300;
// 				$({ countNum : 0}).animate({ countNum: headtmonthtotalPrice},{
// 					duration : animationDuration,
// 					easing : 'linear',
// 					step : function(){
// 						$(".headtmonthtotalPrice").html(Math.floor(this.countNum));
// 					},
// 					complete : function(){
// 						$(".headtmonthtotalPrice").html(formatPrice(headtmonthtotalPrice))
// 					}
// 				})
				var headtmonthtotalPrice = formatPrice(res.monthtotalPrice);
				$(".headtmonthtotalPrice").fadeOut(500, function(){
					$(this).html(headtmonthtotalPrice).fadeIn(500);
				})
				
				// 제품판매액
// 				$(".headtmonthtotalselngPrice").html(formatPrice(res.monthfrcsorderAmt - res.monthpurchasePrice))
				var headtmonthtotalselngPrice = formatPrice(res.monthtotalselngPrice);
				$(".headtmonthtotalselngPrice").fadeOut(500, function(){
					$(this).html(headtmonthtotalselngPrice).fadeIn(500);
				})
				
				// 판매비와 인건비
				var headtmonthtotalselngPersonal = formatPrice(res.monthtotalselngPersonal);
				$(".headtmonthtotalselngPersonal").fadeOut(500, function(){
					$(this).html(headtmonthtotalselngPersonal).fadeIn(500);
				})

				// 가맹비
// 				$(".headtmonthfrcsAmt").html(formatPrice(res.monthfrcsAmt));
				var headtmonthfrcsAmt = formatPrice(res.monthfrcsAmt);
				$(".headtmonthfrcsAmt").fadeOut(500, function(){
					$(this).html(headtmonthfrcsAmt).fadeIn(500);
				})
				
				// 로얄티
// 				$(".headtmonthfrcsRowal").html(formatPrice(res.monthfrcsRowal));
				var headtmonthfrcsRowal = formatPrice(res.monthfrcsRowal);
				$(".headtmonthfrcsRowal").fadeOut(500, function(){
					$(this).html(headtmonthfrcsRowal).fadeIn(500);
				})
				
				// 인건비
// 				$(".headmonthfrcspersonalCost").html(formatPrice(res.monthfrcspersonalCost));
				var headmonthfrcspersonalCost = formatPrice(res.monthfrcspersonalCost);
				$(".headmonthfrcspersonalCost").fadeOut(500, function(){
					$(this).html(headmonthfrcspersonalCost).fadeIn(500);
				})
				
				// 매출원가
// 				$(".headtmonthCogs").html(formatPrice(res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice))
				var headtmonthCogs = formatPrice(res.monthCogs);
				$(".headtmonthCogs").fadeOut(500, function(){
					$(this).html(headtmonthCogs).fadeIn(500);
				})
				
				// 매입가
// 				$(".headtmonthpurchasePrice").html(formatPrice(res.monthpurchasePrice));
				var headtmonthpurchasePrice = formatPrice(res.monthpurchasePrice);
				$(".headtmonthpurchasePrice").fadeOut(500, function(){
					$(this).html(headtmonthpurchasePrice).fadeIn(500);
				})
				
				// 영업이익
// 				$(".headtmonthtotalprofitPrice").html(formatPrice(res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice))
				var headtmonthtotalprofitPrice = formatPrice(res.monthtotalprofitPrice);
				$(".headtmonthtotalprofitPrice").fadeOut(500, function(){
					$(this).html(headtmonthtotalprofitPrice).fadeIn(500);
				})
				
				// 당기순이익
// 				$(".headtmonthtotalincomePrice").html(formatPrice(res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice - tax))
// 				var tax = (res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice)*0.1
// 				var headtmonthtotalincomePrice = formatPrice(res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice - tax);
// 				$(".headtmonthtotalincomePrice").fadeOut(500, function(){
// 					$(this).html(headtmonthtotalincomePrice).fadeIn(500);
// 				})
				
				var headtmonthtotalincomePrice = formatPrice(res.monthtotalincomePrice);
				$(".headtmonthtotalincomePrice").fadeOut(500, function(){
					$(this).html(headtmonthtotalincomePrice).fadeIn(500);
				})
				
			},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '일치하는 데이터가 없습니다 !',
					icon: 'warning',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/head/salesAnalysis.do"; 
					}
				});
			}
		});
	});
	
	// 1개월 단위로 증가
	$("#rightYear").on("click", function(){
		var headMonth = $("#headMonth").html();
		var old_headMonth = parseInt(headMonth)
		var new_headMonth = old_headMonth+1
		$("#headMonth").html(new_headMonth);
		console.log(new_headMonth);
		
		if(parseInt(new_headMonth) < 10){
			new_headMonth = "0" + new_headMonth;
		}
		
		var month = year + "-" + new_headMonth
		
		var data = {
				month : month
		}
		
		$.ajax({
			type : "post",
			url : "/head/month/salesAnalysis.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				
				var headtmonthtotalPrice = formatPrice(res.monthtotalPrice);
				$(".headtmonthtotalPrice").fadeOut(500, function(){
					$(this).html(headtmonthtotalPrice).fadeIn(500);
				})
				
				// 제품판매액
// 				$(".headtmonthtotalselngPrice").html(formatPrice(res.monthfrcsorderAmt - res.monthpurchasePrice))
				var headtmonthtotalselngPrice = formatPrice(res.monthtotalselngPrice);
				$(".headtmonthtotalselngPrice").fadeOut(500, function(){
					$(this).html(headtmonthtotalselngPrice).fadeIn(500);
				})
				
				// 판매비와 인건비
				var headtmonthtotalselngPersonal = formatPrice(res.monthtotalselngPersonal);
				$(".headtmonthtotalselngPersonal").fadeOut(500, function(){
					$(this).html(headtmonthtotalselngPersonal).fadeIn(500);
				})

				// 가맹비
// 				$(".headtmonthfrcsAmt").html(formatPrice(res.monthfrcsAmt));
				var headtmonthfrcsAmt = formatPrice(res.monthfrcsAmt);
				$(".headtmonthfrcsAmt").fadeOut(500, function(){
					$(this).html(headtmonthfrcsAmt).fadeIn(500);
				})
				
				// 로얄티
// 				$(".headtmonthfrcsRowal").html(formatPrice(res.monthfrcsRowal));
				var headtmonthfrcsRowal = formatPrice(res.monthfrcsRowal);
				$(".headtmonthfrcsRowal").fadeOut(500, function(){
					$(this).html(headtmonthfrcsRowal).fadeIn(500);
				})
				
				// 인건비
// 				$(".headmonthfrcspersonalCost").html(formatPrice(res.monthfrcspersonalCost));
				var headmonthfrcspersonalCost = formatPrice(res.monthfrcspersonalCost);
				$(".headmonthfrcspersonalCost").fadeOut(500, function(){
					$(this).html(headmonthfrcspersonalCost).fadeIn(500);
				})
				
				// 매출원가
// 				$(".headtmonthCogs").html(formatPrice(res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice))
				var headtmonthCogs = formatPrice(res.monthCogs);
				$(".headtmonthCogs").fadeOut(500, function(){
					$(this).html(headtmonthCogs).fadeIn(500);
				})
				
				// 매입가
// 				$(".headtmonthpurchasePrice").html(formatPrice(res.monthpurchasePrice));
				var headtmonthpurchasePrice = formatPrice(res.monthpurchasePrice);
				$(".headtmonthpurchasePrice").fadeOut(500, function(){
					$(this).html(headtmonthpurchasePrice).fadeIn(500);
				})
				
				// 영업이익
// 				$(".headtmonthtotalprofitPrice").html(formatPrice(res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice))
				var headtmonthtotalprofitPrice = formatPrice(res.monthtotalprofitPrice);
				$(".headtmonthtotalprofitPrice").fadeOut(500, function(){
					$(this).html(headtmonthtotalprofitPrice).fadeIn(500);
				})
				
				// 당기순이익
// 				$(".headtmonthtotalincomePrice").html(formatPrice(res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice - tax))
// 				var tax = (res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice)*0.1
// 				var headtmonthtotalincomePrice = formatPrice(res.monthfrcsAmt + res.monthfrcsRowal + (res.monthfrcsorderAmt - res.monthpurchasePrice) - res.monthpurchasePrice - tax);
// 				$(".headtmonthtotalincomePrice").fadeOut(500, function(){
// 					$(this).html(headtmonthtotalincomePrice).fadeIn(500);
// 				})
				
				var headtmonthtotalincomePrice = formatPrice(res.monthtotalincomePrice);
				$(".headtmonthtotalincomePrice").fadeOut(500, function(){
					$(this).html(headtmonthtotalincomePrice).fadeIn(500);
				})
				
			},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '일치하는 데이터가 없습니다 !',
					icon: 'warning',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/head/salesAnalysis.do"; 
					}
				});
			}
		});
	});
	
	// 전체로 변경 클릭 이벤트
	$("#allMonth").on("click", function(){
		
		$(".headmonthtitle").show();
		$(".headquatertitle").hide();
		
		$.ajax({
			type : "get",
			url : "/head/allmonth/salesAnalysis.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			success : function(res){
				newYearChart(res);
			    <c:set value="${monthList}" var="monthList"/>
		      	<c:set value="${thismonth}" var="thismonth"/>
		    	<c:forEach items="${monthList}" var="month">
		           	arr.push({total : "${month.monthtotalPrice}"});
		            <c:if test="${month.month eq thismonth}">
		            
		    			$(".headtmonthtotalPrice").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthtotalPrice}")).fadeIn(500);
		    			})
		    			
		    			$(".headtmonthtotalselngPrice").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthtotalselngPrice}")).fadeIn(500);
		    			})
		    			
		    			$(".headtmonthtotalselngPersonal").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthtotalselngPersonal}")).fadeIn(500);
		    			})
		    			
		    			$(".headtmonthfrcsAmt").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthfrcsAmt}")).fadeIn(500);
		    			})
		    			
		    			$(".headtmonthfrcsRowal").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthfrcsRowal}")).fadeIn(500);
		    			})
		    			
		    			$(".headmonthfrcspersonalCost").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthfrcspersonalCost}")).fadeIn(500);
		    			})
		    		
		    			$(".headtmonthCogs").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthCogs}")).fadeIn(500);
		    			})
		    			
		    			$(".headtmonthpurchasePrice").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthpurchasePrice}")).fadeIn(500);
		    			})
		    			
		    			$(".headtmonthtotalprofitPrice").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthtotalprofitPrice}")).fadeIn(500);
		    			})
		    			
		    			$(".headtmonthtotalincomePrice").fadeOut(500, function(){
		    				$(this).html(formatPrice("${month.monthtotalincomePrice}")).fadeIn(500);
		    			})
		    			
		        	</c:if>
		    	</c:forEach>
			},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '일치하는 데이터가 없습니다 !',
					icon: 'warning',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/head/salesAnalysis.do"; 
					}
				});
			}
		});
	});
	
	$("#leftQuater").on("mouseover", function(){
		$("#leftQuater").css("transform", "scale(1.5)")
	});
	
	$("#leftQuater").on("mouseout", function(){
		$("#leftQuater").css("transform", "")
	});
	
	$("#rightQuater").on("mouseover", function(){
		$("#rightQuater").css("transform", "scale(1.5)")
	});
	
	$("#rightQuater").on("mouseout", function(){
		$("#rightQuater").css("transform", "")
	});
	
	$("#quarterMonth").on("click", function(){
		
		$(".headmonthtitle").hide();
		$(".headquatertitle").show();
		
		$("#quaterstartMonth").html(month-3);
		$("#quaterendMonth").html(month-1);
		$(".quaterYear").html(year);
		
		$.ajax({
			type : "get",
			url : "/head/quartermonth/salesAnalysis.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			success : function(res){
				newquarterMonthChart(res);
				
				var quatermonthtotalPrice = 0;
				var quatermonthtotalselngPrice = 0;
				var quatermonthfrcsorderAmt = 0;	
				var quatermonthtotalselngPersonal = 0;
				var quatermonthfrcsAmt = 0;
				var quatermonthfrcsRowal = 0;
				var quatermonthfrcspersonalCost = 0;
				var quatermonthpurchasePrice = 0;
				
				for(var i = 6; i < 9; i++){
					quatermonthtotalPrice += res[i].monthtotalPrice;
					quatermonthtotalselngPrice += res[i].monthtotalselngPrice;
					quatermonthtotalselngPersonal += res[i].monthtotalselngPersonal;
					quatermonthfrcsAmt += res[i].monthfrcsAmt;
					quatermonthfrcsRowal += res[i].monthfrcsRowal;
					quatermonthfrcspersonalCost += res[i].monthfrcspersonalCost;
					quatermonthpurchasePrice += res[i].monthpurchasePrice;
					quatermonthfrcsorderAmt += res[i].monthfrcsorderAmt;
				}
				
				var quatermonthCogs = quatermonthtotalPrice - quatermonthpurchasePrice;
				var quatermonthtotalprofitPrice = quatermonthCogs - quatermonthfrcspersonalCost;
				var quatermonthtotalincomePrice = quatermonthtotalprofitPrice - (quatermonthtotalprofitPrice*0.1);
				
				$(".headtmonthtotalPrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalPrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalselngPrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalselngPrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalselngPersonal").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalselngPersonal)).fadeIn(500)
				})
				
				$(".headtmonthfrcsAmt").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthfrcsAmt)).fadeIn(500)
				})
				
				$(".headtmonthfrcsRowal").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthfrcsRowal)).fadeIn(500)
				})
				
				$(".headmonthfrcspersonalCost").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthfrcspersonalCost)).fadeIn(500)
				})
			
				$(".headtmonthCogs").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthCogs)).fadeIn(500)
				})
				
				$(".headtmonthpurchasePrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthpurchasePrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalprofitPrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalprofitPrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalincomePrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalincomePrice)).fadeIn(500)
				})
				
			},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '일치하는 데이터가 없습니다 !',
					icon: 'warning',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/head/salesAnalysis.do"; 
					}
				});
			}
		});
	});
	
	$("#leftQuater").on("click", function(){
		var startheadMonth = $("#quaterstartMonth").html();
		var old_startheadMonth = parseInt(startheadMonth)
		var new_startheadMonth = old_startheadMonth - 3
		$("#quaterstartMonth").html(new_startheadMonth);
		$(".quaterYear").html(year);
		
		var endheadMonth = $("#quaterendMonth").html();
		var old_endheadMonth = parseInt(endheadMonth)
		var new_endheadMonth = old_endheadMonth - 3
		$("#quaterendMonth").html(new_endheadMonth);
		$(".quaterYear").html(year);
		
		if(parseInt(new_startheadMonth) < 10){
			new_startheadMonth = "0" + new_startheadMonth;
		}
		
		if(parseInt(new_endheadMonth) < 10){
			new_endheadMonth = "0" + new_endheadMonth;
		}
		
		var quaterstartMonth = year + "-" + new_startheadMonth
		var quaterendMonth = year + "-" + new_endheadMonth
		
		var data = {
				quaterstartMonth : quaterstartMonth,
				quaterendMonth : quaterendMonth
		}
		
		$.ajax({
			type : "post",
			url : "/head/quaterDetails/salesAnalysis.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				
				var quatermonthtotalPrice = 0;
				var quatermonthtotalselngPrice = 0;
				var quatermonthfrcsorderAmt = 0;	
				var quatermonthtotalselngPersonal = 0;
				var quatermonthfrcsAmt = 0;
				var quatermonthfrcsRowal = 0;
				var quatermonthfrcspersonalCost = 0;
				var quatermonthpurchasePrice = 0;
				
				for(var i = 0; i < res.length; i++){
					quatermonthtotalPrice += res[i].monthtotalPrice;
					quatermonthtotalselngPrice += res[i].monthtotalselngPrice;
					quatermonthtotalselngPersonal += res[i].monthtotalselngPersonal;
					quatermonthfrcsAmt += res[i].monthfrcsAmt;
					quatermonthfrcsRowal += res[i].monthfrcsRowal;
					quatermonthfrcspersonalCost += res[i].monthfrcspersonalCost;
					quatermonthpurchasePrice += res[i].monthpurchasePrice;
					quatermonthfrcsorderAmt += res[i].monthfrcsorderAmt;
				}
				
				var quatermonthCogs = quatermonthtotalPrice - quatermonthpurchasePrice;
				var quatermonthtotalprofitPrice = quatermonthCogs - quatermonthfrcspersonalCost;
				var quatermonthtotalincomePrice = quatermonthtotalprofitPrice - (quatermonthtotalprofitPrice*0.1);
				
				$(".headtmonthtotalPrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalPrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalselngPrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalselngPrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalselngPersonal").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalselngPersonal)).fadeIn(500)
				})
				
				$(".headtmonthfrcsAmt").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthfrcsAmt)).fadeIn(500)
				})
				
				$(".headtmonthfrcsRowal").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthfrcsRowal)).fadeIn(500)
				})
				
				$(".headmonthfrcspersonalCost").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthfrcspersonalCost)).fadeIn(500)
				})
			
				$(".headtmonthCogs").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthCogs)).fadeIn(500)
				})
				
				$(".headtmonthpurchasePrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthpurchasePrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalprofitPrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalprofitPrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalincomePrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalincomePrice)).fadeIn(500)
				})
			},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '일치하는 데이터가 없습니다 !',
					icon: 'warning',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/head/salesAnalysis.do"; 
					}
				});
			}
		});
	});
	
	$("#rightQuater").on("click", function(){
		var startheadMonth = $("#quaterstartMonth").html();
		var old_startheadMonth = parseInt(startheadMonth)
		var new_startheadMonth = old_startheadMonth + 3
		$("#quaterstartMonth").html(new_startheadMonth);
		$(".quaterYear").html(year);
		
		var endheadMonth = $("#quaterendMonth").html();
		var old_endheadMonth = parseInt(endheadMonth)
		var new_endheadMonth = old_endheadMonth + 3
		$("#quaterendMonth").html(new_endheadMonth);
		$(".quaterYear").html(year);
		
		if(parseInt(new_startheadMonth) < 10){
			new_startheadMonth = "0" + new_startheadMonth;
		}
		
		if(parseInt(new_endheadMonth) < 10){
			new_endheadMonth = "0" + new_endheadMonth;
		}
		
		var quaterstartMonth = year + "-" + new_startheadMonth
		var quaterendMonth = year + "-" + new_endheadMonth
		
		var data = {
				quaterstartMonth : quaterstartMonth,
				quaterendMonth : quaterendMonth
		}
		
		$.ajax({
			type : "post",
			url : "/head/quaterDetails/salesAnalysis.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				
				var quatermonthtotalPrice = 0;
				var quatermonthtotalselngPrice = 0;
				var quatermonthfrcsorderAmt = 0;	
				var quatermonthtotalselngPersonal = 0;
				var quatermonthfrcsAmt = 0;
				var quatermonthfrcsRowal = 0;
				var quatermonthfrcspersonalCost = 0;
				var quatermonthpurchasePrice = 0;
				
				for(var i = 0; i < res.length; i++){
					quatermonthtotalPrice += res[i].monthtotalPrice;
					quatermonthtotalselngPrice += res[i].monthtotalselngPrice;
					quatermonthtotalselngPersonal += res[i].monthtotalselngPersonal;
					quatermonthfrcsAmt += res[i].monthfrcsAmt;
					quatermonthfrcsRowal += res[i].monthfrcsRowal;
					quatermonthfrcspersonalCost += res[i].monthfrcspersonalCost;
					quatermonthpurchasePrice += res[i].monthpurchasePrice;
					quatermonthfrcsorderAmt += res[i].monthfrcsorderAmt;
				}
				
				var quatermonthCogs = quatermonthtotalPrice - quatermonthpurchasePrice;
				var quatermonthtotalprofitPrice = quatermonthCogs - quatermonthfrcspersonalCost;
				var quatermonthtotalincomePrice = quatermonthtotalprofitPrice - (quatermonthtotalprofitPrice*0.1);
				
				$(".headtmonthtotalPrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalPrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalselngPrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalselngPrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalselngPersonal").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalselngPersonal)).fadeIn(500)
				})
				
				$(".headtmonthfrcsAmt").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthfrcsAmt)).fadeIn(500)
				})
				
				$(".headtmonthfrcsRowal").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthfrcsRowal)).fadeIn(500)
				})
				
				$(".headmonthfrcspersonalCost").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthfrcspersonalCost)).fadeIn(500)
				})
			
				$(".headtmonthCogs").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthCogs)).fadeIn(500)
				})
				
				$(".headtmonthpurchasePrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthpurchasePrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalprofitPrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalprofitPrice)).fadeIn(500)
				})
				
				$(".headtmonthtotalincomePrice").fadeOut(500, function(){
					$(this).html(formatPrice(quatermonthtotalincomePrice)).fadeIn(500)
				})
			},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '일치하는 데이터가 없습니다 !',
					icon: 'warning',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/head/salesAnalysis.do"; 
					}
				});
			}
		});
	});
	
	function newYearChart(res){
		removeYearChart();
		var canvas = '<canvas id="myChart" width="785px" height="500px"></canvas>'
		$("#chart-body").html(canvas);
		
		var ctx = $('#myChart');
		var arr = new Array();
		new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        datasets: [{
		            label: '# 매출액',
		            data: [
		            	res[0].monthtotalPrice
		            	, res[1].monthtotalPrice
		            	, res[2].monthtotalPrice
		            	, res[3].monthtotalPrice
		            	, res[4].monthtotalPrice
		            	, res[5].monthtotalPrice
		            	, res[6].monthtotalPrice
		            	, res[7].monthtotalPrice
		            	, res[8].monthtotalPrice
		            	, res[9].monthtotalPrice
		            	, res[10].monthtotalPrice
		            	, res[11].monthtotalPrice
	            	],
	            	backgroundColor: 'rgba(182, 225, 233, 1)'
		        }]
		    },
		    options: {
		    	responsive: false,
		        scales: {
		            x: {
		            	beginAtZero: true,
		                title: {
		                	display: true,
		                    text: '월',
							padding : {
								top : 20,
							}
		                }
		            },
		            y: {
		                beginAtZero: true,
		                title: {
		                    display: true,
		                    text: '금액',
							padding : {
								bottom : 20,
							}
		                },
		            }
		        }
		    }
		});
	}
	
	function removeYearChart(){
		ctx.remove();
	}
	
	function newquarterMonthChart(res){
		removequarterMonthChart();
		var canvas = '<canvas id="myChart" width="785px" height="500px"></canvas>'
		$("#chart-body").html(canvas);
		
		var ctx = $('#myChart');
		
		new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ['1분기(1~3월)', '2분기(4~6월)', '3분기(7~9월)', '4분기(10~12월)'],
		        datasets: [{
		            label: '# 분기별 매출액',
		            data: [
		            	res[0].monthtotalPrice + res[1].monthtotalPrice + res[2].monthtotalPrice
		            	, res[3].monthtotalPrice + res[4].monthtotalPrice + res[5].monthtotalPrice
		            	, res[6].monthtotalPrice + res[7].monthtotalPrice + res[8].monthtotalPrice
		            	, res[9].monthtotalPrice + res[10].monthtotalPrice + res[11].monthtotalPrice
	            	],
	            	backgroundColor: 'rgba(182, 225, 233, 1)'
		        }]
		    },
		    options: {
		    	responsive: false,
		        scales: {
		            x: {
		            	beginAtZero: true,
		                title: {
		                	display: true,
		                    text: '월',
							padding : {
								top : 20,
							}
		                }
		            },
		            y: {
		                beginAtZero: true,
		                title: {
		                    display: true,
		                    text: '금액',
							padding : {
								bottom : 20,
							}
		                },
		            }
		        }
		    }
		});
	}
	
	function removequarterMonthChart(){
		ctx.remove();
	}
	
	function formatPrice(price) {
		  return '₩ ' + price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
});	



</script>
