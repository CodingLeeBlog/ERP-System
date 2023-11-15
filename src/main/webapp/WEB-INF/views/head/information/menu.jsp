<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">

<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height:100px;">
	         <div class="row ">
	               <div class="card-body col-4 align-items-center">
	                  <div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">메뉴관리</div>
	                  <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">메뉴를 관리합니다.</div>
	               </div>
	               <div class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
                  정보관리 > &nbsp;<span class="text-decoration-underline">메뉴관리</span>
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
									<form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between" id="searchForm">
										<input type="hidden" id="page" name="page">
										<div class="col-auto">
											<div class="d-flex align-items-center">
												<select class="form-select" name="searchType" id="searchType">
													<option value="menuName"<c:if test="${searchType eq 'menuName' }">selected</c:if>>메뉴명</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<label for="inputPassword2" class="visually-hidden">검색</label>
											<input type="text" class="form-control" id="searchWord" name="searchWord"
												placeholder="메뉴명을 입력하세요." value="${searchWord }">
										</div>
									</form>
								</div>
								<div class="col-sm-7">
									<div class="text-sm-end">
										<input type="button" class="btn btn-info" id="registerBtn"
											value="등록" data-bs-toggle="modal"
											data-bs-target="#bs-example-modal-lg">
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
											<th style='text-align: center'>순번</th>
											<th style='text-align: center'>메뉴명</th>
											<th style='text-align: center'>카테고리</th>
											<th style='text-align: center'>가격</th>
											<th style='text-align: center'>출시일자</th>
											<th style='text-align: center'></th>
										</tr>
									</thead>
									<tbody id="tBody">
										<c:set value="${pagingVO.dataList }" var="menuList" />
										<c:choose>
											<c:when test="${empty menuList }">
												<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">메뉴가
														존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${menuList }" var="menu">
													<tr class="text-left">
														<td style='text-align: center'>${menu.rnum }</td>
														<td style='text-align: center'>
														    <div style='text-align: center'>${menu.menuName}</div>
														</td>
														<td style='text-align: center'>${menu.menuCg }</td>
														<td style='text-align: center'><fmt:formatNumber value="${menu.menuPrice }"
																type="number" />(원)</td>
														<td style='text-align: center'><fmt:formatDate value="${menu.menuRsdate }"
																pattern="yy/MM/dd" /></td>
														<td style='text-align: center'>
															<button type="button" class="btn btn-info btn-sm"
																id="detailBtn" data-menucd="${menu.menuCd}">상세보기</button>
														</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<nav aria-label="Page navigation example" id="pagingArea">
					               ${pagingVO.pagingHTML }
					            </nav>
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
<!-- Info Header Modal -->
<div id="info-header-modal" class="modal fade" tabindex="-1"
	role="dialog" aria-labelledby="info-header-modalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-info">
				<h4 class="modal-title" id="info-header-modalLabel">상세보기</h4>
<!-- 				<button type="button" class="btn btn-info btn-sm" -->
<!-- 					data-bs-toggle="modal" data-bs-target="#info-header-modal" -->
<%-- 					data-menucd="${menu.menuCd}" id="detailmodal"></button> --%>
			</div>
			<div class="modal-body" id="mBody">
				<form class="ps-3 pe-3" action="/head/menuUpdate.do" method="post" id="menuUpdateForm">
					<input type="hidden" name="menuCd" id="menuCdToUpdate" value="">
					<div class="col-auto">
                       <div class="card d-block">
                           <img class="card-img-top" id="modalImg" src="${pageContext.request.contextPath}/resources/upload/img/${attachOrgname}" alt="메뉴사진">
                       </div> 
                    </div>
					<div class="mb-3" >
						<h5 class="mb-0 text-800">메뉴코드</h5>
						<input class="mb-0 mt-2 form-control" id="modalCode" readonly>
					</div>
					<div class="mb-3">
						<h5 class="mb-0 text-800">메뉴명</h5>
						<input class="mb-0 mt-2 form-control" id="modalMenuName" readonly>
					</div>
					<div class="mb-3">
						<h5 class="mb-0 text-800">카테고리</h5>
						<input class="mb-0 mt-2 form-control" id="modalCategory" readonly>
					</div>
					<div class="mb-3">
						<h5 class="mb-0 text-800">설명</h5>
						<input class="mb-0 mt-2 form-control" id="modalDescription" readonly>
					</div>
					<div class="mb-3">
						<h5 class="mb-0 text-800">가격</h5>
						<input class="mb-0 mt-2 form-control" id="modalPrice" readonly>
					</div>
				</form>
			</div>
			<div class="modal-footer">
			    <button type="button" class="btn btn-light" data-bs-dismiss="modal">목록</button>
			    <button type="button" class="btn btn-info" id="updateBtn">수정</button>
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delmodal${stat.count }" data-payde="${menu.menuCd }" id="delFormBtn">삭제</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->
			<!-- 삭제 폼 -->
			<div id="delmodal${stat.count }" class="modal fade text-start" tabindex="-1" role="dialog" aria-hidden="true" >
				    <div class="modal-dialog modal-dialog-centered">
				        <div class="modal-content">
				            <div class="modal-body">
				                <div class="text-center mt-2 mb-4"> 
				                </div>
				                <form action="/head/menuDelete.do" method="post" id="delForm">
									    <input type="hidden" name="menuCd" id="menuCdToDelete" value="">
				                 	    <div class="text-center mt-2 mb-4"> 
				                		<h5>삭제하시겠습니까? ${menu.menuCd }</h5>
				                		</div>
				                    <div class="mb-3 text-center">
				                        <input type="button" class="btn btn-light" style="margin-right: 0.08rem;" data-bs-dismiss="modal" value="취소">
				                        <input id="delBtn" type="button" class="btn btn-primary" value="확인">
				                    </div>
				                    <sec:csrfInput/>
				                </form>
				            </div>
				        </div>
				    </div>
				</div>

				<div class="modal fade" id="bs-example-modal-lg" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myLargeModalLabel">메뉴 등록</h4>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-hidden="true"></button>
							</div>
							<div class="modal-body">
								<form action="menuRegister" id="menuForm" enctype="multipart/form-data">
									<div class="mb-3">
										<label for="rgMenuImg" class="form-label">메뉴 이미지</label> 
										<input type="file" id="rgMenuImg" class="form-control">
									</div>
				
