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
								<li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
								<li class="breadcrumb-item active">공지사항</li>
							</ol>
						</div>
						<h4 class="page-title">공지사항</h4>
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
									<h5 class="font-18 d-inline">${headBoardVO.boardTitle }</h5>
									<div class="float-end ">
										<fmt:formatDate value="${headBoardVO.boardRegdate }" pattern="yyyy-MM-dd"/>
									</div>
								</div>
								
								<hr />

								<div class="my-3">
									${headBoardVO.boardContent }
								</div>
								
								<hr />
								
								

<!-- 								첨부파일이 있으면 보이도록하기 -->
								<c:set value="${headBoardVO.noticeFileList }" var="noticeFileList"/>
								<c:if test="${not empty headBoardVO.noticeFileList[0].attachNo}">
									<h5 class="mt-3 mb-3">첨부파일</h5>
									<div class="row">
										<div class="col-xl-4">
											<div class="card mb-1 shadow-none border">
												<c:forEach items="${noticeFileList}" var="noticeFile">
													<div class="p-2">
														<div class="row align-items-center">
															<div class="col-auto">
																<div class="avatar-sm">
																	<img src="${pageContext.request.contextPath}/resources/upload/file/${noticeFile.attachOrgname }" alt="img" class="avatar-sm rounded">
																</div>
															</div>
															<div class="col ps-0">
																<a href="javascript:void(0);" class="text-muted fw-bold">${noticeFile.attachOrgname }</a>
																<p class="mb-0">${noticeFile.attachSize } MB</p>
															</div>
															<div class="col-auto">
																<!-- Button -->
																<a href="javascript:void(0);" class="btn btn-link btn-lg text-muted" data-file-no="${noticeFile.fileNo }"> 
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

								<form action="/head/delete.do" method="post" id="procForm">
									<input type="hidden" name="boardNo" value="${headBoardVO.boardNo }"/>
									<sec:csrfInput/>
								</form>

								<div class="mt-4 text-xl-end">
									<button type="button" class="btn btn-light me-2" id="listBtn">목록</button>
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
		location.href = '/head/list.do';
	});
	
	udtBtn.on("click", function(){
		procForm.attr("method", "get");
		procForm.attr("action", "/head/update.do");
		procForm.submit();
	});
	
	delBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			procForm.submit();
		}
	});
	
});

</script>