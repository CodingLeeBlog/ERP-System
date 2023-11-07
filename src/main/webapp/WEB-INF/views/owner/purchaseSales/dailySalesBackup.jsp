<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<input type="hidden" value=${frcsId } id="frcsId">
<div class="content-page">
	<div class="content">
		<div class="container-fluid">
		    <div class="row">
		        <div class="col-12">
		            <div class="page-title-box">
		                <div class="page-title-right">
		                    <ol class="breadcrumb m-0">
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">홈</a></li>
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">매입/매출 분석</a></li>
		                        <li class="breadcrumb-item active">일일 매출 분석</li>
		                    </ol>
		                </div>
		                <h4 class="page-title">일일 매출 분석</h4>
		            </div>
		        </div>
		    </div>
		    
		    <!-- 주간 차트 -->
			<div class="row">
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-4">주간 차트</h4>
                            <div dir="ltr">
                                <div class="mt-3 chartjs-chart" style="height: 100%;">
                                    <canvas id="monthChart" data-colors="#727cf5,#0acf97" style="box-sizing: border-box; display: block; height: 320px; width: 795px;" width="795" height="320"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title mb-4">또다른 차트</h4>
                            <div dir="ltr">
                                <div class="mt-3 chartjs-chart" style="height: 100%;">
                                    <canvas id="monthChart" data-colors="#727cf5,#0acf97" style="box-sizing: border-box; display: block; height: 320px; width: 795px;" width="795" height="320"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
			<div class="col-12">
	            <div class="card">
	                <div class="card-body">
	                    <div class="row mb-2">
							<!-- 검색창  -->
	                        <div class="col-xl-8">
	                            <form id="searchForm" class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">		                                
 									<input type="hidden" name="page" id="page"/>
									 <div class="col-2">
                                       	<input class="form-control" id="afterDate" name="afterDate" type="date" name="date" value="${afterDate }">
                                     </div>
                                     <div class="col-auto">-</div>
                                     <div class="col-2">
                                       	<input class="form-control" id="beforeDate" name="beforeDate" type="date" name="date" value="${beforeDate }">
                                     </div>
	                                 <div class="col-auto">
	                                    <div class="d-flex align-items-center d-flex align-items-baseline">
	                                 <button type="submit" class="btn btn-primary" id="searchBtn">
									    <i class="mdi mdi-magnify search-icon"></i>검색                            			
	                                 </button>
	                                	</div>
	                                 </div>
	                            </form>                             
	                        </div>
	                        
	                        <div class="col-xl-4">
	                            <div class="text-xl-end mt-xl-0 mt-2">
	                            <!-- Modal -->
									<div id="multiple-one" class="modal fade modalArea" tabindex="-1" role="dialog" aria-labelledby="multiple-oneModalLabel" aria-hidden="true">
									    <div class="modal-dialog modal-dialog-centered">
									        <div class="modal-content">
									            <div class="modal-header">
									                <h4 class="modal-title">일자 선택</h4>
									                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									            </div>
									            <div class="modal-body">
													<div class="mb-3 text-start">
                                                        <label for="example-date" class="form-label">날짜 선택</label>
                                                        <input class="form-control" id="selngDate" type="date" name="selngDate">
                                                    </div>
									            </div>
									            <div class="modal-footer">
									                <button type="button" class="btn btn-primary" data-bs-target="#multiple-two" data-bs-toggle="modal" data-bs-dismiss="modal" id="nextBtn">다음</button>
									            </div>
									        </div>
									    </div>
									</div>
									
									<!-- Modal -->
									<div id="multiple-two" class="modal fade modalArea" tabindex="-1" role="dialog" aria-labelledby="multiple-twoModalLabel" aria-hidden="true">
									    <div class="modal-dialog modal-lg modal-dialog-centered">
										        <div class="modal-content">
										        	<div class="modal-header">
									               		<h4 class="modal-title">일일 판매 메뉴 등록</h4>
										               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
											           </div>
											           <div class="modal-body">
											           <div class="mb-3">
											           <div class="input-group">
