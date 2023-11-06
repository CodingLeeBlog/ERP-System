<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
	                            <li class="breadcrumb-item active">1대1문의</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">1대1문의</h4>
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
	                                                <input type="checkbox" class="form-check-input" id="customCheck1">
	                                                <label class="form-check-label" for="customCheck1">&nbsp;</label>
	                                            </div>
	                                        </th>
	                                        <th>No.</th>
	                                        <th>제목</th>
	                                        <th>작성일</th>
	                                        <th>답변여부</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:set value="${inqList }" var="frcsInqList" />
	                                	<c:choose>
	                                		<c:when test="${empty frcsInqList }">
	                                			<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">문의글이 존재하지 않습니다.</td>
												</tr>
	                                		</c:when>
	                                		<c:otherwise>
		                                		<c:forEach items="${frcsInqList }" var="frcsInq">
				                                    <tr>
				                                        <td>
				                                            <div class="form-check">
				                                                <input type="checkbox" class="form-check-input" id="customCheck2">
				                                                <label class="form-check-label" for="customCheck2">&nbsp;</label>
				                                            </div>
				                                        </td>
				                                        <td>${frcsInq.inqryNo }</td>
				                                        <td>
				                                            <a href="/owner/inqDetail.do?inqryNo=${frcsInq.inqryNo }" class="text-body fw-bold">${frcsInq.inqryTtl }</a>
				                                        </td>
				                                        <td>${frcsInq.inqryYmd }</td>
				                                        <td>
				                                            <h5><span class="badge badge-info-lighten">
				                                            	${frcsInq.inqryYn }
				                                            </span></h5>
				                                        </td>
				                                    </tr>
		                                		</c:forEach>
	                                		</c:otherwise>
	                                	</c:choose>
	                                    
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <!-- 페이징추가하기 -->
	
	                        <div class="col-xl-12 mt-2">
	                            <div class="text-xl-end mt-xl-0 mt-2">
	                                <button type="button" class="btn btn-danger mb-2 me-2" id="subBtn">문의하기</button>
	                                <button type="button" class="btn btn-light mb-2">삭제</button>
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
	var subBtn = $("#subBtn");
	
	subBtn.on("click", function(){
		window.location.href="/owner/inqForm.do";
	});
});
</script>