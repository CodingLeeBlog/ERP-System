<%@page import="kr.or.ddit.vo.head.OfficeLetterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	                  <div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">공문관리</div>
	                  <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">본사의 공문을 관리합니다.</div>
	               </div>
	               <div class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
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
									<a href="javascript: void(0);"><i class="ri-star-line me-2"></i>수신함</a>
									<a href="/head/officeLetter.do" class="text-danger fw-bold"><i
										class="ri-inbox-line me-2"></i>발신함<span
										class="badge badge-danger-lighten float-end ms-2">${totalRecord }</span></a>
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
													<option value="menuName"<c:if test="${searchType eq 'title' }">selected</c:if>>공문명</option>
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
												<th>발송일</th>
												<th>상태</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="tBody">
											<c:set value="${pagingVO.dataList }" var="officeLetterList" />
											<c:choose>
												<c:when test="${empty officeLetterList }">
													<tr class="text-center">
														<td colspan="5" class="text-dark font-weight-bolder">문서가
															존재하지 않습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${officeLetterList }" var="officeLetter">
														<tr class="text-left">
															<td><input type="checkbox" class="form-check-input" id="mail1"></td>
															<td id="hdLtno">${officeLetter.hdLtno }</td>
															<td>${officeLetter.hdLttitle }</td>
															<td><fmt:formatDate
																	value="${officeLetter.hdLtrdate }" pattern="yyyy-MM-dd" /></td>
															<td><span class="badge bg-success">${officeLetter.hdLtstate }</span></td>
															<td>
																<button type="button"
																	class="btn btn-info btn-sm sendBtn"
																	data-hdltno="${officeLetter.hdLtno}"
																	data-bs-toggle="modal"
																	data-bs-target="#dark-header-modal">발송</button>
																<button type="button"
																	class="btn btn-danger btn-sm delBtn"
																	data-hdltno="${officeLetter.hdLtno}">삭제</button>
															</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>
								</div>
								<!-- end .mt-4 -->
								<div id="dark-header-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="dark-header-modalLabel" aria-hidden="true">
								    <div class="modal-dialog">
								        <div class="modal-content">
								            <div class="modal-header bg-dark">
								                <h4 class="modal-title" id="dark-header-modalLabel">공문 발송</h4>
								                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-hidden="true"></button>
								            </div>
											<div class="modal-body">
												<div class="row">
													<div class="col">
														<form
															class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between"
															id="searchForm">
															<input type="hidden" id="page" name="page">
															<div class="col-auto">
																<h5>지점명</h5>
															</div>
															<div class="col-auto">
																<label for="inputPassword2" class="visually-hidden">검색</label>
																<input type="text" class="form-control" id="searchWord"
																	name="searchWord" placeholder="지점명을 입력해주세요."
																	value="${searchWord }">
															</div>
															<div class="col">
																<button type="button" class="btn btn-success btn-sm">조회</button>
															</div>
														</form>
														<hr />
														<div>
															<h5 class="m-0 pb-2">
																<a class="text-dark" data-bs-toggle="collapse"
																	href="#todayTasks" role="button" aria-expanded="true"
																	aria-controls="todayTasks"> <i
																	class="uil uil-angle-down font-18"></i>대전광역시 <span
																	class="text-muted">(7)</span>
																</a>
															</h5>

															<div class="collapse show" id="todayTasks" style="">
																<div class="card mb-0">
																	<div class="card-body">
																		<!-- task -->
																		<div class="row justify-content-sm-between">
																			<div class="col-sm-6 mb-2 mb-sm-0">
																				<div class="form-check">
																					<c:choose>
																						<c:when test="${empty frcsList }">
																							<div class="text-center">
																								<p class="text-dark font-weight-bolder">지점이
																									존재하지 않습니다.</p>
																							</div>
																						</c:when>
																						<c:otherwise>
																							<c:forEach items="${frcsList}" var="frcs">
																								<div class="text-left">
																									<input type="checkbox"
																										class="form-check-input" id="task1">
																									<label for="task1">${frcs.frcsName }</label>
																								</div>
																							</c:forEach>
																						</c:otherwise>
																					</c:choose>
																				</div>
																			</div>
																		</div>
																		<!-- end task -->
																	</div>
																</div>
															</div>
															<div id="receiverList">
																<h5>수신자 목록</h5>
																<div class="container">
																	<div class="mt-2" id="sendReceiver"></div>
																</div>
															</div>
															<div class="modal-footer">
																<a href="javascript:void(0);" class="btn btn-light"
																	data-bs-dismiss="modal">취소</a>
																<button type="button" class="btn btn-dark"
																	id="insertBtn">전송</button>
															</div>
														</div>
													</div>
												</div>
												<!-- end row-->
											</div>
											<!-- end inbox-rightbar-->
										</div>
										<!-- end card-body -->
										<div class="clearfix"></div>
									</div>
									<!-- end card-box -->
								</div>
								<!-- end Col -->
							</div>
							<!-- End row -->
							<div class="row">
								<div class="col-20">
									<nav aria-label="Page navigation example" id="pagingArea">${pagingVO.pagingHTML }</nav>
								</div>
							</div>
							<!-- end col-->
						</div>
						<!-- container -->
					</div>
					<!-- content -->
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function() {
	var infoHeaderModal = $("#info-header-modal"); // 상세보기 모달 id
	var saveBtn = $("#saveBtn");
	
	// 페이징
	pagingArea.on("click", "a", function(event) {
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});

    // 삭제 버튼 클릭 이벤트
	$(document).ready(function() {
    $('#products-datatable').on('click', '.delBtn', function() {
        var hdLtno = $(this).data('hdltno');

        $.ajax({
            type: 'POST',
            url: '/head/officeLetterDelete.do',
            data: { hdLtno: hdLtno },
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(res) {
                Swal.fire({
                    title: '알림창',
                    text: '삭제가 완료되었습니다.',
                    icon: 'success',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "/head/officeLetter.do"; 
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
});

	// 공문 저장 
	$(document).ready(function() {
    $("#saveBtn").on("click", function() {
        var sendFile = $("#sendFile")[0];
        var sendTitle = $("#sendTitle").val();
        var sendContent = $("#sendContent").val();

        var data = {
            hdLttitle: sendTitle,
            hdLtcontent: sendContent
        }

        var formData = new FormData();

        if (sendFile.files.length > 0) {
            formData.append("boFile", sendFile.files[0]);
        }

        formData.append("hdLttitle", sendTitle);
        formData.append("hdLtcontent", sendContent);

        $.ajax({
            url: "/head/officeLetterRegister.do",
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
                    text: '저장이 완료되었습니다.',
                    icon: 'success',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "/head/officeLetter.do";
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
});

	// 수신자 지정
	var hdLtno2;

	$(".sendBtn").on("click", function() {
	    hdLtno2 = $(this).data("hdltno");
	});

	document.addEventListener("DOMContentLoaded", function() {
	    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
	    var displayContainer = document.querySelector('.container');
	    var selectedItems = [];

	    checkboxes.forEach(function(checkbox) {
	        checkbox.addEventListener('change', function() {
	            var selectedItemText = checkbox.nextElementSibling.textContent;
	            var selectedItemIndex = selectedItems.findIndex(item => item.hdLtreciever === selectedItemText);

	            if (checkbox.checked) {
	                if (selectedItemIndex === -1) {
	                    selectedItems.push({ hdLtreciever: selectedItemText, hdLtno: hdLtno2 });
	                    updateDisplay();
	                }
	            } else {
	                if (selectedItemIndex !== -1) {
	                    selectedItems.splice(selectedItemIndex, 1);
	                    updateDisplay();
	                }
	            }
	        });
	    });

	    function updateDisplay() {
	        displayContainer.innerHTML = '';

	        selectedItems.forEach(function(item) {
	            var selectedItem = document.createElement('div');
	            selectedItem.textContent = item.hdLtreciever;
	            displayContainer.appendChild(selectedItem);
	        });
	    }

	    var insertBtn = document.querySelector('#insertBtn');

	    insertBtn.addEventListener('click', function() {
	        var data = selectedItems.map(function(item) {
	            return {
	                hdLtreciever: item.hdLtreciever,
	                hdLtno: hdLtno2
	            };
	        });

        $.ajax({
            type: 'POST',
            url: '/head/officeLetterUpdate.do',
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(res) {
                Swal.fire({
                    title: '알림창',
                    text: '발송이 완료되었습니다.',
                    icon: 'success',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "/head/officeLetter.do";
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
});

</script>