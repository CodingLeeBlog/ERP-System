<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
#seatBody {
	display: flex;
	flex-direction: column;
	align-items: center;
	transform: scale(0.8) /* seatBody 크기를 50%로 줄임 */
}

#infospace { 
	border:1px solid lightgray; 
	border-radius: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 10px;
}

#seatspace2 { 
	background: #fafafd; 
	width: 800px; 
	height: 600px;
	border:1px solid lightgray; 
	border-radius: 10px;
	display: flex;
	position: relative;
}

.box {
    position: absolute;
    user-select: none;
    transform: translate(-50%, -50%);
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: -110px;
}

:root {
    /* id-1 */
    --width-1: 75px;
    --height-1: 75px;
    --bg-1: yellow;

    /* id-2 */
    --width-2: 150px;
    --height-2: 75px;
    --bg-2: pink;

    /* id-3 */
    --width-3: 300px;
    --height-3: 75px;
    --bg-3: skyblue;
    --zi-3: 3;

    /* id-exit */
    --width-4: 150px;
    --height-4: 30px;
    --bg-4: lightgray;
}
</style>

<sec:authentication property="principal.member" var="member"/>
<!-- ======= res Section ======= -->
<section id="res" class="d-flex align-items-center">
	<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-4">
				  <img id="resImage1" class="res-image" src="${pageContext.request.contextPath }/resources/assets/img/mv1_menu.png" alt="">
				</div>
				
				<div class="col-lg-4">
				  <img id="resImage2" class="res-image" src="${pageContext.request.contextPath }/resources/assets/img/mv1_title.png" alt="">
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Hero -->

