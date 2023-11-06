<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
  <main id="main">
    <section class="breadcrumbs ">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <ol>
            <li>faq 상세보기</li>
          </ol>
        </div>

      </div>
    </section>
<br><br><br>

	<!-- 게시판 이름 -->
    <section class="inner-page w-75 p-3 mx-auto">
    <p class="d-flex justify-content-center h1 text-white">faq  상세보기</p>
	</section>
	
  <section class="content inner-page w-75 p-3 mx-auto bg-transparent">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-primary bg-transparent">
					<input type="hidden" name="boardNo" id="boardNo" value="${headBoardVO.boardNo }"/>
				<div class="mb-3">
						<label for="simpleinput" class="form-label text-white" >제목 : </label>
						<div>${headBoardVO.boardTitle }</div>
					</div>
					<div class="mb-3">
						<label for="simpleinput" class="form-label text-white">내용 : </label>
						<a id="boardContent" class="form-control">${headBoardVO.boardContent }</a>
				</div>
			<sec:csrfInput/>
				<div class="row">
						<div class="col-12">
                     <button type="button" id="btnList" class="btn btn-light btn float-right">목록</button>
                     <button type="button" id="btnModify" class="btn btn-light btn float-right">수정</button>
                     <button type="button" id="btnDelete" class="btn btn-light btn float-right">삭제</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>
  </main><!-- End #main -->

<section class="content">
         <form action="/head/faqdelete.do" method="post" id="boardForm">
            <input type="hidden" name="boardNo" value="${headBoardVO.boardNo }"/>
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
      location.href = "/head/faqlist.do";
   });
   
   btnModify.on("click", function(){
	  boardForm.attr("method", "get");
      boardForm.attr("action", "/head/faqupdate.do");
      boardForm.submit();
   });
   
   btnDelete.on("click", function(){
      if(confirm("정말 삭제하시겠습니까?")){
    	  boardForm.submit();
      }
   });
});
</script>