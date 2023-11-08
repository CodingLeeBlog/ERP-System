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
	
<!-- 	                            <div class="email-menu-list mt-3"> -->
<!-- 	                                <a id="receive" href="" class="text-primary fw-bold"><i class="ri-inbox-line me-2"></i>받은 공문<span class="badge badge-danger-lighten float-end ms-2">7</span></a> -->
<!-- 	                                <a id="send" href=""><i class="ri-mail-send-line me-2"></i>보낸 공문</a> -->
<!-- 	                            </div>  -->
	                            
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
	                        
	                        	<!-- 검색 ,버튼 -->
		                        <div class="row mb-2">
		                        	<div class="col-xl-8">
			                        	<div class="btn-group">
			                                <button type="button" class="btn btn-light"><i class="mdi mdi-archive font-16"></i>수정</button>
			                                <button type="button" class="btn btn-light"><i class="mdi mdi-alert-octagon font-16"></i>삭제</button>
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
	                            
	                            <!-- 공문 목록 -->
								<!-- 보낸 공문에 보여줄 리스트  -->
								
						        <div class="tab-content" id="v-pills-tabContent">
						        	
						        	<!-- 받은 공문 -->
						            <div class="tab-pane fade active show" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
						                <c:set value="${pagingVO.dataList }" var="frcsOfldcList" />
										<c:choose>
											<c:when test="${empty frcsOfldcList }">
												<h5 class="text-center mt-5">공문이 존재하지 않습니다.</h5>
											</c:when>
											<c:otherwise>
												<c:forEach items="${frcsOfldcList }" var="frcsOfldc">
						                            <div class="mt-3">
						                                <ul class="email-list">
						                                    <li class="unread">
						                                        <div class="email-sender-info">
						                                            <div class="checkbox-wrapper-mail">
						                                                <div class="form-check">
						                                                    <input type="checkbox" class="form-check-input" id="check${frcsOfldc.frcsOfldcNo }">
						                                                    <label class="form-check-label" for="check${frcsOfldc.frcsOfldcNo }">&nbsp;</label>
						                                                </div>
						                                            </div>
						                                            <a href="javascript: void(0);" class="email-title">본사</a>
						                                        </div>
						                                        <div class="email-content">
						                                            <a href="javascript: void(0);" class="email-subject">
						                                                ${frcsOfldc.frcsOfldcTtl }
						                                            </a>
						                                            <div class="email-date">${frcsOfldc.frcsOfldcDspymd }</div>
						                                        </div>
						                                        <div class="email-action-icons">
						                                            <ul class="list-inline">
						                                                <li class="list-inline-item">
						                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
						                                                </li>
						                                                <li class="list-inline-item">
						                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
						                                                </li>
						                                               
						                                            </ul>
						                                        </div>
						                                    </li>
						                                </ul>
						                            </div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
						            </div>
						            
						            <!-- 보낸 공문 -->
						            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
										<c:set value="${pagingVO.dataList }" var="frcsOfldcList" />
										<c:choose>
											<c:when test="${empty frcsOfldcList }">
												<h5 class="text-center mt-5">공문이 존재하지 않습니다.</h5>
											</c:when>
											<c:otherwise>
												<c:forEach items="${frcsOfldcList }" var="frcsOfldc">
						                            <div class="mt-3">
						                                <ul class="email-list">
						                                    <li class="unread">
						                                        <div class="email-sender-info">
						                                            <div class="checkbox-wrapper-mail">
						                                                <div class="form-check">
						                                                    <input type="checkbox" class="form-check-input" id="check${frcsOfldc.frcsOfldcNo }">
						                                                    <label class="form-check-label" for="check${frcsOfldc.frcsOfldcNo }">&nbsp;</label>
						                                                </div>
						                                            </div>
						                                            <a href="javascript: void(0);" class="email-title">본사</a>
						                                        </div>
						                                        <div class="email-content">
						                                            <a href="javascript: void(0);" class="email-subject">
						                                                ${frcsOfldc.frcsOfldcTtl }
						                                            </a>
						                                            <div class="email-date">${frcsOfldc.frcsOfldcDspymd }</div>
						                                        </div>
						                                        <div class="email-action-icons">
						                                            <ul class="list-inline">
						                                                <li class="list-inline-item">
						                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
						                                                </li>
						                                                <li class="list-inline-item">
						                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
						                                                </li>
						                                               
						                                            </ul>
						                                        </div>
						                                    </li>
						                                </ul>
						                            </div>
												</c:forEach>
											</c:otherwise>
										</c:choose>
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
	            <div class="p-1">
	                <div class="modal-body px-3 pt-3 pb-0">
	                   
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
	                <div class="px-3 pb-3">
	                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="regBtn"><i class="mdi mdi-send me-1"></i></button>
	                    <button type="button" class="btn btn-light" data-bs-dismiss="modal" id="canBtn">Cancel</button>
	                </div>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	
</div>

<script type="text/javascript">
$(function(){
	var regBtn = $("#regBtn");
	var regForm = $("#regForm");
	
	regBtn.on("click", function(){
		var frcsOfldcTtl = $("#frcsOfldcTtl").val();
		
		if(frcsOfldcTtl == null || frcsOfldcTtl == ""){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		regForm.submit();
		
	});
	
});
</script>