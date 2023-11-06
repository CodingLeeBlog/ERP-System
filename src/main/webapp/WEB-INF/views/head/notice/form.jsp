<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
  <main id="main">
    <section class="breadcrumbs ">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <ol>
            <li>공지사항</li>
          </ol>
        </div>

      </div>
    </section>
<br><br><br>

	<!-- 게시판 이름 -->
    <section class="inner-page w-75 p-3 mx-auto">
    	<c:set value="등록 " var="name"/>
		<c:if test="${status eq 'u' }">
		<c:set value="수정" var="name"/>	
		</c:if>
    <p class="d-flex justify-content-center h1 text-white">공지사항  ${name }</p>
	</section>
	

    <section class="content inner-page w-75 p-3 mx-auto bg-transparent">
	<div class="row">
		<div class="col-md-12">
			<div class="card card-primary bg-transparent">
				<form action="/head/insert.do" method="post" id="boardForm" enctype="multipart/form-data">
					<c:if test="${status eq 'u' }">
						<input type="hidden" name="boardNo" id="boardNo" value="${headBoardVO.boardNo }"/>
						<input type="hidden" name="tablePk" id="tablePk" value="${attachVO.tablePk }"/>
					</c:if>
					<div class="mb-3">
						<label for="simpleinput" class="form-label text-white" >제목을 입력해주세요</label>
						<input class="form-control" type="text" id="boardTitle" name="boardTitle" value="${headBoardVO.boardTitle }" placeholder="제목을 입력해주세요">
					</div>
					<div class="mb-3">
						<label for="simpleinput" class="form-label  text-white">내용을 입력해주세요</label>
						<textarea name="boardContent" id="boardContent" class="form-control" rows="14" >${headBoardVO.boardContent }</textarea>
						<div class="form-group">
							<div class="custom-file">
								<input type="file" class="custom-file-input" id="boFile" name="boFile" multiple="multiple"> 
								<label class="custom-file-label text-white" for="boFile">파일을 선택해주세요</label>
							</div>
						</div>
					</div>
					<sec:csrfInput/>
				</form>
				<c:if test="${status eq 'u' }">
				<div class="card-footer bg-white">
					<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
						<c:if test="${not empty headBoardVO.noticeFileList[0].attachNo }">
							<c:forEach items="${headBoardVO.noticeFileList }" var="noticeFile" varStatus="vs">							
								<li>
								<span class="mailbox-attachment-icon">
									<i class="far fa-file-pdf"></i>
								</span>
								<div class="mailbox-attachment-info">
									<a href="#" class="mailbox-attachment-name">
										<i class="fas fa-paperclip"></i> ${noticeFile.attachOrgname }</a> 
											<span class="mailbox-attachment-size clearfix mt-1"> 
												<span>${noticeFile.attachSize }</span> 
												<span class="btn btn-default btn-sm float-right attachmentFileDel" id="span_${noticeFile.attachNo }">
													<i class="fas fa-times"></i>
												</span>
											</span>
										</div>
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				</c:if>
				<div class="row">
						<div class="col-12">
						<!-- 
							등록일때는 목록, 등록 버튼이 나타나야하고
							수정일때는 수정, 취소 버튼이 나타나야함
						 -->
							<input type="button" value="${name }" id="insertBtn" class="btn btn-light btn float-right">
							<c:if test="${status eq 'u' }">
								<input type="button" value="취소" id="cancleBtn" class="btn btn-light btn float-right"> 
							</c:if>
							<c:if test="${status ne 'u' }">
							<input type="button" value="목록" id="listBtn" class="btn btn-light btn float-right"> 
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
</section>
  </main><!-- End #main -->
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
		location.href = "/head/list.do";
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
			boardForm.attr("action","/head/update.do");
		}
		
		boardForm.submit();
		
	});
	
	cancleBtn.on("click", function(){
		var boardNo = $("#boardNo").val();
		location.href = "/head/detail.do?boardNo=" + boardNo;
	});
	
	
	$(".attachmentFileDel").on("click", function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");
		var noticeFileNo = id.substring(idx + 1);
		var ptrn = "<input type='text' name='delNoticeNo' value='%V' hidden='hidden'/>";
		$("#boardForm").append(ptrn.replace("%V", noticeFileNo));
		$(this).parents("li:first").hide();	// x를 누른녀석이 사라져야되니까 hide해주자
	});
});
</script>