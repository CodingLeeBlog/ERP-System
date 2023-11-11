<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">

<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height: 100px;">
				<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">개점일정계획</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">가맹점의
							개점 일정을 관리합니다.</div>
					</div>
					<div
						class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
						개점관리 > &nbsp;<span class="text-decoration-underline">개점일정계획</span>
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
										class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
										<input type="hidden" id="page" name="page">
										<div class="col-auto">
											<div class="d-flex align-items-center">
												<select class="form-select" name="searchType"
													id="searchType">
													<option value="1"
														<c:if test="${searchType eq 'frcsName' }">selected</c:if>>가맹점명</option>
													<option value="2">지역</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<label for="inputPassword2" class="visually-hidden">검색</label>
											<input type="text" class="form-control" id="searchWord"
												name="searchWord" placeholder="입력해주세요."
												value="${searchWord }">
										</div>
									</form>
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
											<th style="text-align: center">계약체결일자</th>
											<th style="text-align: center">예상완공일자</th>
											<th style="text-align: center">최종점검일자</th>
											<th style="text-align: center">그랜드오픈일자</th>
											<th style="text-align: center">초도물품입고</th>
											<th style="text-align: center">집기/설비</th>
											<th style="text-align: center"></th>
										</tr>
									</thead>
									<tbody id="tBody">
										<c:set value="${pagingVO.dataList }" var="planList" />
										<c:choose>
											<c:when test="${empty planList }">
												<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">일정이 존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${planList }" var="plan">
													<tr class="text-left">
													    <td style="text-align: center">${plan.rnum }</td>
														<td style="text-align: center" data-frcs-id="${plan.frcsId}">${plan.frcsName }
															<input type="hidden" class="frcsIdInput" value="${plan.frcsId}">
														</td>
														<td style="text-align: center" class="frcsCdate">
															<span class="frcsCdateText">
															<fmt:formatDate value="${plan.frcsCdate }" pattern="yyyy-MM-dd" /></span>
															<input type="date" class="frcsCdateInput" style="display: none" class="frcsCdateStr"/>
														</td>
														<td style="text-align: center" class="frcsInsdate">
															<span class="frcsInsdateText">
															<fmt:formatDate value="${plan.frcsInsdate }" pattern="yyyy-MM-dd" /></span>
															<input type="date" class="frcsInsdateInput" style="display: none" class="frcsInsdateStr"/>
														</td>
														<td style="text-align: center" class="frcsInedate">
															<span class="frcsInedateText">
															<fmt:formatDate value="${plan.frcsInedate }" pattern="yyyy-MM-dd" /></span>
															<input type="date" class="frcsInedateInput" style="display: none" class="frcsInedateStr"/>
														</td>
														<td style="text-align: center" class="frcsOpdate">
															<span class="frcsOpdateText">
															<fmt:formatDate value="${plan.frcsOpdate }" pattern="yyyy-MM-dd" /></span>
															<input type="date" class="frcsOpdateInput" style="display: none" class="frcsOpdateStr"/>
														</td>
														<td style="text-align: center">
														    <select style="display: none" class="fcmgHefcStr">
														        <option value="양호">양호</option>
														        <option value="불량">불량</option>
														    </select>
														    <span class="badge bg-success fcmgHefcText">${plan.fcmgHefc}</span>
														</td>
														<td style="text-align: center">
														    <select class="fcmgIprgstStr" style="display: none">
														        <option value="양호">양호</option>
														        <option value="불량">불량</option>
														    </select>
														    <span class="badge bg-success fcmgIprgstText">${plan.fcmgIprgst}</span>
														</td>
														<td style="text-align: center"><c:choose>
																<c:when
																	test="${not empty plan.frcsInsdate and not empty plan.frcsInsdate}">
																	<!-- 버튼 텍스트를 "수정"으로 설정 -->
																	<button type="button"
																		class="btn btn-danger btn-sm update-btn"
																		data-row-id="${plan.frcsId}">수정</button>
																</c:when>
																<c:otherwise>
																	<!-- 버튼 텍스트를 "등록"으로 설정 -->
																	<button type="button"
																		class="btn btn-info btn-sm register-btn"
																		data-frcs-id="${plan.frcsId}">등록</button>
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
    var frcsCdateInput = row.find('.frcsCdateInput');
    var frcsCdateText = row.find('.frcsCdateText');
    var frcsInsdateInput = row.find('.frcsInsdateInput');
    var frcsInsdateText = row.find('.frcsInsdateText');
    var frcsInedateInput = row.find('.frcsInedateInput');
    var frcsInedateText = row.find('.frcsInedateText');
    var frcsOpdateInput = row.find('.frcsOpdateInput');
    var frcsOpdateText = row.find('.frcsOpdateText');
    var fcmgHefcStr = row.find('.fcmgHefcStr');
    var fcmgHefcText = row.find('.fcmgHefcText');
    var fcmgIprgstStr = row.find('.fcmgIprgstStr');
    var fcmgIprgstText = row.find('.fcmgIprgstText');
    
    frcsCdateInput.show();
    frcsCdateText.hide();
    frcsInsdateInput.show();
    frcsInsdateText.hide();
    frcsInedateInput.show();
    frcsInedateText.hide();
    frcsOpdateInput.show();
    frcsOpdateText.hide();
    fcmgHefcStr.show();
    fcmgHefcText.hide();
    fcmgIprgstStr.show();
    fcmgIprgstText.hide();
    
    var frcsId = $(this).data("row-id");
    console.log(frcsId);
    
    if ($(this).text() === "저장") {
        var regCdate = frcsCdateInput.val();
        var regInsdate = frcsInsdateInput.val();
        var regInedate = frcsInedateInput.val();
        var regOpdate = frcsOpdateInput.val();
        var regHefc = fcmgHefcStr.val();
        var regIprgst = fcmgIprgstStr.val();

        var data = {
        	frcsCdate: regCdate,
        	frcsInsdate: regInsdate,
        	frcsInedate: regInedate,
        	frcsOpdate: regOpdate,
        	fcmgHefc: regHefc,
        	fcmgIprgst: regIprgst,
            frcsId: frcsId 
        }

        $.ajax({
            url: "/head/planUpdate.do",
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
                        location.href = "/head/plan.do"; 
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