<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="content-page">
	<div class="content">

		<div class="container-fluid">

			<!-- start page title -->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a>
								</li>
								<li class="breadcrumb-item"><a href="javascript: void(0);">직원관리</a></li>
								<li class="breadcrumb-item active">조직관리</li>
							</ol>
						</div>
						<h4 class="page-title">조직관리</h4>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<!-- 탭 -->
			<ul class="nav nav-tabs nav-bordered mb-3 position-relative">
				<li class="nav-item">
					<a href="#work" data-bs-toggle="tab" aria-expanded="true" class="nav-link active">
						<i class="mdi mdi-home-variant d-md-none d-block"></i>
						<span class="d-none d-md-block">근무</span>
					</a>
				</li>
				<li class="nav-item">
					<a href="#resign" data-bs-toggle="tab" aria-expanded="false" class="nav-link">
						<i class="mdi mdi-account-circle d-md-none d-block"></i>
						<span class="d-none d-md-block">퇴직</span>
					</a>
				</li>
				<li class="position-absolute top-0 end-0">
					<button type="button" class="btn btn-light me-2" id="delBtn">
						<i class="mdi mdi-minus-circle me-2"></i>삭제
					</button>
					<button type="button" class="btn btn-primary " data-bs-toggle="modal"
						data-bs-target="#register">
						<i class="mdi mdi-plus-circle me-2"></i>새직원 등록
					</button>
				</li>
			</ul>

			<!-- 근무탭 --------------------------------------------------------------------------------- -->
			<div class="tab-content">
				<div class="tab-pane show active" id="work">
					<div class="row">

						<!-- 근무중인 직원 -->
						<c:set value="${empList }" var="empList" />
						<c:forEach items="${empList }" var="emp">
							<c:if test="${emp.frcsEmpYn eq 'Y'}">
								<div class="col-md-6 col-xxl-3">
									<div class="card">
										<div class="card-body">

											<div class="form-check">
												<input type="checkbox" class="form-check-input"
													id="check${emp.frcsEmpCd }" name="checkbox"
													value="${emp.frcsEmpCd }">
												<label class="form-check-label"
													for="check${emp.frcsEmpCd }">&nbsp;</label>
											</div>

											<div class="text-center">
												<div>
													<a href="" class="text-body" data-bs-toggle="modal"
														data-bs-target="#detail${emp.frcsEmpCd }">
														<img src="${pageContext.request.contextPath }${emp.empImg1}"
															class="rounded-circle avatar-md img-thumbnail"
															alt="friend"></a>
												</div>
												<h4 class="mt-3 my-1">
													<a href="" class="text-body" data-bs-toggle="modal"
														data-bs-target="#detail${emp.frcsEmpCd }">${emp.frcsEmpNm}</a>
												</h4>
												<hr class="bg-dark-lighten my-2">
												<h5 class="mt-2 fw-semibold text-muted">
													${emp.frcsEmpRspofc }</h5>
												
												<div class="d-flex justify-content-center">
													<div>
														<p class="mb-0 text-muted text-start">
															<i class="mdi mdi-cellphone me-1"></i><b>연락처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b> &nbsp;&nbsp;${emp.frcsEmpTelno }
														</p>
														<p class="mb-0 text-muted text-start">
															<i class="mdi mdi-cake-variant me-1"></i><b>생년월일&nbsp;&nbsp;:</b>
															 &nbsp;&nbsp;<fmt:formatDate value="${emp.frcsEmpBrdt }" pattern="yyyy-MM-dd" />
														</p>
														<p class="mb-0 text-muted text-start">
															<i class="mdi mdi-cash me-1"></i><b>급여&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b>
															 &nbsp;&nbsp;<fmt:formatNumber value="${emp.frcsEmpSalary }" pattern="#,###,###"/> 원
														</p>
														<p class="mb-0 text-muted text-start">
															<i class="mdi mdi-badge-account-horizontal me-1"></i><b>직원코드&nbsp;&nbsp;:</b> &nbsp;&nbsp;${emp.frcsEmpCd }
														</p>
													</div>
												</div>	

												<div class="row mt-3">
													<div class="col-4">
														<a href="${pageContext.request.contextPath }/owner/empDownload.do?attachFile=${emp.empImg2}"
															target="blank" data-attach-no=""
															class="btn w-100 btn-light fileDownload"
															data-bs-toggle="tooltip"
															data-bs-placement="top" title="보건증"><i
																class="mdi mdi-hospital-box-outline"></i></a>
													</div>
													<div class="col-4">
														<a href="${pageContext.request.contextPath }/owner/empDownload.do?attachFile=${emp.empImg3}"
															class="btn w-100 btn-light fileDownload"
															data-bs-toggle="tooltip"
															data-bs-placement="top" title="이력서"><i
																class="mdi mdi-account-box-multiple-outline"></i></a>
													</div>
													<div class="col-4">
														<a href="${pageContext.request.contextPath }/owner/empDownload.do?attachFile=${emp.empImg4}"
															class="btn w-100 btn-light fileDownload"
															data-bs-toggle="tooltip"
															data-bs-placement="top" title="재직증명서"><i
																class="mdi mdi-file-document-multiple-outline"></i></a>
													</div>
												</div>
											</div>

										</div>
									</div>
								</div> <!-- End col -->
							</c:if>
						</c:forEach>

					</div> <!-- End row -->
				</div>
			</div>

			<!-- 퇴직탭 ---------------------------------------------------------------------------------- -->
			<div class="tab-content">
				<div class="tab-pane show" id="resign">
					<div class="row">

						<!-- 퇴직한 직원 -->
						<c:forEach items="${empList }" var="emp">
							<c:if test="${emp.frcsEmpYn eq 'N'}">
								<div class="col-md-6 col-xxl-3">
									<div class="card">
										<div class="card-body">

											<div class="form-check">
												<input type="checkbox" class="form-check-input"
													id="check${emp.frcsEmpCd }" name="checkbox"
													value="${emp.frcsEmpCd }">
												<label class="form-check-label"
													for="check${emp.frcsEmpCd }">&nbsp;</label>
											</div>

											<div class="text-center">
												<div>
													<a href="" class="text-body" data-bs-toggle="modal"
														data-bs-target="#detail${emp.frcsEmpCd }">
														<img src="${pageContext.request.contextPath }${emp.empImg1}"
															class="rounded-circle avatar-md img-thumbnail"
															alt="friend"></a>
												</div>
												<h4 class="mt-3 my-1">
													<a href="" class="text-body" data-bs-toggle="modal"
														data-bs-target="#detail${emp.frcsEmpCd }">${emp.frcsEmpNm}</a>
												</h4>
												<hr class="bg-dark-lighten my-2">
												<h5 class="mt-2 fw-semibold text-muted">
													${emp.frcsEmpRspofc }</h5>
													
												<div class="d-flex justify-content-center">
													<div>
														<p class="mb-0 text-muted text-start">
															<i class="mdi mdi-cellphone me-1"></i><b>연락처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b> &nbsp;&nbsp;${emp.frcsEmpTelno }
														</p>
														<p class="mb-0 text-muted text-start">
															<i class="mdi mdi-cake-variant me-1"></i><b>생년월일&nbsp;&nbsp;:</b>
															 &nbsp;&nbsp;<fmt:formatDate value="${emp.frcsEmpBrdt }" pattern="yyyy-MM-dd" />
														</p>
														<p class="mb-0 text-muted text-start">
															<i class="mdi mdi-cash me-1"></i><b>급여&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</b>
															 &nbsp;&nbsp;<fmt:formatNumber value="${emp.frcsEmpSalary }" pattern="#,###,###"/> 원
														</p>
														<p class="mb-0 text-muted text-start">
															<i class="mdi mdi-badge-account-horizontal me-1"></i><b>직원코드&nbsp;&nbsp;:</b> &nbsp;&nbsp;${emp.frcsEmpCd }
														</p>
													</div>
												</div>	

												<div class="row mt-3">
													<div class="col-4">
														<a href="${pageContext.request.contextPath }/owner/empDownload.do?attachFile=${emp.empImg2}"
															target="blank" data-attach-no=""
															class="btn w-100 btn-light fileDownload"
															data-bs-toggle="tooltip"
															data-bs-placement="top" title="보건증"><i
																class="mdi mdi-hospital-box-outline"></i></a>
													</div>
													<div class="col-4">
														<a href="${pageContext.request.contextPath }/owner/empDownload.do?attachFile=${emp.empImg3}"
															class="btn w-100 btn-light fileDownload"
															data-bs-toggle="tooltip"
															data-bs-placement="top" title="이력서"><i
																class="mdi mdi-account-box-multiple-outline"></i></a>
													</div>
													<div class="col-4">
														<a href="${pageContext.request.contextPath }/owner/empDownload.do?attachFile=${emp.empImg4}"
															class="btn w-100 btn-light fileDownload"
															data-bs-toggle="tooltip"
															data-bs-placement="top" title="재직증명서"><i
																class="mdi mdi-file-document-multiple-outline"></i></a>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div> <!-- End col -->
							</c:if>
						</c:forEach>

					</div> <!-- End row -->
				</div>
			</div>

			<!-- 직원 상세보기/수정 모달 ------------------------------------------------------------------------- -->
			<c:forEach items="${empList }" var="emp">
				<div class="modal fade" id="detail${emp.frcsEmpCd }" tabindex="-1" role="dialog"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">

							<div class="modal-header">
								<h4 class="modal-title" id="myCenterModalLabel">${emp.frcsEmpNm } 직원
									상세정보</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-hidden="true"></button>
							</div>

							<form action="/owner/empUpdate.do" id="udtForm" method="post" enctype="multipart/form-data">
								<div class="modal-body" id="modal">
									<input id="frcsEmpCdD" name="frcsEmpCd" class="form-control"
										type="hidden" value="${emp.frcsEmpCd }">
									<input id="" name="frcsId" class="form-control"
										type="hidden" value="${emp.frcsId }">
									<input id="" name="tableName" class="form-control"
										type="hidden" value="${emp.tableName }">

									<!-- 프로필이미지 영역 -->
									<div class="mt-2 mb-3 d-flex justify-content-center">
										<img src="${pageContext.request.contextPath }${emp.empImg1}"
											id="profileImgD"
											class="rounded-circle avatar-lg img-thumbnail">
									</div>

									<div class="row mb-2">
										<label class="col-3 col-form-label">프로필이미지</label>
										<div class="col-9">
											<input id="frcsEmpProfileimgD" name="boFile1"
												class="form-control" type="file" value="">
										</div>
									</div>
									<!-- 프로필이미지 영역 끝-->

									<div class="row mb-2">
										<label class="col-3 col-form-label">이름</label>
										<div class="col-9">
											<input id="frcsEmpNmD" name="frcsEmpNm" type="text"
												value="${emp.frcsEmpNm }" class="form-control-plaintext"
												readonly>
										</div>
									</div>

									<div class="row mb-2">
										<label for="example-select"
											class="col-3 col-form-label">직책</label>
										<div class="col-9">
											<input id="frcsEmpRspofcD" name="frcsEmpRspofc" type="text"
												value="${emp.frcsEmpRspofc }"
												class="form-control-plaintext" readonly>
										</div>
									</div>

									<div class="row mb-2">
										<label class="col-3 col-form-label">연락처</label>
										<div class="col-9">
											<input id="frcsEmpTelnoD" name="frcsEmpTelno" type="text"
												value="${emp.frcsEmpTelno }"
												class="form-control-plaintext" readonly
												data-toggle="input-mask"
												data-mask-format="000-0000-0000"
												placeholder="000-0000-0000" maxlength="13">
										</div>
									</div>

									<div class="row mb-2">
										<label for="example-date"
											class="col-3 col-form-label">생년월일</label>
										<div class="col-9">
											<input id="frcsEmpBrdtD" name="frcsEmpBrdt" type="text" value=<fmt:formatDate value='${emp.frcsEmpBrdt }' pattern='yyyy-MM-dd' /> class="form-control-plaintext" readonly >
										</div>
									</div>

									<div class="row mb-2">
										<label for="salary" class="col-3 col-form-label">급여</label>
										<div class="col-9 ">
											<input id="frcsEmpSalaryD" name="frcsEmpSalary" type="text"
												value="${emp.frcsEmpSalary }"
												class="form-control-plaintext" readonly>
										</div>
									</div>

									<div class="row mb-2">
										<label for="example-select"
											class="col-3 col-form-label">근무여부</label>
										<div class="col-9">
											<c:if test="${emp.frcsEmpYn eq 'Y' }">
												<input id="frcsEmpYnD" name="frcsEmpYn" type="text"
													value="근무" class="form-control-plaintext" readonly>
											</c:if>
											<c:if test="${emp.frcsEmpYn eq 'N' }">
												<input id="frcsEmpYnD" name="frcsEmpYn" type="text"
													value="퇴직" class="form-control-plaintext" readonly>
											</c:if>
										</div>
									</div>

									<!-- 보건증 파일 영역 -->
									<div class="row mb-2">
										<label class="col-3 col-form-label">보건증</label>
										<div class="col-9">
											<input id="tableNameD1" name="boFile2"
												class="form-control" type="file" value="">
										</div>
									</div>