<!-- 메인 상단 띠 시작-->                                                    
<div id="main">
	<div class="container-fluid">
		<div class="row">
			<div class="col-1 bg-white">
			</div>
			<div class="col-10 bg-white">
				<div class="row" id="resInfo">
					<div class="col-6" style="color: black">
						<div class="mt-5" style="font-size: 20px;">SPECIALS</div>
						<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
						<div class="" id="frcsName" style="font-size: 40px;">${frcsName }</div>
						<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
						<div class="mb-5" style="font-size: 20px;">원하는 시간을 선택해주세요.</div>
						<div class="d-flex text-center mb-3">
						    <div class="col">
								<button class="resvTimeBtn" id="resvTimeBtn">15시</button>
						    </div>
						    <div class="col">
								<button class="resvTimeBtn" id="resvTimeBtn">16시</button>
						    </div>
						    <div class="col">
						        <button class="resvTimeBtn" id="resvTimeBtn">17시</button>
						    </div>
						    <div class="col">
						        <button class="resvTimeBtn" id="resvTimeBtn">18시</button>
						    </div>
						</div>
						<div class="d-flex text-center mb-5">
							<div class="col">
								<button class="resvTimeBtn" id="resvTimeBtn">19시</button>
							</div>
							<div class="col">
								<button class="resvTimeBtn" id="resvTimeBtn">20시</button>
							</div>
							<div class="col">
								<button class="resvTimeBtn" id="resvTimeBtn">21시</button>
							</div>
							<div class="col">
								<button class="resvTimeBtn" id="resvTimeBtn">22시</button>
							</div>
						</div>
						<div class="mb-5" style="font-size: 20px;">원하는 시간을 선택해주세요.</div>
						<div class="d-flex text-center mb-3">
							<div class="col">
								<button class="resvMcntBtn" id="resvMcntBtn">1명</button>
							</div>
							<div class="col">
								<button class="resvMcntBtn" id="resvMcntBtn">2명</button>
							</div>
							<div class="col">
								<button class="resvMcntBtn" id="resvMcntBtn">3명</button>
							</div>
							<div class="col">
								<button class="resvMcntBtn" id="resvMcntBtn">4명</button>
							</div>
						</div>
						<div class="d-flex text-center mb-5">
							<div class="col">
								<button class="resvMcntBtn" id="resvMcntBtn">5명</button>
							</div>
							<div class="col">
								<button class="resvMcntBtn" id="resvMcntBtn">6명</button>
							</div>
							<div class="col">
								<button class="resvMcntBtn" id="resvMcntBtn">7명</button>
							</div>
							<div class="col">
								<button class="resvMcntBtn" id="resvMcntBtn">8명</button>
							</div>
						</div>
					</div>
					<div class="col-6 ps-5" style="color: black">
						<div class="mt-5 mb-3">원하는 좌석을 선택해주세요.</div>
						<div class="card-body" id="seatBody">
							<div id="seatspace2">
								<c:forEach items="${seatlist }" var="seat">
									<div class="box" data-id="${seat.seatCd}" style="${seat.seatStyle}">${seat.seatCd}</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="menuInfo" style="display: none">
					<div class="col-7 pb-5 pe-2" style="color: black">
						<div class="mt-5" style="font-size: 40px; text-align: center;">🍳&nbsp;&nbsp;&nbsp;Dry Snacks</div>
						<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
						<div class="row pt-3 pb-3" style="font-size: 20px">
							<div class="col-10">메뉴</div>
							<div class="col-1">가격</div>
							<div class="col-1">주문</div>
						</div>
					    <div class="container-fluid mb-3">
						<c:set value="${dryfrcsMenuList}" var="dryfrcsMenuList" />
						<c:choose>
							<c:when test="${empty dryfrcsMenuList }">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">메뉴 리뉴얼 중입니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${dryfrcsMenuList }" var="menu">
									<div class="row drySnacks pt-3 pb-3">
					                    <div class="col-2" style="display: flex; justify-content: center; align-items: center;">
					                   		 <img src="${pageContext.request.contextPath }/resources/upload/img/${menu.attachOrgname }" style="width: 120px; height: 120px;">
					                    </div>
					                    <div class="col-7 my-auto">
					                    	<input type="hidden" class="menuCd" name="menuCd" value="${menu.menuCd }" />
					                    	<div class="text-start menuName" style="font-size: 25px">${menu.menuName }</div>
					                    	<div class="menuDes" style="font-size: 15px">${menu.menuDes }</div>
					                    </div>
					                    <div class="col-2 d-flex justify-content-center align-items-center">
					                    	<div class="col-2 text-end menuPrice" style="font-size: 16px">
					                    		<fmt:formatNumber type="currency" value="${menu.menuPrice }"/>
					                    	</div>
					                    </div>
					                    <button type="button" class="col-1 selectMenuPlus" style="display: flex; justify-content: center; align-items: center; background-color: white; border: none;">&#10133;</button>
				                    </div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					    </div>
						<div class="mt-5" style="font-size: 40px; text-align: center;">🍤&nbsp;&nbsp;&nbsp;Fried Snacks</div>
						<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
						<div class="row pt-3 pb-3" style="font-size: 20px">
							<div class="col-10">메뉴</div>
							<div class="col-1">가격</div>
							<div class="col-1">주문</div>
						</div>
					    <div class="container-fluid mb-3">
						<c:set value="${friedfrcsMenuList}" var="friedfrcsMenuList" />
						<c:choose>
							<c:when test="${empty friedfrcsMenuList }">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">메뉴 리뉴얼 중입니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${friedfrcsMenuList }" var="menu">
									<div class="row drySnacks pt-3 pb-3">
					                    <div class="col-2" style="display: flex; justify-content: center; align-items: center;">
					                   		 <img src="${pageContext.request.contextPath }/resources/upload/img/${menu.attachOrgname }" style="width: 120px; height: 120px;">
					                    </div>
					                    <div class="col-7 my-auto">
					                    	<input type="hidden" class="menuCd" name="menuCd" value="${menu.menuCd }" />
					                    	<div class="text-start menuName" style="font-size: 25px">${menu.menuName }</div>
					                    	<div class="menuDes" style="font-size: 15px">${menu.menuDes }</div>
					                    </div>
					                    <div class="col-2 d-flex justify-content-center align-items-center">
					                    	<div class="col-2 text-end menuPrice" style="font-size: 16px">
					                    		<fmt:formatNumber type="currency" value="${menu.menuPrice }"/>
					                    	</div>
					                    </div>
					                    <button type="button" class="col-1 selectMenuPlus" style="display: flex; justify-content: center; align-items: center; background-color: white; border: none;">&#10133;</button>
				                    </div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					    </div>
						<div class="mt-5" style="font-size: 40px; text-align: center;">🥘&nbsp;&nbsp;&nbsp;Main</div>
						<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
						<div class="row pt-3 pb-3" style="font-size: 20px">
							<div class="col-10">메뉴</div>
							<div class="col-1">가격</div>
							<div class="col-1">주문</div>
						</div>
					    <div class="container-fluid mb-3">
						<c:set value="${mainfrcsMenuList}" var="mainfrcsMenuList" />
						<c:choose>
							<c:when test="${empty mainfrcsMenuList }">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">메뉴 리뉴얼 중입니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${mainfrcsMenuList }" var="menu">
									<div class="row drySnacks pt-3 pb-3">
					                    <div class="col-2" style="display: flex; justify-content: center; align-items: center;">
					                   		 <img src="${pageContext.request.contextPath }/resources/upload/img/${menu.attachOrgname }" style="width: 120px; height: 120px;">
					                    </div>
					                    <div class="col-7 my-auto">
					                    	<input type="hidden" class="menuCd" name="menuCd" value="${menu.menuCd }" />
					                    	<div class="text-start menuName" style="font-size: 25px">${menu.menuName }</div>
					                    	<div class="menuDes" style="font-size: 15px">${menu.menuDes }</div>
					                    </div>
					                    <div class="col-2 d-flex justify-content-center align-items-center">
					                    	<div class="col-2 text-end menuPrice" style="font-size: 16px">
					                    		<fmt:formatNumber type="currency" value="${menu.menuPrice }"/>
					                    	</div>
					                    </div>
					                    <button type="button" class="col-1 selectMenuPlus" style="display: flex; justify-content: center; align-items: center; background-color: white; border: none;">&#10133;</button>
				                    </div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					    </div>
						<div class="mt-5" style="font-size: 40px; text-align: center; background">🍺&nbsp;&nbsp;&nbsp;Drink</div>
						<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
						<div class="row pt-3 pb-3" style="font-size: 20px">
							<div class="col-10">메뉴</div>
							<div class="col-1">가격</div>
							<div class="col-1">주문</div>
						</div>
					    <div class="container-fluid mb-3">
						<c:set value="${drinkfrcsMenuList}" var="drinkfrcsMenuList" />
						<c:choose>
							<c:when test="${empty drinkfrcsMenuList }">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">메뉴 리뉴얼 중입니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${drinkfrcsMenuList }" var="menu">
									<div class="row drySnacks pt-3 pb-3">
					                    <div class="col-2" style="display: flex; justify-content: center; align-items: center;">
					                   		 <img src="${pageContext.request.contextPath }/resources/upload/img/${menu.attachOrgname }" style="width: 120px; height: 120px;">
					                    </div>
					                    <div class="col-7 my-auto">
					                    	<input type="hidden" class="menuCd" name="menuCd" value="${menu.menuCd }" />
					                    	<div class="text-start menuName" style="font-size: 25px">${menu.menuName }</div>
					                    	<div class="menuDes" style="font-size: 15px">${menu.menuDes }</div>
					                    </div>
					                    <div class="col-2 d-flex justify-content-center align-items-center">
					                    	<div class="col-2 text-end menuPrice" style="font-size: 16px">
					                    		<fmt:formatNumber type="currency" value="${menu.menuPrice }"/>
					                    	</div>
					                    </div>
					                    <button type="button" class="col-1 selectMenuPlus" style="display: flex; justify-content: center; align-items: center; background-color: white; border: none;">&#10133;</button>
				                    </div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					    </div>
					</div>
					<div class="col-5 ps-2" id="resDetail" style="color: black">
						<div class="card mt-5 mb-3 mx-auto sticky-top" style="max-width: 25rem;">
							<div class="card-header bg-transparent text-center">상세보기</div>
							<div class="card-body">
							    <div>
								    <div class="mt-3 text-center" style="font-size: 14px" id="resmodalInfo"></div>
							    </div>
							    <div class="mb-3">
									<div id="selectMenuList">
									</div>
							    </div>
							    <div class="">
							    	<div class="row">
							    		<div class="d-flex mb-3">
								    		<div class="col text-start">총 가격</div>
								    		<div class="col text-end" id="restotalPrice">0</div>
							    		</div>
							    		<div class="d-flex mb-3">
								    		<div class="col text-start"style="display: none" id="distotal">할인된 가격</div>
								    		<div class="col text-end" style="display: none" id="distotalPrice"></div>							    		
							    		</div>
							    	</div>
							    </div>
							    <div class="mb-3">
							    	<input type="text" name="" id="resvNote" style="width: 100%" placeholder="비고">
							    </div>
							    <div>
							    	<select id="mycouponList" style="width: 100%">
							    		<option data-memcpnid="null">쿠폰을 선택해주세요.</option>
							    	<c:set value="${couponList }" var="couponList"/>
								    	<c:choose>
								    		<c:when test="${empty couponList }">
								    			<option data-memcpnid="null">보유하신 쿠폰이 없습니다.</option>
								    		</c:when>
								    		<c:otherwise>
								    			<c:forEach items="${couponList }" var="coupon">
								    				<option data-memcpnid="${coupon.memcpnId }" data-cpncontent="${coupon.cpnContent }">
								    					${coupon.cpnName }
								    				</option>
								    			</c:forEach>
								    		</c:otherwise>
								    	</c:choose>
							    	</select>
							    </div>
						  	</div>
						  	<div class="card-footer bg-transparent border-success">
						  		<input type="hidden" name="frcsId" id="frcsId" value="${frcsId }" />
						  		<input type="hidden" name="memId" id="memId" value="${member.memId }" />
						  		<input type="button" class="" id="resBtn" style="width: 100%" value="예약하기"/>
						  	</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-1 bg-white">
			</div>
		</div>
	</div>
