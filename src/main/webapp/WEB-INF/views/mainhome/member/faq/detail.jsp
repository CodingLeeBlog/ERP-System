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
				<a href="/elly/noticelist.do">
					<img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주">
				</a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/list.do"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
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
								<a href="/elly/noticelist.do">
									<span style="color: black; font-size: 1rem;">FAQ</span>
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
					<p class="d-flex justify-content-center" style="color: black; font-size: 2.5rem;">FAQ</p>
				</div>
<!-- 제목 끝 -->
				
<!-- 게시판 영역 시작 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;"></div>
					<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
						<div class="row text-center">
						<input type="hidden" name="boardNo" id="boardNo" value="${headBoardVO.boardNo }"/>
							<table style="height: 20px;">
							  <tbody>
								   <tr>
								     <td class="align-baseline text-center mx-auto fs-5 text" style="width: 1200px;">${headBoardVO.boardTitle }</td>
								     <td class="align-text-top text-end pe-5 fs-5 text"><fmt:formatDate value="${headBoardVO.boardRegdate }" pattern="yyyy. MM. dd"/></td>
								   </tr>
								 </tbody>
							</table>
						</div>
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
                 		 <div class="text-center">${headBoardVO.boardContent }</div>
                 		 <div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;"></div>
                 	 <div class="d-flex justify-content-center">
                    	 <button type="button" id="btnList" class="btn btn-dark btn-lg">목록</button>
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
 

<script type="text/javascript">
$(function(){
   var btnList = $("#btnList");
   
   btnList.on("click", function(){
      location.href = "/elly/faqlist.do";
   });
   
});
</script>