<!-- 								                            <input type="text" class="form-control modalSearchText" placeholder="메뉴명을 입력해주세요."> -->
<!-- 								                            <button class="btn btn-info modalSearchBtn" type="button">검색</button> -->
														<h5>합계
														<input type="text" class="addSalesTotal" readonly>
														</h5>
								                        </div>
								                        <br>
								                        <div class="card-body py-0" data-simplebar style="max-height: 580px;">
											               <table class="table table-hover">
											                   <thead>
											                       <tr>
												                       <th style="width: 20px;"></th>
											                           <th style="text-align:center; width: 100px;">메뉴 코드</th>
											                           <th style="text-align:center; width: 200px;">메뉴명</th>
											                           <th style="text-align:center; width: 130px;">가격</th>
											                           <th style="text-align:center">판매수량</th>
											                       </tr>
											                   </thead>
											                   <tbody class="modalBody">
											                       <c:forEach items="${frcsMenuList }" var="list">
											                           <tr>
												                           <td class="" style="vertical-align:middle;">
																		       <div class="form-check">
																		            <input type="checkbox" class="form-check-input checkBox">
																		       </div>
																	       </td>
											                               <td class="menuCd" style="text-align:center; vertical-align:middle;">${list.menuCd }</td>
											                               <td class="menuName" style="text-align:center; vertical-align:middle;">${list.menuName }</td>
											                               <td class="menuPrice" style="text-align:center; vertical-align:middle;">${list.menuPrice }</td>
											                               <td class="saleCount" style="text-align:center; width: 180px;" >
												                               <div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
												                               		<span class="input-group-btn input-group-prepend"><button class="btn btn-primary bootstrap-touchspin-down saleCountDown" type="button">-</button></span>
												                                    <input data-toggle="touchspin" type="text" value="0" class="form-control text-end saleCountInput">
												                                    <span class="input-group-btn input-group-append"><button class="btn btn-primary bootstrap-touchspin-up saleCountUp" type="button">+</button></span>
											                                   </div>
										 	                               </td>
											                           </tr>
											                       </c:forEach>
											                    </tbody>
											                </table>
										                </div>
										                <br>
											       		<button type="button" class="btn btn-info" style="float: right;" id="addBtn">등록</button>
										                </div>
										            </div>
										        </div>
										    </div>
										</div>
									    <!-- Multiple modal -->
									    <button type="button" class="btn btn-info mb-2" data-bs-toggle="modal" data-bs-target="#multiple-one"><i class="mdi mdi-cart-plus me-1"></i> 매출 등록</button>
									<!-- 등록 모달창 끝 -->
	                                <button type="button" class="btn btn-success mb-2">엑셀 다운로드</button>
	                            </div>
	                        </div>
	                    </div>
	
					<!-- 전체 리스트 출력 -->
                    <div class="table-responsive">
                       	<table class="table table-centered table-nowrap mb-0 table-hover">
                           <thead class="table-light">
                                <tr>
                                   <th style="width: 20px;">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="customCheck1">
                                            <label class="form-check-label" for="customCheck1">&nbsp;</label>
                                        </div>
                                    </th>
                                    <th style="text-align:center; width:100px;">제목</th>
                                    <th style="text-align:center; width:150px;">총 매출금액</th>
                                    <th style="text-align:center; width:150px;">매출 날짜</th>
		                            <th style="text-align:center; width:150px;"></th>
                                </tr>
                            </thead>
                            <tbody id="tBody">
                            <c:set value="${pagingVO.dataList }" var="salesList" />
                            <c:choose>
                            	<c:when test="${empty salesList }">
                            		<tr>
                            			<td colspan="4" style="text-align:center">
                            				일일 매출 내역이 존재하지 않습니다.
                            			</td>
                            		</tr>
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach items="${salesList }" var="salesList" varStatus="stat">
	                            		<tr>
		                                    <td>
		                                        <div class="form-check">
		                                            <input type="checkbox" class="form-check-input" id="customCheck2">
		                                            <label class="form-check-label" for="customCheck2">&nbsp;</label>
		                                        </div>
		                                    </td>
		                                    <td style="text-align:center" class="selngDate"><fmt:formatDate value="${salesList.selngDate }" pattern="yyyy년 MM월 dd일 매출내역"/></td>
		                                    <td style="text-align:center"><fmt:formatNumber value="${salesList.totalPrice }" type="currency"/></td>
		                                    <td style="text-align:center" class="selngDateOwn"><fmt:formatDate value="${salesList.selngDate }" pattern="yyyy/MM/dd"/></td>
		                                    <td style="text-align:center">
			                                    <button type="button" class="btn btn-primary updateBtn" data-bs-toggle="modal" data-bs-target="#updateModal${stat.index }">수정</button>
				                                    <!-- 수정 모달 -->
				                                    <div id="updateModal${stat.index }" class="modal fade modalArea" tabindex="-1" role="dialog" aria-labelledby="multiple-twoModalLabel" aria-hidden="true" data-bs-show="false">
													    <div class="modal-dialog modal-lg modal-dialog-centered">
														        <div class="modal-content">
														        	<div class="modal-header">
													               		<h4 class="modal-title">일일 판매 메뉴 수정</h4>
														               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
															           </div>
															           <div class="modal-body">
															           <div class="mb-3">
															           <div class="input-group d-flex justify-content-end">
