<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<div class="row">

	<!-- Right Sidebar -->
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="page-aside-right">

					<div class="btn-group">
						<button type="button" class="btn btn-secondary">
							<i class="mdi mdi-archive font-16"></i>
						</button>
						<button type="button" class="btn btn-secondary">
							<i class="mdi mdi-alert-octagon font-16"></i>
						</button>
						<button type="button" class="btn btn-secondary">
							<i class="mdi mdi-delete-variant font-16"></i>
						</button>
					</div>
					<div class="btn-group">
						<button type="button"
							class="btn btn-secondary dropdown-toggle arrow-none"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="mdi mdi-folder font-16"></i> <i
								class="mdi mdi-chevron-down"></i>
						</button>
						<div class="dropdown-menu">
							<span class="dropdown-header">Move to:</span> <a
								class="dropdown-item" href="javascript: void(0);">Social</a> <a
								class="dropdown-item" href="javascript: void(0);">Promotions</a>
							<a class="dropdown-item" href="javascript: void(0);">Updates</a>
							<a class="dropdown-item" href="javascript: void(0);">Forums</a>
						</div>
					</div>
					<div class="btn-group">
						<button type="button"
							class="btn btn-secondary dropdown-toggle arrow-none"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="mdi mdi-label font-16"></i> <i
								class="mdi mdi-chevron-down"></i>
						</button>
						<div class="dropdown-menu">
							<span class="dropdown-header">Label as:</span> <a
								class="dropdown-item" href="javascript: void(0);">Updates</a> <a
								class="dropdown-item" href="javascript: void(0);">Social</a> <a
								class="dropdown-item" href="javascript: void(0);">Promotions</a>
							<a class="dropdown-item" href="javascript: void(0);">Forums</a>
						</div>
					</div>

					<div class="btn-group">
						<button type="button"
							class="btn btn-secondary dropdown-toggle arrow-none"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="mdi mdi-dots-horizontal font-16"></i> More <i
								class="mdi mdi-chevron-down"></i>
						</button>
						<div class="dropdown-menu">
							<span class="dropdown-header">More Options :</span> <a
								class="dropdown-item" href="javascript: void(0);">Mark as
								Unread</a> <a class="dropdown-item" href="javascript: void(0);">Add
								to Tasks</a> <a class="dropdown-item" href="javascript: void(0);">Add
								Star</a> <a class="dropdown-item" href="javascript: void(0);">Mute</a>
						</div>
					</div>

	
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
		</div>
					</div>
				</div>
			</div>
		</div>
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