</div>

<!-- 결제 완료시 영수증 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="color: black">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 800px;">
		<div class="modal-content">
			<div class="modal-body">
			<div class="container-fluid">
				<div class="row">
				<div class="col-1"></div>
				<div class="col mt-3">
					<div class="row justify-content-center" style="font-size: 40px;">영수증</div>
					<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>
					<div class="row mb-4">
					<div class="col text-start">매 장 명</div>
					<div class="col text-end receiptFrcsName"></div>
					</div>
					<div class="row mb-4">
					<div class="col text-start">날 짜</div>
					<div class="col text-end receiptDate">YYYY / MM / DD</div>
					</div>
					<div class="row">
					<div class="col text-start">결 제 자 명</div>
					<div class="col text-end receiptName"></div>
					</div>
					<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>
					<div class="row justify-content-start">
					<div class="col-6 text-start">품명</div>
					<div class="col-3 text-end">수량</div>
					<div class="col-3 text-end">금액</div>
					</div>
					<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>
					<div class="row receiptMenu">
<!-- 					<div class="col-6 text-start receiptMenuName">오징어</div> -->
<!-- 					<div class="col-2 text-end receiptMenuCate">마른안주</div> -->
<!-- 					<div class="col-2 text-end receiptMenuCnt">1</div> -->
<!-- 					<div class="col-2 text-end receiptMenuPrice">10,000</div> -->
					</div>
					<div class="mt-3 mb-4" style="color: #f5f5f5; border-bottom: 3px dashed;"></div>
					<div class="row">
					<div class="col text-start">할 인 금 액</div>
					<div class="col text-end receiptDisprice"></div>
					</div>
					<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>
					<div class="row" style="font-size: 40px;">
					<div class="col">합 계 금 액</div>
					<div class="col text-end receiptTotalPrice"></div>
					</div>
					<div class="mt-4 mb-4" style="color: #5a5a5a; border-bottom: 3px dashed;"></div>
					<div class="row mb-2">
					<div class="text-center">이용해주셔서 감사합니다.</div>
					</div>
				</div>
				<div class="col-1"></div>
				</div>
			</div>	
			</div>
			<div class="modal-footer">
				 <a href="/elly/mypage/res.do?memId=${member.memId }"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button></a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">

