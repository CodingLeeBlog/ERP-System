<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<input type="hidden" value="${frcsId }" id="selfrcsId"/>
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
		    
			<div class="row">
                 <div class="col-lg-7">
                     <div class="card">
                         <div class="card-body">
                             <h5 class="header-title mb-3"></h5>
                             <div class="table-responsive">
	                             <h3 class="my-1" style="text-align:center">
		                    		<c:set value="${dailySaleList }" var="daily"/>
		                    		<c:set var="now" value="<%=new java.util.Date() %>" />
		                    		<fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일"/></h3><br>
                   				 <div class="card-body py-0" data-simplebar style="max-height: 580px;">
                                 <div>
                              		<input type="hidden" value="<fmt:formatDate value="${dailySaleList[0].selngDate }" pattern="yyyy-MM-dd"/>" id="selDate"/>
                               	
                                 </div>
                                 <table class="table table-borderless table-nowrap table-centered mb-0 table-hover">
                                      <thead class="table-light">
                                          <tr>
                                              <th style="text-align:center">메뉴명</th>
                                              <th style="text-align:center">판매수량</th>
                                              <th style="text-align:center">메뉴가격</th>
                                              <th style="text-align:center">총 판매금액</th>
                                              <th style="width: 50px;"></th>
                                          </tr>
                                      </thead>
                                      <tbody id="dailyTBody">
                                      <c:choose>
                                      	<c:when test="${empty dailySaleList }">
                                      		<c:set value="empty" var="status"/>
										<tr>
											<td colspan="4" style="text-align:center">
												등록된 일일 매출 내역이 존재하지 않습니다.
											</td>
										</tr>
                                      	</c:when>
                                      	<c:otherwise>
                                      		<c:forEach items="${dailySaleList }" var="sales">
                                      			<tr>
                                        		<td style="text-align:center">${sales.menuName }</td>
												<td style="text-align:center">${sales.selngQy }</td>
												<td style="text-align:center">${sales.selngPrice }</td>
												<td style="text-align:center">${sales.selngQy*sales.selngPrice }</td>
												<td style="text-align:center"></td>
                                      			</tr>
                                      		</c:forEach>
                                      	</c:otherwise>
                                      </c:choose>
                                  	 </tbody>	
                                  </table>
                                  </div>
                                  <div class="row mt-4 ms-0 me-0">
	                                    <div class="col-sm-6">
<!-- 	                                        <a href="/owner/dailySalesInsert.do" class="btn text-muted d-none d-sm-inline-block btn-link fw-semibold"> -->
<!-- 	                                            <i class="mdi mdi-arrow-left"></i> 전날 일일 매출 내역 </a> -->
	                                    </div>
	                                    <div class="col-sm-6">
	                                        <div class="text-sm-end">
	                                        	<c:if test="${status eq 'empty'}">
	                                            	<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#bs-example-modal-lg"><i class="mdi mdi-cart-plus me-1"></i> 매출 등록</button>
	                                        	</c:if>
	                                        	<c:if test="${status ne 'empty'}">
	                                            	<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#bs-example-modal-lg" id="updateModalBtn"><i class="mdi mdi-cart-plus me-1"></i> 매출 수정</button>
	                                        	</c:if>
												<div class="modal fade modalArea" id="bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
												    <div class="modal-dialog modal-lg">
												        <div class="modal-content">
												        	<div class="modal-header">
												        	   <c:if test="${status eq 'empty'}">
												               		<h4 class="modal-title" id="modalLabel1">일일 판매 메뉴 등록</h4>
												               </c:if>
												               <c:if test="${status ne 'empty'}">
												               		<h4 class="modal-title" id="modalLabel1">일일 판매 메뉴 수정</h4>
												               </c:if>
												               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
													           </div>
													           <div class="modal-body">
													           <div class="mb-3">
													           <div class="input-group">
										                            <input type="text" class="form-control searchText" placeholder="메뉴명을 입력해주세요.">
										                            <button class="btn btn-info searchBtn" type="button">검색</button>
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
													                   <tbody id="modalBody">
													                       <c:forEach items="${frcsMenuList }" var="list">
													                           <tr>
														                           <td class="" style="vertical-align:middle;">
																				       <div class="form-check">
<%-- 																			                <input type="hidden" value="${list.frcsId }" class="frcsId"/>								             --%>
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
												                 <c:if test="${status eq 'empty'}">
														       		<button type="button" class="btn btn-info" style="float: right;" id="addBtn">등록</button>
												                 </c:if>
												                 <c:if test="${status ne 'empty'}">
														       		<button type="button" class="btn btn-info" style="float: right;" id="updateBtn">수정</button>
												                 </c:if>
												                </div>
												            </div>
												        </div>
												    </div>
												</div>
			                                 </div>
			                             </div>			
			                         </div>
			                     </div>
                             </div>
                         </div>
                     </div>

                 <div class="col-lg-5">
                     <div class="card">
                         <div class="card-body">
                             <h4 class="header-title mb-3">주간 매출 차트</h4>
                             <div class="table-responsive">
                             	차트
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             
             <!-- 일일 매출 전체 리스트 -->
             <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
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
							            <button type="button" class="btn btn-danger mb-2">이전 매출 등록</button>
							            <button type="button" class="btn btn-success mb-2">엑셀 다운로드</button>
							        </div>
							    </div>
							</div>
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
<!-- 		                                    <th style="text-align:center; width:150px;"></th> -->
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
				                                    <td style="text-align:center"><fmt:formatDate value="${salesList.selngDate }" pattern="yyyy/MM/dd"/></td>
