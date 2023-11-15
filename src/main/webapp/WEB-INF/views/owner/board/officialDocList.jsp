<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div class="content-page">
	<div class="content">
	
	    <!-- Start Content-->
	    <div class="container-fluid">
	        
	        <!-- start page email-title -->
	        <!-- start page title -->
	        <div class="row">
	            <div class="col-12">
	                <div class="page-title-box">
	                    <div class="page-title-right">
	                        <ol class="breadcrumb m-0">
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
	                            <li class="breadcrumb-item active">공문조회</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">공문조회</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	        <!-- end page email-title --> 
	
	        <div class="row">
	
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	                    
	                        <!-- 왼쪽 사이드바 -->
	                        <div class="page-aside-left">
	                            <div class="d-grid">
	                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#compose-modal">공문 보내기</button>
	                            </div>
	                            
	                            <div class="nav flex-column mt-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
						            <a class="nav-link active show" id="v-pills-home-tab" data-bs-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home"
						                aria-selected="true">
						                <i class="mdi mdi-home-variant d-md-none d-block"></i>
						                <span class="d-none d-md-block"><i class="ri-inbox-line me-2"></i>받은 공문</span>
						            </a>
						            <a class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile"
						                aria-selected="false">
						                <i class="mdi mdi-account-circle d-md-none d-block"></i>
						                <span class="d-none d-md-block"><i class="ri-mail-send-line me-2"></i>보낸 공문</span>
						            </a>
						        </div>
						        
	                        </div>
	                        <!-- 왼쪽 사이드바 끝 -->
	
	                        <div class="page-aside-right">
	                        
	                            <!-- 공문 목록 -->
								<!-- 보낸 공문에 보여줄 리스트  -->
								
						        <div class="tab-content" id="v-pills-tabContent">
						        	
						        	<!-- 받은 공문 -->
						            <div class="tab-pane fade active show" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
						            
						            	<!-- 검색 ,버튼 -->
				                        <div class="row mb-2">
				                        	<div class="col-xl-8">
					                        	<div class="btn-group">
					                        		<div class="form-check bg-light" style="width:45px; display:flex; align-items:center;">
		                                                <input type="checkbox" class="form-check-input m-0" id="checkAll" name="checkbox">
		                                            </div>
					                                <button type="button" class="btn btn-light" id="delBtn"><i class="mdi mdi-delete font-16"></i>삭제</button>
					                            </div>
				                        	</div>
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
						            
			                            <div class="mt-3">
						                	<ul class="email-list" style="border: solid #eef2f7; border-width: 1px 0px 0px 0px">
								                <c:set value="${pagingVO.dataList }" var="officeLetterList" />
												<c:choose>
													<c:when test="${empty officeLetterList }">
														<h5 class="text-center mt-5">공문이 존재하지 않습니다.</h5>
													</c:when>
													<c:otherwise>
														<c:forEach items="${officeLetterList }" var="officeLetter">
						                                    <li class="unread" style="border: solid #eef2f7; border-width: 0px 0px 1px 0px">
						                                        <div class="email-sender-info">
						                                            <div class="checkbox-wrapper-mail">
						                                                <div class="form-check">
						                                                    <input type="checkbox" class="form-check-input" id="check${officeLetter.hdLtno }" name="checkbox" value="${officeLetter.hdLtno }">
<%-- 						                                                    <label class="form-check-label" for="check${officeLetter.hdLtno }">&nbsp;</label> --%>
						                                                </div>
						                                            </div>
						                                            <a href="javascript: void(0);" class="email-title">본사</a>
						                                        </div>
						                                        <div class="email-content">
						                                            <a href="/owner/docDetailHead.do?hdLtno=${officeLetter.hdLtno }" class="email-subject">
						                                                ${officeLetter.hdLttitle }
						                                            </a>
						                                            <div class="email-date" style="width: 150px"><fmt:formatDate value="${officeLetter.hdLtsdate }" pattern="yyyy/MM/dd HH:mm"/></div>
						                                        </div>
						                                        <div class="email-action-icons">
						                                            <ul class="list-inline">
						                                                <li class="list-inline-item">
						                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
						                                                </li>
						                                               
						                                            </ul>
						                                        </div>
						                                    </li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
			                                </ul>
			                            </div>
						            </div>
						            
						            <!-- 보낸 공문 -->
						            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
						            
						            	<!-- 보낸 공문 검색 ,버튼 -->
				                        <div class="row mb-2">
				                        	<div class="col-xl-8">
					                        	<div class="btn-group">
					                        		<div class="form-check bg-light" style="width:45px; display:flex; align-items:center;">
		                                                <input type="checkbox" class="form-check-input m-0" id="checkAll" name="checkbox">
		                                            </div>
					                                <button type="button" class="btn btn-light" id="delBtn"><i class="mdi mdi-delete font-16"></i>삭제</button>
					                            </div>
				                        	</div>
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
						            
						            
			                            <div class="mt-3">
			                                <ul class="email-list" style="border: solid #eef2f7; border-width: 1px 0px 0px 0px">
												<c:set value="${pagingVOF.dataList }" var="frcsOfldcList" />
												<c:choose>
													<c:when test="${empty frcsOfldcList }">
														<h5 class="text-center mt-5">공문이 존재하지 않습니다.</h5>
													</c:when>
													<c:otherwise>
														<c:forEach items="${frcsOfldcList }" var="frcsOfldc">
						                                    <li class="unread" style="border: solid #eef2f7; border-width: 0px 0px 1px 0px">
						                                        <div class="email-sender-info">
						                                            <div class="checkbox-wrapper-mail">
						                                                <div class="form-check">
						                                                    <input type="checkbox" class="form-check-input" id="check${frcsOfldc.frcsOfldcNo }">
