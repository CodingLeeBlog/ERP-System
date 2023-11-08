<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	                            <li class="breadcrumb-item active">리뷰조회</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">리뷰조회</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	
	        <div class="row">
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	
							<div class="row mb-2">
	                        	<div class="col-xl-8"></div>
	                            <div class="col-xl-4">
	                                <form class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between" id="searchForm">
	                                    <div class="col-auto input-group input-group-outline">
	                                        <select class="form-select" id="searchType" name="searchType" aria-label="Example select with button addon">
												<option value="content" <c:if test="${searchType eq 'content' }">selected</c:if>>내용</option>
												<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
											</select>
		                                    <label for="inputPassword2" class="visually-hidden">Search</label>
		                                    <input type="search" class="form-control" id="searchWord" name="searchWord" value="${searchWord }" placeholder="Search...">
			                                <button type="submit" class="btn btn-outline-secondary">검색</button>
	                                    </div>
	                                <sec:csrfInput/>
	                                </form>                            
	                            </div>
	                        </div>
	
	                        <div class="table-responsive">
	                            <table class="table dt-responsive nowrap table-centered w-100 ">
<!-- 	                            <table id="basic-datatable" class="table dt-responsive nowrap table-centered w-100 "> -->
	                                <thead class="table-light">
	                                    <tr>
	                                        <th class="all" style="width: 20px;">
	                                            <div class="form-check">
	                                                <input type="checkbox" class="form-check-input" id="checkAll" name="checkbox">
	                                                <label class="form-check-label" for="checkAll">&nbsp;</label>
	                                            </div>
	                                        </th>
	                                        <th class="all">No.</th>
	                                        <th>별점</th>
	                                        <th>내용</th>
	                                        <th>작성자</th>
	                                        <th>작성일</th>
	                                        <th>답변여부</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:set value="${pagingVO.dataList}" var="reviewList" />
	                                	<c:choose>
	                                		<c:when test="${empty reviewList }">
	                                			<tr class="text-center">
													<td colspan="7" class="text-dark font-weight-bolder">리뷰가 존재하지 않습니다.</td>
												</tr>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<c:forEach items="${reviewList }" var="review">
				                                    <tr>
				                                        <td>
				                                            <div class="form-check">
				                                                <input type="checkbox" class="form-check-input" id="check${review.reviewNo }" name="checkbox" value="${review.reviewNo }">
				                                                <label class="form-check-label" for="check${review.reviewNo }">&nbsp;</label>
				                                            </div>
				                                        </td>
				                                        <td>${review.reviewNo }</td>
<!-- 				                                        	별점별로 아이콘나타나게! -->
				                                        <td>
				                                            <p class="m-0 d-inline-block align-middle font-16">
				                                                <c:if test="${review.reviewStar eq '5' }">
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
				                                                </c:if>
				                                                <c:if test="${review.reviewStar eq '4' }">
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                </c:if>
				                                                <c:if test="${review.reviewStar eq '3' }">
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                </c:if>
				                                                <c:if test="${review.reviewStar eq '2' }">
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                </c:if>
				                                                <c:if test="${review.reviewStar eq '1' }">
					                                                <span class="text-warning mdi mdi-star"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
					                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                </c:if>
