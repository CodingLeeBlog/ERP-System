<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

							<div class="mt-3">

								<div>
									<h5 class="font-18 d-inline">${inqVO.inqryTtl }</h5>
									<div class="float-end ">
										<fmt:formatDate value="${inqVO.inqryYmd }" pattern="yyyy-MM-dd"/>
									</div>
								</div>
								
								<hr />

								<div class="my-3 overflow-auto" style="height: 300px" >
									${inqVO.inqryCn }
								</div>
								
								<hr />
								
<!-- 								답변이 달리면 보이도록하기 -->
								<c:if test="${frcsInq.inqryYn eq 'Y'}">
									<h5 class="mb-3">문의답변</h5>
									<hr />
									<div class="my-3 overflow-auto">
										<!-- 답변내용, 작성일 -->
									</div>
								</c:if>
								

<!-- 								첨부파일이 있으면 보이도록하기 -->
								<c:set value="${inqVO.inqFileList }" var="inqFileList"/>
								<c:if test="${not empty inqFileList}">
									<h5 class="mt-3 mb-3">첨부파일</h5>
									<div class="row">
										<c:forEach items="${inqFileList}" var="inqFile">
											<div class="col-xl-4">
												<div class="card mb-1 shadow-none border">
													<div class="p-2">
														<div class="row align-items-center">
															<div class="col-auto">
															</div>
															<div class="col ps-0">
																<a href="javascript:void(0);" class="text-muted fw-bold">${inqFile.attachOrgname }</a>
																<p class="mb-0">${inqFile.attachSize } MB</p>
															</div>
															<div class="col-auto">
																<!-- Button -->
																<button type="button" class="btn btn-link btn-lg fileDownload"
																		data-attach-no="${inqFile.attachNo }" name="attachNo"><i class="ri-download-2-line" ></i></button>
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

								<form action="/owner/inqDelete.do" method="post" id="procForm">
									<input type="hidden" id="inqryNo" name="inqryNo" value="${inqVO.inqryNo}"/>
									<sec:csrfInput/>
								</form>

								<div class="mt-4 text-xl-end">
									<button type="button" class="btn btn-light me-2" id="listBtn">목록</button>
<!-- 									답글달리기 전까지 수정,삭제 가능하게?? -->
									<button type="button" class="btn btn-light me-2" id="delBtn">삭제</button>
									<button type="button" class="btn btn-secondary" id="udtBtn">수정</button> 
								</div>
								
							</div>
							
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>

<script type="text/javascript">

$(function(){
	var listBtn = $("#listBtn");
	var udtBtn = $("#udtBtn");
	var delBtn = $("#delBtn");
	var procForm = $("#procForm");
	
	listBtn.on("click", function(){
		location.href = '/owner/inquiry.do';
	});
	
	udtBtn.on("click", function(){
		console.log("수정버튼클릭");
		procForm.attr("method", "get");
		procForm.attr("action", "/owner/inqUpdate.do");
		procForm.submit();
	});
	
// 	delBtn.on("click", function(){
// 		if(confirm("정말로 삭제하시겠습니까?")){
// 			procForm.submit();
// 		}
// 	});

	delBtn.on('click', function() {
		var selectedItems = [];
		selectedItems.push({ inqryNo: $("#inqryNo").val()});
		
		$.ajax({
	        type: "POST",
	        url: "/owner/inqDelete.do",
	        beforeSend: function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
	        data: JSON.stringify(selectedItems),
	        contentType: "application/json;charset=UTF-8",
	        success: function (response) {
	            console.log("삭제 성공:", response);
	            alert("삭제되었습니다!");
	            location.href='/owner/inquiry.do';
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

		location.href = "/owner/inqDownload.do?attachNo=" + attachNo;
	});
	
});

</script>