<!-- 									저장된 파일 보이기 -->
<!-- 									<div class="mailbox-attachment-info empFile"> -->
<%-- 										<a class="mailbox-attachment-name"><i class="mdi mdi-paperclip"></i>${emp.empImg2}</a> --%>
<%-- 											<span class="btn btn-default float-right attachmentFileDel" id="span_${emp.frcsEmpCd }"> --%>
<!-- 												<i class="mdi mdi-delete-forever-outline"></i> -->
<!-- 											</span> -->
<!-- 									</div> -->
									<!-- 보건증 파일 영역 끝 -->
									
									<!-- 이력서 파일 영역 -->
									<div class="row mb-2">
										<label class="col-3 col-form-label">이력서</label>
										<div class="col-9">
											<input id="tableNameD2" name="boFile3"
												class="form-control" type="file" value="">
										</div>
									</div>
<!-- 									저장된 파일 보이기 -->
<!-- 									<div class="mailbox-attachment-info empFile"> -->
<%-- 										<a class="mailbox-attachment-name"><i class="mdi mdi-paperclip"></i>${emp.empImg2}</a> --%>
<%-- 											<span class="btn btn-default float-right attachmentFileDel" id="span_${emp.frcsEmpCd }"> --%>
<!-- 												<i class="mdi mdi-delete-forever-outline"></i> -->
<!-- 											</span> -->
<!-- 									</div> -->
									<!-- 이력서 파일 영역 끝 -->

									<!-- 재직증명서 파일 영역 -->
									<div class="row mb-2">
										<label class="col-3 col-form-label">재직증명서</label>
										<div class="col-9">
											<input id="tableNameD3" name="boFile4"
												class="form-control" type="file" value="">
										</div>
									</div>
