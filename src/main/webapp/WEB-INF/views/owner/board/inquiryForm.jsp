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
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
	                            <li class="breadcrumb-item active">1대1문의</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">1대1문의</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	
	        <div class="row">
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	                    
	                    	<form id="inqForm" action="/owner/inqInsert.do" method="post" >
		                    	<c:if test="${status eq 'u' }">
									<input type="hidden" name="inqryNo" value="${inqVO.inqryNo}"/>
								</c:if>
		                    	<!-- 제목 -->
		                    	<div class="mb-2 mt-2">
	                                <input type="text" id="inqryTtl" name="inqryTtl" class="form-control" placeholder="문의제목" value="${inqVO.inqryTtl}">
	                            </div>
		                    
		                    	<!-- 에디터 -->
<!-- 		                        <div id="snow-editor" style="height: 300px;"></div> -->
<!-- 		                        <input type="hidden" id="inqryCn" name="inqryCn"> -->
								<textarea class="form-control" cols="50" rows="20" id="inqryCn" name="inqryCn">${inqVO.inqryCn}</textarea>
		                  		<sec:csrfInput/>
	                    	</form>
	                        
	                        <c:if test="${status eq 'u' }">
								<!-- 파일업로드 -->
	                            <!-- File Upload -->
								<form id="inqFileForm" action="/" method="post" class="dropzone mt-2" data-plugin="dropzone" data-previews-container="#file-previews"
								    data-upload-preview-template="#uploadPreviewTemplate" enctype="multipart/form-data">
								    <div class="fallback">
								        <input name="file" type="file" multiple />
								    </div>
								
								    <div class="dz-message needsclick">
								        <i class="h2 text-muted ri-upload-cloud-2-line"></i>
								        <h4>Drop files here or click to upload.</h4>
								    </div>
								</form>
							</c:if>
							
							<!-- Preview -->
							<div class="dropzone-previews mt-3" id="file-previews"></div>
							
							<!-- file preview template -->
							<div class="d-none" id="uploadPreviewTemplate">
							    <div class="card mt-1 mb-0 shadow-none border">
							        <div class="p-2">
							            <div class="row align-items-center">
							                <div class="col-auto">
							                    <img data-dz-thumbnail src="#" class="avatar-sm rounded bg-light" alt="">
							                </div>
							                <div class="col ps-0">
							                    <a href="javascript:void(0);" class="text-muted fw-bold" data-dz-name></a>
							                    <p class="mb-0" data-dz-size></p>
							                </div>
							                <div class="col-auto">
							                    <!-- Button -->
							                    <a href="" class="btn btn-link btn-lg text-muted" data-dz-remove>
							                        <i class="ri-close-line"></i>
							                    </a>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
							<!-- 파일업로드 끝 -->
                          
	
	                        <div class="col-xl-12 mt-2">
	                            <div class="text-xl-end mt-xl-0 mt-2">
	                            	<c:if test="${status eq 'u' }">
	                              	  <button type="button" class="btn btn-light mb-2 me-2" id="canBtn" onclick="javascript:location.href='/owner/inqDetail.do?inqryNo=${inqVO.inqryNo}'">취소</button>
	                              	</c:if>
	                              	<c:if test="${status ne 'u' }">
	                              	  <button type="button" class="btn btn-light mb-2 me-2" id="listBtn" onclick="javascript:location.href='/owner/inquiry.do'">목록</button>
	                              	</c:if>
	                                <button type="button" class="btn btn-danger mb-2" id="subBtn">${name }</button>
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
	CKEDITOR.replace("inqryCn", {
		filebrowserUploadUrl : "/imageUpload.do"
	});
	CKEDITOR.config.width="100%";
	CKEDITOR.config.height="400px";
	
	var subBtn = $("#subBtn");
	var inqForm = $("#inqForm");
	
	subBtn.on("click", function(){
		var inqryTtl = $("#inqryTtl").val();
		var inqryCn = CKEDITOR.instances.inqryCn.getData();
		
// 		quill에디터 적용 보류
// 		var inqryCn = new Quill("#snow-editor", {
// 		    theme: 'snow'  // 또는 다른 테마를 선택할 수 있습니다.
// 		});
// 		inqryCn.on('text-change', function(delta, oldDelta, source) {
// 	        document.getElementById("quillHtml").value = ("#snow-editor").root.innerHTML;
// 		});
		
		if(inqryTtl == null || inqryTtl == ""){
			alert("제목을 입력해주세요.");
			return false;
		}
		if(inqryCn == null || inqryCn == ""){
			alert("내용을 입력해주세요.");
			return false;
		}
		
		if($(this).text() == "수정"){
			inqForm.attr("action", "/owner/inqUpdate.do");
		}
		
		inqForm.submit();		
	});
	
	
});
</script>