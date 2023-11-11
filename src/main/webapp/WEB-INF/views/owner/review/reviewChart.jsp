<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="content-page">
	<div class="content">
	
	    <!-- Start Content-->
	    <div class="container-fluid">
	
	        <!-- start page title -->
	        <div class="row">
	            <div class="col-12">
	                <div class="page-title-box">
	                    <div class="page-title-right">
	                        <ol class="breadcrumb m-0">
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">리뷰관리</a></li>
	                            <li class="breadcrumb-item active">리뷰현황</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">리뷰현황</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	
	        <div class="row">
	            <div class="col-xl-9 col-lg-6">
	
					<div class="row">
						<!-- 라인 차트 -->
						<div class="col-sm-6 d-inline-block">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="header-title mb-4">Simple line chart</h4>
	                                <div dir="ltr">
	                                    <div id="line-chart" class="apex-charts" data-colors="#ffbc00"></div>
	                                </div>
	                            </div>
	                            <!-- end card body-->
	                        </div>
	                        <!-- end card -->
	                    </div>
	                    <!-- end col-->
	                    
	                    <!-- 컬럼 차트 -->
	                    <div class="col-sm-6 d-inline-block">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="header-title mb-3">Column Chart with Datalabels</h4>
	                                <div dir="ltr">
	                                    <div id="datalabels-column" class="apex-charts" data-colors="#727cf5"></div>
	                                </div>
	                            </div>
	                            <!-- end card body-->
	                        </div>
	                        <!-- end card -->
	                    </div>
	                    <!-- end col-->
					</div>
	
						<!--도넛 차트 -->
						<div class="col-xl-3 col-lg-6 d-inline-block">
	                        <div class="card">
	                            <div class="card-body">
	                                <h4 class="header-title mb-4">Donut Chart</h4>
	                                <div dir="ltr">
<!-- 	                                    <div class="donut-container text-center" style="width: 100%;" data-colors2="#727cf5,#0acf97,#6c757d,#fa5c7c,#ffbc00,#39afd1"></div> -->
<!-- 	                                    <div class="legend-chart-container text-center" style="width:70%; height:auto;"></div> -->
	                                </div>
	                            </div>
	                            <!-- end card body-->
	                        </div>
	                        <!-- end card -->
	                    </div>
	                    <!--도넛 차트 끝-->
	                    
	            </div> <!-- end col -->
	        </div> <!-- end row -->   
	        
	    </div> <!-- container -->
	    
	</div> <!-- content -->
</div>