<!-- 									저장된 파일 보이기 -->
<!-- 									<div class="mailbox-attachment-info empFile"> -->
<%-- 										<a class="mailbox-attachment-name"><i class="mdi mdi-paperclip"></i>${emp.empImg2}</a> --%>
<%-- 											<span class="btn btn-default float-right attachmentFileDel" id="span_${emp.frcsEmpCd }"> --%>
<!-- 												<i class="mdi mdi-delete-forever-outline"></i> -->
<!-- 											</span> -->
<!-- 									</div> -->
									<!-- 재직증명서 파일 영역 끝 -->
									

								</div>
								<sec:csrfInput />
							</form>

							<div class="modal-footer">
								<button type="button" class="btn btn-light"
									data-bs-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-light" id="udtBtn"
									onclick="fUp('detail${emp.frcsEmpCd}')">수정</button>
								<button type="button" class="btn btn-light" id="regBtn"
									style="display:none"
									onclick="fSv('detail${emp.frcsEmpCd}')">저장</button>
							</div>

						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<input type="hidden" id="frcsEmpCd" name="frcsEmpCd" value="${empVO.frcsEmpCd }">
			</c:forEach>

			<!-- 새직원 등록 모달 ------------------------------------------------------------------------- -->
			<div class="modal fade" id="register" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">

						<div class="modal-header">
							<h4 class="modal-title" id="myCenterModalLabel">새직원 등록</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-hidden="true"></button>
						</div>

						<div class="modal-body" id="modal">
							<form class="ps-3 pe-3" action="/owner/empInsert.do" method="post"
								id="regForm" enctype="multipart/form-data">

								<div class="mt-2 mb-3 d-flex justify-content-center">
									<img id="profileImgR"
										class="rounded-circle avatar-lg img-thumbnail">
								</div>

								<div class="row mb-2">
									<label class="col-3 col-form-label">프로필이미지</label>
									<div class="col-9">
										<!-- 										<input class="form-control" type="file" id="frcsEmpProfileimgR" name="frcsEmpProfileimg"> -->
										<input class="form-control" type="file" id="frcsEmpProfileimgR"
											name="boFile1">
									</div>
								</div>

								<div class="row mb-2">
									<label class="col-3 col-form-label">이름</label>
									<div class="col-9">
										<input id="frcsEmpNmR" name="frcsEmpNm" type="text"
											class="form-control" >
									</div>
								</div>

								<div class="row mb-2">
									<label for="example-select" class="col-3 col-form-label">직책</label>
									<div class="col-9">
										<select class="form-select" id="frcsEmpRspofcR"
											name="frcsEmpRspofc">
											<option>총괄매니저</option>
											<option>매니저</option>
											<option>아르바이트</option>
										</select>
									</div>
								</div>

								<div class="row mb-2">
									<label class="col-3 col-form-label">연락처</label>
									<div class="col-9">
										<input id="frcsEmpTelnoR" name="frcsEmpTelno" type="text"
											class="form-control" data-toggle="input-mask"
											data-mask-format="000-0000-0000" placeholder="000-0000-0000"
											maxlength="13">
									</div>
								</div>

								<div class="row mb-2">
									<label for="frcsEmpBrdt" class="col-3 col-form-label">생년월일</label>
									<div class="col-9">
										<input class="form-control" type="date" id="frcsEmpBrdtR"
											name="frcsEmpBrdt">
									</div>
								</div>

								<div class="row mb-2">
									<label for="salary" class="col-3 col-form-label">급여</label>
									<div class="col-9 ">
										<div class="input-group input-group-merge">
											<input id="frcsEmpSalaryR" name="frcsEmpSalary" type="text"
												class="form-control">
											<div class="input-group-text" data-password="false">
												<span>원</span>
											</div>
										</div>
									</div>
								</div>

								<div class="row mb-2">
									<label for="example-select"
										class="col-3 col-form-label">근무여부</label>
									<div class="col-9">
										<select class="form-select" id="frcsEmpYnR" name="frcsEmpYn">
											<option value="Y">근무</option>
											<option value="N">퇴직</option>
										</select>
									</div>
								</div>

								<div class="row mb-2">
									<label class="col-3 col-form-label">보건증</label>
									<div class="col-9">
										<input class="form-control" type="file" id="tableNameR1"
											name="boFile2">
									</div>
								</div>

								<div class="row mb-2">
									<label class="col-3 col-form-label">이력서</label>
									<div class="col-9">
										<input class="form-control" type="file" id="tableNameR2"
											name="boFile3">
									</div>
								</div>

								<div class="row mb-2">
									<label class="col-3 col-form-label">재직증명서</label>
									<div class="col-9">
										<input class="form-control" type="file" id="tableNameR3"
											name="boFile4">
									</div>
								</div>

								<sec:csrfInput />
							</form>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-light" id="autoBtn">직원자동생성</button>
							<button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-light" id="subBtn">등록</button>
						</div>

					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

		</div>
		<!-- container -->
	</div>
	<!-- content -->