<!-- 												                            <input type="text" class="form-control modalSearchText" placeholder="메뉴명을 입력해주세요."> -->
<!-- 												                            <button class="btn btn-info modalSearchBtn" type="button">검색</button> -->
																		<h5>합계
																		<input type="text" class="salesTotal" readonly>
																		<input type="hidden" value="${salesList.selngDate }" class="selngDateHidden"/>
																		</h5>
												                        </div>
												                        <div class="card-body py-0" data-simplebar style="max-height: 580px;">
															               <table class="table table-hover">
															                   <thead>
															                       <tr>
																                       <th style="width: 20px;"></th>
															                           <th style="text-align:center; width: 100px;">메뉴 코드</th>
															                           <th style="text-align:center; width: 200px;">메뉴명</th>
															                           <th style="text-align:center; width: 130px;">가격</th>
															                           <th style="text-align:center">판매수량</th>
															                       </tr>
															                   </thead>
															                   <tbody class="updateModalBody">
															                       <c:forEach items="${frcsMenuList }" var="list">
															                           <tr>
																                           <td class="" style="vertical-align:middle;">
																						       <div class="form-check">
																						            <input type="checkbox" class="form-check-input checkBox">
																						       </div>
																					       </td>
															                               <td class="menuCd" style="text-align:center; vertical-align:middle;">${list.menuCd }</td>
															                               <td class="menuName" style="text-align:center; vertical-align:middle;">${list.menuName }</td>
															                               <td class="menuPrice" style="text-align:center; vertical-align:middle;">${list.menuPrice }</td>
															                               <td class="saleCount" style="text-align:center; width: 180px;" >
																                               <div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
																                               		<span class="input-group-btn input-group-prepend"><button class="btn btn-primary bootstrap-touchspin-down saleCountDown" type="button">-</button></span>
																                                    <input data-toggle="touchspin" type="text" value="0" class="form-control text-end saleCountInput">
																                                    <span class="input-group-btn input-group-append"><button class="btn btn-primary bootstrap-touchspin-up saleCountUp" type="button">+</button></span>
															                                   </div>
														 	                               </td>
															                           </tr>
															                       </c:forEach>
															                    </tbody>
															                </table>
														                </div>
														                <br>
															       		<button type="button" class="btn btn-info updateConfirmBtn" style="float: right;">수정</button>
														                </div>
														            </div>
														        </div>
														    </div>
														</div>
			                                    <button type="button" class="btn btn-danger delBtn">삭제</button>
			                                </td>
		                                </tr>
                           			</c:forEach>
                            	</c:otherwise>
                            </c:choose>
                            </tbody>
	                        </table>
	                    </div>
	                    <br>
						<nav aria-label="Page navigation example" id="pagingArea">
							${pagingVO.pagingHTML }
						</nav>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var searchForm = $("#searchForm");	// 검색 폼
	var pagingArea = $("#pagingArea");
	var modalBody = $(".modalBody");	// 등록 모달 바디
	var updateModalBody = $(".updateModalBody");	// 수정 모달 바디
	var tBody = $("#tBody");
	var addBtn = $("#addBtn");	// 등록하기 버튼
	var delBtn = $(".delBtn");	// 삭제하기 버튼
	var dailyTBody = $("#dailyTBody");
	var nextBtn = $("#nextBtn");	// 다음 버튼
    var twoModal = $("#multiple-two"); // 두 번째 모달
	var modalSearchBtn = $(".modalSearchBtn");	// 모달 안 검색버튼
	var modalSearchText = $(".modalSearchText");	// 모달 안 검색창
	var updateConfirmBtn = $(".updateConfirmBtn"); // 모달 안 최종 수정버튼
	
	// a 태그를 클릭하면 이벤트 실행 (페이징 처리)
	pagingArea.on("click","a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	// 등록 + 버튼
	modalBody.on("click",".saleCountUp",function(){
		var tr = $(this).parents('tr');
		var input = tr.children('td').find('.saleCountInput');
		var inputVal = parseInt(tr.children('td').find('.saleCountInput').val());
		
		inputVal += 1;
		input.val(inputVal);
	});
	
	// 등록 - 버튼
	modalBody.on("click",".saleCountDown",function(){
		var tr = $(this).parents('tr');
		var input = tr.children('td').find('.saleCountInput');
		console.log(input);
		var inputVal = parseInt(tr.children('td').find('.saleCountInput').val());
		
		if(inputVal > 0){
			inputVal -= 1;
			input.val(inputVal);
		}else{
			input.val(inputVal);
		}
	});
	
	// 수정 + 버튼
	updateModalBody.on("click",".saleCountUp",function(){
		var tr = $(this).closest('tr');
		var input = tr.find('.saleCountInput');
		var inputVal = parseInt(input.val());
		
		inputVal += 1;
		input.val(inputVal);
		
	});
	
	// 수정 - 버튼
	updateModalBody.on("click",".saleCountDown",function(){
		var tr = $(this).closest('tr');
		var input = tr.find('.saleCountInput');
		var inputVal = parseInt(input.val());
		
		if(inputVal > 0){
			inputVal -= 1;
			input.val(inputVal);
		}else{
			input.val(inputVal);
		}
	});
	
		
	// 등록 모달 체크박스 선택 시 합계 자동 추가
	$("#multiple-two").on("change", ".checkBox", function(){
 		var total = 0;
 		
 		$(".checkBox:checked").each(function(){
			var row = $(this).closest('tr');
			var menuPrice = parseInt(row.find(".menuPrice").text());
			var saleCount = parseInt(row.find(".saleCountInput").val());
			
			console.log(menuPrice);
			console.log(saleCount);
			
			total += (menuPrice*saleCount);
 		});	
 		$("#multiple-two").find(".addSalesTotal").val(total);
 	});
	
	
	// 등록 버튼을 누르면
	addBtn.on("click",function(){
	// 일단 체크한 애들 데이터 가져오자...
		var checkedList = [];
		
		// 체크된 박스
		var checkedBoxes = $(".checkBox:checked");
		
		// 체크된 것이 없으면
		if(checkedBoxes.length == 0){
			Swal.fire({
	            title: "체크박스 누락",
	            text: "선택된 메뉴가 없습니다.",
	            confirmButtonText: "확인",
	            icon: "error",
	            preConfirm: function () {
	            }
	        });
		}else{
			var selngDate = $("#selngDate").val();
			console.log(selngDate);
			var total = 0;
			for(var i=0; i<checkedBoxes.length; i++){
				var tr = checkedBoxes.eq(i).parents('tr');
				var menuCd = tr.children('td').eq(1).text();	// 메뉴코드
				var	selngPrice = tr.children('td').eq(3).text();	// 메뉴가격
				var selngQy = tr.children('td').eq(4).find('.saleCountInput').val();	// 개수
				var frcsId = $("#frcsId").val();
				total += (selngPrice*selngQy);
				
				checkedList.push({
					frcsId : frcsId,
					menuCd : menuCd,
					selngPrice : selngPrice,
					selngQy : selngQy,
					selngDate : selngDate
				});
			}
				$(".addSalesTotal").val(total);
				
			$.ajax({
				type : "post",
				url : "/owner/dailySalesInsert.do",
				beforeSend : function(xhr){	// csrf토큰 보내기 위함
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
				},
				data : JSON.stringify(checkedList),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					if(res == "OK"){
						 Swal.fire({
				            title: "등록 완료",
				            text: "정상적으로 등록되었습니다.",
				            confirmButtonText: "확인",
				            icon: "success",
				            preConfirm: function () {
				                location.href = "/owner/dailySales.do";
				            }
				        });
					}
				}
			});
		}
	});
	
	// 일일 매출 등록 중복 체크
	nextBtn.on("click",function(){
		var selngDate = $("#selngDate").val();
		var frcsId = $("#frcsId").val();

		var data = {
			frcsId : frcsId,
			selngDate : selngDate
		}
		
		$.ajax({
			type : "post",
			url : "/owner/dailyInsertCheck.do",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				if(res == "EXIST"){
					 Swal.fire({
			            title: "중복",
			            text: "이미 등록된 납부일자입니다.",
			            confirmButtonText: "확인",
			            icon: "error",
			            preConfirm: function () {
						twoModal.modal("hide");
			            }
			        });
				}else{
					twoModal.modal("show");
				}
			}
		});
	});
	
	// 수정 모달창버튼을 누르면 
	tBody.on("click",".updateBtn",function(){
     	var modalId = $(this).data('bs-target'); // 해당 버튼과 연결된 모달의 ID를 가져옴
     	$(modalId).modal('show'); // 모달을 표시

     	// 체크박스 선택 시 총합계 변화
     	$(modalId).on("change", ".checkBox", function(){
     		var total = 0;
     		
     		$(modalId).find(".checkBox:checked").each(function(){
				var row = $(this).closest('tr');
				var menuPrice = parseInt(row.find(".menuPrice").text());
				var saleCount = parseInt(row.find(".saleCountInput").val());
				
				console.log(menuPrice);
				console.log(saleCount);
				
				total += (menuPrice*saleCount);
     		});	
     		
     		$(modalId).find(".salesTotal").val(total);
     	});
     	
		// 누른버튼의 날짜 정보 가져오기
		var selngDate = $(this).parents('tr').find('.selngDateOwn').text();
		console.log(selngDate);
		
		var frcsId = $("#frcsId").val();
			
		var data = {
			frcsId : frcsId,
			selngDate : selngDate
		}
	 		console.log(data);
			
		// 이미 들어가 있는 데이터 조회
		$.ajax({
			type : "post",
			url : "/owner/dailyGetUpdateForm.do",	
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
 				console.log(res);
 				var totalPrice = 0;
 				
				for(var i=0; i<res.length; i++){
					var selngQy = res[i].selngQy;
					var menuCd = res[i].menuCd;
				
					console.log(selngQy);
					console.log(menuCd);
					
					// 메뉴코드로 일치하는 행 찾기
			        var row = $('.updateModalBody tr').find('.menuCd:contains(' + menuCd + ')').parent('tr');
					// modalBody안 모든 tr요소를 찾은 후 
					// 클래스명이 menuCd이면서 ajax로 받아온 menuCd와 일치하는 요소를 찾고
					// 그 요소 중 가장 가까운 부모요소 tr을 찾는다.
					console.log(row);
					
			        // 해당 행 판매수량 업데이트
			        row.find('.saleCountInput').val(selngQy);
			        // 해당 행 체크박스 checked
			        row.find('.checkBox').prop("checked", true);
			       
			        var menuPrice = row.children('.menuPrice').eq(0).text();	// 메뉴가격
			        totalPrice += (menuPrice*selngQy);
			        
				}
			        $(".salesTotal").val(totalPrice);
			}
		});
	});
	
	
	// 최종 수정버튼을 누르면
	updateConfirmBtn.on("click",function(){
		// 일단 체크한 애들 데이터 가져오자...
		var checkedList = [];
		
		// 체크된 박스
		var checkedBoxes = $(".checkBox:checked");
		
		// 체크된 것이 없으면
		if(checkedBoxes.length == 0){
			Swal.fire({
	            title: "체크박스 누락",
	            text: "선택된 메뉴가 없습니다.",
	            confirmButtonText: "확인",
	            icon: "error",
	            preConfirm: function () {
	            }
	        });
		}else{
			var selngDate = $(this).parents('tr').find('.selngDateOwn').text();			
			console.log(selngDate);
			
			for(var i=0; i<checkedBoxes.length; i++){
				var tr = checkedBoxes.eq(i).parents('tr');
				var menuCd = tr.children('td').eq(1).text();	// 메뉴코드
				var	selngPrice = tr.children('td').eq(3).text();	// 메뉴가격
				var selngQy = tr.children('td').eq(4).find('.saleCountInput').val();	// 개수
				var frcsId = $("#frcsId").val();
				
				checkedList.push({
					frcsId : frcsId,
					menuCd : menuCd,
					selngPrice : selngPrice,
					selngQy : selngQy,
					selngDate : selngDate
				});
				
				console.log(checkedList);
			}
			$.ajax({
				type : "post",
				url : "/owner/dailyUpdate.do",
				beforeSend : function(xhr){	// csrf토큰 보내기 위함
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
				},
				data : JSON.stringify(checkedList),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					if(res == "OK"){
						 Swal.fire({
				            title: "등록 완료",
				            text: "정상적으로 등록되었습니다.",
				            confirmButtonText: "확인",
				            icon: "success",
				            preConfirm: function () {
				                location.href = "/owner/dailySales.do";
				            }
				        });
					}
				}
			});
		}
			
	});
	
