<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css"
	rel="stylesheet">

<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height: 100px;">
				<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">교육훈련관리</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">가맹점의
							교육을 관리합니다.</div>
					</div>
					<div
						class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
						개점관리 > &nbsp;<span class="text-decoration-underline">교육훈련관리</span>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="row mb-2">
								<div class="col-sm-5">
									<form
										class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between"
										id="searchForm">
										<input type="hidden" id="page" name="page">
										<div class="col-auto">
											<div class="d-flex align-items-center">
												<select class="form-select" name="searchType"
													id="searchType">
													<option selected>선택</option>
													<option value="1"
														<c:if test="${searchType eq 'frcsName' }">selected</c:if>>가맹점명</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<label for="inputPassword2" class="visually-hidden">검색</label>
											<input type="text" class="form-control" id="searchWord"
												name="searchWord" placeholder="Search..."
												value="${searchWord }">
										</div>
									</form>
								</div>
								<div class="col-sm-7">
									<div class="text-sm-end">
										<input type="button" class="btn btn-info" id="registerBtn"
											value="등록" data-bs-toggle="modal"
																		data-bs-target="#exampleModalFullscreenSm">
										<!--                                                      <input type="button" class="btn btn-success" id="manageBtn" value="관리"> -->
										<a href="/head/educationVideo.do" class="btn btn-success">관리</a>
									</div>
								</div>
								<!-- end col-->
							</div>
							<br />
							<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">
									<div class="modal fade" id="exampleModalFullscreenSm"
										tabindex="-1" aria-labelledby="exampleModalFullscreenSmLabel"
										aria-hidden="true">
										<div class="modal-dialog modal-fullscreen-sm-down">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalFullscreenSmLabel">등록화면</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<form enctype="multipart/form-data">
														<!-- 										            		<div class="mb-3 col-md-6"> -->
														<!-- 										            			<label for="" class="col-form-label">지점명</label> -->
														<!-- 																<input type="text" class="form-control" id="inspName" name="searchWord"> -->
														<!-- 										            		</div> -->
														<div class="mb-3 col-md-6">
															<label for="ownerFile8" class="col-form-label">가맹점명</label>
															<input class="form-control" id="frcsName" type="text"
																name="frcsName">
														</div>
														<div class="mb-3 col-md-6">
															<label for="ownerFile8" class="col-form-label">교육시작일</label>
															<input class="form-control" id="eduSdate" type="date"
																name="eduSdate">
														</div>
														<div class="mb-3 col-md-6">
															<label for="ownerFile8" class="col-form-label">교육종료일</label>
															<input class="form-control" id="eduFdate" type="date"
																name="eduFdate">
														</div>
														<div class="mb-3 col-md-6">
															<label for="ownerConst1" class="col-form-label">이수여부</label>
															<select class="form-select form-select-sm mb-3"
																id="eduFnshyn" name="eduFnshyn">
																<option selected>선택</option>
																<option value="Y">Y</option>
																<option value="N">N</option>
															</select>
														</div>
														<div class="mb-3 col-md-6">
															<label for="ownerFile8" class="col-form-label">비고</label>
															<input class="form-control" id="eduRemark" type="text"
																name="eduRemark">
														</div>
													</form>
												</div>
												<div class="modal-footer">
													<a href="javascript:void(0);" class="btn btn-light"
														data-bs-dismiss="modal">취소</a>
													<button type="button" class="btn btn-primary" id="insertBtn">저장</button>
												</div>
											</div>
										</div>
									</div>

							<div class="table-responsive">
								<table class="table table-centered w-100 dt-responsive nowrap"
									id="products-datatable">
									<thead class="table-light">
										<tr>
											<th class="all">가맹점명</th>
											<th>교육시작일</th>
											<th>교육종료일</th>
											<th>이수여부</th>
											<th>비고</th>
										</tr>
									</thead>
									<tbody id="tBody">
										<c:set value="${pagingVO.dataList }" var="educationList" />
										<c:choose>
											<c:when test="${empty educationList }">
												<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">교육
														내역이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${educationList }" var="education">
													<tr class="text-left">
														<td data-frcs-id="${education.frcsId}">${education.frcsName }</td>
														<td><fmt:formatDate value="${education.eduSdate }"
																pattern="yyyy-MM-dd" /></td>
														<td><fmt:formatDate value="${education.eduFdate }"
																pattern="yyyy-MM-dd" /></td>
														<td><span class="badge bg-success">${education.eduFnshyn }</span></td>
														<td>${education.eduRemark }</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<nav aria-label="Page navigation example" id="pagingArea">
									${pagingVO.pagingHTML }</nav>
							</div>
						</div>
						<!-- end card-body-->
					</div>
					<!-- end card-->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->

		</div>
		<!-- container -->

	</div>
	<!-- content -->
