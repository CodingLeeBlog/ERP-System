<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set value="등록" var="name"/>
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="name"/>
</c:if>
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
	                    
	                    	<form id="boardForm" action="/head/insert.do" method="post" enctype="multipart/form-data">
		                    	<c:if test="${status eq 'u' }">
									<input type="hidden" name="boardNo" value="${headBoardVO.boardNo }"/>
								</c:if>
		                    	<!-- 제목 -->
		                    	<div class="mb-2 mt-2">
	                                <input type="text" id="boardTitle" name="boardTitle" class="form-control" placeholder="제목" value="${headBoardVO.boardTitle }">
	                            </div>
		                    
		                    	<!-- 에디터 -->
<!-- 		                        <div id="snow-editor" style="height: 300px;"></div> -->
<!-- 		                        <input type="hidden" id="inqryCn" name="inqryCn"> -->
								<textarea class="form-control" cols="50" rows="20" id="boardContent" name="boardContent">${headBoardVO.boardContent }</textarea>
		                        
		                        <!-- 파일  인풋 영역 -->
		                        <div class="col-md-12 mt-2">
									<div class="input-group input-group-outline mb-4">
										<input type="file" class="form-control" id="boFile" name="boFile" multiple="multiple" />
									</div>
								</div>
		                  		<sec:csrfInput/>
	                    	</form>
	                    	
	                        
							<!-- 수정 파일 영역 -->
							<c:if test="${status eq 'u' }">
								
							<div class="card-footer bg-white">
								<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
									<c:if test="${not empty headBoardVO.noticeFileList[0].attachNo }">
										<c:forEach items="${headBoardVO.noticeFileList }" var="noticeFile">
											<li>
												<span class="mailbox-attachment-icon">
													<i class="far fa-file-pdf"></i>
												</span>
												<div class="mailbox-attachment-info">
													<a href="#" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> ${noticeFile.attachOrgname }</a> 
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
                          
	                        <div class="col-xl-12 mt-2">
	                            <div class="text-xl-end mt-xl-0 mt-2">
	                            	<c:if test="${status eq 'u' }">
	                              	  <button type="button" class="btn btn-light mb-2 me-2" id="canBtn" onclick="javascript:location.href='/head/detail.do?boardNo=${headBoardVO.boardNo }'">취소</button>
	                              	</c:if>
	                              	<c:if test="${status ne 'u' }">
	                              	  <button type="button" class="btn btn-light mb-2 me-2" id="listBtn" onclick="javascript:location.href='/head/list.do'">목록</button>
	                              	</c:if>
	                                <button type="button" class="btn btn-primary mb-2" id="subBtn">${name }</button>
	                            </div>
	                        </div>
	                    </div> <!-- end card-body-->
	                </div> <!-- end card-->
	            </div> <!-- end col -->
	        </div>
	        <!-- end row --> 
	        
	    </div> <!-- container -->
	
	</div> <!-- content -->
	
</div>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	CKEDITOR.replace("boardContent",{
		filebrowserUploadUrl:"/imageUpload.do?${_csrf.parameterName}=${_csrf.token}"
	});
	
	var listBtn = $("#listBtn");
	var subBtn = $("#subBtn");
	var cancleBtn = $("#cancleBtn");
	var boardForm = $("#boardForm");
	
	listBtn.on("click", function(){
		location.href = "/head/faqlist.do";
	});
	
	subBtn.on("click", function(){
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
			boardForm.attr("action","/head/faqUpdate.do");
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