// 	// 모달창 안 검색기능
// 	modalSearchBtn.on("click",function(){
// 		var inputText = $(this).prev('input').val();
// 		var frcsId = $("#frcsId").val();
		
// 		var data = {
// 			frcsId : frcsId,
// 			inputText : inputText
// 		}
		
// 		$.ajax({
// 			type : "post",
// 			url : "/owner/menuSearch.do",
// 			data : JSON.stringify(data),
// 			contentType : "application/json; charset=utf-8",
// 			beforeSend : function(xhr){	// csrf토큰 보내기 위함
// 				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
// 			},
// 			success : function(res){
// 				console.log(res);
// 				var str;
				
// 				for(var i=0; i<res.length; i++){
// 					console.log(res[i]);		
// 					modalBody.empty();
// 					str += "<tr><td class='' style='vertical-align:middle;'>";
// 					str += "<div class='form-check'><input type='checkbox' class='form-check-input checkBox'></div></td>";
// 					str += "<td class='menuCd' style='text-align:center; vertical-align:middle;'>"+res[i].menuCd+"</td>";	
// 					str += "<td class='menuName' style='text-align:center; vertical-align:middle;'>"+res[i].menuName+"</td>";	
// 					str += "<td class='menuPrice' style='text-align:center; vertical-align:middle;'>"+res[i].menuPrice+"</td>";	
// 					str += "<td class='saleCount' style='text-align:center; width: 180px;'>";
// 					str += "<div class='input-group bootstrap-touchspin bootstrap-touchspin-injected'>";
// 					str += "<span class='input-group-btn input-group-prepend'><button class='btn btn-primary bootstrap-touchspin-down saleCountDown' type='button'>-</button></span>";
// 					str += "<input data-toggle='touchspin' type='text' value='0' class='form-control text-end saleCountInput'>";
// 					str += "<span class='input-group-btn input-group-prepend'><button class='btn btn-primary bootstrap-touchspin-down saleCountUp' type='button'>+</button></span></div></td></tr>";
// 				}
// 				modalBody.html(str)
// 			}
// 		});
// 	});
	
	
// 	// 월세 차트
// 	var frcsId = $("#frcsId").val();
// 	var duesMthtChart = [];	// 월세내역 
// 	var duesPayTotal = [];	// 공과금내역
	
