<%@page import="kr.or.ddit.vo.head.OfficeLetterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">공문관리</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">본사의
							공문을 관리합니다.</div>
					</div>
					<div
						class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
						매장관리 > &nbsp;<span class="text-decoration-underline">공문관리</span>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<div class="row">

				<!-- Right Sidebar -->
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<!-- Left sidebar -->
							<div class="page-aside-left">
								<div class="d-grid">
									<button type="button" class="btn btn-danger"
										data-bs-toggle="modal" data-bs-target="#standard-modal">작성하기</button>
									<div id="standard-modal" class="modal fade" tabindex="-1"
										role="dialog" aria-labelledby="standard-modalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="standard-modalLabel">공문 작성</h4>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-hidden="true"></button>
												</div>
												<div class="modal-body">
													<form action="officeLetterRegister" id="letterForm"
														enctype="multipart/form-data">
														<div class="mb-3">
															<label for="sendTitle" class="form-label">공문명</label> <input
																type="text" id="sendTitle" name="hdLttitle"
																class="form-control">
														</div>
														<div class="mb-3">
															<label for="sendContent" class="form-label">공문 내용</label>
															<textarea class="form-control" name="hdLtcontent"
																rows="5" id="sendContent"></textarea>
														</div>
														<div class="mb-3">
															<label for="sendFile" class="form-label">파일</label> <input
																type="file" id="sendFile" class="form-control">
														</div>
													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-light"
														data-bs-dismiss="modal">취소</button>
													<button type="button" class="btn btn-primary" id="saveBtn">저장</button>
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
								</div>
								<div class="email-menu-list mt-3">
									<a href="/head/officeLetterRead.do" class="text-danger fw-bold"><i
										class="ri-star-line me-2"></i>수신함<span
										class="badge badge-danger-lighten float-end ms-2">${totalRecord }</span></a>
									<a href="/head/officeLetter.do"><i
										class="ri-inbox-line me-2"></i>발신함</a>
								</div>

							</div>
							<!-- End Left sidebar -->

							<div class="page-aside-right">
								<div class="col-sm-5">
									<form
										class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between"
										id="searchForm">
										<input type="hidden" id="page" name="page">
										<div class="col-auto">
											<div class="d-flex align-items-center">
												<select class="form-select" name="searchType"
													id="searchType">
													<option value="menuName"
														<c:if test="${searchType eq 'title' }">selected</c:if>>공문명</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<label for="inputPassword2" class="visually-hidden">검색</label>
											<input type="text" class="form-control" id="searchWord"
												name="searchWord" placeholder="제목을 입력하세요."
												value="${searchWord }">
										</div>
									</form>
								</div>
								<br />
								<div class="btn-group">
									<button type="button" class="btn btn-secondary">
										<i class="mdi mdi-archive font-16"></i>
									</button>
									<button type="button" class="btn btn-secondary">
										<i class="mdi mdi-alert-octagon font-16"></i>
									</button>
									<button type="button" class="btn btn-secondary">
										<i class="mdi mdi-delete-variant font-16"></i>
									</button>
								</div>
								<div class="btn-group">
									<button type="button"
										class="btn btn-secondary dropdown-toggle arrow-none"
										data-bs-toggle="dropdown" aria-expanded="false">
										<i class="mdi mdi-folder font-16"></i> <i
											class="mdi mdi-chevron-down"></i>
									</button>
									<div class="dropdown-menu">
										<span class="dropdown-header">Move to:</span> <a
											class="dropdown-item" href="javascript: void(0);">Social</a>
										<a class="dropdown-item" href="javascript: void(0);">Promotions</a>
										<a class="dropdown-item" href="javascript: void(0);">Updates</a>
										<a class="dropdown-item" href="javascript: void(0);">Forums</a>
									</div>
								</div>
								<div class="btn-group">
									<button type="button"
										class="btn btn-secondary dropdown-toggle arrow-none"
										data-bs-toggle="dropdown" aria-expanded="false">
										<i class="mdi mdi-label font-16"></i> <i
											class="mdi mdi-chevron-down"></i>
									</button>
									<div class="dropdown-menu">
										<span class="dropdown-header">Label as:</span> <a
											class="dropdown-item" href="javascript: void(0);">Updates</a>
										<a class="dropdown-item" href="javascript: void(0);">Social</a>
										<a class="dropdown-item" href="javascript: void(0);">Promotions</a>
										<a class="dropdown-item" href="javascript: void(0);">Forums</a>
									</div>
								</div>

								<div class="btn-group">
									<button type="button"
										class="btn btn-secondary dropdown-toggle arrow-none"
										data-bs-toggle="dropdown" aria-expanded="false">
										<i class="mdi mdi-dots-horizontal font-16"></i> More <i
											class="mdi mdi-chevron-down"></i>
									</button>
									<div class="dropdown-menu">
										<span class="dropdown-header">More Options :</span> <a
											class="dropdown-item" href="javascript: void(0);">Mark as
											Unread</a> <a class="dropdown-item" href="javascript: void(0);">Add
											to Tasks</a> <a class="dropdown-item" href="javascript: void(0);">Add
											Star</a> <a class="dropdown-item" href="javascript: void(0);">Mute</a>
									</div>
								</div>

								<div class="mt-3">
									<table class="table table-centered w-100 dt-responsive nowrap"
										id="products-datatable">
										<thead class="table-light">
											<tr>
												<th></th>
												<th class="all">문서번호</th>
												<th>제목</th>
<!-- 												<th>지점명</th> -->
												<th>발송일</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody id="tBody">
											<c:set value="${pagingVOF.dataList }" var="frcsOfldcList" />
											<c:choose>
												<c:when test="${empty frcsOfldcList }">
													<tr class="text-center">
														<td colspan="5" class="text-dark font-weight-bolder">문서가
															존재하지 않습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${frcsOfldcList}" var="frcsOfldc">
														<tr class="text-left">
															<td><input type="checkbox" class="form-check-input"
																id="mail1"></td>
															<td id="frcsOfldcNo">${frcsOfldc.frcsOfldcNo }</td>
															<td><a
																href="/head/readDetail.do?frcsOfldcNo=${frcsOfldc.frcsOfldcNo}"
																class="email-subject"> ${frcsOfldc.frcsOfldcTtl } </a></td>
<%-- 															<td>${frcsOfldc.frcsOfldcSndpty }</td> --%>
															<td><fmt:formatDate
																	value="${frcsOfldc.frcsOfldcDspymd }"
																	pattern="yyyy-MM-dd" /></td>
															<td>
																<button type="button"
																	class="btn btn-danger btn-sm delBtn"
																	data-hdltno="${frcsOfldc.frcsOfldcNo }">삭제</button>
															</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
								<!-- end .mt-4 -->

								<div class="clearfix"></div>
							</div>
							<!-- end card-box -->
							<div class="row">
								<div class="col-20">
									<nav aria-label="Page navigation example" id="pagingArea">${pagingVO.pagingHTML }</nav>
								</div>
							</div>
						</div>
						<!-- end Col -->
					</div>
					<!-- End row -->
					<!-- end col-->
				</div>
				<!-- container -->
			</div>
			<!-- content -->
		</div>
	</div>
</div>

<script type="text/javascript">
$(function() {
	var infoHeaderModal = $("#info-header-modal"); // 상세보기 모달 id
	var saveBtn = $("#saveBtn");
	
	
	pagingArea.on("click", "a", function(event) {
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});


</script>