<!-- 									<div class="mb-3"> -->
<!-- 										<label for="simpleinput" class="form-label">메뉴코드</label> <input -->
<!-- 											type="text" id="rgMenuCd" name="menuCd" class="form-control"> -->
<!-- 									</div> -->
									
									<div class="mb-3">
										<label for="simpleinput" class="form-label">메뉴명</label> 
										<input type="text" id="rgMenuName" name="menuName" class="form-control">
									</div>
				
									<label for="simpleinput" class="form-label">메뉴구분</label> 
									<select class="form-select form-select-sm mb-3" id="rgMenuCg" name="menuCg">
										<option selected>선택</option>
										<option value="마른안주">마른안주</option>
										<option value="튀김안주">튀김안주</option>
										<option value="식사안주">식사안주</option>
										<option value="주류">주류</option>
									</select>
				
									<div class="mb-3">
										<label for="example-textarea" class="form-label">설명</label>
										<textarea class="form-control" id="rgMenuDes" name="menuDes" rows="5"></textarea>
									</div>
				
									<div class="mb-3">
										<label for="example-number" class="form-label">가격</label> <input
											class="form-control" id="rgMenuPrice"  type="number"
											name="menuPrice">
									</div>
								</form>
								<div class="modal-footer">
									<button type="button" class="btn btn-light" data-bs-dismiss="modal">목록</button>
									<button type="button" class="btn btn-info" id="insertBtn">등록</button>
									<button type="button" class="btn btn-success" id="autoBtn">자동완성</button>
								</div>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
<!-- /.modal -->
</tbody>