// 	// 월세/공과금 배열 크기 12로 지정
// 	for(var i=0; i<12; i++){
// 		duesMthtChart.push(0);	// 기본값 0으로 지정
// 		duesPayTotal.push(0);
// 	}
	
// 	$.ajax({
// 		type : "post",
// 		url : "/owner/dues/chart.do",
// 		beforeSend : function(xhr){	// csrf토큰 보내기 위함
// 			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
// 		},
// 		data : {frcsId : frcsId},
// 		success : function(res){
			
// 			for(var i=0; i<res.length; i++){
// 				console.log(res[i].duesPayde);
// 				var month = (res[i].duesPayde).substr(5);	// 월만 추출
// 				var index; 
				
// 				// 0으로 시작하는 달은 0 자르기
// 				if(month.startsWith(0)){
// 					index = parseInt((res[i].duesPayde).substr(6))-1; 	
// 				}else{
// 					index = parseInt(month)-1;
// 				}
// 				console.log(index);
				
// 				duesMthtChart[index] = res[i].duesMtht;
// 				duesPayTotal[index] =  res[i].duesElcty+res[i].duesWater+res[i].duesGas;
// 			}
// 			console.log(duesMthtChart);
// 			console.log(duesPayTotal);
			
// 			// 월별
// 		    var months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
		    
