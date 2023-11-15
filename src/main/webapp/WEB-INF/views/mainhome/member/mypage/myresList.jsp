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
						<a href="/elly/list.do">
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
			
			<!-- 결제 취소시 모달창 -->
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
			
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
$(function(){	
	
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
							
							// 결제 성공시 div 영역 변경
// 							var pay = '<div>결제 완료</div><input class="paymentcancelBtn mt-2" type="button" name="paymentcancelBtn" id="paymentcancelBtn" value="결제 취소" />'
// 							var res = '<div>예약 완료</div>'
// 							$(".resvNo:contains(" + resvNo + ")").closest(".row").find(".payState").html(pay);
// 							$(".resvNo:contains(" + resvNo + ")").closest(".row").find(".resState").html(res);
							
							// 결제취소 기능
// 							$(".paymentcancelBtn").on("click", function(){
								
// 								var memId = '${member.memId}';
// 								var resvNo = $(this).closest(".row").find(".resvNo").text();
// 								var resvDate = $(this).closest(".row").find(".resvDate").text();
								
// 						        $(".resvNo").html(resvNo);
// 						        $(".resvDate").html(resvDate);
								
// 								$("#cancelModal").modal("show");
								
// 							    $(".cancelList").on("change", function () {
// 							         var selectedOption = $(".cancelList option:selected").val();
// 							         if(selectedOption === '기타'){
// 							        	 $(".canceletc").show();
// 							         }else {
// 							        	 $(".canceletc").hide();
// 							         }
// 							    });
							    
// 							    $(".cancelBtn").on("click", function(){
							    	
// 							    	var data = {
// 							    			resvNo : resvNo,
// 							    			memId : memId,
// 							    			payYn : 'N',
// 							    			resvState : 'N'
// 							    	}
							    	
// 							    	$.ajax({
// 							    		type : "post",
// 							    		url : "/elly/mypage/cancel.do",
// 							    		beforeSend : function(xhr) {
// 							    			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
// 							    		},
// 							    		data : JSON.stringify(data),
// 							    		contentType : "application/json; charset=utf-8",
// 							    		success : function(res){
// 							    			if(res === "OK"){
// 							    				alert("취소가 완료되었습니다 !")
							    				
// 							    				location.href = "/elly/mypage/res.do?memId="+memId
//						 						var pay = '<input class="paymentBtn" type="button" name="paymentBtn" id="paymentBtn" value="결제하기" />'
//						 						var res = '<div>예약 대기중</div>'
												
//						 						$(".resvNo:contains(" + resvNo + ")").closest(".row").find(".payState").html(pay);
//						 						$(".resvNo:contains(" + resvNo + ")").closest(".row").find(".resState").html(res);
// 							    			}
// 							    		}
// 							    	})
// 							    })
// 							});
							
// 						}
// 					}
// 		    	});
		    	
// 		    	$('#exampleModal').modal('show');
// 		    } else {
// 				alert("결제에 실패하였습니다 !")
// 		    }
// 		});
//     }
	
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
	    			payYn : 'N',
	    			resvState : 'N'
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
								location.href = "/elly/mypage/res.do?memId="+memId
							}
						});
	    			}
	    		}
	    	})
	    })
	});
	
	$("#reviewBtn").on("click", function(){
		
		var review = $(".frcsreview").val();
		var frcsName = $(".frcsName").val();
		
		$("#reviewForm").submit();
	})
});
</script>