<script type="text/javascript">
$(function() {
	var tBody = $("#tBody");
	var infoHeaderModal = $("#info-header-modal"); // 상세보기 모달 id
	var detailBtn = $("#detailBtn");
	var updateBtn = $("#updateBtn");
	var isEditMode = false; // 수정 모드인지 여부를 저장하는 변수
	var insertBtn = $("#insertBtn");
	var menuForm = $("#menuForm");
	var delForm = $("#delForm");
	var delFormBtn = $("#delFormBtn");
	var delBtn = $("#delBtn");
	var menuCdToDelete = $("#menuCdToDelete");
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	
	function formatWon(number) {
	    // 숫자를 한국 표준 통화 형식으로 포맷팅
	    var formattedNumber = new Intl.NumberFormat('ko-KR', {
	      style: 'currency',
	      currency: 'KRW'
	    }).format(number);
	    
	    // "₩" 통화 기호 제거
	    formattedNumber = formattedNumber.replace("₩", "");
	    
	    // "(원)" 추가
	    return formattedNumber + "(원)";
	}
	
	// 페이징
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	// 상세보기
	tBody.on("click", "#detailBtn", function() {
		var data = {
			menuCd : $(this).data("menucd")
		};

		$.ajax({
			url : "/head/menuDetail.do",
			type : "post",
			data : JSON.stringify(data),
			contentType : 'application/json; charset=utf-8',
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}"); // csrf 토큰 보내기 위함
			},
			success : function(res) {
				$("#modalImg").attr("src", "${pageContext.request.contextPath}" + (res.menuFileList[0].attachSavename));
				$("#modalCode").val(res.menuCd);
				$("#modalMenuName").val(res.menuName);
				$("#modalDescription").val(res.menuDes);
				$("#modalCategory").val(res.menuCg);
				$("#modalPrice").val(formatWon(res.menuPrice));
				infoHeaderModal.modal("show");

				// "수정" 버튼의 텍스트 변경
				updateBtn.text("수정");
				isEditMode = false; // 저장 후 다시 수정 모드 해제
			}
		});
	});

    // 모달 "수정" 버튼에 클릭 이벤트 핸들러를 추가
    $('#updateBtn').on('click', function() {
        var isEditMode = $(this).text() === "수정";

        if (isEditMode) {
            $(this).text("저장");
            $('.form-control').prop('readonly', false);
        } else {
            var data = {
                menuCd: $("#modalCode").val(),
                menuName: $("#modalMenuName").val(),
                menuCg: $("#modalCategory").val(),
                menuDes: $("#modalDescription").val(),
                menuPrice: $("#modalPrice").val()
            };

           // 서버에 데이터 전송
           $.ajax({
               url: "/head/menuUpdate.do",
               type: "post",
               data: JSON.stringify(data),
               contentType: "application/json; charset=utf-8",
               beforeSend: function(xhr) {
                   // CSRF 토큰 보내기
                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
               },
               success: function(res) {
                   Swal.fire({
                       title: '알림창', // Alert 제목
                       text: '수정이 완료되었습니다.', // Alert 내용
                       icon: 'success', // Alert 타입
                   }).then((result) => {
                       if (result.isConfirmed) {
                           location.href = "/head/menu.do"; 
                       }
                   });
                   console.log(res);
               },
               error: function() {
                   alert("데이터 저장 중 오류가 발생했습니다.");
                   console.log(data);
               }
           });

           $(this).text("수정");
           $('.form-control').prop('readonly', true);
       }
	});

		// 등록
		insertBtn.on("click", function() {
	    var rgMenuImg = $("#rgMenuImg")[0];
	    var rgMenuName = $("#rgMenuName").val();
	    var rgMenuCg = $("#rgMenuCg").val();
	    var rgMenuDes = $("#rgMenuDes").val();
	    var rgMenuPrice = $("#rgMenuPrice").val();
	    
	    // 데이터를 객체로 생성
	    var data = {
	        menuName: rgMenuName,
	        menuCg: rgMenuCg,
	        menuDes: rgMenuDes,
	        menuPrice: rgMenuPrice
	    }

	    // 이미지 파일을 FormData 객체에 추가
	    var formData = new FormData();
	    console.log('img => ', rgMenuImg.files[0]);
	    formData.append("boFile", rgMenuImg.files[0]); // 이미지 파일
	    formData.append("menuCg", rgMenuCg); 
	    formData.append("menuName", rgMenuName); 
	    formData.append("menuDes", rgMenuDes); 
	    formData.append("menuPrice", rgMenuPrice); 
// 	    formData.append("menuPrice", JSON.stringify(data)); // 다른 데이터를 JSON 형태로 추가

	    $.ajax({
	        type: "post",
	        url: "/head/menuRegister.do",
	        data: formData, // 이미지 파일과 다른 데이터 포함한 FormData 전달
	        processData: false, // 데이터를 직렬화하지 말고 FormData 그대로 전송
	        contentType: false,
	        dataType: "json",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); // csrf 토큰 보내기 위함
	        },
	        success: function(res) {
	        	 Swal.fire({
                     title: '알림창', // Alert 제목
                     text: '등록이 완료되었습니다.', // Alert 내용
                     icon: 'success', // Alert 타입
                 }).then((result) => {
                     if (result.isConfirmed) {
                         location.href = "/head/menu.do"; 
                     }
                 });
	        },
	        error: function(err) {
	            alert("데이터 저장 중 오류가 발생했습니다.", err);
	        }
	    });
	});


	// 삭제
	tBody.on("click", "#detailBtn", function() {
		var menuCd = $(this).data("menucd");

		$("#menuCdToDelete").val(menuCd);
		// 메뉴 코드를 삭제 폼의 숨겨진 필드에 설정
		delBtn.click(function() {
			// "확인" 버튼 클릭 시 폼 제출
			delForm.submit(); // 폼 제출
		});
	});
	
	
	// 자동완성
	$("#autoBtn").on("click", function(){
		$("#rgMenuName").val("고구마");
		$("#rgMenuCg").val("마른안주");
		$("#rgMenuDes").val("촉촉하고 부드러운 고구마를 한입에~");
		$("#rgMenuPrice").val("7000");
	});
});
</script>