<%-- 						                                                    <label class="form-check-label" for="check${frcsOfldc.frcsOfldcNo }">&nbsp;</label> --%>
						                                                </div>
						                                            </div>
<%-- 						                                            <c:if test="${frcsOfldc.frcsOfldcRcvr eq 'admin' }"> --%>
																		<!-- 가맹점명 넣기 -->
						                                          		<a href="javascript: void(0);" class="email-title">가맹점</a>
<%-- 						                                            </c:if> --%>
						                                        </div>
						                                        <div class="email-content">
						                                            <a href="/owner/docDetail.do?frcsOfldcNo=${frcsOfldc.frcsOfldcNo}" class="email-subject">
						                                                ${frcsOfldc.frcsOfldcTtl }
						                                            </a>
						                                            <div class="email-date" style="width: 150px"><fmt:formatDate value="${frcsOfldc.frcsOfldcDspymd }" pattern="yyyy/MM/dd HH:mm"/></div>
						                                        </div>
						                                        <div class="email-action-icons">
						                                            <ul class="list-inline">
						                                                <li class="list-inline-item">
						                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
						                                                </li>
						                                            </ul>
						                                        </div>
						                                    </li>
														</c:forEach>
													</c:otherwise>
												</c:choose>
			                                </ul>
			                            </div>
						            </div>
						            
						        </div> <!-- end tab-content-->
						   
								<!-- 페이징 -->
	                            <nav aria-label="Page navigation example" id="pagingArea">
									${pagingVO.pagingHTML }
								</nav>
	                            
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
	
	
	<!-- 공문 보내기 모달 -->
	<div id="compose-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	        
	            <div class="modal-header modal-colored-header">
	                <h4 class="modal-title" id="compose-header-modalLabel">공문 보내기</h4>
	                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            
	                <div class="modal-body px-3 pt-3 pb-0 mb-2">
	                    <form action="/owner/docInsert.do" method="post" id="regForm" enctype="multipart/form-data">
	                        <input type="hidden" id="frcsOfldcRcvr" name="frcsOfldcRcvr" value="">
	                        <div class="mb-2">
	                            <label for="mailsubject" class="form-label">제목</label>
	                            <input type="text" id="frcsOfldcTtl" name="frcsOfldcTtl" class="form-control" placeholder="제목">
	                        </div>
	                        <div class="write-mdg-box mb-3">
	                            <label class="form-label">내용</label>
	                            <textarea id="simplemde1" name="frcsOfldcCn"></textarea>
	                        </div>
	                        <div class="mb-2">
	                            <label class="form-label">첨부파일</label>
	                            <input type="file" id="boFile" name="boFile" class="form-control" multiple="multiple">
	                        </div>
	                    	<sec:csrfInput/>
	                    </form>
	                </div>
	                
	                <div class="modal-footer pb-3">
	                    <button type="button" class="btn btn-light" data-bs-dismiss="modal" id="canBtn">취소</button>
	                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="regBtn"><i class="mdi mdi-send me-1"></i>전송</button>
	                </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
</div>

<script type="text/javascript">
$(function(){
	var regBtn = $("#regBtn");
	var delBtn = $("#delBtn");
	var regForm = $("#regForm");
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	
	regBtn.on("click", function(){
		var frcsOfldcTtl = $("#frcsOfldcTtl").val();
		
		if(frcsOfldcTtl == null || frcsOfldcTtl == ""){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		regForm.submit();
		
	});
	
	// 문의 선택 삭제하기
	delBtn.on('click', function() {
		var selectedItems = [];
		
		 $("input:checkbox[name='checkbox']:checked").each(function () {
             selectedItems.push({ frcsOfldcNo: $(this).val()});
         });
		 
		 if (selectedItems.length > 0) {
             $.ajax({
                 type: "POST",
                 url: "/owner/docDelete.do",
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