<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height: 100px;">
				<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">공지사항</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">공지사항을
							관리합니다.</div>
					</div>
					<div
						class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
						게시판 > &nbsp;<span class="text-decoration-underline">공지사항</span>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">

							<div class="row mb-2">
								<div class="col-xl-12">
									<form
										class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between"
										id="searchForm">
										<input type="hidden" id="page" name="page">
										<div class="col-auto">
											<div class="d-flex align-items-center">
												<select class="form-select" name="searchType"
													id="searchType">
													<option value="boardTitle"
														<c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
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
							</div>

							<div class="table-responsive">
								<table class="table table-centered w-100">
									<thead class="table-light">
										<tr>
											<th class="all" style="width: 20px;">
												<div class="form-check">
													<input type="checkbox" class="form-check-input"
														id="checkAll" name="checkbox"> <label
														class="form-check-label" for="checkAll">&nbsp;</label>
												</div>
											</th>
											<th style='text-align: center'>No.</th>
											<th style='text-align: center'>제목</th>
											<th style='text-align: center'>작성자</th>
											<th style='text-align: center'>등록일시</th>
											<th style='text-align: center'>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:set value="${pagingVO.dataList }" var="boardList" />
										<c:choose>
											<c:when test="${empty boardList }">
												<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">게시글이
														존재하지 않습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${boardList }" var="headBoardVO">
													<tr>
														<td style='text-align: center'>
															<div class="form-check">
																<input type="checkbox" class="form-check-input"
																	id="check${headBoardVO.rnum2 }" name="checkbox"
																	value="${headBoardVO.boardNo }"> <label
																	class="form-check-label"
																	for="check${headBoardVO.rnum2 }">&nbsp;</label>
															</div>
														</td>
														<td style='text-align: center'>${headBoardVO.rnum2 }</td>
														<td style='text-align: left'><a
															href="/head/detail.do?boardNo=${headBoardVO.boardNo }">${headBoardVO.boardTitle }</a>
														</td>
														<td style='text-align: center'>관리자</td>
														<td style='text-align: center'><fmt:formatDate
																value="${headBoardVO.boardRegdate }"
																pattern="yyyy. MM. dd" /></td>
														<td style='text-align: center'>${headBoardVO.boardHit }</td>
													</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>

									</tbody>
								</table>
							</div>

							<!-- 페이징 버튼 시작 -->
							<div class="pagination justify-content-center text-dark"
								id="noticepagingArea">${pagingVO.pagingHTML }</div>
							<!-- 페이징 버튼 끝 -->


							<div class="col-xl-12 mt-2">
								<div class="text-xl-end mt-xl-0 mt-2">
									<button type="button" class="btn btn-danger mb-2 me-2"
										id="subBtn">등록</button>
									<button type="button" class="btn btn-light mb-2" id="delBtn">삭제</button>
								</div>
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

<script type="text/javascript">
$(function(){
	var searchForm = $("#searchForm");
	var noticepagingArea = $("#noticepagingArea");
	var subBtn = $("#subBtn");
	var delBtn = $("#delBtn");
	 
	 noticepagingArea.on("click", "a", function(event){
		 event.preventDefault();
		 var pageNo = $(this).data("page");
		 searchForm.find("#page").val(pageNo);
		 searchForm.submit();
	 });
	 
	
	// 등록하기
	subBtn.on("click", function(){
		window.location.href="/head/form.do";
	});
	
	
	// 문의 선택 삭제하기
	delBtn.on('click', function() {
		var selectedItems = [];
		
		 $("input:checkbox[name='checkbox']:checked").each(function () {
             selectedItems.push({ boardNo: $(this).val()});
         });
		 
		 if (selectedItems.length > 0) {
             $.ajax({
                 type: "POST",
                 url: "/head/delete.do",
                 beforeSend: function(xhr){
     				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
     			 },
                 data: JSON.stringify(selectedItems),
                 contentType: "application/json;charset=UTF-8",
                 success: function (response) {
                     console.log("삭제 성공:", response);
                     alert("삭제되었습니다!");
                     location.reload();
                 },
                 error: function (error) {
                     console.error("삭제 실패:", error);
                     alert("다시 시도해주세요!");
                 }
             });
         } else {
             alert("삭제할 문의를 선택하세요.");
         }
	});
	
	
	// 전체 선택 체크박스
	var checkAll = document.getElementById('checkAll');
	
	// 다른 모든 체크박스들
	var checkboxes = document.getElementsByName('checkbox');
	
	// 전체 선택 체크박스의 클릭 이벤트 처리
	checkAll.addEventListener('click', function() {
	    for (var i = 0; i < checkboxes.length; i++) {
	        checkboxes[i].checked = checkAll.checked;
	    }
	});
	
	// 다른 체크박스 중 하나라도 선택이 해제되면 전체 선택 체크박스도 해제
	for (var i = 0; i < checkboxes.length; i++) {
	    checkboxes[i].addEventListener('click', function() {
	        checkAll.checked = true;
	        for (var j = 0; j < checkboxes.length; j++) {
	            if (!checkboxes[j].checked) {
	                checkAll.checked = false;
	                break;
	            }
	        }
	    });
	}
	
});
</script>