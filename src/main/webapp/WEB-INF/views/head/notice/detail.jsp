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
            <li><a href="/elly/main.do">Home</a></li>
            <li>칭찬합니다 상세보기</li>
          </ol>
        </div>

      </div>
    </section>
<br><br><br>

	<!-- 게시판 이름 -->
    <section class="inner-page mx-auto">
    <p class="d-flex justify-content-right h1 text-white">칭찬합니다  상세보기</p>
	</section>
	
  <section class="content inner-page w-75 p-3 float-right mx-auto bg-transparent">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-primary bg-transparent">
					<input type="hidden" name="boardNo" id="boardNo" value="${headBoardVO.boardNo }"/>
					    <input type="hidden" name="attachNo" id="attachNo" value="${attachVO.attachNo }"/>
				<div class="mb-3">
						<label for="simpleinput" class="form-label text-white" >제목 : </label>
						<a class="form-control" type="text" id="boardTitle">${headBoardVO.boardTitle }</a>
					</div>
					<div class="mb-3">
						<label for="simpleinput" class="form-label text-white">내용 : </label>
						<a id="boardContent" class="form-control">${headBoardVO.boardContent }</a>
				 	</div>
				 <form id="quickForm" novalidate="novalidate">
                  <div class="card-footer bg-white">
                     <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
                        <c:if test="${not empty headBoardVO.noticeFileList[0].attachNo}">
                           <c:forEach items="${headBoardVO.noticeFileList }" var="noticeFile" varStatus="vs">
                              <li>
                                 <span class="mailbox-attachment-icon"> 
                                    <i class="far fa-file-pdf"></i>
                                 </span>
                                 <div class="mailbox-attachment-info">
                                    <a href="#" class="mailbox-attachment-name"> 
                                       <i class="fas fa-paperclip"></i> ${noticeFile.attachOrgname }
                                    </a> 
                                       	<div class="card-body text-center bg-white border-radius-lg p-3 pt-0">
											<h6 class="mt-3 mb-1 d-md-block d-none">
												${noticeFile.attachSize }(${noticeFile.attachNo })
											</h6>
											<p class="mb-0 text-xs font-weight-bolder text-info text-uppercase">
												<button type="button" class="btn btn-primary btn-sm fileDownload"
													data-attach-no="${noticeFile.attachNo }">
													download
												</button>
											</p>
										</div>
                                 </div>
                              </li>
                           </c:forEach>
                        </c:if>
                     </ul>
                  </div>
				<div class="row">
						<div class="col-12">
                     <button type="button" id="btnList" class="btn btn-light btn float-right">목록</button>
                     <button type="button" id="btnModify" class="btn btn-light btn float-right">수정</button>
                     <button type="button" id="btnDelete" class="btn btn-light btn float-right">삭제</button>
						</div>
					</div>
                     </form>
                    </div>
                  </div>
               </div>
			<sec:csrfInput/>
</section>
  </main><!-- End #main -->

<section class="content">
         <form action="/head/delete.do" method="post" id="boardForm">
            <input type="hidden" name="boardNo" value="${headBoardVO.boardNo }"/>
            <input type="hidden" name="attachNo" id="attachNo" value="${attachVO.attachNo }"/>
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
      location.href = "/head/list.do";
   });
   
   btnModify.on("click", function(){
	   boardForm.attr("method", "get");
      boardForm.attr("action", "/head/update.do");
      boardForm.submit();
   });
   
   btnDelete.on("click", function(){
      if(confirm("정말 삭제하시겠습니까?")){
    	  boardForm.submit();
      }
  	});
      
      $(".fileDownload").on("click", function(){
  		var attachNo = $(this).data("attach-no");		
  		location.href = "/head/download.do?attachNo=" + attachNo;
  		
  	});
});
</script>