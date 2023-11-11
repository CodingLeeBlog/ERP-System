<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!-- ======= menubar Section ======= -->
<div id="menubar" class="d-flex align-items-center h-75 d-inline-block align-middle">
	<div class="container position-relative text-center text-lg-center"
		data-aos="zoom-in" data-aos-delay="100">
		<div class="row" style="height: 400px">
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/faqlist.do">
					<img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주">
				</a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/tendilist.do"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
			</div>
		</div>
	</div>
</div>
<!-- menubar Hero -->
                          
<!-- 메인 상단 띠 시작-->                                                    
<div id="main">
	<div class="container-fluid">
		<div class="row">
			<div class="col-1 bg-white">
			</div>
			<div class="col-10 bg-white">
				<div class="mt-5 mb-5">
					<nav id="navbar" class="navbar order-last order-lg-0">
						<ul>
							<li class="me-5">
								<a class="nav-link scrollto active" style="color: black; font-size: 1rem;" href="" id="home">Home</a>
							</li>
							<li class="dropdown me-5">
								<a href="/elly/list.do">
									<span style="color: black; font-size: 1rem;">칭찬합니다</span>
									<i class="bi bi-chevron-down"></i>
								</a>
								<ul>
									<li><a href="/elly/noticelist.do">공지사항</a></li>
									<li><a href="/elly/faqlist.do">FAQ</a></li>
									<li><a href="/elly/list.do">칭찬합니다</a></li>
									<li><a href="/elly/tendilist.do">건의합니다</a></li>
								</ul>
							</li>
						</ul>
						<i class="bi bi-list mobile-nav-toggle"></i>
					</nav>
				</div>
				<div class="mb-5">
					<p class="d-flex justify-content-center" style="color: black; font-size: 2.5rem;">칭찬합니다</p>
				</div>
				
				<!-- 검색 시작  -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;">
					<form method="post" id="searchForm" class="input-group input-group-sm justfiy-content-end rounded-3" style="width: 250px;">
						<input type="hidden" name="page" id="page"/>
			<!-- 			<select class="form-control rounded-3" name="searchType"> -->
			<%-- 				<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option> --%>
			<%-- 				<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option> --%>
			<%-- 				<option value="both" <c:if test="${searchType eq 'both' }">selected</c:if>>제목+작성자</option> --%>
			<!-- 			</select> &nbsp;&nbsp;<br> -->
						<input type="text" name="searchWord" value="${searchWord }" placeholder="검색할 제목을 입력하세요" class="form-control float-right bg-transparent rounded-3 me-3"  style="width: 100px;">
						<div class="input-group-append">
							<button type="submit" class="btn btn-dark text-light">검색</button>
						</div>
						<sec:csrfInput/>
					</form>
					<div class="d-flex justify-content-end mb-3">
						<a href="/elly/list.do">
							<span>전체</span>
						</a>
					</div>
				</div>
				<!-- 검색 끝  -->
				
				<!-- 게시판 영역 시작 -->
				<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
					<div class="row text-center">
							<div class="col-1">순번</div>
							<div class="col">제목</div>
							<div class="col-1">작성자</div>
							<div class="col-2">등록일시</div>
							<div class="col-1">조회수</div>
<!-- 							<div class="col-1">수정</div> -->
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
							<c:forEach items="${boardList }" var="board">
								<div class="row text-center">
									<div class="col-1">
										${board.rnum2 }
									</div>
									<div class="col">
										<a href="/elly/detail.do?tableNo=${board.tableNo }">${board.boardTitle }</a>
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
<!-- 									<div class="col-1"> -->
<%-- 										<a href="/elly/update.do?tableNo=${board.tableNo }" class="action-icon"> <i class="mdi mdi-pencil"></i></a> --%>
<!-- 									</div> -->
									<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
								</div>
							</c:forEach>
						</c:otherwise>
						</c:choose>
					</div>
				</div>				
				<!-- 게시판 영역 끝 -->

				<!-- 등록하기 버튼 시작 -->				
				<div class="card-body">
					<button type="button" id="btnForm" name="btnForm" class="btn btn-dark text-light d-flex justify-content-end">등록하기</button>
				</div>
				<!-- 등록하기 버튼 끝 -->
				
				<!-- 페이징 버튼 시작 -->
				<div class="mb-5 pagination justify-content-center text-dark" id="complipagingArea"> ${pagingVO.pagingHTML }</div>
				<!-- 페이징 버튼 끝 -->
				
			</div>
			<div class="col-1 bg-white">
			</div>
		</div>
	</div>
</div>

  
<script type="text/javascript">
$(function(){
	 var searchForm = $("#searchForm");
	 var complipagingArea = $("#complipagingArea");
	 var btnForm = $("#btnForm");
	 
	 complipagingArea.on("click", "a", function(event){
		 event.preventDefault();
		 var pageNo = $(this).data("page");
		 searchForm.find("#page").val(pageNo);
		 searchForm.submit();
	 });
	 
	 btnForm.on("click", function(){
		 location.href = "/elly/form.do";
	 });
});
</script>
