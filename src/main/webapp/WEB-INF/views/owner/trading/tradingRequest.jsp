<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Bootstrap Touchspin css -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" type="text/css" />

<!-- Bootstrap Touchspin js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>

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
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">홈</a></li>
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">재고 트레이딩</a></li>
		                        <li class="breadcrumb-item active">트레이딩 요청</li>
		                    </ol>
		                </div>
		                <h4 class="page-title">트레이딩 요청</h4>
		            </div>
		        </div>
		    </div>
		    <!-- end page title -->

		    <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                
		                    <div class="row mb-2">
		                        <div class="col-xl-9"><h4 class="mt-1 mb-3">내 가맹점 주변 매장</h4></div>
		                    </div>
		
		                    <div>
								지도API		                    
		                    </div>
		       		         </div> <!-- end card-body-->
		       		  	</div> <!-- end card-->
		     	   </div> <!-- end col -->
			</div>
			
			<!-- 트레이딩 물품 조회 -->
			<div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		               		 <div class="row mb-2">
		                        <div class="col-xl-8">
		                            <form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
		                                <div class="col-auto">
		                                    <label for="inputPassword2" class="visually-hidden">Search</label>
		                                    <input type="search" class="form-control" id="inputPassword2" placeholder="Search">
		                                </div>
		                                <div class="col-auto">
		                                    <div class="d-flex align-items-center">
		                                        <label for="status-select" class="me-2">Status</label>
		                                        <select class="form-select" id="status-select">
		                                            <option selected="">선택해주세요</option>
		                                            <option value="1">제품코드</option>
		                                            <option value="2">제품명</option>
		                                        </select>
		                                    </div>
		                                </div>
		                            </form>                            
		                        </div>
		                        
		                        <div class="col-xl-4">
		                            <div class="text-xl-end mt-xl-0 mt-2">
		                                <button type="button" class="btn btn-light mb-2">엑셀 다운로드</button>
		                            </div>
		                        </div><!-- end col-->
		                    </div>
		                  	  <div class="table-responsive">
		                        <table class="table table-centered table-nowrap mb-0">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="width: 20px;">
		                                        <div class="form-check">
		                                            <input type="checkbox" class="form-check-input" id="customCheck1">
		                                            <label class="form-check-label" for="customCheck1">&nbsp;</label>
		                                        </div>
		                                    </th>
		                                    <th style="text-align:center; width:100px;">가맹점명</th>
		                                    <th style="text-align:center; width:200px;">위치</th>
		                                    <th style="text-align:center; width:150px;">제품명</th>
		                                    <th style="text-align:center; width:150px;">보유수량</th>
		                                    <th style="text-align:center; width:150px;"></th>
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
		                                    <td style="text-align:center">
		                                    	P0001
		                                    </td>
		                                    <td style="text-align:center">
		                                    	냉동 오징어 1ea
		                                    </td>
		                                    <td style="text-align:center">
		                                    	300
		                                    </td>
		                                    <td style="text-align:center">
												500
		                                    </td>
		                                    <td style="text-align:center">
												<button type="button" class="btn btn-info">트레이딩 신청</button>
		                                    </td>
		                                </tr>
		                                <tr>
		                            </tbody>
		                        </table>
		                    </div>
		                    <br>
		       		         </div> <!-- end card-body-->
		       		  	</div> <!-- end card-->
		     	   </div> <!-- end col -->
			    </div>
			</div>
		</div> <!-- container -->
	</div> <!-- content -->
<script type="text/javascript">
$(function(){
	$('.btn-danger').on("click", function(){
		
		// 버튼 텍스트값
		var btnText = $(this).text();
		var str = "";
		
		if(btnText== "수정"){
			// 텍스트가 수정이면 
			$(this).text("변경");
			$(this).attr("class", "btn btn-primary");
			
			// 버튼이 눌린 row 정보
			var tr = $(this).parent().parent();	// <tr>
		   	console.log(tr);
		   	var td = tr.children();	// <td>
		   	console.log(td);
		   	
		   	// 현 재고수량
		   	console.log(td[3]);
		   	
		   	var invent = td[3];
		   	console.log(td[3]);
//	 	   	console.log(td[8].find('button').text());
		}
		
		if(btnText=="변경"){
			$(this).text("수정");
			$(this).attr("class", "btn btn-danger");
		}
		

	   	
	});
				
});
</script>