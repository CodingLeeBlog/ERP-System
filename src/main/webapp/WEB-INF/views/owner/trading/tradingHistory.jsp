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
		                        <li class="breadcrumb-item active">트레이딩 내역</li>
		                    </ol>
		                </div>
		                <h4 class="page-title">트레이딩 내역</h4>
		            </div>
		        </div>
		    </div>
		    <!-- end page title -->
		
		    <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
		                        <div class="col-xl-8">
		                            <h5>필터</h5>
		                            <div class="mt-2">
									    <div class="form-check form-check-inline">
									        <input type="checkbox" class="form-check-input" id="customCheck3">
									        <label class="form-check-label" for="customCheck3">전체</label>
									    </div>
									    <div class="form-check form-check-inline">
									        <input type="checkbox" class="form-check-input" id="customCheck4">
									        <label class="form-check-label" for="customCheck4">발신</label>
									    </div>
									    <div class="form-check form-check-inline">
									        <input type="checkbox" class="form-check-input" id="customCheck5">
									        <label class="form-check-label" for="customCheck5">수신</label>
									    </div>
									</div>                       
		                        </div>
		                    </div>
							<div class="row mb-2">
		                        <div class="col-xl-8">
		                            <h5>진행상태</h5>
		                            <div class="mt-2">
									    <div class="form-check form-check-inline">
									        <input type="checkbox" class="form-check-input" id="customCheck3">
									        <label class="form-check-label" for="customCheck3">전체</label>
									    </div>
									    <div class="form-check form-check-inline">
									        <input type="checkbox" class="form-check-input" id="customCheck4">
									        <label class="form-check-label" for="customCheck4">요청중</label>
									    </div>
									    <div class="form-check form-check-inline">
									        <input type="checkbox" class="form-check-input" id="customCheck5">
									        <label class="form-check-label" for="customCheck5">거래완료</label>
									    </div>
									    <div class="form-check form-check-inline">
									        <input type="checkbox" class="form-check-input" id="customCheck5">
									        <label class="form-check-label" for="customCheck5">거절</label>
									    </div>
									</div>                          
		                        </div>
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
		                                    <th style="text-align:center; width:100px;">순번</th>
		                                    <th style="text-align:center; width:200px;">트레이딩 신청일</th>
		                                    <th style="text-align:center; width:150px;">수신/발신</th>
		                                    <th style="text-align:center; width:150px;">트레이딩 대상 가맹점</th>
		                                    <th style="text-align:center; width:150px;">제품명</th>
		                                    <th style="text-align:center; width:150px;">수량</th>
		                                    <th style="text-align:center; width:150px;">진행상태</th>
		                                    <th style="text-align:center; width:150px;">비고</th>
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
		                                    	1
		                                    </td>
		                                    <td style="text-align:center">
		                                    	2023-10-03
		                                    </td>
			                                <td style="text-align:center">
			                               		발신
			                                </td>
		                                    <td style="text-align:center">
		                                    	대전 오류점
		                                    </td>
		                                    <td style="text-align:center">
		                                    	오징어입
		                                    </td>
		                                    <td style="text-align:center">
		                                    	5개
		                                    </td>
		                                    <td style="text-align:center">
												거절
		                                    </td>
		                                    <td style="text-align:center">
												재고부족
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <div class="form-check">
		                                            <input type="checkbox" class="form-check-input" id="customCheck2">
		                                            <label class="form-check-label" for="customCheck2">&nbsp;</label>
		                                        </div>
		                                    </td>
		                                    <td style="text-align:center">
		                                    	2
		                                    </td>
		                                    <td style="text-align:center">
		                                    	2023-10-03
		                                    </td>
			                                <td style="text-align:center">
			                               		수신
			                                </td>
		                                    <td style="text-align:center">
		                                    	대전 오류점
		                                    </td>		
		                                    <td style="text-align:center">
		                                    	오징어입
		                                    </td>
		                                    <td style="text-align:center">
		                                    	5개
		                                    </td>
		                                    <td style="text-align:center">
												거래완료
		                                    </td>
		                                    <td style="text-align:center">
		                                    </td>
		                                </tr>
		                            </tbody>
		                        </table>
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
		</div> <!-- container -->
	</div> <!-- content -->
</div>
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