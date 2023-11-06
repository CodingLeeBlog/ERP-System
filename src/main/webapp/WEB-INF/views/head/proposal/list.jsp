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
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
	                            <li class="breadcrumb-item active">건의합니다</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">건의합니다.</h4>
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
													<option selected>선택</option>
													<option value="title"<c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
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
	                        </div>
	
	                        <div class="table-responsive">
	                            <table class="table table-centered w-100 " id="">
	                                <thead class="table-light">
	                                    <tr>
<!-- 	                                        <th class="all">No.</th> -->
	                                        <th>제목</th>
	                                        <th>작성자</th>
	                                        <th>작성일</th>
	                                        <th>답변여부</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:set value="${pagingVO.dataList }" var="proposalList" />
	                                	<c:choose>
	                                		<c:when test="${empty proposalList }">
	                                			<tr class="text-center">
													<td colspan="7" class="text-dark font-weight-bolder">게시글이 존재하지 않습니다.</td>
												</tr>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<c:forEach items="${proposalList }" var="proposal">
				                                    <tr>
				                                        <td>
				                                            <a href="/head/proposalDetail.do?tableNo=${proposal.tableNo }" class="text-body" data-bs-toggle="modal" data-bs-target="${proposal.tableNo }">${proposal.boardTitle }</a>
				                                        </td>
				                                        <td>${proposal.memId }</td>
				                                        <td><fmt:formatDate value="${proposal.boardRegdate }" pattern="yyyy-MM-dd"/></td>
				                                        <td>
				                                            <span class="badge bg-success">${proposal.ansState }</span>
				                                        </td>
				                                    </tr>
	                                			</c:forEach>
	                                		</c:otherwise>
	                                	</c:choose>
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <nav aria-label="Page navigation example" id="pagingArea">
					               ${pagingVO.pagingHTML }
					        </nav>
	
	                        <div class="row mt-2">
	                            <div class="col-sm-12">
	                                <div class="text-sm-end">
	                                    <button type="button" class="btn btn-light mb-2" id="delBtn">삭제</button>
	                                </div>
	                            </div><!-- end col-->
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
	var udtBtn = $("#udtBtn");
	var delBtn = $("#delBtn");
	var ansForm = $("#ansForm");
	var ansUdtForm = $("#ansUdtForm");
	var pagingArea = $("#pagingArea");
	
	// 페이징
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	subBtn.on("click", function(){
		console.log("클릭");
		var ansCn1 = $("#ansCn1").val(); 
		
		if(ansCn1 == null || ansCn1 == ""){
			alert("답변을 입력해주세요!");
			return false;
		}
		
		reviewAnsForm.submit();
	});
	
	udtBtn.on("click", function(){
		var ansCn2 = $("#ansCn2").val(); 
		
		if(ansCn2 == null || ansCn2 == ""){
			alert("답변을 입력해주세요!");
			return false;
		}
		
		reviewAnsUdtForm.submit();
		
	});

// 	// 전체 선택 체크박스
// 	var checkAll = document.getElementById('checkAll');
	
// 	// 다른 모든 체크박스들
// 	var checkboxes = document.getElementsByName('checkbox');
	
// 	// 전체 선택 체크박스의 클릭 이벤트 처리
// 	checkAll.addEventListener('click', function() {
// 	    for (var i = 0; i < checkboxes.length; i++) {
// 	        checkboxes[i].checked = checkAll.checked;
// 	    }
// 	});
	
// 	// 다른 체크박스 중 하나라도 선택이 해제되면 전체 선택 체크박스도 해제
// 	for (var i = 0; i < checkboxes.length; i++) {
// 	    checkboxes[i].addEventListener('click', function() {
// 	        checkAll.checked = true;
// 	        for (var j = 0; j < checkboxes.length; j++) {
// 	            if (!checkboxes[j].checked) {
// 	                checkAll.checked = false;
// 	                break;
// 	            }
// 	        }
// 	    });
// 	}
	
// 	delBtn.on('click', function() {
// 		var selectedItems = [];
		
// 		 $("input:checkbox[name='checkbox']:checked").each(function () {
//              selectedItems.push({ reviewNo: $(this).val()});
//          });
		 
// 		 if (selectedItems.length > 0) {
//              $.ajax({
//                  type: "POST",
//                  url: "/owner/reviewDelete.do", // 서버의 URL 주소
//                  beforeSend: function(xhr){
//      				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
//      			 },
//                  data: JSON.stringify(selectedItems),
//                  contentType: "application/json;charset=UTF-8",
//                  success: function (response) {
//                      console.log("삭제 성공:", response);
//                      alert("삭제되었습니다!");
//                      location.reload();
//                  },
//                  error: function (error) {
//                      console.error("삭제 실패:", error);
//                      alert("다시 시도해주세요!");
                     
//                  }
//              });
//          } else {
//              alert("삭 선택하세요.");
//          }
// 	});
	
});
</script>