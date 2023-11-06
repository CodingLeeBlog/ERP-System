<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
		                        <div class="col-xl-10">
		                            <form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
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
		                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search">
                                                <button type="button" class="btn btn-secondary">검색</button>
                                            </div>
		                                </div>
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

            <div class="row justify-content-around">
                <div class="col-5">
                    <div class="card widget-inline" style="height:90px;">
                        <div class="card-body">
                            <div class="row justify-content-center">
                                <div class="col-4 ms-1 ">
                                    <h3><span>기간 </span>&nbsp;&nbsp;:</h3>
                                </div>
                                <div class="col-6">
                                    <!-- Year View -->
                                    <div class="mb-3">
                                        <input class="form-control" id="example-month" type="month" name="month">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-5">
                    <div class="card widget-inline" style="height:90px;">
                        <div class="card-body">
                            <div class="row justify-content-around">
                                <div class="col-4">
                                    <select class="form-select" id="example-select">
                                        <option>전체</option>
                                        <option>운영중</option>
                                        <option>휴업중</option>
                                        <option>개점예정</option>
                                        <option>계약만료</option>
                                    </select>
                                </div>
                                <div class="col-8">
                                    <div class="input-group">
                                        <input type="search" class="form-control"
                                            placeholder="검색하기..." id="store-search">
                                        <button class="btn btn-primary" type="submit"
                                            style="background-color: #abb2b8;">검색</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
                                                    <td>Ⅰ.매출액</td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>제품판매액</td>
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
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h1 class="header-title font-24">00점 영업매출</h1>
                                <div>
                                    <button type="button" class="btn btn-soft-secondary btn-sm">
                                        ALL
                                    </button>
                                    <button type="button" class="btn btn-soft-primary btn-sm">
                                        1개월
                                    </button>
                                    <button type="button" class="btn btn-soft-secondary btn-sm">
                                        6개월
                                    </button>
                                    <button type="button" class="btn btn-soft-secondary btn-sm">
                                        1년
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <h4 class="header-title mb-4">Spline Area</h4>
                                <div dir="ltr">
                                    <div id="spline-area" class="apex-charts" style="height: 515px;" data-colors="#727cf5,#6c757d"></div>
                                </div>
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