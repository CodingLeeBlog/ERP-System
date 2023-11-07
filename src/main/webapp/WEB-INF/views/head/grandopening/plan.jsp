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
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">개점관리</a></li>
								<li class="breadcrumb-item active">개점일정계획</li>
							</ol>
						</div>
						<h4 class="page-title">개점일정계획</h4>
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
													<option selected>선택</option>
													<option value="1"
														<c:if test="${searchType eq 'frcsName' }">selected</c:if>>가맹점명</option>
													<option value="2">지역</option>
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
											value="등록">
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
											<th class="all">가맹점명</th>
											<th>계약체결일자</th>
											<th>예상완공일자</th>
											<th>최종점검일자</th>
											<th>그랜드오픈일자</th>
											<th>초도물품입고</th>
											<th>집기/설비</th>
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
														<td>${plan.frcsName }</td>
														<td><fmt:formatDate value="${plan.frcsInsdate }"
																pattern="yyyy-MM-dd" /></td>
														<td><fmt:formatDate value="${plan.frcsInedate }"
																pattern="yyyy-MM-dd" /></td>
														<td><fmt:formatDate value="${plan.frcsOpdate }"
																pattern="yyyy-MM-dd" /></td>
														<td><fmt:formatDate value="${plan.frcsCdate }"
																pattern="yyyy-MM-dd" /></td>
														<td><span class="badge bg-success">${plan.fcmgHefc }</span></td>
														<td><span class="badge bg-success">${plan.fcmgIprgst }</span></td>
<%-- 														<td><span class="badge bg-success">${plan.fcmgRemark }</span></td> --%>
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
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">가맹점명</label> <input
							type="text" class="form-control" id="recipient-name">
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">교육내역</label> <input
							type="text" class="form-control" id="recipient-name">
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">상태</label> <input
							type="text" class="form-control" id="recipient-name">
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">교육시작일</label> <input
							type="text" class="form-control" id="recipient-name">
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">교육종료일</label> <input
							type="text" class="form-control" id="recipient-name">
					</div>
					<div class="mb-3">
						<label for="recipient-name" class="col-form-label">비고</label> <input
							type="text" class="form-control" id="recipient-name">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">삭제</button>
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">목록</button>
			</div>
		</div>
	</div>
</div>

</body>
