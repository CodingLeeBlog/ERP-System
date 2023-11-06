<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height: 110px;">
				<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">거래처발주</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">거래처에게
							제품을 발주합니다.</div>
					</div>
					<div
						class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						매입내역관리 / &nbsp;<span class="text-decoration-underline">발주</span>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">

							<div class="row">
								<div class="col-12">
									<div class="card">
										<div class="card-body">

											<!-- Checkout Steps -->
											<ul class="nav nav-pills bg-nav-pills nav-justified mb-3">
												<li class="nav-item"><a href="#billing-information"
													data-bs-toggle="tab" aria-expanded="false"
													class="nav-link rounded-0 active"> <i
														class="mdi mdi-account-circle font-18"></i> <span
														class="d-none d-lg-block">발주하실 거래처를 선택 후 제품명을
															클릭하세요.</span>
												</a></li>
											</ul>

											<!-- Steps Information -->
											<div class="tab-content">

												<!-- Billing Content-->
												<div class="tab-pane show active" id="billing-information">
													<div class="row">
														<div class="col-lg-12">

															<form>
																<div class="row">
																	<div class="col-12">
																		<div class="mb-3">
																			<label class="form-label">거래처명</label> <select
																				data-toggle="select2" title="vendor">
																				<option value="0">선택하세요</option>
																				<option value="1">수산팜</option>
																				<option value="2">비비마트</option>
																				<option value="3">훈훈수산</option>
																				<option value="4">청수식품</option>
																			</select>
																		</div>
																	</div>
																</div>
																<!-- end row -->
																<div class="row">
																	<div class="col-md-12">
																		<div class="mb-6">
																			<label data-bs-toggle="collapse"
																				href="#inventoryName" role="button"
																				class="form-label" aria-expanded="false"
																				aria-controls="multiCollapseExample1">제품명</label>
																			<!-- <p class="form-control" type="text" placeholder="Enter your first name" id="billing-first-name"></p> -->
																		</div>
																	</div>
																	<!--거래처의 제품명을 아래 div요소 ... 안에 넣어주면 된다-->
																	<div class="row">
																		<div class="col">
																			<div class="collapse multi-collapse"
																				id="inventoryName">
																				<div class="card card-body mb-0">...</div>
																			</div>
																		</div>
																	</div>
																	<!-- end row-->
																</div>
																<!-- end row -->
																<div class="row">
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-email-address" class="form-label">이메일
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="email"
																				placeholder="bark33@naver.com"
																				id="billing-email-address" />
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-phone" class="form-label">Phone
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="text"
																				placeholder="1588-3819" id="billing-phone" />
																		</div>
																	</div>
																</div>
																<!-- end row -->
																<div class="row">
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-email-address" class="form-label">우편번호
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="email"
																				placeholder="13561" id="billing-email-address" />
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-phone" class="form-label">주소
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="text"
																				placeholder="경기도 성남시 분당구 정자일로 95" id="billing-phone" />
																		</div>
																	</div>
																</div>
																<!-- end row -->
																<div class="row">
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-email-address" class="form-label">담당자
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="email"
																				placeholder="차수연" id="billing-email-address" />
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-phone" class="form-label">분류
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="text"
																				placeholder="육가공/수산" id="billing-phone" />
																		</div>
																	</div>
																</div>
																<!-- end row -->

																<div class="row">
																	<div class="col-12">
																		<div class="mb-3">
																			<label for="example-textarea" class="form-label">의견</label>
																			<textarea class="form-control" id="example-textarea"
																				rows="3" placeholder="건의사항을 말씀하세요"></textarea>
																		</div>
																	</div>
																</div>
																<!-- end row -->

																<div class="row mt-2">
																	<div class="col-sm-6">
																		<a href="/head/purchaseList.do"
																			class="btn text-muted d-none d-sm-inline-block btn-link fw-semibold">
																			<i class="mdi mdi-arrow-left"></i> 돌아가기
																		</a>
																	</div>
																	<!-- end col -->
																	<div class="col-sm-6">
																		<div class="text-sm-end">
																			<a href="#" class="btn btn-danger"> <i
																				class="mdi mdi-truck-fast me-1"></i> 주문하기
																			</a>
																		</div>
																	</div>
																	<!-- end col -->
																</div>
																<!-- end row -->
															</form>
														</div>

													</div>
													<!-- end card-body-->

												</div>
												<!-- end card-->
											</div>
											<!-- end col -->
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Container-fluid-->
					<!-- Footer Start -->
					<footer class="footer">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-6">
									<script>
										document
												.write(new Date().getFullYear())
									</script>
									© Hyper - Coderthemes.com
								</div>
								<div class="col-md-6">
									<div class="text-md-end footer-links d-none d-md-block">
										<a href="javascript: void(0);">About</a> <a
											href="javascript: void(0);">Support</a> <a
											href="javascript: void(0);">Contact Us</a>
									</div>
								</div>
							</div>
						</div>
					</footer>
					<!-- end Footer -->
				</div>
				<!-- content -->
			</div>
			<!-- content-page -->
		</div>
	</div>
</div>