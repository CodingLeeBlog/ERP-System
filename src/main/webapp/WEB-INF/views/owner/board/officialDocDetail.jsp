<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="content-page">
	<div class="content">
	
	    <!-- Start Content-->
	    <div class="container-fluid">
	        
	        <!-- start page email-title -->
	        <!-- start page title -->
	        <div class="row">
	            <div class="col-12">
	                <div class="page-title-box">
	                    <div class="page-title-right">
	                        <ol class="breadcrumb m-0">
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
	                            <li class="breadcrumb-item active">공문조회</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">공문조회</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	        <!-- end page email-title --> 
	
	        <div class="row">
	
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	                    
	                        <!-- 왼쪽 사이드바 -->
	                        <div class="page-aside-left">
	                            <div class="d-grid">
	                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#compose-modal">공문 보내기</button>
	                            </div>
	                            
	                            <div class="nav flex-column mt-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						            <a class="nav-link active show" id="v-pills-home-tab" href="/owner/doc.do">
						                <i class="mdi mdi-home-variant d-md-none d-block"></i>
						                <span class="d-none d-md-block"><i class="ri-inbox-line me-2"></i>받은 공문</span>
						            </a>
						            <a class="nav-link" id="v-pills-profile-tab" href="/owner/doc.do">
						                <i class="mdi mdi-account-circle d-md-none d-block"></i>
						                <span class="d-none d-md-block"><i class="ri-mail-send-line me-2"></i>보낸 공문</span>
						            </a>
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
										<c:forEach items="${ofldcFileList}" var="ofldcFile">
											<div class="col-xl-4">
												<div class="card mb-1 shadow-none border">
													<div class="p-2">
														<div class="row align-items-center">
															<div class="col-auto">
															</div>
															<div class="col ps-0">
																<a href="javascript:void(0);" class="text-muted fw-bold">${ofldcFile.attachOrgname }</a>
																<p class="mb-0">${ofldcFile.attachSize } MB</p>
															</div>
															<div class="col-auto">
																<!-- Button -->
																<button type="button" class="btn btn-link btn-lg fileDownload"
																		data-attach-no="${ofldcFile.attachNo }" name="attachNo"><i class="ri-download-2-line" ></i></button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<!-- end col -->
									</div>
									<!-- end row-->
								</c:if>

<!-- 								<form action="/owner/docDelete.do" method="post" id="procForm"> -->
									<input type="hidden" id="frcsOfldcNo" name="frcsOfldcNo" value="${frcsOfldcVO.frcsOfldcNo}"/>
<%-- 									<sec:csrfInput/> --%>
<!-- 								</form> -->

								<div class="mt-4 text-xl-end">
									<button type="button" class="btn btn-light me-2" id="listBtn">목록</button>
<!-- 									답글달리기 전까지 수정,삭제 가능하게?? -->
									<button type="button" class="btn btn-light me-2" id="delBtn">삭제</button>
<!-- 									<button type="button" class="btn btn-secondary" id="udtBtn">수정</button>  -->
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
	var listBtn = $("#listBtn");
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
	
	listBtn.on("click", function(){
		location.href = '/owner/doc.do';
	});
	
// 	delBtn.on("click", function(){
// 		if(confirm("정말로 삭제하시겠습니까?")){
// 			procForm.submit();
// 		}
// 	});

	delBtn.on('click', function() {
		var selectedItems = [];
		selectedItems.push({ frcsOfldcNo: $("#frcsOfldcNo").val()});
		
		$.ajax({
	        type: "POST",
	        url: "/owner/docDelete.do",
	        beforeSend: function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
	        data: JSON.stringify(selectedItems),
	        contentType: "application/json;charset=UTF-8",
	        success: function (response) {
	            console.log("삭제 성공:", response);
	            alert("삭제되었습니다!");
	            location.href='/owner/doc.do';
	        },
	        error: function (error) {
	            console.error("삭제 실패:", error);
	            alert("다시 시도해주세요!");
	        }
	    });
        
	});
	
	// 파일 다운로드
	$(".fileDownload").on("click", function() {
		var attachNo = $(this).data("attach-no");

		location.href = "/owner/docDownload.do?attachNo=" + attachNo;
	});
	
});
</script>