</div>

<script type="text/javascript">

	// 전역 함수
	// 수정
	function  fUp(pId) {

		// 모달 루트 설정?!
		let modalRoot = document.querySelector("#"+pId);
// 		console.log("체킁킁", modalRoot);
		// modalRoot에 있는 input 요소의 readonly 속성을 제거
		var inputElements = modalRoot.querySelectorAll('.form-control-plaintext');
		inputElements.forEach(function (inputElement) {
			// class 속성을 변경하여 form-control로 변경
			inputElement.classList.remove('form-control-plaintext');
			inputElement.classList.add('form-control');
			// readonly 속성 제거
			inputElement.removeAttribute('readonly');
		});

		// 직책
		// 새로운 <select> 엘리먼트 생성
		var frcsEmpRspofc = modalRoot.querySelector('#frcsEmpRspofcD');
		var selectElement = document.createElement('select');
		selectElement.className = 'form-select';
		selectElement.id = 'frcsEmpRspofcR';
		selectElement.name = 'frcsEmpRspofc';
		selectElement.value = frcsEmpRspofc.value;

		// <select> 엘리먼트에 옵션 추가
		var options = ['총괄매니저', '매니저', '아르바이트'];
		for (var i = 0; i < options.length; i++) {
			var option = document.createElement('option');
			option.value = options[i];
			option.text = options[i];
			selectElement.appendChild(option);
		}

		// 기존의 <input> 엘리먼트를 찾아 교체
		var inputElement = modalRoot.querySelector('#frcsEmpRspofcD');
		var parentElement = inputElement.parentElement;
		parentElement.replaceChild(selectElement, inputElement);

		// 생년월일
		var frcsEmpBrdtD = modalRoot.querySelector("#frcsEmpBrdtD");
		frcsEmpBrdtD.type = "date";

		// 급여
		// frcsEmpSalaryD 요소를 가져옵니다
		var frcsEmpSalaryD = modalRoot.querySelector("#frcsEmpSalaryD");

		// frcsEmpSalaryR 요소를 만들기
		var inputGroupDiv = document.createElement("div");
		inputGroupDiv.className = "input-group input-group-merge";

		var salaryElement = document.createElement("input");
		salaryElement.id = "frcsEmpSalaryR";
		salaryElement.name = "frcsEmpSalary";
		salaryElement.type = "text";
		salaryElement.className = "form-control";
		salaryElement.value = frcsEmpSalaryD.value;

		var inputGroupTextDiv = document.createElement("div");
		inputGroupTextDiv.className = "input-group-text";
		inputGroupTextDiv.setAttribute("data-password", "false");

		var spanElement = document.createElement("span");
		spanElement.textContent = "원";

		// 생성된 요소들을 조합하여 DOM에 추가합니다
		inputGroupTextDiv.appendChild(spanElement);
		inputGroupDiv.appendChild(salaryElement);
		inputGroupDiv.appendChild(inputGroupTextDiv);

		// frcsEmpSalaryD 요소를 대체합니다
		frcsEmpSalaryD.parentNode.replaceChild(inputGroupDiv, frcsEmpSalaryD);

		// 근무여부
		// frcsEmpYnD 요소를 가져옵니다
		var frcsEmpYnD = modalRoot.querySelector("#frcsEmpYnD");

		// frcsEmpYnR 요소를 만들기
		var selectElement2 = document.createElement("select");
		selectElement2.className = "form-select";
		selectElement2.id = "frcsEmpYnR";
		selectElement2.name = "frcsEmpYn";

		// 옵션 요소들을 생성하여 추가합니다
		var options2 = [
			{ value: "Y", text: "근무" },
			{ value: "N", text: "퇴직" }
		];

		options2.forEach(function (option) {
			var option2 = document.createElement("option");
			option2.value = option.value;
			option2.textContent = option.text;
			selectElement2.appendChild(option2);
		});

		// frcsEmpYnD 요소를 대체합니다
		frcsEmpYnD.parentNode.replaceChild(selectElement2, frcsEmpYnD);

		// 수정버튼 숨기기
		var udtBtn2 = modalRoot.querySelector("#udtBtn");
		udtBtn2.style.display = 'none';

		// 저장버튼 나타내기
		var regBtn2 = modalRoot.querySelector("#regBtn");
		regBtn2.style.display = 'block';
	};

	function  fSv(pId) {
		let modalRoot = document.querySelector("#"+pId);
		var udtForm=modalRoot.querySelector("#udtForm");
		udtForm.submit();
	}

	$(function () {
		var subBtn = $("#subBtn");
		//	var udtBtn = $("#udtBtn");
		var delBtn = $("#delBtn");
		var regBtn = $("#regBtn");
		var regForm = $("#regForm");
// 		var udtForm = $("#udtForm");
		var autoBtn = $("#autoBtn");

		// 자동완성버튼
		autoBtn.on('click', function () {
			console.log("클릭");
			$("#frcsEmpNmR").val("이직원");
			$("#frcsEmpRspofcR").val("매니저");
			$("#frcsEmpTelnoR").val("010-1234-5678");
			$("#frcsEmpBrdtR").val("1996-11-17");
			$("#frcsEmpSalaryR").val(300000);
			$("#frcsEmpYnR").val("Y");
		});

		// 새직원 등록 파일선택
		var imgFile = $("#frcsEmpProfileimgR"); // 파일 선택 Element
		imgFile.on("change", function (event) {
			var file = event.target.files[0];

			if (isImageFile(file)) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$("#profileImgR").attr("src", e.target.result);
				}
				reader.readAsDataURL(file);
			} else {
				alert("이미지 파일을 선택해주세요!")
			}
		});

		// 직원 수정 파일선택
		var imgFile = $("#frcsEmpProfileimgD"); // 파일 선택 Element
		imgFile.on("change", function (event) {
			var file = event.target.files[0];

			if (isImageFile(file)) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$("#profileImgD").attr("src", e.target.result);
				}
				reader.readAsDataURL(file);
			} else {
				alert("이미지 파일을 선택해주세요!")
			}
		});

		// 등록
		subBtn.on("click", function () {
			
			Swal.fire({
		      title: '알림창',
		      icon: 'success',
		      text: '등록이 완료되었습니다!',
		    }).then((result) => {
	            if (result.isConfirmed) {
	            	regForm.submit();
	                    }
	          });
		});


		// 수정>저장 업데이트
