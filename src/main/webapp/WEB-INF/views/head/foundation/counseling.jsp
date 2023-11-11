<%@page import="kr.or.ddit.vo.owner.OwnerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css"
	rel="stylesheet">

<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height: 100px;">
				<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">가맹상담관리</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">가맹점의
							창업 상담을 관리합니다.</div>
					</div>
					<div
						class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
						창업상담관리 > &nbsp;<span class="text-decoration-underline">가맹상담관리</span>
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
													<!-- 															<option selected>선택</option> -->
													<option value="ownerName"
														<c:if test="${searchType eq 'ownerName' }">selected</c:if>>성명</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<label for="inputPassword2" class="visually-hidden">검색</label>
											<input type="search" class="form-control" id="searchWord"
												name="searchWord" value="${searchWord }"
												placeholder="이름을 입력해주세요.">
										</div>
									</form>
								</div>
							</div>
							<div class="table-responsive">
								<table class="table table-centered w-100 dt-responsive nowrap"
									id="products-datatable">
									<thead class="table-light">
										<tr>
											<th style='text-align: center'>순번</th>
											<th style='text-align: center'>성명</th>
											<th style='text-align: center'>신청날짜</th>
											<th style='text-align: center'>연락처</th>
											<th style='text-align: center'>이메일</th>
											<th style='text-align: center'>연락여부</th>
											<th style='text-align: center'>계약현황</th>
											<th style='text-align: center'>상세보기</th>
											<th style='text-align: center'></th>
										</tr>
									</thead>
									<tbody id="tbody">
										<c:set value="${pagingVO.dataList }" var="ownerList" />
										<c:choose>
											<c:when test="${empty ownerList }">
												<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">문의자가
														존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${ownerList }" var="owner">
													<div>
														<input type="hidden" id="frcsId">
													</div>
													<tr class="text-left">
														<td id="menuName" style='text-align: center'>${owner.rnum }</td>
														<td id="menuName" style='text-align: center'>${owner.ownerName }</td>
														<td style='text-align: center'><fmt:formatDate value="${owner.ownerRgdate }"
																pattern="yyyy-MM-dd" /></td>
														<td style='text-align: center'>${owner.ownerTel }</td>
														<td style='text-align: center'>${owner.ownerEmail }</td>
														<td style='text-align: center'><span class="badge bg-success">${owner.ownerTelyn }</span></td>
														<td style='text-align: center'><span class="badge bg-success">${owner.ownerConst }</span></td>
														<td class="table-action" style='text-align: center'><a
															href="javascript:void(0);" class="action-icon"> <i
																class="mdi mdi-eye detailBtn" data-bs-toggle="modal"
																data-bs-target="#info-header-modal"
																data-ownerid="${owner.ownerId}"></i>
														</a></td>
														<td style='text-align: center'>
															<button type="button" class="btn btn-info btn-sm mailCheckBtn"
																data-ownerid="${owner.ownerId}" data-email="${owner.ownerEmail}">승인</button>
														</td>
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
			<!-- 모달 창 -->
			<div class="modal fade" id="info-header-modal" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header bg-info">
							<h5 class="modal-title" id="myLargeModalLabel">상세보기</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form id="updateForm" method="post" enctype="multipart/form-data">
								<input type="hidden" name="ownerId" value="">
								<div class="row g-2">
									<div class="mb-3 col-md-6">
										<label for="ownerId1" class="col-form-label">일련번호</label> <input
											type="text" class="form-control" name="ownerId" id="ownerId1"
											readonly>
									</div>
									<div class="mb-3 col-md-6">
										<label for="ownerRgdate1" class="col-form-label">신청날짜</label>
										<input type="text" class="form-control" name="formattedRgdate"
											id="ownerRgdate1" readonly>
									</div>
								</div>
								<div class="row g-2">
									<div class="mb-3 col-md-6">
										<label for="ownerName1" class="col-form-label">이름</label> <input
											type="text" class="form-control" name="ownerName"
											id="ownerName1" readonly>
									</div>
									<div class="mb-3 col-md-6">
										<label for="ownerBir1" class="col-form-label">생년월일</label> <input
											type="text" class="form-control" id="ownerBir1" readonly>
									</div>
								</div>
								<div class="row g-2">
									<div class="mb-3 col-md-6">
										<label for="ownerTel1" class="col-form-label">연락처</label> <input
											type="text" class="form-control" id="ownerTel1" readonly>
									</div>
									<div class="mb-3 col-md-6">
										<label for="ownerEmail1" class="col-form-label">이메일</label> <input
											type="text" class="form-control" id="ownerEmail1" readonly>
									</div>
								</div>
								<div class="row g-2">
									<div class="mb-3 col-md-6">
										<label for="ownerArea1" class="col-form-label">창업희망지역</label>
										<input type="text" class="form-control" id="ownerArea1"
											readonly>
									</div>
									<div class="mb-3 col-md-6">
										<label for="ownerDong1" class="col-form-label">창업희망상세지역</label>
										<input type="text" class="form-control" id="ownerDong1"
											readonly>
									</div>
								</div>
								<div class="row g-2">
									<div class="mb-3 col-md-6">
										<label for="ownerMoney1" class="col-form-label">예상창업비용</label>
										<input type="text" class="form-control" id="ownerMoney1"
											readonly>
									</div>
									<div class="mb-3 col-md-6">
										<label for="ownerBuilding1" class="col-form-label">상가보유유무</label>
										<input type="text" class="form-control" id="ownerBuilding1"
											readonly>
									</div>
								</div>
								<div class="mb-3">
									<label for="ownerBuildingadd1" class="col-form-label">상가주소</label>
									<input type="text" class="form-control" id="ownerBuildingadd1"
										readonly>
								</div>
								<div class="row g-2">
									<div class="mb-3 col-md-6">
										<label for="ownerExp1" class="col-form-label">창업경험</label> <input
											type="text" class="form-control" id="ownerExp1" readonly>
									</div>
									<div class="mb-3 col-md-6">
										<label for="ownerHopetime1" class="col-form-label">상담희망시간</label>
										<input type="text" class="form-control" id="ownerHopetime1"
											readonly>
									</div>
								</div>
								<div class="mb-3">
									<label for="ownerInfocontent1" class="col-form-label">문의구분</label>
									<input type="text" class="form-control" id="ownerInfocontent1"
										readonly>
								</div>
								<div class="mb-3">
									<label for="ownerContentdetail1" class="col-form-label">문의내용</label>
									<textarea class="form-control" id="ownerContentdetail1"
										readonly></textarea>
								</div>
								<hr />
								<div class="row g-2">
									<div class="mb-3 col-md-6">
										<label for="ownerConst1" class="col-form-label">계약현황</label> <input
											type="text" class="form-control" id="ownerConst1" readonly>
									</div>
									<div class="mb-3 col-md-6">
										<label for="ownerTelyn1" class="col-form-label">연락여부</label> <input
											type="text" class="form-control" id="ownerTelyn1" readonly>
									</div>
								</div>
								<div class="card-body p-3"></div>
								<c:set value="${owner.counselFileList}" var="counselFileList" />
								<div class="row g-2" id="divRow">
									<!-- 		                        	<div class="col-md-2"> -->
									<!-- 										<div> -->
									<!-- 											<div -->
									<!-- 												class="card-header mt-n4 mx-3 p-0"> -->
									<!-- 												<a href="/resources/upload/file/attachOrgname" target="_blank">  -->
									<!-- 													<img src="/resources/assets/icons/PDF-icon.png" style="width:70px;" /> -->
									<!-- 												</a> -->
									<!-- 											</div> -->
									<!-- 											<div class="card-body text-center bg-white border-radius-lg p-3 pt-0"> -->
									<!-- 												<h6 class="mt-3 mb-1 d-md-block d-none"> -->
									<!--  													attachOrgname(100bytes) -->
									<!-- 												</h6> -->
									<!-- 												<p class="mb-0 text-xs font-weight-bolder text-info text-uppercase"> -->
									<!-- 													<button type="button" class="btn btn-primary btn-sm fileDownload" -->
									<%-- 														data-file-no="${boFile.fileNo }"> --%>
									<!-- 														download -->
									<!-- 													</button> -->
									<!-- 												</p> -->
									<!-- 											</div> -->
									<!-- 										</div> -->
									<!-- 									</div> -->
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" id="updateBtn"
								data-bs-toggle="modal"
								data-bs-target="#exampleModalFullscreenSm">수정</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">목록</button>
							<button type="button" class="btn btn-primary" id="addBtn"
								data-bs-toggle="modal" data-bs-target="#bs-example-modal-lg" data-owner-id="${ownerId}">추가</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 추가 -->
			<div class="modal fade" id="bs-example-modal-lg" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="myLargeModalLabel">가맹점 등록</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-hidden="true"></button>
						</div>
						<div class="modal-body">
							<div class="mb-3">
							    <input type="hidden" id="ownerId2">
								<label for="frcsId1" class="col-form-label">가맹점코드</label>
								<div class="col-10 d-flex justify-content-between">
									<div class="col-3">
										<input type="text" class="form-control frcsId1" name="frcsId"
											id="frcsId1" style="width: 155px; min-width: 155px"
											readonly="readonly">
									</div>
									<div class="col-10">
										<button type="button" class="btn btn-success btn-flat"
											id="makeBtn">생성</button>
									</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="frcsName1" class="col-form-label">가맹점명</label>
								<div class="col-10 d-flex justify-content-between">
									<div class="col-3">
										<input type="text" class="form-control" name="frcsName"
											id="frcsName1" style="width: 155px; min-width: 155px">
									</div>
									<div class="col-10">
										<button type="button" class="btn btn-success btn-flat"
											id="frcsCheckBtn">중복검사</button>
									</div>
								</div>
							</div>
							<div class="row g-2">
								<div class="mb-3 col-md-6">
									<label for="frcsState1" class="col-form-label">운영상태</label> <select
										class="form-select form-select-sm mb-3" id="frcsState1"
										name="frcsState">
										<option selected>선택</option>
										<option value="개점예정">개점예정</option>
										<option value="휴업중">휴업중</option>
										<option value="운영중">운영중</option>
									</select>
								</div>
								<div class="mb-3 col-md-6">
									<label for="frcsTel1" class="col-form-label">전화번호</label> <input
										type="text" class="form-control" name="frcsTel" id="frcsTel1">
								</div>
							</div>
							<div class="row g-2">
								<div class="mb-3 col-md-6">
									<label for="frcsStdate1" class="col-form-label">가맹등록일자</label>
									<input type="date" class="form-control" name="frcsStdate"
										id="frcsStdate1">
								</div>
								<div class="mb-3 col-md-6">
									<label for="frcsEnddate1" class="col-form-label">계약만료일자</label>
									<input type="date" class="form-control" name="frcsEnddate"
										id="frcsEnddate1">
								</div>
							</div>
							<div class="mb-3">
								<label for="memPost" class="col-form-label">주소</label>
								<div class="col-10 d-flex justify-content-between">
									<div class="col-3">
										<input type="text" class="form-control" id="frcsPost1"
											name="frcsPost" style="width: 155px; min-width: 155px"
											readonly="readonly" value="" maxlength="5">
									</div>
									<div class="col-10">
										<button type="button" onclick="DaumPostcode()"
											class="btn btn-secondary btn-flat">우편번호 찾기</button>
									</div>
								</div>
							</div>
							<div class="mb-3">
								<label for="frcsAdd3" class="col-form-label">기본주소</label> <input
									type="text" class="form-control" id="frcsAdd3" name="frcsAdd1"
									readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="frcsAdd4" class="col-form-label">상세주소</label> <input
									type="text" class="form-control" id="frcsAdd4" name="frcsAdd2">
							</div>
							<div class="row g-2">
								<div class="mb-3 col-md-6">
									<label for="frcsSttime1" class="col-form-label">영업시작시간</label>
									<input type="time" class="form-control" name="frcsSttime"
										id="frcsSttime1">
								</div>
								<div class="mb-3 col-md-6">
									<label for="frcsEndtime1" class="col-form-label">영업종료시간</label>
									<input type="time" class="form-control" name="frcsEndtime"
										id="frcsEndtime1">
								</div>
							</div>
							<div class="row g-4">
								<div class="mb-3 col-md-3">
									<label for="frcsCdate1" class="col-form-label">계약체결일자</label> <input
										type="date" class="form-control" name="frcsCdate"
										id="frcsCdate1">
								</div>
								<div class="mb-3 col-md-3">
									<label for="frcsInsdate1" class="col-form-label">예상완공일</label>
									<input type="date" class="form-control" name="frcsInsdate"
										id="frcsInsdate1">
								</div>
								<div class="mb-3 col-md-3">
									<label for="frcsOpdate1" class="col-form-label">그랜드오픈일자</label>
									<input type="date" class="form-control" name="frcsOpdate"
										id="frcsOpdate1">
								</div>
								<div class="mb-3 col-md-3">
									<label for="frcsInedate1" class="col-form-label">최종점검일자</label>
									<input type="date" class="form-control" name="frcsInedate"
										id="frcsInedate1">
								</div>
							</div>
							<div class="row g-4">
								<div class="mb-3 col-md-3">
									<label for="frcsXmap1" class="col-form-label">가맹점X좌표</label> <input
										type="text" class="form-control" name="frcsXmap"
										id="frcsXmap1">
								</div>
								<div class="mb-3 col-md-3">
									<label for="frcsYmap1" class="col-form-label">가맹점Y좌표</label> <input
										type="text" class="form-control" name="frcsYmap"
										id="frcsYmap1">
								</div>
								<div class="mb-3 col-md-3">
									<label for="frcsStar1" class="col-form-label">가맹점별점</label> <input
										type="text" class="form-control" name="frcsStar"
										id="frcsStar1">
								</div>
								<div class="mb-3 col-md-3">
									<label for="frcsPsncpa1" class="col-form-label">가맹점수용인원</label>
									<input type="text" class="form-control" name="frcsPsncpa"
										id="frcsPsncpa1">
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<a href="javascript:void(0);" class="btn btn-light"
								data-bs-dismiss="modal">취소</a>
							<button type="button" class="btn btn-primary" id="regBtn">저장</button>
							<button type="button" class="btn btn-success" id="autoBtn">자동완성</button>
						</div>
					</div>
				</div>
			</div>
			<!--수정 모달창 -->
			<div class="modal fade" id="exampleModalFullscreenSm" tabindex="-1"
				aria-labelledby="exampleModalFullscreenSmLabel" aria-hidden="true">
				<div class="modal-dialog modal-fullscreen-sm-down">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalFullscreenSmLabel">수정</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class="row g-2">
									<div class="mb-3 col-md-6">
										<label for="ownerConst1" class="col-form-label">계약현황</label> <select
											class="form-select form-select-sm mb-3" id="ownerConst2"
											name="ownerConst">
											<option value="계약완료">계약완료</option>
											<option value="계약전">계약전</option>
										</select>
									</div>
									<div class="mb-3 col-md-6">
										<label for="ownerTelyn2" class="col-form-label">연락여부</label> <select
											class="form-select form-select-sm mb-3" id="ownerTelyn2"
											name="ownerTelyn">
											<option value="O">O</option>
											<option value="X">X</option>
										</select>
									</div>
								</div>
								<div class="row g-2">
									<div class="mb-3 col-md-6">
									    <label for="ownerFiles" class="col-form-label">첨부파일</label>
									    <input type="file" class="form-control" id="ownerFiles" name="files[]" multiple>
									</div>
