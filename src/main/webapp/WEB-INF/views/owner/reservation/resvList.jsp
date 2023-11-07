<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">예약관리</a></li>
	                            <li class="breadcrumb-item active">매장 예약 관리</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">매장 예약 관리</h4>
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
	                                <form class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between">
	                                    <div class="col-auto">
	                                        <label for="inputPassword2" class="visually-hidden">Search</label>
	                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search...">
	                                        <!-- 버튼추가하기 -->
	                                    </div>
	                                </form>                            
	                            </div>
	                        </div>
	
	                        <div class="table-responsive">
	                            <table class="table table-centered table-nowrap mb-0">
	                                <thead class="table-light">
	                                    <tr>
	                                        <th style="width: 20px;">
	                                            <div class="form-check">
	                                                <input type="checkbox" class="form-check-input" id="checkAll" name="checkbox">
	                                                <label class="form-check-label" for="checkAll">&nbsp;</label>
	                                            </div>
	                                        </th>
	                                        <th>예약일자</th>
	                                        <th>예약시간</th>
	                                        <th>회원ID</th>
	                                        <th>예약인원</th>
	                                        <th>좌석</th>
	                                        <th>예약상태</th>
	                                        <th>비고</th>
	                                        <th>상세보기/수정</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:set value="${resvList }" var="resvList" />
	                                	<c:choose>
	                                		<c:when test="${empty resvList }">
	                                			<tr class="text-center">
													<td colspan="9" class="text-dark font-weight-bolder">예약이 존재하지 않습니다.</td>
												</tr>
	                                		</c:when>
	                                		<c:otherwise>
		                                		<c:forEach items="${resvList }" var="resv">
				                                    <tr>
				                                        <td>
				                                            <div class="form-check">
				                                                <input type="checkbox" class="form-check-input" id="check${resv.resvNo }" name="checkbox" value="${resv.resvNo }">
				                                                <label class="form-check-label" for="check${resv.resvNo }">&nbsp;</label>
				                                            </div>
				                                        </td>
				                                        <td>
<%-- 				                                            <a href="/" class="text-body fw-bold">${resv.resv }</a> --%>
																<fmt:formatDate value="${resv.resvDate }" pattern="yyyy-MM-dd"/>
				                                        </td>
				                                        <td>${resv.resvTime }</td>
				                                        <td>${resv.memId }</td>
				                                        <td>${resv.resvMcnt }</td>
				                                        <td>${resv.seatCd }</td>
				                                        <td>
				                                            <h5><span class="badge badge-info-lighten">
				                                            	${resv.resvState }
				                                            </span></h5>
				                                        </td>
				                                        <td>${resv.resvNote }</td>
				                                        <td><h5><a href="/" class="text-body" data-bs-toggle="modal" data-bs-target="#${resv.resvNo }"><span class="badge badge-primary-lighten">예약상세/수정</span></a></h5></td>
				                                    </tr>
		                                		</c:forEach>
	                                		</c:otherwise>
	                                	</c:choose>
	                                    
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <c:set var="member" value="${member}" />
	                        <c:forEach items="${resvList }" var="resv">
		                        <div class="modal fade" id="${resv.resvNo }" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											
											<div class="modal-header">
												<h4 class="modal-title" id="myCenterModalLabel">예약 상세보기</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
											</div>
<!-- 											예약내역 외에 회원정보보기는 따로 쿼리만들어야할듯...ㅠㅠ -->
											<div class="modal-body" id="modal">
												<div class="m-3">
													<p>예약상태 : ${resv.resvState }</p>
													<p>예약코드 : ${resv.resvNo }</p>
													<p>예약일자 : <fmt:formatDate value="${resv.resvDate }" pattern="yyyy-MM-dd"/></p>
													<p>예약시간 : ${resv.resvTime }</p>
													<p>좌석번호 : ${resv.seatCd }</p>
													<p>메뉴 : </p>
													<p>결제금액 : ${resv.resvPrice }</p>
													<p>예약접수일자 : <fmt:formatDate value="${resv.resvAccDate }" pattern="yyyy-MM-dd"/></p>
													<p>회원ID : ${resv.memId }</p>
													<p>연락처 : ${member.memTel }</p>
													<p>비고 : ${resv.resvNote }</p>
												</div>
											</div>
											
											<div class="modal-footer">
												<button type="button" class="btn btn-light"	data-bs-dismiss="modal">닫기</button>
<%-- 												<c:if test="${review.reviewYn eq 'N' }"> --%>
<!-- 													<button type="button" class="btn btn-primary" id="subBtn">등록</button> -->
<%-- 												</c:if> --%>
<%-- 												<c:if test="${review.reviewYn eq 'Y' }"> --%>
													<button type="button" class="btn btn-light"	id="udtBtn">수정</button>
<%-- 												</c:if> --%>
											</div>
													
										</div>
									</div>
								</div>
							</c:forEach>
							
	                        <!-- 페이징추가하기 -->
	
	                        <div class="col-xl-12 mt-2">
	                            <div class="text-xl-end mt-xl-0 mt-2">
<!-- 	                                <button type="button" class="btn btn-danger mb-2 me-2" id="subBtn">문의하기</button> -->
	                                <button type="button" class="btn btn-light mb-2" id="canBtn">예약취소</button>
	                            </div>
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
	$(function(){
		// 전체 선택 체크박스
		var checkAll = document.getElementById('checkAll');
		
		// 다른 모든 체크박스들
		var checkboxes = document.getElementsByName('checkbox');
		
		// 전체 선택 체크박스의 클릭 이벤트 처리
		checkAll.addEventListener('click', function() {
		    for (var i = 0; i < checkboxes.length; i++) {
		        checkboxes[i].checked = checkAll.checked;
		    }
		});
		
		// 다른 체크박스 중 하나라도 선택이 해제되면 전체 선택 체크박스도 해제
		for (var i = 0; i < checkboxes.length; i++) {
		    checkboxes[i].addEventListener('click', function() {
		        checkAll.checked = true;
		        for (var j = 0; j < checkboxes.length; j++) {
		            if (!checkboxes[j].checked) {
		                checkAll.checked = false;
		                break;
		            }
		        }
		    });
		}
		
		var canBtn = $("#canBtn");
		
		canBtn.on('click', function(){
			
			var selectedItems = [];
			
			 $("input:checkbox[name='checkbox']:checked").each(function () {
	             selectedItems.push({ 
	            	resvNo: $(this).val()
	             });
	         });
			 
			 if (selectedItems.length > 0) {
	             $.ajax({
	                 type: "POST",
	                 url: "/owner/rsevStateUpdate.do",
	                 beforeSend: function(xhr){
	     				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
	     			 },
	                 data: JSON.stringify(selectedItems),
	                 contentType: "application/json;charset=UTF-8",
	                 success: function (response) {
	                     console.log("예약상태 업데이트 성공:", response);
	                     alert("예약 취소되었습니다!");
	                     location.reload();
	                 },
	                 error: function (error) {
	                     console.error("예약상태 업데이트 실패:", error);
	                     alert("다시 시도해주세요!");
	                     
	                 }
	             });
	         } else {
	             alert("취소할 예약을 선택하세요.");
	         }
			
		});
		
	});
</script>