</div>
<!-- 모달 창 -->
</div>
</div>
</div>
</div>


<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">상세보기</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form>
					<input type="hidden" name="frcsId" id="frcsId">
					<div class="mb-3">
						<label for="frcsName1" class="col-form-label">가맹점명</label> <input
							type="text" class="form-control" id="frcsName1">
					</div>
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="recipient-name" class="col-form-label">교육내역</label> <input -->
<!-- 							type="text" class="form-control" id="recipient-name"> -->
<!-- 					</div> -->
					<div class="mb-3">
						<label for="eduFnshyn1" class="col-form-label">상태</label> <input
							type="text" class="form-control" id="eduFnshyn1">
					</div>
					<div class="mb-3">
						<label for="eduSdate1" class="col-form-label">교육시작일</label> <input
							type="text" class="form-control" id="eduSdate1">
					</div>
					<div class="mb-3">
						<label for="eduFdate1" class="col-form-label">교육종료일</label> <input
							type="text" class="form-control" id="eduFdate1">
					</div>
					<div class="mb-3">
						<label for="eduRemark1" class="col-form-label">비고</label> <input
							type="text" class="form-control" id="eduRemark1">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="updateBtn">수정</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">삭제</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">목록</button>
			</div>
		</div>
	</div>
</div>

</body>
<!-- jQuery 및 Bootstrap를 로드합니다. -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(function() {
    var pagingArea = $("#pagingArea");
    var insertBtn = $("#insertBtn");

    // 페이징
    pagingArea.on("click", "a", function(event) {
        event.preventDefault();
        var pageNo = $(this).data("page");
        searchForm.find("#page").val(pageNo);
        searchForm.submit();
    });
    
    // 등록 버튼 클릭 이벤트 처리
    insertBtn.on("click", function() {
        var frcsName = $("#frcsName").val();
        var eduSdate = $("#eduSdate").val();
        var eduFdate = $("#eduFdate").val();
        var eduFnshyn = $("#eduFnshyn").val();
        var eduRemark = $("#eduRemark").val();

        var data = {
            frcsName: frcsName,
            eduSdate: eduSdate,
            eduFdate: eduFdate,
            eduFnshyn: eduFnshyn,
            eduRemark: eduRemark
        };

        $.ajax({
            type: "POST", 
            url: "/head/educationRegister.do",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(res) {
                Swal.fire({
                    title: '알림창',
                    text: '발송이 완료되었습니다.',
                    icon: 'success',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "/head/education.do";
                    }
                });
                console.log(res.result);
            },
            error: function(err) {
                alert("데이터 저장 중 오류가 발생했습니다.", err);
                console.log(data);
            }
        });
    });
    $(document).ready(function() {
        $('table tbody').on('click', 'td[data-frcs-id]', function() {
            var data = 
            	{ frcsId : $(this).data("frcs-id")
            
            	};

            // Open the modal
            openModal(frcsId);
        });

        function openModal(frcsId) {
        	$.ajax({
        	    url: "/head/educationDetail.do",
        	    type: "post",
        	    data: JSON.stringify(data), // 데이터를 JSON 문자열로 변환
        	    contentType: "application/json; charset=utf-8",
        	    beforeSend: function(xhr) {
        	        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        	    },
        	    success: function(data) {
        	        console.log(data);  // 데이터 확인
        	        $("#frcsId").val(data.frcsId);
        	        $("#frcsName1").val(data.frcsName);
        	        $("#eduSdate1").val(data.eduSdate);
        	        $("#eduFdate1").val(data.eduFdate);
        	        $("#eduFnshyn1").val(data.eduFnshyn);
        	        $("#eduRemark1").val(data.eduRemark);

        	        $('#exampleModal').modal('show');
        	    },
        	    error: function() {
        	        alert("오류가 발생했습니다.");
        	    }
        	});
        }
    });
});

</script>

