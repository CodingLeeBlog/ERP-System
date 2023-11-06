<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content-page">
    <div class="content">
        <!-- Start Content-->
        <div class="container-fluid">
             <!-- start page title -->
             <div class="row">
                 <div class="col-12">
                   <div class="card widget-inline mt-3">
                     <div class="page-title-box">
                         <div class="page-title-right">
                             <ol class="breadcrumb m-0">
                                 <li class="breadcrumb-item"><a href="javascript: void(0);">매장관리</a></li>
                                 <li class="breadcrumb-item active">공문관리</li>
                             </ol>
                         </div>
                         <h4 class="page-title ms-3">공문관리</h4>
                     </div>
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
                                 <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#standard-modal">작성하기</button>
                             	 <div id="standard-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
								    <div class="modal-dialog">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h4 class="modal-title" id="standard-modalLabel">공문 작성</h4>
								                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
								            </div>
								            <div class="modal-body">
								            	<form action="officeLetterRegister" id="letterForm" enctype="multipart/form-data">
								                <div class="mb-3">
												    <label for="sendTitle" class="form-label">공문명</label>
												    <input type="text" id="sendTitle" name="hdLttitle" class="form-control">
												</div>
								                <div class="mb-3">
												    <label for="sendContent" class="form-label">공문 내용</label>
												    <textarea class="form-control" name="hdLtcontent" rows="5" id="sendContent"></textarea>
												</div>
								                <div class="mb-3">
												    <label for="sendFile" class="form-label">파일</label>
												    <input type="file" id="sendFile" class="form-control">
												</div>
												</form>
								            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
								                <button type="button" class="btn btn-primary" id="saveBtn">저장</button>
								            </div>
								        </div><!-- /.modal-content -->
								    </div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
                             </div>

                             <div class="email-menu-list mt-3">
                                 <a href="javascript: void(0);"><i class="ri-star-line me-2"></i>수신함</a>
                                 <a href="javascript: void(0);" class="text-danger fw-bold"><i class="ri-inbox-line me-2"></i>발신함<span class="badge badge-danger-lighten float-end ms-2">7</span></a>
                             </div>

                         </div>
                         <!-- End Left sidebar -->

                         <div class="page-aside-right">
								<div class="col-sm-5">
									<form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between" id="searchForm">
										<input type="hidden" id="page" name="page">
										<div class="col-auto">
											<div class="d-flex align-items-center">
												<select class="form-select" name="searchType" id="searchType">
													<option selected>선택</option>
													<option value="menuName"<c:if test="${searchType eq 'title' }">selected</c:if>>공문명</option>
												</select>
											</div>
										</div>
										<div class="col-auto">
											<label for="inputPassword2" class="visually-hidden">검색</label>
											<input type="text" class="form-control" id="searchWord" name="searchWord"
												placeholder="Search..." value="${searchWord }">
										</div>
									</form>
								</div>
								<br/>
                             <div class="btn-group">
                                 <button type="button" class="btn btn-secondary"><i class="mdi mdi-archive font-16"></i></button>
                                 <button type="button" class="btn btn-secondary"><i class="mdi mdi-alert-octagon font-16"></i></button>
                                 <button type="button" class="btn btn-secondary"><i class="mdi mdi-delete-variant font-16"></i></button>
                             </div>
                             <div class="btn-group">
                                 <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false">
                                     <i class="mdi mdi-folder font-16"></i>
                                     <i class="mdi mdi-chevron-down"></i>
                                 </button>
                                 <div class="dropdown-menu">
                                     <span class="dropdown-header">Move to:</span>
                                     <a class="dropdown-item" href="javascript: void(0);">Social</a>
                                     <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                                     <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                                     <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                 </div>
                             </div>
                             <div class="btn-group">
                                 <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false">
                                     <i class="mdi mdi-label font-16"></i>
                                     <i class="mdi mdi-chevron-down"></i>
                                 </button>
                                 <div class="dropdown-menu">
                                     <span class="dropdown-header">Label as:</span>
                                     <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                                     <a class="dropdown-item" href="javascript: void(0);">Social</a>
                                     <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                                     <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                 </div>
                             </div>

                             <div class="btn-group">
                                 <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false">
                                     <i class="mdi mdi-dots-horizontal font-16"></i> More
                                     <i class="mdi mdi-chevron-down"></i>
                                 </button>
                                 <div class="dropdown-menu">
                                     <span class="dropdown-header">More Options :</span>
                                     <a class="dropdown-item" href="javascript: void(0);">Mark as Unread</a>
                                     <a class="dropdown-item" href="javascript: void(0);">Add to Tasks</a>
                                     <a class="dropdown-item" href="javascript: void(0);">Add Star</a>
                                     <a class="dropdown-item" href="javascript: void(0);">Mute</a>
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
											<th>발송일시</th>
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
														<td> <input type="checkbox" class="form-check-input" id="mail1"></td>
														<td id="hdLtno">${officeLetter.hdLtno }</td>
														<td class="email-content">${officeLetter.hdLttitle }</td>
														<td><fmt:formatDate value="${officeLetter.hdLtrdate }"
																pattern="yyyy-MM-dd" /></td>
				                                         <td>
				                                         <button type="button" class="btn btn-info btn-sm"
																id="sendBtn" data-menucd="${officeLetter.hdLtno}" data-bs-toggle="modal" data-bs-target="#bs-example-modal-lg">발송</button>
				                                         <button type="button" class="btn btn-danger btn-sm"
																id="delBtn" data-menucd="${officeLetter.hdLtno}">삭제</button>
				                                         </td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
                                 
                             </div>
                             <!-- end .mt-4 -->
							 <div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    							<div class="modal-dialog modal-lg">
							        <div class="modal-content">
							            <div class="modal-header">
							                <h5 class="modal-title" id="exampleModalFullscreenSmLabel">공문 발송</h5>
							                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							            </div>
							            <div class="modal-body">
							                <div class="row">
							                    <div class="col">
							                        <div class="card">
							                            <form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between" id="searchForm">
															<input type="hidden" id="page" name="page">
															<div class="col-auto">
																<h5>지점명</h5>
															</div>
															<div class="col-auto">
																<label for="inputPassword2" class="visually-hidden">검색</label>
																<input type="text" class="form-control" id="searchWord" name="searchWord"
																	placeholder="Search..." value="${searchWord }">
															</div>
															<div class="col">
																<button type="button" class="btn btn-success btn-sm">조회</button>
															</div>
														</form>
														<hr/>
														<div>
														<table>
															<thead class="table-light">
																<tr class="text-left">
																    <td>
																        <svg type="button" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
																            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
																            <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
																        </svg>
																        <input type="checkbox" class="form-check-input" id="mail1">
																    </td>
																    <td class="all">대전광역시</td>
																</tr>
															</thead>
															<tbody>
