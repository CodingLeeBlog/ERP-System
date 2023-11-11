<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

		
			<div class="col-md-10 pt-5 pb-5 pe-5 bg-white">
			
			<!-- 커뮤니티 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;">
					<h2 class="mb-5">게시글</h2> 
							
					<div class="row d-flex justify-content-center align-items-center mb-3">
					
					<!-- 구분 -->
						<div class="col-9">
							<form id="searchForm" method="post">
		                            <input type="hidden" name="page" id="page"/>
									<div class="input-group">
									<div class="col-md-1 me-3">
										<select class="form-select" id="example-select" name="searchStatus">
											<option value="">전체</option>
											<option value="칭찬" <c:if test="${searchStatus eq '칭찬' }">selected</c:if>>칭찬</option>
											<option value="건의" <c:if test="${searchStatus eq '건의' }">selected</c:if>>건의</option>
										</select>
									</div>
									<div class="col-md-3">
										<div class="input-group" >
											<input type="search" class="form-control" placeholder="검색할 제목을 입력하세요" id="boardlistSearch" name="searchWord">
											<button class="btn btn-secondary" type="submit" >검색</button>
										</div>
									</div>
									</div>
								<sec:csrfInput/>
							</form>
						</div>
						<!-- 구분 끝-->
						<div class="col-3 text-end">
							<a href="/elly/list.do">
								<span>전체</span>
							</a>
						</div>
					</div>
				</div>
				<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
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
							<c:when test="${empty boardList}">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">작성하신 게시글이 없습니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="page" id="page"/>
								<c:forEach items="${boardList }" var="board">
									<div class="row text-center">
										<div class="col-1">
											${board.rnum2 }
										</div>
										<div class="col">
										  <a class="board-link" data-table-no="${board.tableNo}" data-type="${board.field}" href="#">${board.boardTitle}</a>
										</div>
										<div class="col-1">
											${board.memId }
										</div>
										<div class="col-2">
											<fmt:formatDate value="${board.boardRegdate }" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col-1">
											${board.boardCount }
										</div>
										<div class="col-1">
										  <a class="board-link action-icon" data-table-no="${board.tableNo}" data-type="${board.field}" href="#"><i class="mdi mdi-pencil"></i></a>
										</div>
										<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
									</div>
								</c:forEach>
								<div class="mt-4 mb-4 pagination justify-content-center text-dark" id="mypagingArea">${pagingVO.pagingHTML }</div>
							</c:otherwise>
						</c:choose>							
					</div>
				</div>
			</div>
				
			
<script type="text/javascript">
$(function(){
	var searchForm = $("#searchForm");
	var mypagingArea = $("#mypagingArea");
	 
	mypagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
});
document.addEventListener("DOMContentLoaded", function () {
	  const boardLinks = document.querySelectorAll(".board-link");

	  boardLinks.forEach((link) => {
	    const tableNo = link.getAttribute("data-table-no");
	    const type = link.getAttribute("data-type");
	    let href = "";

	    if (type === "칭찬") {
	      href = `/elly/detail.do?tableNo=` + tableNo;
	    } else if (type === "건의") {
	      href = `/elly/tendidetail.do?tableNo=` + tableNo;
	    }

	    link.setAttribute("href", href);
	  });
});

</script>