$(function(){
	
	// 원하는 시간 예약 변수
	var resvTimeBtn = $(".resvTimeBtn")	
	var resvTimeFlag = false;
	var old_resvTime = "";
	
	// 원하는 인원 예약 변수
	var resvMcntBtn = $(".resvMcntBtn")
	var resvMcntFlag = false;
	var old_resvMcnt = "";
	
	// 원하는 좌석 예약 변수
	var box = $(".box")
	var resvSeatFlag = false;
	var old_resvSeat = "";
	
	$('.card').css('top', '350px');
	
	// 원하는 시간 예약 기능
	resvTimeBtn.on("click", function(event){
		change_resvTimeBtn(event)
		
		var new_resvTime = $(this).text();
		console.log("old_resvTime : " + old_resvTime);
		
		if(old_resvTime === new_resvTime){
			alert('이미 선택한 시간입니다.')
		};
		
		old_resvTime = new_resvTime;
		resvTimeFlag = true;
		
		console.log("new_resvTime : " + new_resvTime);
		console.log(resvTimeFlag);
		
		checkFlags();
	});
	
	// 원하는 인원 예약 기능
	resvMcntBtn.on("click", function(event){
		change_resvMcntBtn(event)
		
		var new_resvMcnt = $(this).text();
		console.log("old_resvMcnt : " + old_resvMcnt);
		
		if(old_resvMcnt === new_resvMcnt){
			alert('이미 선택한 인원입니다.')
		};
		
		old_resvMcnt = new_resvMcnt;
		resvMcntFlag = true;
		
		console.log("new_resvMcnt : " + new_resvMcnt);
		console.log(resvMcntFlag);
		
		checkFlags();
	});
	
	// 원하는 좌석 예약 기능
	box.on("click", function(){
		
		var new_resvSeat = $(this).data('id');
		console.log("old_resvSeat : " + old_resvSeat);
		
		if(old_resvSeat === new_resvSeat){
			alert('이미 선택한 좌석입니다.')
		};
		
		old_resvSeat = new_resvSeat;
		resvSeatFlag = true;
		
		console.log("new_resvSeat : " + new_resvSeat);
		console.log(resvSeatFlag);
		
		checkFlags();
	});
	
	// 메뉴 선택 및 예약으로 가는 플래그
	function checkFlags(){		
		if(resvTimeFlag === true && resvMcntFlag === true && resvSeatFlag === true) {
			
			var menuInfo = $("#menuInfo")
	        menuInfo.css("display", "flex");
			
	        $(".drySnacks:even").css("background-color", "#f2f2f2");
	        $(".selectMenuPlus:even").css("background-color", "#f2f2f2");
			
			var today = new Date();
			var year = today.getFullYear(); // 년도
			var month = today.getMonth() + 1;  // 월
			var date = today.getDate();  // 날짜
			var str = year + '년 ' + month + '월 ' + date + '일, ' + old_resvTime + ', ' + old_resvSeat +' 좌석으로 예약 됩니다'
			
			var resmodalInfo = $("#resmodalInfo")
			resmodalInfo.html(str)
			
			console.log(old_resvTime)
			console.log(old_resvMcnt)
			console.log(old_resvSeat)
		};
	};
	
	// 메뉴 목록 추가 변수
	var selectMenuList = $("#selectMenuList")
	var selectMenuPlus = $(".selectMenuPlus")
		
	// 담겨있는 메뉴 배열 변수
	var menuArr = new Array();
	
	// 메뉴 목록 추가 기능
	selectMenuPlus.on("click", function(){
		
		var price = 0;
		var menuFlag = false;
		var newMenu = "";
		var menuCnt = 1;
		
		var menuCd = $(this).closest('.row').find('.menuCd').val();
		var menuName = $(this).closest('.row').find('.menuName').text();
		var menuPriceText  = $(this).closest('.row').find('.menuPrice').text().trim();
		var menuPrice = parseInt(menuPriceText.replace(/\D/g, ''));
		
		
		console.log(menuCd)
		
		if(menuArr.length == 0){
			menuArr.push(menuCd + "_" + menuName + "_" + menuPrice + "_" + menuCnt)
		}else {
			for(var i = 0; i < menuArr.length; i++){
				if(menuCd == menuArr[i].split("_")[0]){
					menuArr[i] = menuCd + "_" + menuName + "_" + menuPrice + "_" + (parseInt(menuArr[i].split("_")[3]) + 1);
					menuFlag = true;
					break;
				}
			}
			if(menuFlag == false){
				menuArr.push(menuCd + "_" + menuName + "_" + menuPrice + "_" + menuCnt);
			}
		}
		console.log("메뉴 최종 등록  : " + menuArr)
		
		
		for(var i = 0; i < menuArr.length; i++){			
			newMenu += '<div class="d-flex mt-3 selectMenu" id="' + menuArr[i].split("_")[0] + '">';
			newMenu += '<button type="button" class="col-1 selectMenuMinus" style="display: flex; justify-content: center; align-items: center; background-color: white; border: none;">&#10134;</button>';
			newMenu += '<div class="col-1 menuCnt" style="display: flex; justify-content: center; align-items: center;">' + menuArr[i].split("_")[3] + '</div>';
			newMenu += '<div class="col-1" style="display: flex; justify-content: center; align-items: center;">x</div>';
			newMenu += '<div class="col menuName" style="display: flex; justify-content: left; align-items: center;">' + menuArr[i].split("_")[1] + '</div>';
			newMenu += '<div class="col menuPrice" style="display: flex; justify-content: right; align-items: center;">' + formatPrice(menuArr[i].split("_")[2]) + '원</div>';
			newMenu += '</div>';
            price += parseInt(menuArr[i].split("_")[2] * menuArr[i].split("_")[3]);
		}

		selectMenuList.html(newMenu);
        
		// 총 가격 변수
		var restotalPrice = $("#restotalPrice");
		restotalPrice.text(formatPrice(price));
		
	});
	
	// 메뉴 목록 삭제 변수
	var selectMenuMinus = $(".selectMenuMinus")
	
	// 메뉴 목록 삭제 변수
	selectMenuList.on("click", ".selectMenuMinus", function(){
		
		var price = 0;
		var menuFlag = true;
		var menuCd = $(this).closest('.selectMenu').attr('id');
		var menuName = $(this).closest('.selectMenu').find('.menuName').text();
		var menuPriceText  = $(this).closest('.selectMenu').find('.menuPrice').text().trim();
		var menuPrice = parseInt(menuPriceText.replace(/\D/g, ''));
		var menuCnt = $(this).closest('.selectMenu').find('.menuCnt').text();
		var newMenu = "";
		
		console.log(menuCnt)
		console.log(selectMenuList)
		
		for(var i = 0; i < menuArr.length; i++){
			if(menuCd == menuArr[i].split("_")[0]){
				menuArr[i] = menuCd + "_" + menuName + "_" + menuPrice + "_" + (parseInt(menuArr[i].split("_")[3]) - 1);
				
				var newCnt = parseInt(menuArr[i].split("_")[3]);
				$(".menuCnt").eq(i).html(newCnt);
				if(newCnt === 0){
					menuFlag = false;
					menuArr.splice(i, 1);
					i--;
				}
			}
		}
		
		if(menuFlag == false){			
			$(this).closest(".selectMenu").remove();
			console.log("메뉴 완전 삭제 : " + menuArr);
		}
		
		for(var i = 0; i < menuArr.length; i++){
			
			price += parseInt(menuArr[i].split("_")[2] * menuArr[i].split("_")[3]);
		}
		
		// 총 가격 변수
		var restotalPrice = $("#restotalPrice");
		restotalPrice.html(formatPrice(price));
	});
	
	// 쿠폰 적용 기능
	var mycouponList = $("#mycouponList")
	
	var disPrice = ''
	
	mycouponList.on("change", function(){
		
		// 선택한 옵션
		var selectedOption = $(this).find('option:selected');
		
		// 기존 가격
// 		var menuPriceText  = $(this).closest('.selectMenu').find('.menuPrice').text().trim();
// 		var menuPrice = parseInt(menuPriceText.replace(/\D/g, ''));
		var restotalPriceText = $("#restotalPrice").text().trim(); 
		var restotalPrice = parseInt(restotalPriceText.replace(/\D/g, ''));
		
		// 쿠폰 선택시 할인율
		var memcpnId = selectedOption.data('memcpnid');
		var distotal = $("#distotal")
		var distotalPrice = $("#distotalPrice")
		
		if(memcpnId == null){
			distotal.hide();
			distotalPrice.hide();
			$('#restotalPrice').css('text-decoration', 'none');
			
			distotalPrice.html('');
		}else {
			distotal.show();
			distotalPrice.show();
			$('#restotalPrice').css('text-decoration', 'line-through');
			var cpnContent = selectedOption.data('cpncontent');

			var disPercent = parseInt(cpnContent.slice(0,2));
			
			var totalPrice = parseInt(restotalPrice);
			disPrice = totalPrice * (disPercent / 100);
			
			distotalPrice.html(formatPrice(totalPrice - disPrice));
		}
	});
	
	
	// 최종 예약 버튼
	var resBtn = $("#resBtn");
	
	resBtn.on("click", function(){
		
		var IMP = window.IMP; 
		IMP.init('imp58730656');
	  
	    var today = new Date();   
	    var hours = today.getHours(); // 시
	    var minutes = today.getMinutes();  // 분
	    var seconds = today.getSeconds();  // 초
	    var milliseconds = today.getMilliseconds();
	    var makeMerchantUid = hours +  minutes + seconds + milliseconds;
	    
	 	// 결제 내역에 들어갈 파라미터
		var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'
		var resvNo = ''
		for (var i = 0; i < 6; i++) {
			var rnum = Math.floor(Math.random() * chars.length)
			resvNo += chars.substring(rnum, rnum + 1)
	    }
		
		var memId = $("#memId").val();
		var frcsId = $("#frcsId").val();
		var frcsName = $("#frcsName").text();
		
		var distotalPriceText = $("#distotalPrice").text().trim();
		var distotalPrice = parseInt(distotalPriceText.replace(/\D/g, ''));
		
		var restotalPriceText = $("#restotalPrice").text().trim();
		var restotalPrice = parseInt(restotalPriceText.replace(/\D/g, ''));

		var resvPrice = '';
		
		if(distotalPriceText != null && distotalPriceText !== ""){
			resvPrice = distotalPrice;
		}else {
			resvPrice = restotalPrice;
		}
		
		var selectedOption = mycouponList.find('option:selected');
		var memcpnId = selectedOption.data('memcpnid');
		
		// 예약 버튼 누를 시 넘어가야할 menuList
		var menuList = [];
		for(var i = 0; i < menuArr.length; i++){
			menuList.push({
				memId : memId,
				frcsId : frcsId,
				menuCd : menuArr[i].split("_")[0],
				menuName : menuArr[i].split("_")[1],
				menuPrice : menuArr[i].split("_")[2],
				menuCnt : menuArr[i].split("_")[3]
			})
		}
		
	    var name = '${member.memName}';
	    var payNo = (Math.floor(Math.random() * 89999999) + 10000000);
	    
	    requestPay(memId, resvNo, resvPrice, name, payNo, menuList, memcpnId, frcsId, frcsName);
	})
	
	// 결제 요청 Function
    function requestPay(memId, resvNo, resvPrice, name, payNo, menuList, memcpnId, frcsId, frcsName) {
        IMP.request_pay(
        	{
	            pg : 'kakaopay',
	            merchant_uid: 'merchant_' + new Date().getTime(),
	            name : '엘리할머니맥주 '+ frcsName,
	            amount : resvPrice,
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
		    			payPrice : resvPrice,
		    			payYn : 'Y',
		    			resvState : 'Y'
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
							
							var data = {
									resvNo : resvNo,
									memId : memId,
									frcsId : frcsId,
									resvMcnt : old_resvMcnt,
									resvTime : old_resvTime,
									seatCd : old_resvSeat,
									resvPrice : resvPrice,
									menuList : menuList
							};
							
							if(memcpnId !== null){
								data.memcpnId = memcpnId;
							}
							
							$.ajax({
								type : "post",
								url : "/elly/store/res.do",
								beforeSend: function(xhr){
									xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
								},
								data : JSON.stringify(data),
								contentType : "application/json; charset=utf-8",
								success : function(res){
									if(res === "OK"){
										
										var today = new Date();
										var year = today.getFullYear();
										var month = today.getMonth() + 1;
										var day = today.getDate();
										
										if (month < 10){
											month = '0' + month;
										}
										if(day < 0){
											day = '0' + day;
										}
										
										var payDate = year + '. ' + month + '. ' + day;
										
										var formattedPrice = formatPrice(resvPrice);
										
										if(disPrice == null){
											$(".receiptDisprice").html('₩ 0');
										}else {
											$(".receiptDisprice").html(formatPrice(disPrice));
										}
										
										var receiptMenu = ''
										for(var i = 0; i < menuList.length; i++){
										receiptMenu += '<div class="col-6 mb-2 text-start receiptMenuName">' + menuList[i].menuName + '</div>'
										receiptMenu += '<div class="col-3 mb-2 text-end receiptMenuCnt">' + menuList[i].menuCnt + '</div>'
										receiptMenu += '<div class="col-3 mb-2 text-end receiptMenuPrice">' + formatPrice(menuList[i].menuPrice) + '</div>'
										}
										
								    	$('.receiptFrcsName').html(frcsName);
								    	$('.receiptDate').html(payDate);
								    	$('.receiptName').html(name);
								    	$('.receiptTotalPrice').html(formattedPrice);
								    	$('.receiptMenu').html(receiptMenu);
								    	
								    	$('#exampleModal').modal('show');
									}
								},
								error : function(xhr, status, error) {
									Swal.fire({
										title: '경고',
										text: '예약 오류 발생 ! 다시 시도해주세요 !',
										icon: 'warning',
									})
								}
							});
						}
					},
					error : function(xhr, status, error) {
						Swal.fire({
							title: '경고',
							text: '결제 정보 오류 ! 다시 시도해주세요 !',
							icon: 'warning',
						})
					}
		    	});
		    } else {
				Swal.fire({
					title: '경고',
					text: '결제에 실패하였습니다 !',
					icon: 'warning',
				})
		    }
		});
    }
	
	// 최종 예약 버튼
