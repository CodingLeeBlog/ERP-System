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
								<li class="breadcrumb-item active">1:1문의</li>
							</ol>
						</div>
						<h4 class="page-title">1:1문의</h4>
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
									<h5 class="font-18 d-inline">${headInquiryVO.inqryTtl }</h5>
									<div class="float-end ">
										<fmt:formatDate value="${headInquiryVO.inqryYmd }" pattern="yyyy-MM-dd"/>
									</div>
								</div>
								
								<hr />

								<div class="my-3 overflow-auto" style="height: 300px" >
									${headInquiryVO.inqryCn }
								</div>
								
								<hr />
								
								

<!-- 								첨부파일이 있으면 보이도록하기 -->

								<form action="/owner/inqDelete.do" method="post" id="procForm">
									<input type="hidden" name="inqryNo" value="${headInquiryVO.inqryNo }"/>
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
		location.href = '/head/inquiryList.do';
	});
	
	delBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			procForm.submit();
		}
	});
	
});

</script>