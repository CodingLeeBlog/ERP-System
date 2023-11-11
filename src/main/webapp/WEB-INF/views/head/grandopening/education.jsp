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
													<option value="1"
														<c:if test="${searchType eq 'frcsName' }">selected</c:if>>가맹점명</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<label for="inputPassword2" class="visually-hidden">검색</label>
											<input type="text" class="form-control" id="searchWord"
												name="searchWord" placeholder="가맹점명을 입력해주세요."
												value="${searchWord }">
										</div>
									</form>
								</div>
								<div class="col-sm-7">
									<div class="text-sm-end">
										<a href="/head/officeLetter.do" class="btn btn-danger">공문</a>
									</div>
								</div>
								<!-- end col-->
							</div>
							<br />

							<div class="table-responsive">
								<table class="table table-centered w-100 dt-responsive nowrap"
									id="products-datatable">
									<thead class="table-light">
										<tr>
											<th style="text-align: center">순번</th>
											<th style="text-align: center">가맹점명</th>
											<th style="text-align: center">교육시작일</th>
											<th style="text-align: center">교육종료일</th>
											<th style="text-align: center">이수여부</th>
											<th style="text-align: center">비고</th>
											<th style="text-align: center"></th>
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
														<td style="text-align: center">${education.rnum }
														</td>
														<td style="text-align: center" data-frcs-id="${education.frcsId}">${education.frcsName }
															 <input type="hidden" class="frcsIdInput" value="${education.frcsId}">
														</td>
														<td style="text-align: center" class="eduSdate"><span
															class="eduSdateText"><fmt:formatDate
																	value="${education.eduSdate}" pattern="yyyy-MM-dd" /></span>
															<input type="date" class="eduSdateInput"
															style="display: none" class="eduSdateStr" /></td>
														<td style="text-align: center" class="eduFdate"><span
															class="eduFdateText"><fmt:formatDate
																	value="${education.eduFdate}" pattern="yyyy-MM-dd" /></span>
															<input type="date" class="eduFdateInput"
															style="display: none" class="eduFdateStr" /></td>
														<td style="text-align: center"><span
															class="badge bg-success">${education.eduFnshyn }</span></td>
														<td style="text-align: center">${education.eduRemark }</td>
														<td style="text-align: center"><c:choose>
																<c:when
																	test="${not empty education.eduSdate and not empty education.eduFdate}">
																	<!-- 버튼 텍스트를 "수정"으로 설정 -->
																	<button type="button"
																		class="btn btn-danger btn-sm update-btn"
																		data-row-id="${education.frcsId}">수정</button>
																</c:when>
																<c:otherwise>
																	<!-- 버튼 텍스트를 "등록"으로 설정 -->
																	<button type="button"
																		class="btn btn-info btn-sm register-btn"
																		data-frcs-id="${education.frcsId}">등록</button>
																</c:otherwise>
															</c:choose></td>
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
    
});

//수정 버튼을 클릭했을 때
$('.update-btn').click(function() {
    var row = $(this).closest('tr');
    var eduSdateInput = row.find('.eduSdateInput');
    var eduSdateText = row.find('.eduSdateText');
    var eduFdateInput = row.find('.eduFdateInput');
    var eduFdateText = row.find('.eduFdateText');
    
    eduSdateInput.show();
    eduSdateText.hide();
    eduFdateInput.show();
    eduFdateText.hide();
    
	var frcsId = $(this).data("row-id");
    
    if ($(this).text() === "저장") {
        var regSdate = eduSdateInput.val();
        var regFdate = eduFdateInput.val();

        var data = {
            eduSdate: regSdate,
            eduFdate: regFdate,
            frcsId: frcsId 
        }

        $.ajax({
            url: "/head/educationUpdate.do",
            type: "POST",
            data: JSON.stringify(data), // 데이터를 JSON 문자열로 직렬화
            contentType: "application/json; charset=utf-8",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(data) {
                Swal.fire({
                    title: '알림창',
                    text: '수정이 완료되었습니다.',
                    icon: 'success',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "/head/education.do"; 
                    }
                });

            },
            error: function(err) {
                alert("저장 중 오류가 발생했습니다.");
            }
        });
    } else {
        // "저장" 버튼으로 변경
        $(this).text('저장');
    }
});

//등록 버튼을 클릭했을 때
$('.register-btn').click(function() {
	var row = $(this).closest('tr');
    var eduSdateInput = row.find('.eduSdateInput');
    var eduSdateText = row.find('.eduSdateText');
    var eduFdateInput = row.find('.eduFdateInput');
    var eduFdateText = row.find('.eduFdateText');
    
    eduSdateInput.show();
    eduSdateText.hide();
    eduFdateInput.show();
    eduFdateText.hide();
    
    var frcsId = $(this).data("frcs-id");
    
    if ($(this).text() === "저장") {
        var regSdate = eduSdateInput.val();
        var regFdate = eduFdateInput.val();

        var data = {
            eduSdate: regSdate,
            eduFdate: regFdate,
            frcsId: frcsId 
        }

        $.ajax({
            url: "/head/educationRegister.do",
            type: "POST",
            data: JSON.stringify(data), // 데이터를 JSON 문자열로 직렬화
            contentType: "application/json; charset=utf-8",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(data) {
                Swal.fire({
                    title: '알림창',
                    text: '등록이 완료되었습니다.',
                    icon: 'success',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "/head/education.do"; 
                    }
                });

            },
            error: function(err) {
                alert("저장 중 오류가 발생했습니다.");
            }
        });
    } else {
        // "저장" 버튼으로 변경
        $(this).text('저장');
    }
});



</script>

