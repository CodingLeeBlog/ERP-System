<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<div class="row">

	<!-- Right Sidebar -->
	<div class="col-12">
		<div class="card">
			<div class="card-body">
				<div class="page-aside-right">

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
								class="dropdown-item" href="javascript: void(0);">Social</a> <a
								class="dropdown-item" href="javascript: void(0);">Promotions</a>
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
								class="dropdown-item" href="javascript: void(0);">Updates</a> <a
								class="dropdown-item" href="javascript: void(0);">Social</a> <a
								class="dropdown-item" href="javascript: void(0);">Promotions</a>
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
						<input type="hidden" name="tableNo" id="tableNo"
							value="${proposal.tableNo}" />
						<h5 class="font-18">
							<span class="align-baseline text-center mx-auto fs-5 text"
								style="width: 1200px;">${proposal.boardTitle}</span>
						</h5>
						<hr />

						<div class="d-flex mb-3 mt-1">
							<div class="w-100 overflow-hidden">
								<small class="float-end"> <span
									class="align-text-top text-end pe-5 fs-5 text"> <fmt:formatDate
											value="${proposal.boardRegdate}" pattern="yyyy. MM. dd" />
								</span>
								</small>
								<h6 class="m-0 font-14">
									<span class="align-baseline text-center mx-auto fs-5 text"
										style="width: 1200px;">작성자 ${proposal.memId}</span>
								</h6>
							</div>
						</div>
					</div>

					<p>
					<div class="text-center" id="boardContent">${proposal.boardContent}</div>
					</p>

					<hr />

					<div class="row">
						<div class="col-xl-4">
							<div class="card mb-1">
								<div class="p-2">
									<div id="${proposal.tableNo}">
										<c:choose>
											<c:when test="${proposal.boardState eq 'N'}">
												<form class="ps-3 pe-3" action="/head/proposalInsert.do"
													method="post" id="ansForm">
													<div class="mb-3">
														<label class="form-label">답변</label>
														<textarea class="form-control" cols="205" rows="5"
															id="ansCn1" name="ansContent">${proposal.ansContent}</textarea>
														<input type="hidden" id="tableNo" name="tableNo"
															value="${proposal.tableNo}"> <input type="hidden"
															id="memId" name="memId" value="${proposal.memId}">
														<input type="hidden" id="ansId" name="ansId"
															value="${proposal.ansId}">
													</div>
													<sec:csrfInput />
												</form>
											</c:when>
											<c:otherwise>
												<div class="m-3">
													<label class="form-label">답변</label>
													<p>${proposal.ansContent}</p>
												</div>
											</c:otherwise>
										</c:choose>
										<div>
										    <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
										    <c:choose>
										        <c:when test="${proposal.boardState eq 'N'}">
										            <button type="button" class="btn btn-primary" id="subBtn">등록</button>
										        </c:when>
										        <c:otherwise>
										            <button type="button" class="btn btn-light" id="udtBtn">수정</button>
										        </c:otherwise>
										    </c:choose>
										</div>
									</div>
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
document.addEventListener('DOMContentLoaded', function() {
    var subBtn = document.getElementById('subBtn');
    var ansForm = document.getElementById('ansForm');
    
    if (subBtn && ansForm) {
        subBtn.addEventListener('click', function() {
            ansForm.submit();
        });
    }
});
</script>
