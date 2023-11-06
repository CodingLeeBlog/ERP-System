<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content-page">
	<div class="content">

		<div class="container-fluid">

			<!-- start page title -->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
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
			<ul class="nav nav-tabs nav-bordered mb-3">
				<li class="nav-item"><a href="#work" data-bs-toggle="tab"
					aria-expanded="true" class="nav-link active"> <i
						class="mdi mdi-home-variant d-md-none d-block"></i> <span
						class="d-none d-md-block">근무</span>
				</a></li>
				<li class="nav-item"><a href="#" data-bs-toggle="tab"
					aria-expanded="false" class="nav-link"> <i
						class="mdi mdi-account-circle d-md-none d-block"></i> <span
						class="d-none d-md-block">퇴직</span>
				</a></li>
			</ul>


			<div class="tab-content">
				<div class="tab-pane show active" id="work">
					<div class="row">
			            <div class="col-md-6 col-xxl-3">
			                <div class="card">
			                    <div class="card-body">
			                        
<!-- 			                        <div class="dropdown float-end"> -->
<!-- 			                            <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!-- 			                                <i class="mdi mdi-dots-vertical"></i> -->
<!-- 			                            </a> -->
<!-- 			                            <div class="dropdown-menu dropdown-menu-end"> -->
<!-- 			                                <a href="javascript:void(0);" class="dropdown-item">수정</a> -->
<!-- 			                                <a href="javascript:void(0);" class="dropdown-item">삭제</a> -->
<!-- 			                                <a href="javascript:void(0);" class="dropdown-item">퇴직</a> -->
<!-- 			                            </div> -->
<!-- 			                        </div> -->
			
			                        <div class="text-center">
			                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" class="rounded-circle avatar-md img-thumbnail" alt="friend">
			                            <h4 class="mt-3 my-1"><a href="pages-profile-2.html" class="text-reset">홍길동</a></h4>
			                            <hr class="bg-dark-lighten my-2">
			                            <h5 class="mt-2 fw-semibold text-muted">총괄 매니저</h5>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cellphone me-1"></i><b>연락처 :</b> 010-1234-5678</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cake-variant me-1"></i><b>생년월일 :</b> 1990.08.01</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cash me-1"></i><b>급여 :</b> 3,000,000 원</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-badge-account-horizontal me-1"></i><b>직원코드 :</b> E23022501</p>
			                        
			                            <div class="row mt-3">
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="다운로드">
			                                    	<p class="mb-0 text-muted">보건증</p>
			                                    </a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="다운로드">
			                                    	<p class="mb-0 text-muted">이력서</p>
			                                    </a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="다운로드">
			                                    	<p class="mb-0 text-muted">재직증명서</p>
			                                    </a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div> <!-- End col -->
			
			            <div class="col-md-6 col-xxl-3">
			                <div class="card">
			                    <div class="card-body">
			
			                        <div class="text-center">
			                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg" class="rounded-circle avatar-md img-thumbnail" alt="friend">
			                            <h4 class="mt-3 my-1"><a href="pages-profile-2.html" class="text-reset">홍길동</a></h4>
			                            <hr class="bg-dark-lighten my-2">
			                            <h5 class="mt-2 fw-semibold text-muted">총괄 매니저</h5>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cellphone me-1"></i> 010-1234-5678</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cake-variant me-1"></i> 1990.08.01</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cash me-1"></i> 3,000,000 원</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-badge-account-horizontal me-1"></i> E23022501</p>
			                        
			                            <div class="row mt-3">
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="보건증"><i class="mdi mdi-hospital-box-outline"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="이력서"><i class="mdi mdi-account-box-multiple-outline"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="재직증명서"><i class="mdi mdi-file-document-multiple-outline"></i></a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div> <!-- End col -->
			
			            <div class="col-md-6 col-xxl-3">
			                <div class="card">
			                    <div class="card-body">
			
			                        <div class="text-center">
			                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-3.jpg" class="rounded-circle avatar-md img-thumbnail" alt="friend">
			                            <h4 class="mt-3 my-1"><a href="pages-profile-2.html" class="text-reset">홍길동</a></h4>
			                            <hr class="bg-dark-lighten my-2">
			                            <h5 class="mt-2 fw-semibold text-muted">총괄 매니저</h5>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cellphone me-1"></i><b>연락처 :</b> 010-1234-5678</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cake-variant me-1"></i><b>생년월일 :</b> 1990.08.01</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cash me-1"></i><b>급여 :</b> 3,000,000 원</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-badge-account-horizontal me-1"></i><b>직원코드 :</b> E23022501</p>
			                        
			                            <div class="row mt-3">
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Message"><i class="mdi mdi-message-processing-outline"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Call"><i class="mdi mdi-phone"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Email"><i class="mdi mdi-email-outline"></i></a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div> <!-- End col -->
			
			            <div class="col-md-6 col-xxl-3">
			                <div class="card">
			                    <div class="card-body">
			
			                        <div class="text-center">
			                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-4.jpg" class="rounded-circle avatar-md img-thumbnail" alt="friend">
			                            <h4 class="mt-3 my-1"><a href="pages-profile-2.html" class="text-reset">홍길동</a></h4>
			                            <hr class="bg-dark-lighten my-2">
			                            <h5 class="mt-2 fw-semibold text-muted">총괄 매니저</h5>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cellphone me-1"></i><b>연락처 :</b> 010-1234-5678</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cake-variant me-1"></i><b>생년월일 :</b> 1990.08.01</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cash me-1"></i><b>급여 :</b> 3,000,000 원</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-badge-account-horizontal me-1"></i><b>직원코드 :</b> E23022501</p>
			                        
			                            <div class="row mt-3">
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Message"><i class="mdi mdi-message-processing-outline"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Call"><i class="mdi mdi-phone"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Email"><i class="mdi mdi-email-outline"></i></a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div> <!-- End col -->
			
			            <div class="col-md-6 col-xxl-3">
			                <div class="card">
			                    <div class="card-body">
			
			                        <div class="text-center">
			                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-5.jpg" class="rounded-circle avatar-md img-thumbnail" alt="friend">
			                            <h4 class="mt-3 my-1"><a href="pages-profile-2.html" class="text-reset">홍길동</a></h4>
			                            <hr class="bg-dark-lighten my-2">
			                            <h5 class="mt-2 fw-semibold text-muted">총괄 매니저</h5>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cellphone me-1"></i><b>연락처 :</b> 010-1234-5678</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cake-variant me-1"></i><b>생년월일 :</b> 1990.08.01</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cash me-1"></i><b>급여 :</b> 3,000,000 원</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-badge-account-horizontal me-1"></i><b>직원코드 :</b> E23022501</p>
			                        
			                            <div class="row mt-3">
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Message"><i class="mdi mdi-message-processing-outline"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Call"><i class="mdi mdi-phone"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Email"><i class="mdi mdi-email-outline"></i></a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div> <!-- End col -->
			
			            <div class="col-md-6 col-xxl-3">
			                <div class="card">
			                    <div class="card-body">
			
			                        <div class="text-center">
			                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-6.jpg" class="rounded-circle avatar-md img-thumbnail" alt="friend">
			                            <h4 class="mt-3 my-1"><a href="pages-profile-2.html" class="text-reset">홍길동</a></h4>
			                            <hr class="bg-dark-lighten my-2">
			                            <h5 class="mt-2 fw-semibold text-muted">총괄 매니저</h5>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cellphone me-1"></i><b>연락처 :</b> 010-1234-5678</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cake-variant me-1"></i><b>생년월일 :</b> 1990.08.01</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cash me-1"></i><b>급여 :</b> 3,000,000 원</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-badge-account-horizontal me-1"></i><b>직원코드 :</b> E23022501</p>
			                        
			                            <div class="row mt-3">
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Message"><i class="mdi mdi-message-processing-outline"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Call"><i class="mdi mdi-phone"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Email"><i class="mdi mdi-email-outline"></i></a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div> <!-- End col -->
			
			            <div class="col-md-6 col-xxl-3">
			                <div class="card">
			                    <div class="card-body">
			
			                        <div class="text-center">
			                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-7.jpg" class="rounded-circle avatar-md img-thumbnail" alt="friend">
			                            <h4 class="mt-3 my-1"><a href="pages-profile-2.html" class="text-reset">홍길동</a></h4>
			                            <hr class="bg-dark-lighten my-2">
			                            <h5 class="mt-2 fw-semibold text-muted">총괄 매니저</h5>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cellphone me-1"></i><b>연락처 :</b> 010-1234-5678</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cake-variant me-1"></i><b>생년월일 :</b> 1990.08.01</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cash me-1"></i><b>급여 :</b> 3,000,000 원</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-badge-account-horizontal me-1"></i><b>직원코드 :</b> E23022501</p>
			                        
			                            <div class="row mt-3">
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Message"><i class="mdi mdi-message-processing-outline"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Call"><i class="mdi mdi-phone"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Email"><i class="mdi mdi-email-outline"></i></a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div> <!-- End col -->
			
			            <div class="col-md-6 col-xxl-3">
			                <div class="card">
			                    <div class="card-body">
			
			                        <div class="text-center">
			                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-8.jpg" class="rounded-circle avatar-md img-thumbnail" alt="friend">
			                            <h4 class="mt-3 my-1"><a href="pages-profile-2.html" class="text-reset">홍길동</a></h4>
			                            <hr class="bg-dark-lighten my-2">
			                            <h5 class="mt-2 fw-semibold text-muted">총괄 매니저</h5>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cellphone me-1"></i><b>연락처 :</b> 010-1234-5678</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cake-variant me-1"></i><b>생년월일 :</b> 1990.08.01</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-cash me-1"></i><b>급여 :</b> 3,000,000 원</p>
			                            <p class="mb-0 text-muted"><i class="mdi mdi-badge-account-horizontal me-1"></i><b>직원코드 :</b> E23022501</p>
			                        
			                            <div class="row mt-3">
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Message"><i class="mdi mdi-message-processing-outline"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Call"><i class="mdi mdi-phone"></i></a>
			                                </div>
			                                <div class="col-4">
			                                    <a href="javascript:void(0);" class="btn w-100 btn-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Email"><i class="mdi mdi-email-outline"></i></a>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div> <!-- End col -->
			        </div> <!-- End row -->
			
				</div>
			</div>
			
		</div>
		<!-- container -->
	</div>
	<!-- content -->

</div>