<%-- 																<c:set value="${pagingVO.dataList }" var="frcsList" /> --%>
																<c:choose>
																	<c:when test="${empty frcsList }">
																		<tr class="text-center">
																			<td colspan="5" class="text-dark font-weight-bolder">지점이
																				존재하지 않습니다.</td>
																		</tr>
																	</c:when>
																	<c:otherwise>
																			<c:forEach items="${frcsList }" var="frcs">
																				<tr class="text-left">
																					<td> 
																						<input type="checkbox" class="form-check-input" id="mail1">
																					</td>
																					<td>${frcs.frcsName }</td>
																				</tr>
																			</c:forEach>
																	</c:otherwise>
																</c:choose>
															</tbody>
														</table>
														</div>
							                        </div>
							                    </div>
							                    <div class="col-1">
							                    	<div class="row mt-3 mb-3">
													    <svg id="leftArrow" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
													        <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
													    </svg>
													</div>
													<div class="row mt-3 mb-3">
													    <svg id="rightArrow" xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
													        <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
													    </svg>
													</div>
							                    </div>
							                    <div class="col">
							                        <div class="card" id="receiverList">
							                            <p>수신자 목록</p>
							                        </div>
							                    </div>
							                </div>
							            </div>
							            <div class="modal-footer">
							                <a href="javascript:void(0);" class="btn btn-light" data-bs-dismiss="modal">취소</a>
							                <button type="button" class="btn btn-primary">발송</button>
							            </div>
							        </div>
							    </div>
							</div>

                             <div class="row">
                                 <div class="col-7 mt-1">
                                     <nav aria-label="Page navigation example" id="pagingArea">
						               ${pagingVO.pagingHTML }
						            </nav>
                                 </div> <!-- end col-->
                             </div>
                             <!-- end row-->
                         </div> 
                         <!-- end inbox-rightbar-->
                     </div>
                     <!-- end card-body -->
                     <div class="clearfix"></div>
                 </div> <!-- end card-box -->
             </div> <!-- end Col -->
         </div><!-- End row -->
     </div> <!-- container -->
 </div> <!-- content -->
</div>

<script type="text/javascript">
$(function() {
	var infoHeaderModal = $("#info-header-modal"); // 상세보기 모달 id
	var saveBtn = $("#saveBtn");
	
	// 페이징
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
// 저장
	saveBtn.on("click", function() {
		var sendTitle = $("#sendTitle").val();
		var sendContent = $("#sendContent").val();
		
		if (sendTitle == null || sendTitle === "") {
			alert("공문명을 입력해주세요.");
			return false;
		}
		if (sendContent == null || sendContent === "") {
			alert("공문내용을 입력해주세요.");
			return false;
		}

	    
		var data = {
			hdLttitle : sendTitle,
			hdLtcontent : sendContent
		}

		$.ajax({
			type : "post",
			url : "/head/officeLetterRegister.do",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr) { // csrf 토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}"); // key value로 보낸다.
			},
			success : function(res) {
				console.log(res);
				alert("등록 되었습니다.");
				location.href = "/head/officeLetter.do";
			},
			error : function() {
				alert("데이터 저장 중 오류가 발생했습니다.");
			}
		});
	});
	
	
});

	
</script>
																