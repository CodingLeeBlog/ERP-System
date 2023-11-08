<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height:100px;">
	         <div class="row ">
	               <div class="card-body col-4 align-items-center">
	                  <div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">공문관리</div>
	                  <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">본사의 공문을 관리합니다.</div>
	               </div>
	               <div class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
                  매장관리 > &nbsp;<span class="text-decoration-underline">공문관리</span>
               </div>
            </div>
         </div>
			<!-- end page title -->
	
	        <div class="row">
	
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	                    
	                        <!-- 왼쪽 사이드바 -->
	                        <div class="page-aside-left">
	                            <div class="d-grid">
	                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#compose-modal">작성하기</button>
	                            </div>
	
<!-- 	                            <div class="email-menu-list mt-3"> -->
<!-- 	                                <a id="receive" href="" class="text-primary fw-bold"><i class="ri-inbox-line me-2"></i>받은 공문<span class="badge badge-danger-lighten float-end ms-2">7</span></a> -->
<!-- 	                                <a id="send" href=""><i class="ri-mail-send-line me-2"></i>보낸 공문</a> -->
<!-- 	                            </div>  -->
	                            
								<div class="email-menu-list mt-3">
									<a href="/head/officeLetterRead.do" class="text-danger fw-bold"><i
										class="ri-star-line me-2"></i>수신함<span
										class="badge badge-danger-lighten float-end ms-2">${totalRecord }</span></a>
									<a href="/head/officeLetter.do"><i
										class="ri-inbox-line me-2"></i>발신함</a>
								</div>
						        
	                        </div>
	                        <!-- 왼쪽 사이드바 끝 -->
	
	                        <div class="page-aside-right">
	                        
	                        	<div class="mt-3">

								<div>
									<h5 class="font-18 d-inline">${frcsOfldcVO.frcsOfldcTtl }</h5>
									<div class="float-end ">
										<fmt:formatDate value="${frcsOfldcVO.frcsOfldcDspymd }" pattern="yyyy-MM-dd"/>
									</div>
								</div>
								
								<hr />

								<div class="my-3 overflow-auto" style="height: 300px" >
									${frcsOfldcVO.frcsOfldcCn }
								</div>
								
								<hr />
								
<!-- 								첨부파일이 있으면 보이도록하기 -->
								<c:set value="${frcsOfldcVO.ofldcFileList }" var="ofldcFileList"/>
								<c:if test="${not empty ofldcFileList}">
									<h5 class="mt-3 mb-3">첨부파일</h5>
									<div class="row">
										<div class="col-xl-4">
											<div class="card mb-1 shadow-none border">
												<c:forEach items="${ofldcFileList}" var="ofldcFile">
													<div class="p-2">
														<div class="row align-items-center">
															<div class="col-auto">
																<div class="avatar-sm">
																	<img src="${pageContext.request.contextPath}/resources/upload/file/${ofldcFile.attachOrgname }" alt="img" class="avatar-sm rounded">
																</div>
															</div>
															<div class="col ps-0">
																<a href="javascript:void(0);" class="text-muted fw-bold">${ofldcFile.attachOrgname }</a>
																<p class="mb-0">${ofldcFile.attachSize } MB</p>
															</div>
															<div class="col-auto">
																<!-- Button -->
																<a href="javascript:void(0);" class="btn btn-link btn-lg text-muted" data-file-no="${ofldcFile.fileNo }"> 
																	<i class="ri-download-2-line" ></i>
																</a>
															</div>
														</div>
													</div>
												</c:forEach>
												
											</div>
										</div>
										<!-- end col -->
									</div>
									<!-- end row-->
								</c:if>

								<form action="/owner/docDelete.do" method="post" id="procForm">
									<input type="hidden" id="frcsOfldcNo" name="frcsOfldcNo" value="${frcsOfldcVO.frcsOfldcNo}"/>
									<sec:csrfInput/>
								</form>

								<div class="mt-4 text-xl-end">
									<button type="button" class="btn btn-light me-2" id="listBtn" onclick="javascript:location.href='/head/officeLetterRead.do'">목록</button>
									<button type="button" class="btn btn-light me-2" id="delBtn">삭제</button>
								</div>
								
							</div>
	                            
	                        </div> 
	                        <!-- end inbox-rightbar-->
	                    </div>
	                    <!-- end card-body -->
	                    <div class="clearfix"></div>
	                </div> <!-- end card-box -->
	
	            </div> <!-- end Col -->
	        </div><!-- End row -->
	        
	    </div> <!-- container -->
	
	</div> <!-- content -->

		<!-- 공문 보내기 모달 -->
	<div id="compose-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header modal-colored-header">
	                <h4 class="modal-title" id="compose-header-modalLabel">공문 보내기</h4>
	                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="p-1">
	                <div class="modal-body px-3 pt-3 pb-0">
	                   
	                    <form action="/owner/docInsert.do" method="post" id="regForm" enctype="multipart/form-data">
	                        <input type="hidden" id="frcsOfldcRcvr" name="frcsOfldcRcvr" value="">
	                        <div class="mb-2">
	                            <label for="mailsubject" class="form-label">제목</label>
	                            <input type="text" id="frcsOfldcTtl" name="frcsOfldcTtl" class="form-control" placeholder="제목">
	                        </div>
	                        <div class="write-mdg-box mb-3">
	                            <label class="form-label">내용</label>
	                            <textarea id="simplemde1" name="frcsOfldcCn"></textarea>
	                        </div>
	                        <div class="mb-2">
	                            <label class="form-label">첨부파일</label>
	                            <input type="file" id="boFile" name="boFile" class="form-control" multiple="multiple">
	                        </div>
	                    	<sec:csrfInput/>
	                    </form>
	                    
	                </div>
	                <div class="px-3 pb-3">
	                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="regBtn"><i class="mdi mdi-send me-1"></i></button>
	                    <button type="button" class="btn btn-light" data-bs-dismiss="modal" id="canBtn">Cancel</button>
	                </div>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
		
</div>

<script type="text/javascript">
$(function(){
	var regBtn = $("#regBtn");
// 	var listBtn = $("#listBtn");
	var delBtn = $("#delBtn");
	var regForm = $("#regForm");
	var procForm = $("#procForm");
	
	regBtn.on("click", function(){
		var frcsOfldcTtl = $("#frcsOfldcTtl").val();
		
		if(frcsOfldcTtl == null || frcsOfldcTtl == ""){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		regForm.submit();
		
	});
	
// 	listBtn.on("click", function(){
// 		location.href = '/owner/doc.do';
// 	});
	
	delBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			procForm.submit();
		}
	});

});
</script>