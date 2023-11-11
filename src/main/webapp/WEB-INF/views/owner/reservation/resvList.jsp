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
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">예약관리</a></li>
	                            <li class="breadcrumb-item active">매장 예약 관리</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">매장 예약 관리</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	
	        <div class="row">
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	                    
	                        <div class="row mb-2">
	                        	<div class="col-xl-8"></div>
	                            <div class="col-xl-4">
	                                <form class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between" id="searchForm">
	                                    <div class="col-auto input-group input-group-outline">
	                                        <select class="form-select" id="searchType" name="searchType" aria-label="Example select with button addon">
												<option value="content" <c:if test="${searchType eq 'content' }">selected</c:if>>내용</option>
												<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
											</select>
		                                    <label for="inputPassword2" class="visually-hidden">Search</label>
		                                    <input type="search" class="form-control" id="searchWord" name="searchWord" value="${searchWord }" placeholder="Search...">
			                                <button type="submit" class="btn btn-outline-secondary">검색</button>
	                                    </div>
	                                <sec:csrfInput/>
	                                </form>                            
	                            </div>
	                        </div>
	
	                        <div class="table-responsive">
	                            <table class="table dt-responsive nowrap table-centered w-100 ">
	                                <thead class="table-light">
	                                    <tr>
	                                        <th style="width: 20px;">
	                                            <div class="form-check">
	                                                <input type="checkbox" class="form-check-input" id="checkAll" name="checkbox">
	                                                <label class="form-check-label" for="checkAll">&nbsp;</label>
	                                            </div>
	                                        </th>
	                                        <th>예약일자</th>
	                                        <th>예약시간</th>
	                                        <th>회원ID</th>
	                                        <th>예약인원</th>
	                                        <th>좌석</th>
	                                        <th>예약상태</th>
	                                        <th>비고</th>
	                                        <th>상세보기/수정</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:set value="${pagingVO.dataList }" var="resvList" />
	                                	<c:choose>
	                                		<c:when test="${empty resvList }">
	                                			<tr class="text-center">
													<td colspan="9" class="text-dark font-weight-bolder">예약이 존재하지 않습니다.</td>
												</tr>
	                                		</c:when>
	                                		<c:otherwise>
		                                		<c:forEach items="${resvList }" var="resv">
				                                    <tr>
				                                        <td>
				                                            <div class="form-check">
				                                                <input type="checkbox" class="form-check-input" id="check${resv.resvNo }" name="checkbox" value="${resv.resvNo }">
				                                                <label class="form-check-label" for="check${resv.resvNo }">&nbsp;</label>
				                                            </div>
				                                        </td>
				                                        <td>
															<fmt:formatDate value="${resv.resvDate }" pattern="yyyy-MM-dd"/>
				                                        </td>
				                                        <td>${resv.resvTime }</td>
				                                        <td><a href="/" class="link-info" data-bs-toggle="modal" data-bs-target="#M${resv.resvNo }">${resv.memId }</a></td>
				                                        <td>${resv.resvMcnt }</td>
				                                        <td>${resv.seatCd }</td>
				                                        <td>
				                                            <h5><span class="badge badge-info-lighten">
				                                            	<c:if test="${resv.resvState eq 'Y'}">
																	예약완료
																</c:if>
																<c:if test="${resv.resvState eq 'N'}">
																	예약취소
																</c:if>
				                                            </span></h5>
				                                        </td>
				                                        <td>${resv.resvNote }</td>
				                                        <td>
				                                        	<h5><a href="/" class="text-body" id="resvModalBtn" data-bs-toggle="modal" data-bs-target="#${resv.resvNo }"><span class="badge badge-primary-lighten">예약상세/수정</span></a></h5>
				                                        </td>
				                                    </tr>
		                                		</c:forEach>
	                                		</c:otherwise>
	                                	</c:choose>
	                                    
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <!-- 예약 모달 ------------------------------------------------------------------------------------>
	                        <c:forEach items="${resvList }" var="resv">
		                        <div class="modal fade" id="${resv.resvNo }" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											
											<div class="modal-header">
												<h4 class="modal-title" id="myCenterModalLabel">예약 상세보기</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
											</div>
											
											<div class="modal-body" id="modal">
												<div class="m-3">
													<form action="/owner/resvUpdate.do" id="udtForm" method="post">
													
														<div class="row mb-2">
															<label for="resvState" class="col-3 col-form-label">예약상태</label>
															<div class="col-9">
																<c:if test="${resv.resvState eq 'Y'}">
																	<p class="form-control-plaintext">예약완료</p>
																</c:if>
																<c:if test="${resv.resvState eq 'N'}">
																	<p class="form-control-plaintext">예약취소</p>
																</c:if>
															</div>
														</div>
														
														<div class="row mb-2">
															<label for="resvNo" class="col-3 col-form-label">예약코드</label>
															<div class="col-9">
																<input id="resvNo" name="resvNo" type="text"  value="${resv.resvNo }" class="form-control-plaintext" readonly >
															</div>
														</div>
														
														<div class="row mb-2">
															<label for="resvDate" class="col-3 col-form-label">예약일자</label>
															<div class="col-9">
																<input id="resvDate" name="resvDate" type="date" value="<fmt:formatDate value="${resv.resvDate }" pattern="yyyy-MM-dd"/>" class="form-control-plaintext udt" readonly >
															</div>
														</div>
	
														<div class="row mb-2">
															<label for="resvTime" class="col-3 col-form-label">예약시간</label>
															<div class="col-9">
																<input id="resvTime" name="resvTime" type="text"  value="${resv.resvTime }" class="form-control-plaintext udt" readonly >
															</div>
														</div>
														
														<div class="row mb-2">
															<label for="resvMcnt" class="col-3 col-form-label">예약인원</label>
															<div class="col-9">
																<input id="resvMcnt" name="resvMcnt" type="text" value="${resv.resvMcnt }" class="form-control-plaintext udt" readonly >
															</div>
														</div>
														
														<!-- 좌석 수정시 그날 남아있는 좌석을 보여줄 것! -->
														<div class="row mb-2">
															<label for="seatCd" class="col-3 col-form-label">좌석번호</label>
															<div class="col-9">
																<input id="seatCd" name="seatCd" type="text" value="${resv.seatCd }" class="form-control-plaintext udt" readonly >
															</div>
														</div>
														
														<!-- 메뉴 따로 리스트로 받아서 넣어야할듯?! -->
														<div class="row mb-2">
															<label class="col-3 col-form-label">메뉴</label>
															<div class="col-9">
															<!-- resvmenuList : List<MenuListVO> -->
															<c:set value="${resv.resvMenuList }" var="resvmenuList" />
															<c:forEach var="menuListVO" items="${resvmenuList}" varStatus="stat">
																<p class="form-control-plaintext">${menuListVO.menuName} ${menuListVO.menuCnt}개</p>
															</c:forEach>																
															</div>
														</div>
														
														<div class="row mb-2">
															<label class="col-3 col-form-label">결제금액</label>
															<div class="col-9">
																<p class="form-control-plaintext">${resv.resvPrice }</p>
															</div>
														</div>
														
														<div class="row mb-2">
															<label class="col-3 col-form-label">예약접수일자</label>
															<div class="col-9">
																<p class="form-control-plaintext"><fmt:formatDate value="${resv.resvAccDate }" pattern="yyyy-MM-dd"/></p>
															</div>
														</div>
														
														<div class="row mb-2">
															<label for="resvNote" class="col-3 col-form-label">비고</label>
															<div class="col-9">
																<input id="resvNote" name="resvNote" type="text" value="${resv.resvNote }" class="form-control-plaintext udt" readonly >
															</div>
														</div>
													
													<sec:csrfInput/>
													</form>
													
												</div>
											</div>
											
											<div class="modal-footer">
												<button type="button" class="btn btn-light"	data-bs-dismiss="modal">닫기</button>
												<button type="button" class="btn btn-primary"	id="udtBtn">수정</button>
												<button type="button" class="btn btn-primary"	id="regBtn" style="display:none">저장</button>
											</div>
													
										</div>
									</div>
								</div>
							</c:forEach>
							
							<!-- 회원 모달 ------------------------------------------------------------------------------>
							<c:set var="member" value="${member}" />
	                        <c:forEach items="${resvList }" var="resv">
		                        <div class="modal fade" id="M${resv.resvNo }" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											
											<div class="modal-header">
												<h4 class="modal-title" id="myCenterModalLabel">회원 상세보기</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
											</div>
											
											<div class="modal-body" id="modal">
												<div class="m-3">
													<p>회원ID : ${resv.memId }</p>
													<p>이름 : ${member.memName }</p>
													<p>생년월일 : ${member.memBir }</p>
													<p>연락처 : ${member.memTel }</p>
													<!-- 연락처 클릭시 카톡문자보내기 하면 좋을듯 -->
												</div>
											</div>
											
											<div class="modal-footer">
												<button type="button" class="btn btn-light"	data-bs-dismiss="modal">닫기</button>
											</div>
													
										</div>
									</div>
								</div>
							</c:forEach>
							
	                        <!-- 페이징추가하기 -->
	                        <nav aria-label="Page navigation example" id="pagingArea">
								${pagingVO.pagingHTML }
							</nav>
	
	                        <div class="col-xl-12 mt-2">
	                            <div class="text-xl-end mt-xl-0 mt-2">
	                                <button type="button" class="btn btn-light mb-2" id="canBtn">예약취소</button>
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
	
	// 예약 수정하기
	var udtBtn = $("#udtBtn");
	var udtForm = $("#udtForm");
	
	udtBtn.on('click', function() {
		
		// input 요소의 readonly 속성을 제거
	    var inputElements = document.querySelectorAll('.udt');
	    inputElements.forEach(function(inputElement) {
	    	// class 속성을 변경하여 form-control로 변경
	        inputElement.classList.remove('form-control-plaintext');
	        inputElement.classList.add('form-control');
	  		// readonly 속성 제거
	        inputElement.removeAttribute('readonly');
	    });
	    
		// 수정버튼 숨기기
	    var udtBtn = document.getElementById("udtBtn");
	    udtBtn.style.display = 'none';
	    
	    // 저장버튼 나타내기
	    var regBtn = document.getElementById("regBtn");
	    regBtn.style.display = 'block';
		
	});
	
	// 수정>저장 업데이트
	var regBtn = $("#regBtn");
	
	regBtn.on('click', function() {
		udtForm.submit();
	});
	
	
	// 예약취소하기
	var canBtn = $("#canBtn");
	
	canBtn.on('click', function(){
		
		var selectedItems = [];
		
		 $("input:checkbox[name='checkbox']:checked").each(function () {
             selectedItems.push({ 
            	resvNo: $(this).val()
             });
         });
		 
		 if (selectedItems.length > 0) {
             $.ajax({
                 type: "POST",
                 url: "/owner/rsevDelete.do",
                 beforeSend: function(xhr){
     				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
     			 },
                 data: JSON.stringify(selectedItems),
                 contentType: "application/json;charset=UTF-8",
                 success: function (response) {
                     console.log("예약 취소 성공:", response);
                     alert("예약 취소되었습니다!");
                     location.reload();
                 },
                 error: function (error) {
                     console.error("예약 취소 실패:", error);
                     alert("다시 시도해주세요!");
                     
                 }
             });
         } else {
             alert("취소할 예약을 선택하세요.");
         }
		
	});
	
	//검색,페이징
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("page").val(pageNo);
		searchForm.submit();
	});
	

	
});
</script>