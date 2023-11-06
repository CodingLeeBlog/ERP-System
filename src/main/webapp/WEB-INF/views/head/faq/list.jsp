<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
                                            <li class="breadcrumb-item active">FAQ</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">FAQ</h4>
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
                                                <form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
                                                    <div class="col-auto">
                                                        <div class="d-flex align-items-center">
                                                            <select class="form-select" id="status-select">
                                                                <option selected>선택</option>
                                                                <option value="1">제목</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <label for="inputPassword2" class="visually-hidden">검색</label>
                                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search...">
                                                    </div>
                                                </form> 
                                                <br/>
                                            </div>
                               		 	</div>
                           		   </div>
                       		 </div>
                       		<div class="modal-footer">
							    <div class="col-md-0 text-right"> <!-- 오른쪽으로 버튼을 위치시키는 부분 -->
							        <button type="button" class="btn btn-info">등록</button>
							    </div>
							</div>
						<br/>
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                        </div>
				<!-- 게시판 영역 시작 -->
				<div class="container-fluid" style="color: rgb(0, 0, 0);">
					<div class="row text-center">
							<div class="col-1">순번</div>
							<div class="col">제목</div>
							<div class="col-1">작성자</div>
							<div class="col-2">등록일시</div>
							<div class="col-1">조회수</div>
							<div class="col-1">수정</div>
					</div>
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
					<div>
						<c:set value="${pagingVO.dataList }" var="boardList"/>
						<c:choose>
							<c:when test="${empty boardList }">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">작성하신 게시글이 없습니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
							<c:forEach items="${boardList }" var="headBoardVO">
								<div class="row text-center">
									<div class="col-1">
										${headBoardVO.rnum2 }
									</div>
									<div class="col">
										<a href="/head/faqdetail.do?boardNo=${headBoardVO.boardNo }">${headBoardVO.boardTitle }</a>
									</div>
									<div class="col-1"> 관리자
									</div>
									<div class="col-2">
										<fmt:formatDate value="${headBoardVO.boardRegdate }" pattern="yyyy. MM. dd"/>
									</div>
									<div class="col-1">
										${headBoardVO.boardHit }
									</div>
									<div class="col-1">
										<a href="/head/faqdetail.do?boardNo=${headBoardVO.boardNo }" class="action-icon"> <i class="mdi mdi-pencil"></i></a>
									</div>
									<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
				</div>				
				<!-- 게시판 영역 끝 -->

				<!-- 페이징 버튼 시작 -->
				<div class="pagination justify-content-center text-dark" id="pagingArea"> ${pagingVO.pagingHTML }</div>
				<!-- 페이징 버튼 끝 -->
				
			</div>
			<div class="col-1 bg-white">
			</div>
		</div>
	</div>
</div>
</div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->        
                        
    
  
<script type="text/javascript">
$(function(){
	 var searchForm = $("#searchForm");
	 var pagingArea = $("#pagingArea");
	 var btnForm = $("#btnForm");
	 
	 pagingArea.on("click", "a", function(event){
		 event.preventDefault();
		 var pageNo = $(this).data("page");
		 searchForm.find("#page").val(pageNo);
		 searchForm.submit();
	 });
	 
	 btnForm.on("click", function(){
		 location.href = "/head/faqform.do";
	 });
});
</script>
