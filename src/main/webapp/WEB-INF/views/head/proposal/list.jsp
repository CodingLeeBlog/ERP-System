<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height: 100px;">
				<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">건의합니다</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">고객이 올린 건의를 조회할 수 있습니다.</div>
					</div>
					<div
						class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
						게시판 > &nbsp;<span class="text-decoration-underline">건의합니다</span>
					</div>
				</div>
			</div>
	        <!-- end page title -->
	
	        <div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-sm-5">
									<form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between" id="searchForm">
										<input type="hidden" id="page" name="page">
										<div class="col-auto">
											<div class="d-flex align-items-center">
												<select class="form-select" name="searchType" id="searchType">
													<option selected>선택</option>
													<option value="title"<c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<label for="inputPassword2" class="visually-hidden">검색</label>
											<input type="text" class="form-control" id="searchWord" name="searchWord"
												placeholder="Search..." value="${searchWord }">
										</div>
									</form>               
	                            </div>
	                        </div>
	
	                        <div class="table-responsive">
	                            <table class="table table-centered w-100 " id="">
	                                <thead class="table-light">
	                                    <tr>
<!-- 	                                        <th class="all">No.</th> -->
	                                        <th>제목</th>
	                                        <th>작성자</th>
	                                        <th>작성일</th>
	                                        <th>답변여부</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:set value="${pagingVO.dataList }" var="proposalList" />
	                                	<c:choose>
	                                		<c:when test="${empty proposalList }">
	                                			<tr class="text-center">
													<td colspan="7" class="text-dark font-weight-bolder">게시글이 존재하지 않습니다.</td>
												</tr>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<c:forEach items="${proposalList }" var="proposal">
				                                    <tr>
				                                        <td>
				                                            <a href="/head/proposalDetail.do?tableNo=${proposal.tableNo }" class="text-body" data-bs-toggle="modal" data-bs-target="${proposal.tableNo }">${proposal.boardTitle }</a>
				                                        </td>
				                                        <td>${proposal.memId }</td>
				                                        <td><fmt:formatDate value="${proposal.boardRegdate }" pattern="yyyy-MM-dd"/></td>
				                                        <td>
				                                            <span class="badge bg-success">${proposal.ansState }</span>
				                                        </td>
				                                    </tr>
	                                			</c:forEach>
	                                		</c:otherwise>
	                                	</c:choose>
	                                </tbody>
	                            </table>
	                        </div>
	                        
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
	var ansForm = $("#ansForm");
	var ansUdtForm = $("#ansUdtForm");
	var pagingArea = $("#pagingArea");
	
	// 페이징
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
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

</script>