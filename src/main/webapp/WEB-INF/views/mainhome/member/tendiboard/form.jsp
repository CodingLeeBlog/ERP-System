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
  <section class="inner-page w-75 p-3 mx-auto">
    		<c:set value="등록" var="name"/>
			<c:if test="${status eq 'u' }">
			<c:set value="수정" var="name"/>	
			</c:if>
			<div class="mb-5">
				<p class="d-flex justify-content-center" style="color: black; font-size: 2.5rem;">건의게시판  ${name }</p>
			</div>
	</section>
	
<!-- 제목 끝 -->
				

<!-- 게시판 영역 시작 -->
<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;"></div>
    <section class="content inner-page w-75 p-3 mx-auto bg-transparent">
	<div class="row">
		<div class="col-md-12">
			<div class="">
				<form action="/elly/tendiinsert.do" method="post" id="boardForm">
				<c:if test="${status eq 'u' }">
					<input type="hidden" name="tableNo" id="tableNo" value="${board.tableNo }"/>
				</c:if>
				<div class="mb-3">
						<label for="simpleinput" class="form-label text-dark align-baselin" >TITLE</label>
				<div class="mb-3 " style="color: rgb(0, 0, 0); border-bottom: 1px dotted;"></div>
						<input class="form-control" type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle }" placeholder="제목을 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="simpleinput" class="form-label text-dark">CONTENT</label>
				<div class="mb-3"  style="color: rgb(0, 0, 0); border-bottom: 1px dotted;"></div>
						<textarea name="boardContent" id="boardContent" class="form-control" rows="14" >${board.boardContent }</textarea>
				</div>
			<sec:csrfInput/>
				</form>
				<c:if test="${status eq 'u' }">
				</c:if>
				<div class="row">
						<div class="col-12">
						<!-- 
							등록일때는 목록, 등록 버튼이 나타나야하고
							수정일때는 수정, 취소 버튼이 나타나야함
						 -->
							<input type="button" value="${name }" id="insertBtn" class="btn btn-dark btn float-right">
							<c:if test="${status eq 'u' }">
								<input type="button" value="취소" id="cancleBtn" class="btn btn-dark btn float-right"> 
							</c:if>
							<c:if test="${status ne 'u' }">
							<input type="button" value="목록" id="listBtn" class="btn btn-dark btn float-right"> 
							</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
				<br><br>
							<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
			<br><br><br><br>
			</div>
			<div class="col-1 bg-white"></div>
		</div>
	</div>
</div>
<!-- 게시판 영역 끝 -->
 
 
<script type="text/javascript">
$(function(){
	CKEDITOR.replace("boardContent",{
		filebrowserUploadUrl:"/imageUpload.do?${_csrf.parameterName}=${_csrf.token}"
	});
	
	var listBtn = $("#listBtn");
	var insertBtn = $("#insertBtn");
	var cancleBtn = $("#cancleBtn");
	var boardForm = $("#boardForm");
	
	listBtn.on("click", function(){
		location.href = "/elly/tendilist.do";
	});
	
	insertBtn.on("click", function(){
		var title = $("#boardTitle").val();
// 		var content = $("#boContent").val();
		var content = CKEDITOR.instances.boardContent.getData(); 
		
		if(title == null || title == ""){
			alert("제목을 입력해주세요");
			return false;
		}
		if(content == null || content == ""){
			alert("내용을 입력해주세요");
			return false;
		}
		if($(this).val() == "수정"){
			boardForm.attr("action","/elly/tendiupdate.do");
			
		}
		
		boardForm.submit();
		
	});
	
	cancleBtn.on("click", function(){
		var tableNo = $("#tableNo").val();
		location.href = "/elly/tendidetail.do?tableNo=" + tableNo;
	});
	
});
</script>
</html>