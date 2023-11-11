<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal.member" var="member"/>
		
			<div class="col-md-10 pt-5 pb-5 pe-5 bg-white">
			
				<!-- 예약 내역 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;">
					<h2 class="">예약 내역</h2> 
					<div class="d-flex justify-content-end mb-3">
						<a href="/elly/mypage/res.do?memId=${member.memId }">
							<span>전체</span>
						</a>
					</div>
				</div>
				<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
					<div class="row text-center">
							<div class="col-1">예약번호</div>
							<div class="col-1">예약 시간</div>
							<div class="col-1">예약 인원</div>
							<div class="col-1">예약 좌석</div>
							<div class="col-1">예약 일자</div>
							<div class="col">건의사항</div>
							<div class="col-1">예약 상태</div>
							<div class="col-1">리뷰 쓰기</div>
							<div class="col-1">비고</div>
					</div>
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
					<div>
						<c:set value="${resList }" var="resList"/>
						<c:choose>
							<c:when test="${empty resList}">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">접수하신 예약이 없습니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${resList }" var="res">
									<div class="row text-center d-flex justify-content-center align-items-center">
										<div class="col-1">
											<div class="resvNo">${res.resvNo }</div>
										</div>
										<div class="col-1">
											${res.resvTime }
										</div>
										<div class="col-1">
											${res.resvMcnt }
										</div>
										<div class="col-1">
											${res.seatCd }
										</div>
										<div class="col-1 resvDate">
											<fmt:formatDate value="${res.resvDate}" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col">
											${res.resvNote}
										</div>
										<div class="col-1 resState">
											<div>예약 완료</div>										
										</div>
										<div class="col-1 reviewState">
											<c:if test="${res.reviewYn eq 'Y' }">
												<div>등록 완료</div>
											</c:if>
											<c:if test="${res.reviewYn ne 'Y' }">
												<form action="/elly/store/find.do" method="get" id="reviewForm">
													<input type="hidden" name="frcsreview" class="frcsreview" value="review">
													<input type="hidden" name="frcsName" class="frcsName" value="${res.frcsName }">
													<input class="btn btn-secondary reviewBtn" type="button" name="reviewBtn" id="reviewBtn" value="리뷰 쓰기" />
												</form>
											</c:if>
										</div>
										<div class="col-1 payState">
											<c:if test="${res.reviewYn eq 'Y' }">
												<div>결제 완료</div>
											</c:if>
											<c:if test="${res.reviewYn ne 'Y' }">
												<input class="btn btn-secondary paymentcancelBtn" type="button" name="paymentcancelBtn" id="paymentcancelBtn" value="결제 취소" />
											</c:if>
										</div>
										<input class="name" type="hidden" name="" id="" value="${res.frcsName }" />
										<input class="amount" type="hidden" name="" id="" value="${res.resvPrice }" />
									</div>
									<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
								</c:forEach>
							</c:otherwise>
						</c:choose>						
					</div>
				</div>
				
				<a href="/elly/faqlist.do" class="">
					<i class="ic-22-line-question"></i>
					<span>취소/환불 방법이 궁금하신가요?</span>
				</a>

				<div class="mt-5 mb-5 d-flex"></div>
				
				<!-- 커뮤니티 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;">
					<h2 class="mb-5">게시글</h2> 
							
					<div class="row d-flex justify-content-center align-items-center mb-3">
					
					<!-- 구분 -->
						<div class="col-9">
							<form id="searchForm" method="post">
		                            <input type="hidden" name="page" id="page"/>
									<div class="input-group">
									<div class="col-md-1 me-3">
										<select class="form-select" id="example-select" name="searchStatus">
											<option value="">전체</option>
											<option value="칭찬" <c:if test="${searchStatus eq '칭찬' }">selected</c:if>>칭찬</option>
											<option value="건의" <c:if test="${searchStatus eq '건의' }">selected</c:if>>건의</option>
										</select>
									</div>
									<div class="col-md-3">
										<div class="input-group" >
											<input type="search" class="form-control" placeholder="검색하기..." id="boardlistSearch" name="searchWord">
											<button class="btn btn-secondary" type="submit" >검색</button>
										</div>
									</div>
									</div>
								<sec:csrfInput/>
							</form>
						</div>
						<!-- 구분 끝-->
						<div class="col-3 text-end">
							<a href="/elly/list.do">
								<span>전체</span>
							</a>
						</div>
					</div>
				</div>
				<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
					<div class="row text-center">
							<div class="col-1">순번</div>
							<div class="col">제목</div>
							<div class="col-1">작성자</div>
							<div class="col-2">등록일시</div>
							<div class="col-1">조회수</div>
							<div class="col-1">수정</div>
					</div>
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
					<div>
						<c:set value="${pagingVO.dataList }" var="boardList"/>
						<c:choose>
							<c:when test="${empty boardList}">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">작성하신 게시글이 없습니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="page" id="page"/>
								<c:forEach items="${boardList }" var="board">
									<div class="row text-center">
										<div class="col-1">
											${board.rnum2 }
										</div>
										<div class="col">
										  <a class="board-link" data-table-no="${board.tableNo}" data-type="${board.field}" href="#">${board.boardTitle}</a>
										</div>
										<div class="col-1">
											${board.memId }
										</div>
										<div class="col-2">
											<fmt:formatDate value="${board.boardRegdate }" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col-1">
											${board.boardCount }
										</div>
										<div class="col-1">
										  <a class="board-link action-icon" data-table-no="${board.tableNo}" data-type="${board.field}" href="#"><i class="mdi mdi-pencil"></i></a>
										</div>
										<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
									</div>
								</c:forEach>
								<div class="mt-4 mb-4 pagination justify-content-center text-dark" id="mypagingArea">${pagingVO.pagingHTML }</div>
							</c:otherwise>
						</c:choose>							
					</div>
				</div>
				
				<div class="mb-4"></div>
				<a href="/elly/faqlist.do">
					<i class="ic-22-line-question"></i>
					<span>게시글 작성 방법이 궁금하신가요?</span>
				</a>
				
				<div class="mt-5 mb-5 d-flex"></div>
				
				<!-- 쿠폰 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;">
					<h2 class="">쿠폰</h2> 
					<div class="d-flex justify-content-end mb-3">
						<a href="/elly/mypage/coupon.do?memId=${member.memId }">
							<span>전체</span>
						</a>
					</div>
				</div>
				<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
					<div class="row text-center">
							<div class="col-1">쿠폰번호</div>
							<div class="col">쿠폰명</div>
							<div class="col-1">할인율(액)</div>
							<div class="col-2">적용 범위</div>
							<div class="col-2">유효기간</div>
							<div class="col-1"></div>
					</div>
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
					<div>
						<c:set value="${couponList }" var="couponList"/>
						<c:choose>
							<c:when test="${empty couponList}">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">보유하신 쿠폰이 없습니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${couponList }" var="coupon">
									<div class="row text-center d-flex justify-content-center align-items-center">
										<div class="col-1">
											${coupon.rownum }
										</div>
										<div class="col">
											<a href="/elly/mycoupon/detail.do?memcpnId=${coupon.memcpnId }">${coupon.cpnName }</a>
										</div>
										<div class="col-1">
											${coupon.cpnContent }
										</div>
										<div class="col-2">
											
										</div>
										<div class="col-2">
											<fmt:formatDate value="${coupon.cpnStdate }" pattern="yyyy. MM. dd"/> -
											<fmt:formatDate value="${coupon.cpnEnddate }" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col-1">
										</div>
										<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>							
					</div>
				</div>
				
				<a href="/elly/faqlist.do">
					<i class="ic-22-line-question"></i>
					<span>쿠폰 사용 방법이 궁금하신가요?</span>
				</a>
				
				<!-- 여백 시작 -->
				<div class="mt-5 mb-5 d-flex"></div>
				<!-- 여백 끝 -->
				
				<!-- 리뷰 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;">
					<h2 class="">리뷰</h2> 
					<div class="d-flex justify-content-end mb-3">
						<a href="/elly/mypage/review.do?memId=${member.memId }">
							<span>전체</span>
						</a>
					</div>
				</div>
				
				<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
					<div class="row text-center">
							<div class="col-1">리뷰 번호</div>
							<div class="col-1">예약 번호</div>
							<div class="col">리뷰 내용</div>
							<div class="col-2">별점</div>
							<div class="col-2">등록날짜</div>
							<div class="col-1">답변여부</div>
					</div>
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
					<div>
						<c:set value="${reviewList }" var="reviewList"/>
						<c:choose>
							<c:when test="${empty reviewList}">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">작성하신 리뷰 내용이 없습니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${reviewList }" var="review">
									<div class="row text-center d-flex justify-content-center align-items-center">
										<div class="col-1">
											${review.reviewNo }
										</div>
										<div class="col-1">
											${review.resvNo }
										</div>
										<div class="col">
											<a href="/owner/reviewAns.do?reviewNo=${review.reviewNo }" class="text-body" data-bs-toggle="modal" data-bs-target="#${review.reviewNo }">${review.reviewContent }</a>
										</div>
										<div class="col-2">
											${review.reviewStar }/5
										</div>
										<div class="col-2">
											<fmt:formatDate value="${review.reviewRegdate }" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col-1">
											<c:if test="${review.reviewYn eq 'Y' }">
												<div>상세보기</div>
											</c:if>
											<c:if test="${review.reviewYn ne 'Y' }">
												<div>대기중</div>
											</c:if>									
										</div>
										<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>							
					</div>
				</div>
			</div>
			
			
			<c:forEach items="${reviewList }" var="review">
			<div class="modal fade" id="${review.reviewNo }" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title text-dark" id="myCenterModalLabel">리뷰 상세보기</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
						</div>
						<div class="modal-body" id="modal">
								
								<div class="m-3 text-dark">
									<p class="m-0 d-inline-block align-middle font-16">
										별점 :
										<c:if test="${review.reviewStar eq '5' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              <c:if test="${review.reviewStar eq '4' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              <c:if test="${review.reviewStar eq '3' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              <c:if test="${review.reviewStar eq '2' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              <c:if test="${review.reviewStar eq '1' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              ${review.reviewStar } 점
                                          </p>
									<p class="m-0 inline-block">작성자  : ${review.memId }</p>
									<p class="m-0 inline-block">작성일  : <fmt:formatDate value="${review.reviewRegdate }" pattern="yyyy. MM. dd"/></p>
									<hr>
									<label class="inline-block form-label text-dark">내용 : </label>
									<p class="mt-1 inline-block">${review.reviewContent }</p>
								</div>
								
								<c:if test="${review.reviewYn eq 'N' }">
										<div class="m-3 text-dark">
										<hr>
											<label class="form-label text-dark">리뷰 답변 : </label>
											<p class="text-dark">답변이 아직 없습니다.</p>
										</div>
                 							<sec:csrfInput/>
                                      	</c:if>
                                      	
                                      	<c:if test="${review.reviewYn eq 'Y' }">
                                       		<div class="m-3 text-dark">
                                       		<hr>
											<label class="form-label text-dark">리뷰 답변 : </label>
											<input type="hidden" id="ansNo" name="ansNo" value="${review.ansNo }">
											<p class="text-dark">${review.ansCn }</p>
										</div>
									<sec:csrfInput/>
                                      	</c:if>
                                      	
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-dark"	data-bs-dismiss="modal">닫기</button>
							</div>
							
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</c:forEach>
			
			<!-- 결제 완료시 영수증 모달창 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="color: black">
				<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 800px;">
					<div class="modal-content">
						<div class="modal-body">
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 결제 완료시 영수증 모달창 -->
			<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="color: black">
				<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 500px;">
					<div class="modal-content">
						<div class="modal-header"  style="border-bottom: 0px;">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="container-fluid">
								<div class="row">
									<div class="col-1"></div>
									<div class="col mt-3">
										<div class="row justify-content-center" style="font-size: 40px;">결제내역</div>
										<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>
										<div class="row mb-4">
										<div class="col text-start">예 약 번 호</div>
										<div class="col text-end resvNo"></div>
										</div>
										<div class="row mb-4">
										<div class="col text-start">결 제 일 자</div>
										<div class="col text-end resvDate"></div>
										</div>
										<div class="row">
										<div class="col text-start">결 제 자 명</div>
										<div class="col text-end">${member.memName}</div>
										</div>
										<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>
										<div class="row">
										<div>
											<select class="form-select cancelList">
											<option value="고객변심">고객변심</option>
											<option value="개인사유">개인사유</option>
											<option value="기타">기타</option>
											</select>
										</div>
										</div>
										<div class="mt-4 canceletc" style="display: none;">
											<textarea class="form-control canceldetail"rows="5"></textarea>
										</div>
										<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>
									</div>
									<div class="col-1"></div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary cancelBtn" data-bs-dismiss="modal">결제취소</button>
						</div>
					</div>
				</div>
			</div>
			
<script type="text/javascript">
$(function(){
	
	var searchForm = $("#searchForm");
	var mypagingArea = $("#mypagingArea");
	 
	mypagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	// 페이지 네이션 기능
	$(".board-link").each(function() {
		var tableNo = $(this).data("table-no");
		var type = $(this).data("type");
		var href = "";

		if (type === "칭찬") {
		  href = '/elly/detail.do?tableNo=' + tableNo;
		} else if (type === "건의") {
		  href = '/elly/tendidetail.do?tableNo=' + tableNo;
		}

		$(this).attr("href", href);
		console.log("tableNo: " + tableNo);
	});
	
	// 결제취소 기능
	$(".paymentcancelBtn").on("click", function(){
		
		var memId = '${member.memId}';
		var resvNo = $(this).closest(".row").find(".resvNo").text();
		var resvDate = $(this).closest(".row").find(".resvDate").text();
		
        $(".resvNo").html(resvNo);
        $(".resvDate").html(resvDate);
		
		$("#cancelModal").modal("show");
		
	    $(".cancelList").on("change", function () {
	         var selectedOption = $(".cancelList option:selected").val();
	         if(selectedOption === '기타'){
	        	 $(".canceletc").show();
	         }else {
	        	 $(".canceletc").hide();
	         }
	    });
	    
	    $(".cancelBtn").on("click", function(){
	    	
	    	var data = {
	    			resvNo : resvNo,
	    			memId : memId,
	    	}
	    	
	    	$.ajax({
	    		type : "post",
	    		url : "/elly/mypage/cancel.do",
	    		beforeSend : function(xhr) {
	    			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
	    		},
	    		data : JSON.stringify(data),
	    		contentType : "application/json; charset=utf-8",
	    		success : function(res){
	    			if(res === "OK"){
	    				Swal.fire({
	    					title: '알림창',
	    					text: '취소가 완료되었습니다.',
	    					icon: 'success',
	    				}).then((result) => {
							if (result.isConfirmed) {
								location.href = "/elly/mypage.do?memId="+memId;
							}
						});
	    			}
	    		},
				error : function(xhr, status, error) {
					Swal.fire({
						title: '경고',
						text: '취소 중 오류 발생 ! 다시 시도해주세요 !',
						icon: 'warning',
					})
				}
	    	})
	    })
	});
	
	$("#reviewBtn").on("click", function(){
		$("#reviewForm").submit();
	})
	
	// 결제하기 기능
// 	$(".paymentBtn").on("click", function(){
	    
// 		var IMP = window.IMP; 
// 		IMP.init('imp58730656');
	  
// 	    var today = new Date();   
// 	    var hours = today.getHours(); // 시
// 	    var minutes = today.getMinutes();  // 분
// 	    var seconds = today.getSeconds();  // 초
// 	    var milliseconds = today.getMilliseconds();
// 	    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
		
		// 결제 내역에 들어갈 파라미터
// 	    var memId = '${member.memId}';
// 	    var resvNo = $(this).closest(".row").find(".resvNo").text();
// 	    var amount = parseInt($(this).closest(".row").find(".amount").val());
// 	    var name = $(this).closest(".row").find(".name").val();
// 	    var payNo = (Math.floor(Math.random() * 89999999) + 10000000);
	    
// 	    requestPay(memId, resvNo, amount, name, payNo);
// 	})
	
	// 결제 요청 Function
//     function requestPay(memId, resvNo, amount, name, payNo) {
//         IMP.request_pay(
//         	{
// 	            pg : 'kakaopay',
// 	            merchant_uid: 'merchant_' + new Date().getTime(),
// 	            name : name,
// 	            amount : amount,
// 	            buyer_email : '${member.memEmail }',
// 	            buyer_name : '${member.memName }',
// 	            buyer_tel : '${member.memTel }',
// 	            buyer_addr : '${member.memAdd1 }',
// 	            buyer_postcode : '${member.memPost }',
// 	            resvNo : resvNo,
// 	            memId : memId,
// 	            payNo : payNo,
// 	            payYn : 'Y'
// 	        }, 
// 	        function (rsp) { // callback
// 			console.log(rsp);
// 		    if ( rsp.success ) {
		    	
// 		    	var data = {
// 		    			resvNo : resvNo,
// 		    			memId : memId,
// 		    			payNo : payNo,
// 		    			payPrice : amount,
// 		    			payYn : 'Y',
// 		    			resvState : 'Y'
// 		    	}
		    	
		    	// 결제 성공시 결제정보 DB 저장 기능
// 		    	$.ajax({
// 		    		type : "post",
// 		    		url : "/elly/mypage/pay.do",
// 					beforeSend: function(xhr){
// 						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
// 					},
// 					data : JSON.stringify(data),
// 					contentType : "application/json; charset=utf-8",
// 					success : function(res){
// 						if(res === "OK"){						
							
// 							console.log(resvNo);
							
// 							var pay = '<div>결제 완료</div><input class="paymentcancelBtn mt-2" type="button" name="paymentcancelBtn" id="paymentcancelBtn" value="결제 취소" />'
// 							var res = '<div>예약 완료</div>'
							
// 							$(".resvNo:contains(" + resvNo + ")").closest(".row").find(".payState").html(pay);
// 							$(".resvNo:contains(" + resvNo + ")").closest(".row").find(".resState").html(res);
// 						}
// 					}
// 		    	});
		    	
		    	// 결제 완료시 호출 할 Modal 메세지
// 				var msg = '<div class="container-fluid">'
// 					msg += '<div class="row">'
// 					msg += '<div class="col-1"></div>'
// 					msg += '<div class="col mt-3">'
// 					msg += '<div class="row justify-content-center" style="font-size: 40px;">영수증</div>'
// 					msg += '<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>'
// 					msg += '<div class="row mb-4">'
// 					msg += '<div class="col text-start">매 장 명</div>'
// 					msg += '<div class="col text-end">대전 시청점</div>'
// 					msg += '</div>'
// 					msg += '<div class="row mb-4">'
// 					msg += '<div class="col text-start">날 짜</div>'
// 					msg += '<div class="col text-end">YYYY / MM / DD</div>'
// 					msg += '</div>'
// 					msg += '<div class="row">'
// 					msg += '<div class="col text-start">대 표 자 명</div>'
// 					msg += '<div class="col text-end">홍 길 동</div>'
// 					msg += '</div>'
// 					msg += '<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>'
// 					msg += '<div class="row justify-content-start">'
// 					msg += '<div class="col-6 text-start">품명</div>'
// 					msg += '<div class="col-2 text-end">종류</div>'
// 					msg += '<div class="col-2 text-end">수량</div>'
// 					msg += '<div class="col-2 text-end">금액</div>'
// 					msg += '</div>'
// 					msg += '<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>'
// 					msg += '<div class="row">'
// 					msg += '<div class="col-6 text-start">오징어</div>'
// 					msg += '<div class="col-2 text-end">마른안주</div>'
// 					msg += '<div class="col-2 text-end">1</div>'
// 					msg += '<div class="col-2 text-end">10,000</div>'
// 					msg += '</div>'
// 					msg += '<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>'
// 					msg += '<div class="row">'
// 					msg += '<div class="col text-start">할 인 금 액</div>'
// 					msg += '<div class="col text-end">1,000</div>'
// 					msg += '</div>'
// 					msg += '<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>'
// 					msg += '<div class="row" style="font-size: 40px;">'
// 					msg += '<div class="text-center">합 계 금 액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10,000</div>'
// 					msg += '</div>'
// 					msg += '<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>'
// 					msg += '<div class="row mb-2">'
// 					msg += '<div class="text-center">이용해주셔서 감사합니다.</div>'
// 					msg += '</div>'
// 					msg += '</div>'
// 					msg += '<div class="col-1"></div>'
// 					msg += '</div>'
// 					msg += '</div>'
// 		        $(".modal-body").html(msg);
// 		    	$('#exampleModal').modal('show');
// 		    } else {
// 				alert("결제에 실패하였습니다 !")
// 		    }
// 		});
//     }
});
	
</script>