<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

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

<!--             <div class="row justify-content-around"> -->
<!--                 <div class="col-5"> -->
<!--                     <div class="card widget-inline" style="height:90px;"> -->
<!--                         <div class="card-body"> -->
<!--                             <div class="row justify-content-center"> -->
<!--                                 <div class="col-4 ms-1 "> -->
<!--                                     <h3><span>기간 </span>&nbsp;&nbsp;:</h3> -->
<!--                                 </div> -->
<!--                                 <div class="col-6"> -->
<!--                                     Year View -->
<!--                                     <div class="mb-3"> -->
<!--                                         <input class="form-control" id="selectMonth" type="month" name="month"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="col-5"> -->
<!--                     <div class="card widget-inline" style="height:90px;"> -->
<!--                         <div class="card-body"> -->
<!--                             <div class="row justify-content-around"> -->
<!--                                 <div class="col-4"> -->
<!--                                     <select class="form-select" id="example-select"> -->
<!--                                         <option>전체</option> -->
<!--                                         <option>운영중</option> -->
<!--                                         <option>휴업중</option> -->
<!--                                         <option>개점예정</option> -->
<!--                                         <option>계약만료</option> -->
<!--                                     </select> -->
<!--                                 </div> -->
<!--                                 <div class="col-8"> -->
<!--                                     <div class="input-group"> -->
<!--                                         <input type="search" class="form-control" -->
<!--                                             placeholder="검색하기..." id="store-search"> -->
<!--                                         <button class="btn btn-primary" type="submit" -->
<!--                                             style="background-color: #abb2b8; border: #abb2b8;">검색</button> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->

            <div class="row">
                <div class="col-lg-6">
                        <div class="card">
                             <div class="card-header d-flex justify-content-center align-items-center">
                                <h1 class="header-title font-24"></h1>
                            </div>

                        <div class="card-body" style="height:620px;">
                             <div class="col-lg-12 d-flex justify-content-between">
                                    <div class="col-lg-10">
                                        <table class="table table-bordered table-centered ms-5">
                                            <thead class="table-dark" style="text-align: center;">
                                                <tr>
                                                    <th style="width: 500px;">과목</th>
                                                    <th style="width: 500px;">금액(원)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Ⅰ.매출액</td>
                                                    <td>(가맹비 + 로얄티 + (제품판매액 - 매입가))</td>
                                                </tr>
                                                <tr>
                                                    <td>제품판매액</td>
                                                    <td>
                                                    	(가맹점에 판매한 총금액)<br>
                                                    	(출고단가 * 주문수량)
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Ⅱ. 판매비와관리비</td>
                                                    <td>(가맹비 + 로얄티 + 인건비)</td>
                                                </tr>
                                                <tr>
                                                    <td>가맹비</td>
                                                    <td>(고정값 50만원)</td>
                                                </tr>
                                                <tr>
                                                    <td>로얄티</td>
                                                    <td>(각 가맹점 총 매출의 3%)</td>
                                                </tr>
                                                <tr>
                                                    <td>인건비</td>
                                                    <td>(월별 직원급여 하드코딩)</td>
                                                </tr>
                                                <tr>
                                                    <td>Ⅲ. 매출원가</td>
                                                    <td>(매출액 - 매입가)</td>
                                                </tr>
                                                <tr>
                                                    <td>매입가</td>
                                                    <td>(입고단가 * 주문수량)</td>
                                                </tr>
                                                <tr>
                                                    <td>Ⅳ. 영업이익</td>
                                                    <td>(매출액 - 매입가 - 인건비)</td>
                                                </tr>
                                                <tr>
                                                    <td>Ⅴ. 당기순이익</td>
                                                    <td>(영업이익 - 세금(10%))</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
                        </div>
                        </div> <!-- end card -->
                    </div><!-- end col-->

                    <div class="col-lg-6">
                    	<div class="row">
                    		<div class="col" id="test"></div>
                    			<div class="row mt-4 mb-4">
                    				<div class="col d-flex justify-content-center align-items-center">
		                    			<i class="ri-arrow-left-s-line" id="leftYear" style="font-size: 50px"></i>
                    				</div>
		                    		<div id="calYear" class="col d-flex justify-content-center align-items-center" style="font-size: 30px; font-family: 'GmarketSansMedium';"></div>
		                    		<div class="col d-flex justify-content-center align-items-center">
		                    			<i class="ri-arrow-right-s-line" id="rightYear" style="font-size: 50px"></i>
		                    		</div>
                    			</div>
	                    		<div class="pt-4"></div>
	                    	<div class="col"></div>
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
	var month = date.getMonth() + 1;
	var day = date.getDate();
	var year = date.getFullYear();
		
	$("#calYear").html(year)
	
	var ctx = $('#myChart');
	
	new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
	        datasets: [{
	            label: ' 매출액',
	            data: [12, 19, 3, 5, 2, 3, 12, 19, 3, 5, 2, 3],
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
	})
	
	$("#leftYear").on("mouseout", function(){
		$("#leftYear").css("transform", "")
	})
	
	$("#rightYear").on("mouseover", function(){
		$("#rightYear").css("transform", "scale(1.5)")
	})
	
	$("#rightYear").on("mouseout", function(){
		$("#rightYear").css("transform", "")
	})
	
	// 1년 단위로 감소
	$("#leftYear").on("click", function(){
		var calYear = $("#calYear").html();
		var old_calYear = parseInt(calYear)
		var new_calYear = old_calYear-1
		$("#calYear").html(new_calYear);
		newChart();
	})
	
	// 1년 단위로 증가
	$("#rightYear").on("click", function(){
		var calYear = $("#calYear").html();
		var old_calYear = parseInt(calYear)
		var new_calYear = old_calYear+1
		$("#calYear").html(new_calYear);
		newChart();
		
		if(new_calYear === parseInt(year)+1){
			$("#calYear").html(old_calYear);
			alert("잘못된 접근입니다")
		}
		
	})
	
	function newChart(){
		removeChart();
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
	
	function removeChart(){
		ctx.remove();
	}
	
	function set
	
});
</script>