<%-- 				                                                ${review.reviewStar } --%>
				                                            </p>
				                                        </td>
				                                        <td>
				                                            <a href="" class="text-body fw-bold" data-bs-toggle="modal" data-bs-target="#${review.reviewNo }">${review.reviewContent }</a>
				                                        </td>
				                                        <td>${review.memId }</td>
				                                        <td><fmt:formatDate value="${review.reviewRegdate }" pattern="yyyy-MM-dd"/></td>
				                                        <td>
															<c:if test="${review.reviewYn eq 'N'}">
					                                            <h5><span class="badge bg-info">
					                                            	답변대기중
					                                            </span></h5>
				                                            </c:if>
				                                            <c:if test="${review.reviewYn eq 'Y'}">
					                                            <h5><span class="badge bg-success">
					                                            	답변완료
					                                            </span></h5>
				                                            </c:if>
				                                        </td>
				                                    </tr>
	                                			</c:forEach>
	                                		</c:otherwise>
	                                	</c:choose>
	                                </tbody>
	                            </table>
	                        </div>
	                        
					                    
					        <!-- 리뷰 상세보기 모달 -------------------------------------------------------------- -->    
							<c:forEach items="${reviewList }" var="review">
	                       		<div class="modal fade" id="${review.reviewNo }" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" id="myCenterModalLabel">리뷰 상세보기</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
											</div>
											<div class="modal-body" id="modal">
													
													<div class="m-3">
														<p class="m-0">No. ${review.reviewNo }</p>
														<p class="m-0 d-inline-block align-middle font-16">
															<c:if test="${review.reviewStar eq '5' }">
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
			                                                </c:if>
			                                                <c:if test="${review.reviewStar eq '4' }">
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
			                                                </c:if>
			                                                <c:if test="${review.reviewStar eq '3' }">
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
			                                                </c:if>
			                                                <c:if test="${review.reviewStar eq '2' }">
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
			                                                </c:if>
			                                                <c:if test="${review.reviewStar eq '1' }">
				                                                <span class="text-warning mdi mdi-star"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
				                                                <span class="text-warning mdi mdi-star-outline"></span>
			                                                </c:if>
															| <fmt:formatDate value="${review.reviewRegdate }" pattern="yyyy-MM-dd"/> | 
															${review.memId }
			                                            </p>
														<p class="mt-2">${review.reviewContent }</p>
													</div>
													
													<hr class="m-3"/>
													
													<c:if test="${review.reviewYn eq 'N' }">
			                                          	<form class="ps-3 pe-3" action="/owner/reviewAnsInsert.do" method="post" id="reviewAnsForm">
															<div class="mb-3">
																<label class="form-label">리뷰 답변</label>
																<textarea class="form-control" cols="10" rows="3" id="ansCn1" name="ansCn">${review.ansCn }</textarea>
																<input type="hidden" id="reviewNo" name="reviewNo" value="${review.reviewNo }">
																<input type="hidden" id="memId" name="memId" value="${review.memId }">
																<input type="hidden" id="resvNo" name="resvNo" value="${review.resvNo }">
																<input type="hidden" id="ansId" name="ansId" value="${review.frcsId }">
															</div>
				                  							<sec:csrfInput/>
			                                         	</form>
		                                         	</c:if>
		                                         	
		                                         	<c:if test="${review.reviewYn eq 'Y' }">
		                                         		<form class="ps-3 pe-3" action="/owner/reviewAnsUpdate.do" method="post" id="reviewAnsUdtForm">
			                                         		<div class="m-3">
																<label class="form-label">리뷰 답변</label>
																<p>${review.ansCn }</p>
																<hr/>
																<label class="form-label mb-2">리뷰 수정</label>
																<textarea class="form-control" cols="10" rows="3" id="ansCn2" name="ansCn">${review.ansCn }</textarea>
																<input type="hidden" id="ansNo" name="ansNo" value="${review.ansNo }">
															</div>
														<sec:csrfInput/>
														</form>
		                                         	</c:if>
		                                         	
												</div>
												
												<div class="modal-footer">
													<button type="button" class="btn btn-light"	data-bs-dismiss="modal">닫기</button>
													<c:if test="${review.reviewYn eq 'N' }">
														<button type="button" class="btn btn-primary" id="subBtn">등록</button>
													</c:if>
													<c:if test="${review.reviewYn eq 'Y' }">
														<button type="button" class="btn btn-primary" id="udtBtn">수정</button>
													</c:if>
												</div>
												
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
								</c:forEach>
						                        
	                        <!-- 페이징추가하기 -->
	                        <nav aria-label="Page navigation example" id="pagingArea">
								${pagingVO.pagingHTML }
							</nav>
	
	                        <div class="row mt-2">
	                            <div class="col-sm-12">
	                                <div class="text-sm-end">
	                                    <button type="button" class="btn btn-light mb-2" id="delBtn">삭제</button>
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
$(function(){
	var subBtn = $("#subBtn");
	var udtBtn = $("#udtBtn");
	var delBtn = $("#delBtn");
	var reviewAnsForm = $("#reviewAnsForm");
	var reviewAnsUdtForm = $("#reviewAnsUdtForm");
	
	subBtn.on("click", function(){
		console.log("클릭");
		var ansCn1 = $("#ansCn1").val(); 
		
		if(ansCn1 == null || ansCn1 == ""){
			alert("답변을 입력해주세요!");
			return false;
		}
		
		reviewAnsForm.submit();
	});
	
	udtBtn.on("click", function(){
		var ansCn2 = $("#ansCn2").val(); 
		
		if(ansCn2 == null || ansCn2 == ""){
			alert("답변을 입력해주세요!");
			return false;
		}
		
		reviewAnsUdtForm.submit();
		
	});

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
	
	delBtn.on('click', function() {
		var selectedItems = [];
		
		 $("input:checkbox[name='checkbox']:checked").each(function () {
             selectedItems.push({ reviewNo: $(this).val()});
         });
		 
		 if (selectedItems.length > 0) {
             $.ajax({
                 type: "POST",
                 url: "/owner/reviewDelete.do", // 서버의 URL 주소
                 beforeSend: function(xhr){
     				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
     			 },
                 data: JSON.stringify(selectedItems),
                 contentType: "application/json;charset=UTF-8",
                 success: function (response) {
                     console.log("삭제 성공:", response);
                     alert("삭제되었습니다!");
                     location.reload();
                 },
                 error: function (error) {
                     console.error("삭제 실패:", error);
                     alert("다시 시도해주세요!");
                     
                 }
             });
         } else {
             alert("삭제할 리뷰를 선택하세요.");
         }
	});
	
	//검색,페이징
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("page").val(pageNo);
		searchForm.submit();
	});
	
});
</script>