<!-- 				                                    <td style="text-align:center"> -->
<!-- 					                                    <button type="button" class="btn btn-danger cancelModalBtn">주문 취소</button> -->
<!-- 					                                </td> -->
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
</div>
<script type="text/javascript">
$(function(){
	var modalBody = $("#modalBody");
	var addBtn = $("#addBtn");	// 등록하기 버튼
	var updateBtn = $("#updateBtn");	// 수정하기 버튼
	var pagingArea = $("#pagingArea");
	var dailyTBody = $("#dailyTBody");
	
// 	var dailyTBody = $("#dailyTBody");여기 샾 숨어있어요...지우면 안돼!!#

// 	페이징처리
	pagingArea.on("click","a",function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	
	// + 버튼
	modalBody.on("click",".saleCountUp",function(){
		var tr = $(this).parents('tr');
		var input = tr.children('td').find('.saleCountInput');
		var inputVal = parseInt(tr.children('td').find('.saleCountInput').val());
		
		inputVal += 1;
		input.val(inputVal);
	});
	
	// - 버튼
	modalBody.on("click",".saleCountDown",function(){
		var tr = $(this).parents('tr');
		var input = tr.children('td').find('.saleCountInput');
		var inputVal = parseInt(tr.children('td').find('.saleCountInput').val());
		
		if(inputVal > 0){
			inputVal -= 1;
			input.val(inputVal);
		}else{
			input.val(inputVal);
		}
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
			for(var i=0; i<checkedBoxes.length; i++){
				var tr = checkedBoxes.eq(i).parents('tr');
				var menuCd = tr.children('td').eq(1).text();	// 메뉴코드
				var	selngPrice = tr.children('td').eq(3).text();	// 메뉴가격
				var selngQy = tr.children('td').eq(4).find('.saleCountInput').val();	// 개수
				var frcsId = $("#selfrcsId").val();
				checkedList.push({
					frcsId : frcsId,
					menuCd : menuCd,
					selngPrice : selngPrice,
					selngQy : selngQy
				});
			}
			
// 			console.log(checkedList);
			
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
	
	// 수정 버튼을 클릭했을 때 
	$("#updateModalBtn").on("click",function(){
		// 이미 들어가 있는 데이터는 input에 수량 표기가 되어있고...
		// 이미 들어가 있는 데이터는 줄이거나 추가했을때는 수량이 변경되고...
		  $(".modalArea").modal("hide");
		
		var frcsId = $("#selfrcsId").val();
		var selngDate = $("#selDate").val();
		
		var data = {
			frcsId : frcsId,
			selngDate : selngDate
		}
		
// 		console.log(data);
		
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
// 				console.log(res);
				
				for(var i=0; i<res.length; i++){
					var tr = $("#modalBody").children();	// 모달 안 tr
					
					for(var j=0; j<tr.length; j++){	 // 모달 tr의 개수만큼 for문
						var menuCd = tr.eq(j).children().eq(1).text();	// 메뉴코드
						var inputVal = parseInt(tr.eq(j).children().eq(4).find('.saleCountInput').val());	// input값
						var input = tr.eq(j).children().eq(4).find('.saleCountInput');	// input
						var checkbox = tr.eq(j).children().eq(0).find('.checkBox');	// input
					
						var date = new Date(res[i].selngDate);	// 날짜
						var qy = parseInt(res[i].selngQy);	// 수량
						var menu = res[i].menuCd;	//메뉴
						
						if(menuCd === menu){
							inputVal += qy;
							input.val(inputVal);
							checkbox.attr("checked",true);
						}
					}
				}
// 				console.log($("#modalBody").children());
				// ajax 이후 모달 열기..
	            $(".modalArea").modal("show");
			}
		});
	});
	
	updateBtn.on("click",function(){
		
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
			for(var i=0; i<checkedBoxes.length; i++){
				var tr = checkedBoxes.eq(i).parents('tr');
				var menuCd = tr.children('td').eq(1).text();	// 메뉴코드
				var	selngPrice = tr.children('td').eq(3).text();	// 메뉴가격
				var selngQy = tr.children('td').eq(4).find('.saleCountInput').val();	// 개수
				var frcsId = $("#selfrcsId").val();
				checkedList.push({
					frcsId : frcsId,
					menuCd : menuCd,
					selngPrice : selngPrice,
					selngQy : selngQy
				});
			}
			
			$.ajax({
				type : "post",
				url : "/owner/dailySalesUpdate.do",
				beforeSend : function(xhr){	// csrf토큰 보내기 위함
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
				},
				data : JSON.stringify(checkedList),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					if(res == "OK"){
						 Swal.fire({
				            title: "수정 완료",
				            text: "정상적으로 수정되었습니다.",
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
	
	// 모달이 숨겨질 때 이벤트 처리
	$('.modalArea').on('hidden.bs.modal', function(e) {
	    $(this).find('.saleCountInput').val(0); // 입력값 초기화
	});
	
});
</script>