<!-- 									<div class="mb-3 col-md-6"> -->
<!-- 										<label for="ownerFile2" class="col-form-label">위생교육필증</label> -->
<!-- 										<input type="file" class="form-control" id="ownerFile2"> -->
<!-- 									</div> -->
<!-- 									<div class="mb-3 col-md-6"> -->
<!-- 										<label for="ownerFile3" class="col-form-label">임대차계약</label> <input -->
<!-- 											type="file" class="form-control" id="ownerFile3"> -->
<!-- 									</div> -->
<!-- 									<div class="mb-3 col-md-6"> -->
<!-- 										<label for="ownerFile4" class="col-form-label">영업신고증</label> <input -->
<!-- 											type="file" class="form-control" id="ownerFile4"> -->
<!-- 									</div> -->
<!-- 									<div class="mb-3 col-md-6"> -->
<!-- 										<label for="ownerFile5" class="col-form-label">사업자등록증</label> -->
<!-- 										<input type="file" class="form-control" id="ownerFile5"> -->
<!-- 									</div> -->
<!-- 									<div class="mb-3 col-md-6"> -->
<!-- 										<label for="ownerFile6" class="col-form-label">가맹점계약서</label> -->
<!-- 										<input type="file" class="form-control" id="ownerFile6"> -->
<!-- 									</div> -->
<!-- 									<div class="mb-3 col-md-6"> -->
<!-- 										<label for="ownerFile7" class="col-form-label">사업자통장/카드</label> -->
<!-- 										<input type="file" class="form-control" id="ownerFile7"> -->
<!-- 									</div> -->
<!-- 									<div class="mb-3 col-md-6"> -->
<!-- 										<label for="ownerFile8" class="col-form-label">안전시설완비증명서</label> -->
<!-- 										<input type="file" class="form-control" id="ownerFile8"> -->
<!-- 									</div> -->
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<a href="javascript:void(0);" class="btn btn-light"
								data-bs-dismiss="modal">취소</a>
							<button type="button" class="btn btn-primary" id="saveBtn">저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- container -->
	</div>
	<!-- content -->
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806a49ec63336f4fd1e46074f5163d44&libraries=services"></script>
<script type="text/javascript">
$(function() {
	var tBody = $("#tBody");
	var detailModal = $("#info-header-modal");
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	var mailCheckBtn = $("#mailCheckBtn");
	var updateBtn = $("#updateBtn");
	var saveBtn = $("#saveBtn");
	// 수정 모드인지 여부를 저장하는 변수
	var isEditMode = false; 
	// 가맹점 등록 버튼
	var regBtn = $("#regBtn"); 
	// 가맹점 중복체크
	var frcsCheckBtn = $("#frcsCheckBtn");
	var frcsCheckFlag = false;
	
	
	// 자동완성
	$("#autoBtn").on("click", function(){
		$("#frcsName1").val("대전 선화점");
		$("#frcsState1").val("개점예정");
		$("#frcsTel1").val("041-350-1237");
		$("#frcsStdate1").val("2023-11-16");
		$("#frcsEnddate1").val("2028-11-15");
		$("#frcsPost1").val("34834");
		$("#frcsAdd3").val("대전 중구 대종로 543-8");
		$("#frcsAdd4").val("1층");
		$("#frcsSttime1").val("17:00");
		$("#frcsEndtime1").val("01:00");
		$("#frcsCdate1").val("2023-11-16");
		$("#frcsInsdate1").val("2023-11-30");
		$("#frcsOpdate1").val("2023-12-10");
		$("#frcsInedate1").val("2023-12-12");
		$("#frcsXmap1").val("36.3315745622429");
		$("#frcsYmap1").val("127.421484942001");
		$("#frcsStar1").val("0");
		$("#frcsPsncpa1").val("30");
	});

	// 페이징
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	// 가맹점 중복체크
	frcsCheckBtn.on("click", function(){
		var name =  $("#frcsName1").val();
		
		if(name == null || name == ""){
			alert("가맹점을 입력해주세요.");
			return false;
		}
		
		var data = {
			frcsName : name
		};
		
		$.ajax({
			type : "post",
			url : "/head/frcsCheck.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data: JSON.stringify(data), // 방법 2)
			contentType : "application/json; charset=utf-8", // 방법 2)
			success : function(res){
				if(res == "NOTEXIST"){ // 아이디 사용 가능					
					alert("사용 가능한 가맹점명입니다!");
					frcsCheckFlag = true; // 가입하기 버튼을 클릭할때 아이디 중복 체크를 했는지 여부
				}else{				   // 아이디 사용 불가능
					alert("이미 사용중인 가맹점명입니다!")
				}
			}
		});
	});
	
	// 상세보기
	$(".detailBtn").on("click", function() {
	    var ownerId = $(this).data("ownerid");
	    console.log("ownerid:", ownerId);
	    $('#addBtn').data('owner-id', ownerId); 
	
       var data = {
           ownerId: ownerId
       };

		$.ajax({
			url : "/head/counselDetail.do",
			type : "post",
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}"); // csrf 토큰 보내기 위함
			},
			success : function(res) {
				console.log("res : " + JSON.stringify(res));
				var rgdate = new Date(res.ownerRgdate);
	            var formattedRgdate = rgdate.getFullYear() + "년 " + (rgdate.getMonth() + 1) + "월 " + rgdate.getDate() + "일";
				
				$("#ownerId1").val(res.ownerId);
				$("#ownerName1").val(res.ownerName);
				$("#ownerRgdate1").val(formattedRgdate);
				$("#ownerBir1").val(res.ownerBir);
				$("#ownerTel1").val(res.ownerTel);
				$("#ownerEmail1").val(res.ownerEmail);
				$("#ownerArea1").val(res.ownerArea);
				$("#ownerDong1").val(res.ownerDong);
				$("#ownerMoney1").val(res.ownerMoney);
				$("#ownerBuilding1").val(res.ownerBuilding);
				$("#ownerBuildingadd1").val(res.ownerBuildingadd);
				$("#ownerExp1").val(res.ownerExp);
				$("#ownerHopetime1").val(res.ownerHopetime);
				$("#ownerInfocontent1").val(res.ownerInfocontent);
				$("#ownerContentdetail1").val(res.ownerContentdetail);
				$("#ownerConst1").val(res.ownerConst);
				$("#ownerTelyn1").val(res.ownerTelyn);

				let tmp = "";
				$.each(res.counselFileList,function(idx,attachVO){
					console.log(attachVO.attachOrgname);
					
					tmp += "<div class='col-md-2'><div><div class='card-header mt-n4 mx-3 p-0'><a href='"+attachVO.attachSavename+"' target='_blank'><img src='/resources/assets/icons/PDF-icon.png' style='width:70px;' /></a></div>";
					tmp += "<div class='card-body text-center bg-white border-radius-lg p-3 pt-0'><h6 class='mt-3 mb-1 d-md-block d-none'>"+attachVO.attachOrgname+"<br/>"+"("+attachVO.attachSize+"bytes)</h6>";
					tmp += "<p class='mb-0 text-xs font-weight-bolder text-info text-uppercase'></p>";
					tmp += "</div></div></div>";
				});
				
				$("#divRow").append(tmp);
				
				detailModal.modal("show");
	
			}
		});
	});
	