// 		    // 캔버스 엘리먼트 설정
// 			var ctx = document.getElementById('monthChart').getContext('2d');

// 		    // Chart 객체 생성
// 			var chart = new Chart(ctx, {
// 			    type: 'bar', // 막대그래프
// 			    data: {
// 			        labels: months,
// 			        datasets: [
// 			            {
// 			                label: '공과금',
// 			                data: duesPayTotal,
// 			                backgroundColor: 'rgba(255, 99, 132, 0.2)',
// 			                borderColor: 'rgba(255, 99, 132, 1)',
// 			                borderWidth: 1
// 			            },
// 			            {
// 			                label: '월세',
// 			                data: duesMthtChart,
// 			                type: 'line', // 꺾은선 그래프
// 			                fill: false,
// 			                borderColor: 'rgba(54, 162, 235, 1)',
// 			                borderWidth: 2
// 			            }
// 			        ]
// 			    },
// 			    options: {
// 			        responsive: true,
// 			        scales: {
// 			            x: {
// 			                title: {
// 			                    display: true,
// 			                    text: '월'
// 			                }
// 			            },
// 			            y: {
// 			                beginAtZero: true,
// 			                title: {
// 			                    display: true,
// 			                    text: '금액'
// 			                },
// 			                grid: {
// 			                    display: false
// 			                }
// 			            }
// 			        }
// 			    }
// 			});
			
// 		}
// 	});
	
		
// 	// 상세 내역 열고 닫기
// 	var rows = $(".view");

// 	rows.on("click", function () {
//        var content = $(this).next();
//        if (content.is(":visible")) {
//            content.hide();
//        } else {
//            content.show(); 
//        }
// 	});
	
	// 모달이 숨겨질 때 이벤트 처리
	$('.modalArea').on('hidden.bs.modal', function(e) {
	    $(this).find('.saleCountInput').val(0); // 입력값 초기화
	    $(this).find('#selngDate').val(); // 입력값 초기화
	    $(this).find('.checkBox').prop("checked", false); // 체크박스 초기화
	});
});

</script>