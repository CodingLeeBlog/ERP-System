<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
 
 

 
 <!-- ======= menubar Section ======= -->
<div id="menubar" class="d-flex align-items-center h-75 d-inline-block align-middle">
	<div class="container position-relative text-center text-lg-center"
		data-aos="zoom-in" data-aos-delay="100">
		<div class="row" style="height: 400px">
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/list.do">
					<img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주">
				</a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/noticelist.do"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
			</div>
		</div>
	</div>
</div>
<!-- menubar Hero -->
 
 
<!-- 메뉴 mini bar -->
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
								<a class="nav-link scrollto active" style="color: black; font-size: 1rem;" href="#home" id="home">Home</a>
							</li>
							<li class="dropdown me-5">
								<a href="/elly/tendilist.do">
									<span style="color: black; font-size: 1rem;">건의합니다</span>
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
<!-- 메뉴 mini bar 끝-->				
				
<!-- 제목 시작 -->
				<div class="mb-5">
					<p class="d-flex justify-content-center" style="color: black; font-size: 2.5rem;">건의게시판</p>
				</div>
<!-- 제목 끝 -->
				
<!-- 게시판 영역 시작 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;"></div>
					<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
						<div class="row text-center">
								<input type="hidden" name="tableNo" id="tableNo" value="${board.tableNo }"/>
							<table style="height: 20px;">
							  <tbody>
								   <tr>
								     <td class="align-baseline text-center mx-auto fs-5 text " style="width: 1200px;" id="boardTitle">${board.boardTitle }</td>
								     <td class="align-text-top text-end pe-5 fs-5 text"><fmt:formatDate value="${board.boardRegdate }" pattern="yyyy. MM. dd"/></td>
								   </tr>
								 </tbody>
							</table>
						</div>
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
                 		 <div class="text-center" id="boardContent">${board.boardContent }</div>
                 		 <br>
							<div class="alert alert-light bg-transparent text-dark" role="alert">
							<div>
								관리자 답변 : <br>
								<br><a class="form-control"> ${hdBoardAnswer.ansContent } <br></a>
							</div>
							</div>
                 	<sec:csrfInput/>
                 		 <div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;"></div>
                 	 <div class="d-flex justify-content-end">
	                     <button type="button" id="btnList" class="btn btn-dark btn float-right btn-lg me-1">목록</button>
	                    		<sec:authorize access="isAuthenticated()">
	         	   <sec:authentication property="principal.member" var="member"/>
					</sec:authorize>
					<c:choose>
					    <c:when test="${member.memId eq board.memId}">
					        <button type="button" id="btnModify" class="btn btn-dark btn float-right btn-lg me-1">수정</button>
	                    	 <button type="button" id="btnDelete" class="btn btn-dark btn float-right btn-lg">삭제</button>
					    </c:when>
					    <c:otherwise>
					    </c:otherwise>
					</c:choose>
                 	 </div>
                  <br><br><br>
				</div>
          		 </div>
				<div class="col-1 bg-white"></div>
             </div>
          </div>
	<sec:csrfInput/>
</div>
<!-- 게시판 영역 끝 -->
 
<section class="content">
         <form action="/elly/tendidelete.do" method="post" id="boardForm">
            <input type="hidden" name="tableNo" value="${board.tableNo }"/>
            <sec:csrfInput/>
         </form>
         <div class="col-md-6"></div>
</section>
<script type="text/javascript">
$(function(){
   var btnList = $("#btnList");
   var btnModify = $("#btnModify");
   var btnDelete = $("#btnDelete");
   var boardForm = $("#boardForm");
   
   btnList.on("click", function(){
      location.href = "/elly/tendilist.do";
   });
   
   btnModify.on("click", function(){
	   boardForm.attr("method", "get");
      boardForm.attr("action", "/elly/tendiupdate.do");
      boardForm.submit();
   });
   
   btnDelete.on("click", function(){
      if(confirm("정말 삭제하시겠습니까?")){
    	  boardForm.submit();
      }
   });
});
</script>