// 		regBtn.on('click', function () {
// 			udtForm.submit();
// 		});

		// 선택 삭제
		delBtn.on('click', function () {
			var selectedItems = [];

			$("input:checkbox[name='checkbox']:checked").each(function () {
				selectedItems.push({ frcsEmpCd: $(this).val() });
			});

			if (selectedItems.length > 0) {
				$.ajax({
					type: "POST",
					url: "/owner/empDelete.do",
					beforeSend: function (xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
					},
					data: JSON.stringify(selectedItems),
					contentType: "application/json;charset=UTF-8",
					success: function (response) {
						
						Swal.fire({
						      title: '삭제 완료',
						      icon: 'success',
						      text: '삭제가 완료되었습니다!',
						    }).then((result) => {
					            if (result.isConfirmed) {
					            	location.reload();
					                    }
					          });
					},
					error: function (error) {

						Swal.fire({
							title: '삭제 실패',
						    icon: 'error',
						    text: '다시 시도해주세요!'
						}).then((result) => {
				            if (result.isConfirmed) {
				            	location.reload();
				                    }
				          });
					}
				});
			} else {
				alert("삭제할 직원을 선택하세요.");
			}

		});

		// 파일 다운로드
		// 	$(".fileDownload").on("click", function() {
		// 		var attachNo = $(this).data("attach-no");

		// 		location.href = "/owner/empDownload.do?attachNo=" + attachNo;
		// 	});
		
// 		$(".attachmentFileDel").on("click", function(){
// 			var id = $(this).prop("id");
// 			var idx = id.indexOf("_");
// 			var empFileNo = id.substring(idx + 1);
// 			var ptrn = "<input type='text' name='delEmpNo' value='%V' hidden='hidden'/>";
// 			$("#udtForm").append(ptrn.replace("%V", delEmpNo));
// 			$(this).parents(".empFile").hide();	// x를 누른녀석이 사라져야되니까 hide해주자
// 		});
		
		
	});

	//이미지 파일인지 체크
	function isImageFile(file) {
		var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 꺼낸다
		return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1 ? false : true);
	}
</script>