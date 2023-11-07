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
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">매장점검관리</a></li>
	                            <li class="breadcrumb-item active">매장위생관리</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">매장위생관리</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	
	        <div class="row">
	            <div class="col-12">
	                <div class="card widget-inline">
	                    <div class="card-body p-0">
	                        <div class="row g-0">
	                        
	                            <div class="col-sm-6 col-lg-6">
	                                <div class="card rounded-0 shadow-none m-0 border-start border-light">
	                                    
	                                    <div class="row align-items-center mx-5">
	                                        <div class="col-4">
	                                            <div class="card-body text-center">
	                                                <i class="ri-group-line text-muted font-24"></i>
	                                                <h3><span>5 / 5</span></h3>
	                                                <p class="text-muted font-15 mb-0">위생 총점</p>
	                                            </div>
	                                        </div>
	                                        <div class="col-8">
	                                            <div class="text-end">
	                                                <div id="campaign-sent-chart" data-colors="#727cf5" ></div>
	                                            </div>
	                                        </div>
	                                    </div> <!-- end row-->
	                                    
	                                </div> <!-- end card -->
	                            </div> <!-- end col -->
	                
	                            <div class="col-sm-6 col-lg-3">
	                                <div class="card rounded-0 shadow-none m-0 border-start border-light">
	                                    <div class="card-body text-center">
	                                        <i class="ri-group-line text-muted font-24"></i>
	                                        <h3><span>2023-08-30</span></h3>
	                                        <p class="text-muted font-15 mb-0">최근 점검일자</p>
	                                    </div>
	                                </div>
	                            </div>
	
	                            <div class="col-sm-6 col-lg-3">
	                                <div class="card rounded-0 shadow-none m-0 border-start border-light">
	                                    <div class="card-body text-center">
	                                        <i class="ri-line-chart-line text-muted font-24"></i>
	                                        <h3><span>93%</span> <i class="mdi mdi-arrow-up text-success"></i></h3>
	                                        <p class="text-muted font-15 mb-0">공문바로가기</p>
	                                    </div>
	                                </div>
	                            </div>
	
	                        </div> <!-- end row -->
	                    </div>
	                </div> <!-- end card-box-->
	            </div> <!-- end col-->
	        </div>
	        <!-- end row-->
	
	        <div class="row">
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	
	                        <div class="row mb-2">
	                            <div class="col-xl-12">
	                                <form class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between">
	                                    <div class="col-auto">
	                                        <label for="inputPassword2" class="visually-hidden">Search</label>
	                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search...">
	                                        <!-- 버튼추가하기? -->
	                                    </div>
	                                </form>                            
	                            </div>
	                        </div>
	
	                        <div class="table-responsive">
	                            <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable">
	                                <thead class="table-light">
	                                    <tr>
	                                        <th class="all" style="width: 20px;">
	                                            <div class="form-check">
	                                                <input type="checkbox" class="form-check-input" id="customCheck1">
	                                                <label class="form-check-label" for="customCheck1">&nbsp;</label>
	                                            </div>
	                                        </th>
	                                        <th class="all">No.</th>
	                                        <th>위생총점</th>
	                                        <th>내역</th>
	                                        <th>점검일자</th>
	                                        <th>위생교육이수여부</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                
	                                    <tr>
	                                        <td>
	                                            <div class="form-check">
	                                                <input type="checkbox" class="form-check-input" id="customCheck2">
	                                                <label class="form-check-label" for="customCheck2">&nbsp;</label>
	                                            </div>
	                                        </td>
	                                        <td>
	                                            10
	                                        </td>
	                                        <td>
	                                            5/5
	                                        </td>
	                                        <td>
	                                            <a href="#"><span class="badge bg-light text-dark">내역보기</span></a>
	                                            <i class="mdi-file-download-outline"></i>
	                                        </td>
	                                        <td>
	                                            2023-10-06
	                                        </td>
	                                        <td>
	                                            <span class="badge bg-success">완료</span>
<!-- 	                                            <span class="badge bg-danger">미완료</span> -->
	                                        </td>
	                                    </tr>
	                                    
	                                    <tr>
	                                        <td>
	                                            <div class="form-check">
	                                                <input type="checkbox" class="form-check-input" id="customCheck3">
	                                                <label class="form-check-label" for="customCheck3">&nbsp;</label>
	                                            </div>
	                                        </td>
	                                        <td>
	                                            9
	                                        </td>
	                                        <td>
	                                            <p class="m-0 d-inline-block align-middle font-16">
	                                                <span class="text-warning mdi mdi-star"></span>
	                                                <span class="text-warning mdi mdi-star"></span>
	                                                <span class="text-warning mdi mdi-star"></span>
	                                                <span class="text-warning mdi mdi-star"></span>
	                                                <span class="text-warning mdi mdi-star-outline"></span>
	                                            </p>
	                                        </td>
	                                        <td>
	                                            <a href="#" class="text-body">좋아요</a>
	                                        </td>
	                                        <td>
	                                            2023-10-06
	                                        </td>
	                                        <td>
	                                            <span class="badge bg-danger">미완료</span>
	                                        </td>
	                                    </tr>
	                                    
	                                </tbody>
	                            </table>
	                        </div>
	
	                        <!-- 페이징추가하기 -->
	
	                        <div class="row mt-2">
	                            <div class="col-sm-5">
	                                <!-- <a href="javascript:void(0);" class="btn btn-danger mb-2"><i class="mdi mdi-plus-circle me-2"></i> Add Products</a> -->
	                            </div>
	                            <div class="col-sm-7">
	                                <div class="text-sm-end">
	                                    <button type="button" class="btn btn-light mb-2">삭제</button>
	                                </div>
	                            </div><!-- end col-->
	                        </div>
	
	                    </div> <!-- end card-body-->
	                </div> <!-- end card-->
	            </div> <!-- end col -->
	        </div>
	        <!-- end row -->   
	        
	    </div> <!-- container -->
	
	</div> <!-- content -->
</div>

<script type="text/javascript">
// var columnChart = {
//         series: [{
//         data: [25, 66, 41, 89, 63, 25, 44, 12, 36, 9, 54]
//       }],
//         chart: {
//         type: 'bar',
//         width: 100,
//         height: 35,
//         sparkline: {
//           enabled: true
//         }
//       },
//       plotOptions: {
//         bar: {
//           columnWidth: '80%'
//         }
//       },
//       labels: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
//       xaxis: {
//         crosshairs: {
//           width: 1
//         },
//       },
//       tooltip: {
//         fixed: {
//           enabled: false
//         },
//         x: {
//           show: false
//         },
//         y: {
//           title: {
//             formatter: function (seriesName) {
//               return ''
//             }
//           }
//         },
//         marker: {
//           show: false
//         }
//       }
//       };

// var columnChart = new ApexCharts(document.querySelector("#columnChart"), options5);
// chart5.render();
</script>