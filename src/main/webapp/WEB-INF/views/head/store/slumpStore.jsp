<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!-- jquery 데이터테이블 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

		<!-- start page title -->
		<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">부진매장관리</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">매출이 부진한 가맹점을 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						매장관리 / &nbsp;<span class="text-decoration-underline">부진매장관리</span>
					</div>
				</div>
			</div>
            <!-- end page title -->

            <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
		                        <div class="col-xl-12">
                                <form id="searchForm" method="post" class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between">
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
                                            <label for="status-select" class="col-3">분류</label>
                                            <select class="form-select" id="status-select">
                                                <option selected>선택해주세요</option>
                                                <option value="1">잡화</option>
                                                <option value="2">수산</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label for="inputPassword2" class="visually-hidden">Search</label>
                                            <input type="search" class="form-control" id="inputPassword2" placeholder="Search">
                                            <button type="button" class="btn btn-secondary">검색</button>
                                        </div>
                                    </div>
                                    <sec:csrfInput/>
                                </form>                            
                            </div>
		                    </div>
		
		                    <div class="table-responsive">
		                    
		                        <table class="table table-centered table-nowrap mt-2">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:100px;">순번</th>
		                                    <th style="text-align:center; width:150px;">가맹점명</th>
		                                    <th style="text-align:center; width:150px;">가맹점주명</th>
		                                    <th style="text-align:center; width:150px;">연락처</th>
		                                    <th style="text-align:center; width:150px;">해당년월</th>
		                                    <th style="text-align:center; width:150px;">손익분기점</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                <tr>
		                                    <td style="text-align:center">
		                                    	1
		                                    </td>
		                                    <td style="text-align:center">
		                                    	대전 대흥점
		                                    </td>
			                                <td style="text-align:center">
			                                   	이정민
			                                </td>
		                                    <td style="text-align:center">
		                                        010-8877-6552
		                                    </td>
		                                    <td style="text-align:center">
		                                    	2023/05
		                                    </td>
		                                    <td style="text-align:center">
		                                    	15,000,000
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td style="text-align:center">
		                                    	2
		                                    </td>
		                                    <td style="text-align:center">
		                                    	대전 선화점
		                                    </td>
			                                <td style="text-align:center">
			                                   	차수연
			                                </td>
		                                    <td style="text-align:center">
		                                        010-8877-6552
		                                    </td>
		                                    <td style="text-align:center">
		                                    	2023/05
		                                    </td>
		                                    <td style="text-align:center">
		                                    	18,000,000
		                                    </td>
		                                </tr>
		                            </tbody>
		                        </table>
		                    </div>
                        </div>
		                    <br>
								<nav aria-label="Page navigation example">
   									 <ul class="pagination pagination-rounded mb-0 justify-content-center">
								        <li class="page-item">
								            <a class="page-link" href="javascript: void(0);" aria-label="Previous">
								                <span aria-hidden="true">&laquo;</span>
								            </a>
								        </li>
								        <li class="page-item"><a class="page-link" href="javascript: void(0);">1</a></li>
								        <li class="page-item"><a class="page-link" href="javascript: void(0);">2</a></li>
								        <li class="page-item active"><a class="page-link" href="javascript: void(0);">3</a></li>
								        <li class="page-item"><a class="page-link" href="javascript: void(0);">4</a></li>
								        <li class="page-item"><a class="page-link" href="javascript: void(0);">5</a></li>
								        <li class="page-item">
								            <a class="page-link" href="javascript: void(0);" aria-label="Next">
								                <span aria-hidden="true">&raquo;</span>
								            </a>
								        </li>
								    </ul>
								</nav>
		                </div> <!-- end card-body-->
		            </div> <!-- end card-->
		        </div> <!-- end col -->
		    </div>

            <div class="row">
                <div class="col-lg-6">
                        <div class="card">
                             <div class="card-header d-flex justify-content-center align-items-center">
                                <h1 class="header-title font-24">손익계산서</h1>
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
                                                    <td>Ⅰ.총매출액</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>Ⅱ. 판매비와관리비</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>가맹비</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>로얄티</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>인건비</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>공과금</td>
                                                    <td>(수도세/전기세/가스비) + (월세)</td>
                                                </tr>
                                                <tr>
                                                    <td>Ⅲ. 매출원가</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>매입가</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>Ⅳ. 영업이익</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>Ⅴ. 당기순이익</td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
                        </div>
                        </div> <!-- end card -->
                    </div><!-- end col-->

                    <div class="col-lg-6">
                        <div class="card">
                            <div style="height:30px;"class="card-header d-flex justify-content-between align-items-center">
                                <h1 class="header-title font-24 mt-2">00점 영업매출</h1>
                            </div>
                            <div class="card-body">
<!--                                 <h4 class="header-title mb-4">Spline Area</h4> -->
                                <div class="row" style="height:50px;">
			                		<div class="col-4" id="test"></div>
				               			<div class="col mt-4 mb-4 d-flex justify-content-center align-items-center">
				                			<i class="me-3 ri-arrow-left-s-line" id="leftYear" style="font-size: 30px"></i>
				                				<span>2023</span>
				                 				<div id="calYear" class="" style="font-size: 30px; font-family: 'GmarketSansMedium';"></div>
				                			<i class="ms-3 ri-arrow-right-s-line" id="rightYear" style="font-size: 30px"></i>
				               			</div>
				                 	<div class="col-4"></div>
			                	</div>
									<div class="card-body">
                                        <div class="chart-body" dir="ltr">
                                            <div>
                                                <canvas id="mixed-chart" width="800" height="450"></canvas>
                                            </div>
                                        </div>

                                    </div> <!-- end card body-->
                            </div>
                            <!-- end card body-->
                        </div> <!-- end card -->
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

<script type="text/javascript">

new Chart(document.getElementById("mixed-chart"), {
    type: 'bar',
    data: {
      labels: ["1900", "1950", "1999", "2050"],
      datasets: [ {
          label: "Africa",
          type: "line",
          borderColor: "#FFA8A5",
          data: [450,75,480,299],
          fill: false
        }, {
          label: "Africa",
          type: "bar",
          backgroundColor: "rgba(0,143,226,0.2)",
          backgroundColorHover: "#96FFFF",
          data: [650,150,500,300]
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Population growth (millions): Europe & Africa'
      },
      legend: { display: false }
    }
});

</script>