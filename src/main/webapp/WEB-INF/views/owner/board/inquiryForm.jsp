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
	                    
	                    	<form id="inqForm" action="/owner/inqInsert.do" method="post" enctype="multipart/form-data">
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
									<c:if test="${not empty inqVO.inqFileList[0].attachNo }">
										<c:forEach items="${inqVO.inqFileList}" var="inqFile">
											<li>
<!-- 												<span class="mailbox-attachment-icon"> -->
<!-- 													<i class="ri-file-line"></i> -->
<!-- 												</span> -->
												<div class="mailbox-attachment-info">
													<a class="mailbox-attachment-name"><i class="mdi mdi-paperclip"></i> ${inqFile.attachOrgname }</a> 
													<span class="mailbox-attachment-size clearfix mt-1"> 
														<span>${inqFile.attachSize }</span> 
														<span class="btn btn-default btn-sm float-right attachmentFileDel" id="span_${inqFile.attachNo }">
															<i class="mdi mdi-delete-forever-outline"></i>
														</span>
													</span>
												</div>
											</li>
										</c:forEach>
									</c:if>
								</ul>
							</div>	


<%-- 								<c:if test="${not empty inqVO.inqFileList[0].attachNo }"> --%>
<!-- 									<div class="col-md-12"> -->
<!-- 										<div class="row"> -->
<%-- 											<c:forEach items="${inqVO.inqFileList }" var="inqFile"> --%>
<!-- 												<div class="col-md-2"> -->
<!-- 													<div class="card shadow-lg"> -->
<!-- 														<div class="card-header mt-n4 mx-3 p-0 bg-transparent position-relative z-index-2"> -->
<!-- 															<a class="d-block blur-shadow-image text-center">  -->
<!-- 																<img src="" alt="img-blur-shadow" class="img-fluid shadow border-radius-lg"> -->
<!-- 															</a> -->
<!-- 															<div class="colored-shadow" style="background-image: url(&quot;https://images.unsplash.com/photo-1536321115970-5dfa13356211?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;ixlib=rb-1.2.1&amp;auto=format&amp;fit=crop&amp;w=934&amp;q=80&quot;);"></div> -->
<!-- 														</div> -->
<!-- 														<div class="card-body text-center bg-white border-radius-lg p-3 pt-0"> -->
<!-- 															<h6 class="mt-3 mb-1 d-md-block d-none"> -->
<%-- 																${inqFile.attachOrgname } (${inqFile.attachSize }) --%>
<!-- 															</h6> -->
<!-- 															<p class="mb-0 text-xs font-weight-bolder text-info text-uppercase"> -->
<%-- 																<button type="button" class="btn btn-primary fileDelete" id="btn_${inqFile.attachNo }">delete</button> --%>
<!-- 															</p> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</div> -->
<%-- 											</c:forEach> --%>
<!-- 										</div> -->
<!-- 									</div> -->
<%-- 								</c:if> --%>
								
							</c:if>
                          
	                        <div class="col-xl-12 mt-2">
	                            <div class="text-xl-end mt-xl-0 mt-2">
	                            	<c:if test="${status eq 'u' }">
	                              	  <button type="button" class="btn btn-light mb-2 me-2" id="canBtn" onclick="javascript:location.href='/owner/inqDetail.do?inqryNo=${inqVO.inqryNo}'">취소</button>
	                              	</c:if>
	                              	<c:if test="${status ne 'u' }">
	                              	  <button type="button" class="btn btn-light mb-2 me-2" id="listBtn" onclick="javascript:location.href='/owner/inquiry.do'">목록</button>
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
	
	$(".attachmentFileDel").on("click", function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");
		var inqFileNo = id.substring(idx + 1);
		var ptrn = "<input type='text' name='delInqNo' value='%V' hidden='hidden'/>";
		$("#inqForm").append(ptrn.replace("%V", inqFileNo));
		$(this).parents("li:first").hide();	// x를 누른녀석이 사라져야되니까 hide해주자
	});
	
});
</script>