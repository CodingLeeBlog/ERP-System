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
							<div class="col-1">접수일</div>
							<div class="col-1">예약 일자</div>
							<div class="col">비고</div>
							<div class="col-1">결제 상태</div>
							<div class="col-1">예약 상태</div>
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
										<div class="col-1">
											<fmt:formatDate value="${res.resvAccDate }" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col-1">
											<fmt:formatDate value="${res.resvDate}" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col">
											${res.resvNote}
										</div>
										<div class="col-1">
											<div class="payment">
												<c:if test="${res.resvYn eq 'N' }">
													<input class="paymentBtn" type="button" name="" id="paymentBtn" value="결제하기" />
												</c:if>
												<c:if test="${res.resvYn ne 'N'}">
													<div>${res.resvYn }</div>												
												</c:if>
											</div>
										</div>
										<div class="col-1">
											<input class="amout" type="button" name="" id="" value="예약 취소" />
										</div>
										<input class="name" type="hidden" name="" id="" value="${res.frcsName }" />
										<input class="amount" type="hidden" name="" id="" value="${res.resvPrice }" />
										<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>							
					</div>
				</div>
			</div>
			
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
			
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
$(function(){	
	
	// 결제하기 기능
	$(".paymentBtn").on("click", function(){
	    
		var IMP = window.IMP; 
		IMP.init('imp58730656');
	  
	    var today = new Date();   
	    var hours = today.getHours(); // 시
	    var minutes = today.getMinutes();  // 분
	    var seconds = today.getSeconds();  // 초
	    var milliseconds = today.getMilliseconds();
	    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
		
		// 결제 내역에 들어갈 파라미터
	    var memId = '${member.memId}';
	    var resvNo = $(this).closest(".row").find(".resvNo").text();
	    var amount = parseInt($(this).closest(".row").find(".amount").val());
	    var name = $(this).closest(".row").find(".name").val();
	    var payNo = (Math.floor(Math.random() * 89999999) + 10000000);
	    
	    requestPay(memId, resvNo, amount, name, payNo);
	})
	
	// 결제 요청 Function
    function requestPay(memId, resvNo, amount, name, payNo) {
        IMP.request_pay(
        	{
	            pg : 'kakaopay',
	            merchant_uid: 'merchant_' + new Date().getTime(),
	            name : name,
	            amount : amount,
	            buyer_email : '${member.memEmail }',
	            buyer_name : '${member.memName }',
	            buyer_tel : '${member.memTel }',
	            buyer_addr : '${member.memAdd1 }',
	            buyer_postcode : '${member.memPost }',
	            resvNo : resvNo,
	            memId : memId,
	            payNo : payNo,
	            payYn : 'Y'
	        }, 
	        function (rsp) { // callback
			console.log(rsp);
		    if ( rsp.success ) {
		    	
		    	var data = {
		    			resvNo : resvNo,
		    			memId : memId,
		    			payNo : payNo,
		    			payPrice : amount,
		    			payYn : 'Y'
		    	}
		    	
		    	// 결제 성공시 결제정보 DB 저장 기능
		    	$.ajax({
		    		type : "post",
		    		url : "/elly/mypage/pay.do",
					beforeSend: function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
					},
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success : function(res){
						if(res === "OK"){						
							
							console.log(resvNo);
							
							var pay = '<div class="resvYn" name="resvYn">Y</div>'
							
							$(".resvNo:contains(" + resvNo + ")").closest(".row").find(".payment").html(pay);
						}
					}
		    	});
		    	
		    	// 결제 완료시 호출 할 Modal 메세지
				var msg = '<div class="container-fluid">'
					msg += '<div class="row">'
					msg += '<div class="col-1"></div>'
					msg += '<div class="col mt-3">'
					msg += '<div class="row justify-content-center" style="font-size: 40px;">영수증</div>'
					msg += '<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>'
					msg += '<div class="row mb-4">'
					msg += '<div class="col text-start">매 장 명</div>'
					msg += '<div class="col text-end">대전 시청점</div>'
					msg += '</div>'
					msg += '<div class="row mb-4">'
					msg += '<div class="col text-start">날 짜</div>'
					msg += '<div class="col text-end">YYYY / MM / DD</div>'
					msg += '</div>'
					msg += '<div class="row">'
					msg += '<div class="col text-start">대 표 자 명</div>'
					msg += '<div class="col text-end">홍 길 동</div>'
					msg += '</div>'
					msg += '<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>'
					msg += '<div class="row justify-content-start">'
					msg += '<div class="col-6 text-start">품명</div>'
					msg += '<div class="col-2 text-end">종류</div>'
					msg += '<div class="col-2 text-end">수량</div>'
					msg += '<div class="col-2 text-end">금액</div>'
					msg += '</div>'
					msg += '<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>'
					msg += '<div class="row">'
					msg += '<div class="col-6 text-start">오징어</div>'
					msg += '<div class="col-2 text-end">마른안주</div>'
					msg += '<div class="col-2 text-end">1</div>'
					msg += '<div class="col-2 text-end">10,000</div>'
					msg += '</div>'
					msg += '<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>'
					msg += '<div class="row">'
					msg += '<div class="col text-start">할 인 금 액</div>'
					msg += '<div class="col text-end">1,000</div>'
					msg += '</div>'
					msg += '<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>'
					msg += '<div class="row" style="font-size: 40px;">'
					msg += '<div class="text-center">합 계 금 액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10,000</div>'
					msg += '</div>'
					msg += '<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>'
					msg += '<div class="row mb-2">'
					msg += '<div class="text-center">이용해주셔서 감사합니다.</div>'
					msg += '</div>'
					msg += '</div>'
					msg += '<div class="col-1"></div>'
					msg += '</div>'
					msg += '</div>'
		        $(".modal-body").html(msg);
		        
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    $('#exampleModal').modal('show');
		});
    }
});
</script>