<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="content-page">
	<div class="content">
	
	    <!-- Start Content-->
	    <div class="container-fluid">
	
	        <!-- start page title -->
	        <div class="row">
	            <div class="col-12">
	                <div class="page-title-box">
	                    <div class="page-title-right">
	                        <ol class="breadcrumb m-0">
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
	                            <li class="breadcrumb-item active">1대1문의</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">1대1문의</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	
	        <div class="row">
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	                    
	                    	<!-- 검색 -->
	                        <div class="row mb-2">
	                        	<div class="col-xl-8"></div>
	                            <div class="col-xl-4">
	                                <form class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between" id="searchForm">
	                                    <div class="col-auto input-group input-group-outline">
	                                        <select class="form-select" id="searchType" name="searchType" aria-label="Example select with button addon">
												<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
												<option value="content" <c:if test="${searchType eq 'content' }">selected</c:if>>내용</option>
											</select>
		                                    <label for="inputPassword2" class="visually-hidden">Search</label>
		                                    <input type="search" class="form-control" id="searchWord" name="searchWord" value="${searchWord }" placeholder="Search...">
			                                <button type="submit" class="btn btn-outline-secondary">검색</button>
	                                    </div>
	                                <sec:csrfInput/>
	                                </form>                            
	                            </div>
	                        </div>
	
							<!-- 테이블 -->
	                        <div class="table-responsive">
<!-- 	                            <table id="basic-datatable" class="table dt-responsive nowrap table-centered w-100"> -->
	                            <table class="table nowrap table-centered w-100 table-hover " style="table-layout:fixed">
	                                <thead class="table-light">
	                                    <tr>
	                                        <th class="all" style="width: 20px;">
	                                            <div class="form-check">
	                                                <input type="checkbox" class="form-check-input" id="checkAll" name="checkbox">
	                                                <label class="form-check-label" for="checkAll">&nbsp;</label>
	                                            </div>
	                                        </th>
	                                        <th>No.</th>
	                                        <th>제목</th>
<!-- 	                                        <th>내용</th> -->
	                                        <th>작성일</th>
	                                        <th>답변여부</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:set value="${pagingVO.dataList }" var="frcsInqList" />
	                                	<c:choose>
	                                		<c:when test="${empty frcsInqList }">
	                                			<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">문의글이 존재하지 않습니다.</td>
												</tr>
	                                		</c:when>
	                                		<c:otherwise>
		                                		<c:forEach items="${frcsInqList }" var="frcsInq">
				                                    <tr>
				                                        <td>
				                                            <div class="form-check">
				                                                <input type="checkbox" class="form-check-input" id="check${frcsInq.inqryNo }" name="checkbox" value="${frcsInq.inqryNo }">
				                                                <label class="form-check-label" for="check${frcsInq.inqryNo }">&nbsp;</label>
				                                            </div>
				                                        </td>
				                                        <td>${frcsInq.inqryNo }</td>
				                                        <td>
				                                            <a href="/owner/inqDetail.do?inqryNo=${frcsInq.inqryNo }" class="text-body fw-bold">${frcsInq.inqryTtl }</a>
				                                        </td>
				                                        <!-- 내용 일정 글자 초과시 뒤에 ...으로 표시하기 -->
<%-- 				                                        <td style="max-width:100px; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><p><a href="/owner/inqDetail.do?inqryNo=${frcsInq.inqryNo }" class="text-body">${frcsInq.inqryCn }</a></p></td> --%>
				                                        <td><fmt:formatDate value="${frcsInq.inqryYmd }" pattern="yyyy-MM-dd"/></td>
				                                        <td>
				                                            <c:if test="${frcsInq.inqryYn eq 'N'}">
					                                            <h5><span class="badge badge-info-lighten">
					                                            	답변대기중
					                                            </span></h5>
				                                            </c:if>
				                                            <c:if test="${frcsInq.inqryYn eq 'Y'}">
					                                            <h5><span class="badge badge-info-lighten">
					                                            	답변완료
					                                            </span></h5>
				                                            </c:if>
				                                        </td>
				                                    </tr>
		                                		</c:forEach>
	                                		</c:otherwise>
	                                	</c:choose>
	                                    
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <!-- 페이징 -->
	                        <nav aria-label="Page navigation example" id="pagingArea">
								${pagingVO.pagingHTML }
							</nav>
	
	                        <div class="col-xl-12 mt-2">
	                            <div class="text-xl-end mt-xl-0 mt-2">
	                                <button type="button" class="btn btn-primary mb-2 me-2" id="subBtn">문의하기</button>
	                                <button type="button" class="btn btn-light mb-2" id="delBtn">삭제</button>
	                            </div>
	                        </div>
	                    </div> <!-- end card-body-->
	                </div> <!-- end card-->
	            </div> <!-- end col -->
	        </div>
	        <!-- end row --> 
	        
	    </div> <!-- container -->
	
	</div> <!-- content -->
</div>

<script type="text/javascript">
$(function(){
	var subBtn = $("#subBtn");
	var delBtn = $("#delBtn");
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	
	// 문의 등록하기
	subBtn.on("click", function(){
		window.location.href="/owner/inqForm.do";
	});
	
	
	// 문의 선택 삭제하기
	delBtn.on('click', function() {
		var selectedItems = [];
		
		 $("input:checkbox[name='checkbox']:checked").each(function () {
             selectedItems.push({ inqryNo: $(this).val()});
         });
		 
		 if (selectedItems.length > 0) {
             $.ajax({
                 type: "POST",
                 url: "/owner/inqDelete.do",
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
	
	//검색,페이징
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("page").val(pageNo);
		searchForm.submit();
	});
	
});
</script>