// 	var resBtn = $("#resBtn");
	
// 	resBtn.on("click", function(){
		
// 		var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'
// 		var resvNo = ''
// 		for (var i = 0; i < 6; i++) {
// 			var rnum = Math.floor(Math.random() * chars.length)
// 			resvNo += chars.substring(rnum, rnum + 1)
// 	    }
		
// 		var memId = $("#memId").val();
// 		var frcsId = $("#frcsId").val();
// 		var distotalPrice = $("#distotalPrice").text();
// 		var restotalPrice = $("#restotalPrice").text();
// 		var resvPrice = '';
		
// 		if(distotalPrice != null && distotalPrice !== ""){
// 			resvPrice = distotalPrice;
// 		}else {
// 			resvPrice = restotalPrice;
// 		}
		
// 		var restotalPrice = $("#restotalPrice").text();
		
// 		var selectedOption = mycouponList.find('option:selected');
// 		var memcpnId = selectedOption.data('memcpnid');
		
		// 예약 버튼 누를 시 넘어가야할 menuList
// 		var menuList = [];
// 		for(var i = 0; i < menuArr.length; i++){
// 			menuList.push({
// 				memId : memId,
// 				menuCd : menuArr[i].split("_")[0],
// 				frcsId : frcsId,
// 				menuCnt : menuArr[i].split("_")[3]
// 			})
// 		}
		
		
// 		var data = {
// 				resvNo : resvNo,
// 				memId : memId,
// 				frcsId : frcsId,
// 				resvMcnt : old_resvMcnt,
// 				resvTime : old_resvTime,
// 				seatCd : old_resvSeat,
// 				resvPrice : resvPrice,
// 				menuList : menuList
// 		};
		