// 승인 버튼 클릭시 메일 전송 및 frcsId 가져오기
var code = "";

$(".mailCheckBtn").on("click", function(){
    var email = $(this).data("email");
    var ownerId = $(this).data("ownerid");

    // ownerId를 사용하여 frcsId를 서버로부터 가져오기
    $.ajax({
        url: "/head/frcsIdByOwnerId.do",
        method: "GET",
        data: { ownerId: ownerId },
        success: function(response) {
            // 성공적으로 frcsId를 받았을 때 메일 전송 요청
            var frcsId = response;
//             console.log("frcsId", frcsId);
            
			// 이제 frcsId와 email을 사용하여 메일 전송 요청
			var mailData = {
				ownerId: ownerId,
			    frcsId: frcsId,
			    email: email
			};
			console.log(email);

            $.ajax({
                type: "post",
                url: "/head/counselMail.do",
                data: JSON.stringify(mailData),
                contentType: "application/json; charset=utf-8",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function(res){
                	Swal.fire({
	                    title: '알림창',
	                    text: '해당 이메일로 발송되었습니다.',
	                    icon: 'success',
	                }).then((result) => {
	                    if (result.isConfirmed) {
	                        location.href = "/head/counseling.do"; 
	                    }
	                });
                    console.log("res : " + res);
                    code = res;
                }
            });
        },
        error: function() {
            console.error("frcsId를 가져오는데 실패했습니다.");
        }
    });
});


	
	// addBtn 클릭 시 ownerId 설정
	$('#addBtn').on('click', function() {
	    var ownerId = $(this).data('owner-id');
	    $(this).data('ownerId', ownerId); // addBtn에 ownerId를 설정
	});

	// 가맹점 등록 
	$('#regBtn').on('click', function() {
		var ownerId = $('#addBtn').data('ownerId'); // ownerId를 가져옴
	    if (ownerId) {
	    	
	        var data = {
	            ownerId: ownerId,
				frcsId : $("#frcsId1").val(),
				frcsName : $("#frcsName1").val(),
				frcsState : $("#frcsState1").val(),
				frcsTel : $("#frcsTel1").val(),
				frcsStdate : $("#frcsStdate1").val(),
				frcsEnddate : $("#frcsEnddate1").val(),
				frcsPost : $("#frcsPost1").val(),
				frcsAdd1 : $("#frcsAdd3").val(),
				frcsAdd2 : $("#frcsAdd4").val(),
				frcsSttime : $("#frcsSttime1").val(),
				frcsEndtime : $("#frcsEndtime1").val(),
				frcsCdate : $("#frcsCdate1").val(),
				frcsInsdate : $("#frcsInsdate1").val(),
				frcsOpdate : $("#frcsOpdate1").val(),
				frcsInedate : $("#frcsInedate1").val(),
				frcsXmap : $("#frcsXmap1").val(),
				frcsYmap : $("#frcsYmap1").val(),
				frcsStar : $("#frcsStar1").val(),
				frcsPsncpa : $("#frcsPsncpa1").val()
		};
		        // 서버로 데이터를 전송
		        $.ajax({
		            url: "/head/counselRegister.do",
		        	type: "post",
	                data: JSON.stringify(data),
	                contentType: "application/json; charset=utf-8",
		            beforeSend: function(xhr) {
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
		            success: function(res) {
		                Swal.fire({
		                    title: '알림창',
		                    text: '등록이 완료되었습니다.',
		                    icon: 'success',
		                }).then((result) => {
		                    if (result.isConfirmed) {
		                        location.href = "/head/counseling.do"; 
		                    }
		                });
		                console.log(res.result);
		            },
		            error: function(err) {
		                alert("데이터 저장 중 오류가 발생했습니다.", err);
		                console.log(data);
		            }
		        });
			}
	     });
	
	// 수정 버튼 클릭 시
	$('#saveBtn').on('click', function() {
		
        // 저장 버튼을 클릭했을 때 데이터를 서버로 전송합니다.
        var formData = new FormData();
        
        var ownerFiles = document.getElementById('ownerFiles').files;

        for (var i = 0; i < ownerFiles.length; i++) {
            formData.append("boFile", ownerFiles[i]);
        }
//         formData.append("boFile", ownerFile2.files[0]);
//         formData.append("boFile", ownerFile3.files[0]);
//         formData.append("boFile", ownerFile4.files[0]);
//         formData.append("boFile", ownerFile5.files[0]);
//         formData.append("boFile", ownerFile6.files[0]);
//         formData.append("boFile", ownerFile7.files[0]);
//         formData.append("boFile", ownerFile8.files[0]);
        formData.append("ownerId", $("#ownerId1").val()); 
        formData.append("ownerConst", $("#ownerConst2").val()); 
        formData.append("ownerTelyn", $("#ownerTelyn2").val());

        // 서버로 데이터를 전송
        $.ajax({
            url: "/head/counselUpdate.do",
            type: "post",
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(res) {
                Swal.fire({
                    title: '알림창',
                    text: '수정이 완료되었습니다.',
                    icon: 'success',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "/head/counseling.do"; 
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
	
	// 수연이가 만든 지도 활용 기능(주소를 입력받으면 x,y 좌표를 얻을 수 있다.)
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	$("#frcsAdd4").focusout(function(){
		console.log("focusout...!");
		var addr1 = $("#frcsAdd3").val();
		var addr2 = $("#frcsAdd4").val();
		console.log("data : " + addr1 + ", " + addr2);
		if((addr1 != null || addr1 != "") && (addr2 != null || addr2 != "")){
			getAddressXYPoint(geocoder, addr1+ " " +addr2);
			console.log("pointXY : " + pointXY);
		}else{
			console.log("주소 입력이 온전치 않네요?");
		}
	});
	
	function getAddressXYPoint(geocoder, address){
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
	    	if (status === kakao.maps.services.Status.OK) {
	    		console.log(result[0].x);
	    		console.log(result[0].y);
	    		$("#frcsXmap1").val(result[0].y);
	    		$("#frcsYmap1").val(result[0].x);
		    } 
		});  
	}
});
	
	
	function DaumPostcode(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	            
	            } 

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('frcsPost1').value = data.zonecode;
	            document.getElementById("frcsAdd3").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("frcsAdd4").focus();
	        }
	    }).open();
	};
	
	document.getElementById("makeBtn").addEventListener("click", function () {
	    $.ajax({
	        type: "POST",
	        url: "/head/frcsIdMake.do",
	        beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (response) {
                var frcsIdInputs = document.getElementsByClassName("frcsId1");
                for (var i = 0; i < frcsIdInputs.length; i++) {
                    frcsIdInputs[i].value = response;
                }
            },
	        error: function () {
	            console.error("서버 요청 실패");
	        }
	    });
	});
  
</script>