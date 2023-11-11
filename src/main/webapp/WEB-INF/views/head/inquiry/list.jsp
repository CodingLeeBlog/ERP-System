<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height:100px;">
	         <div class="row ">
	               <div class="card-body col-4 align-items-center">
	                  <div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">1:1문의</div>
	                  <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">1:1문의를 관리합니다.</div>
	               </div>
	               <div class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
                  게시판 > &nbsp;<span class="text-decoration-underline">1:1문의</span>
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
	                                <form class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between">
	                                    <div class="col-auto">
	                                        <label for="inputPassword2" class="visually-hidden">Search</label>
	                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search...">
	                                        <!-- 버튼추가하기 -->
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
	                                                <input type="checkbox" class="form-check-input" id="checkAll" name="checkbox">
	                                                <label class="form-check-label" for="checkAll">&nbsp;</label>
	                                            </div>
	                                        </th>
	                                        <th>No.</th>
	                                        <th>제목</th>
	                                        <th>작성일</th>
	                                        <th>답변여부</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:set value="${pagingVO.dataList }" var="headInquiryList" />
	                                	<c:choose>
	                                		<c:when test="${empty headInquiryList }">
	                                			<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">문의글이 존재하지 않습니다.</td>
												</tr>
	                                		</c:when>
	                                		<c:otherwise>
		                                		<c:forEach items="${headInquiryList }" var="headInquiry">
				                                    <tr>
				                                        <td>
				                                            <div class="form-check">
				                                                <input type="checkbox" class="form-check-input" id="check${headInquiry.inqryNo }" name="checkbox" value="${headInquiry.inqryNo }">
				                                                <label class="form-check-label" for="check${headInquiry.inqryNo }">&nbsp;</label>
				                                            </div>
				                                        </td>
				                                        <td>${headInquiry.inqryNo }</td>
				                                        <td>
				                                            <a href="/head/inquiryDetail.do?inqryNo=${headInquiry.inqryNo }" class="text-body fw-bold">${headInquiry.inqryTtl }</a>
				                                        </td>
				                                        <!-- 내용 일정 글자 초과시 뒤에 ...으로 표시하기 -->
				                                        <td><fmt:formatDate value="${headInquiry.inqryYmd }" pattern="yyyy-MM-dd"/></td>
				                                        <td>
				                                            <c:if test="${headInquiry.inqryYn eq 'N'}">
					                                            <h5><span class="badge badge-info-lighten">
					                                            	답변대기중
					                                            </span></h5>
				                                            </c:if>
				                                            <c:if test="${headInquiry.inqryYn eq 'Y'}">
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
	                        
	                        <!-- 페이징추가하기 -->
	
	                        <div class="col-xl-12 mt-2">
	                            <div class="text-xl-end mt-xl-0 mt-2">
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
	
});
</script>