// 		if(memcpnId !== null){
// 			data.memcpnId = memcpnId;
// 		}
		
// 		$.ajax({
// 			type : "post",
// 			url : "/elly/store/res.do",
// 			beforeSend: function(xhr){
// 				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
// 			},
// 			data : JSON.stringify(data),
// 			contentType : "application/json; charset=utf-8",
// 			success : function(res){
// 				if(res === "OK"){
// 					location.href = "/elly/main.do";
// 				}
// 			}
// 		});
// 	});
	
// 	// 쿠폰 적용 기능
// 	var mycouponList = $("#mycouponList")
	
// 	mycouponList.on("click", function(){
		
// 		var memId = $("#memId").val();
		
// 		var data = {
// 				memId : memId
// 		};
		
// 		$.ajax({
// 			type : "post",
// 			url : "/elly/store/mycoupon.do",
// 			beforeSend: function(xhr){
// 				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
// 			},
// 			data : JSON.stringify(data),
// 			contentType : "application/json; charset=utf-8",
// 			success : function(result){
// 				console.log(result.length);
// 				var couponList = '<option>쿠폰을 선택하세요.</option>';
// 				for(var i = 0; i < result.length; i++){
// 					couponList += '<option>' + result[i].cpnName + '</option>'
// 				}
// 				mycouponList.html(couponList);
// 			}
// 		});
// 	});
	
});

// 원하는 시간 선택 hover
function change_resvTimeBtn(e) {
	var resvTimeBtns = document.querySelectorAll(".resvTimeBtn");
	
	resvTimeBtns.forEach(function(resvTimeBtn, i) {
		if(event.currentTarget == resvTimeBtn) {
			resvTimeBtn.classList.add("active");
		}
		else {
			resvTimeBtn.classList.remove("active");
		}
	});
};

//원하는 인원 선택 hover
function change_resvMcntBtn(e) {
	var resvMcntBtns = document.querySelectorAll(".resvMcntBtn");

	resvMcntBtns.forEach(function(resvMcntBtn, i) {
		if(event.currentTarget == resvMcntBtn) {
			resvMcntBtn.classList.add("active");
		}
		else {
			resvMcntBtn.classList.remove("active");
		}
	});
};

function formatPrice(price) {
	  return '₩ ' + price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

</script>
