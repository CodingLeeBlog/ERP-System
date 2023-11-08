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
						<div class="mt-5 mb-3">SPECIALS</div>
						<div class="mb-5">대전 오류점</div>
						<div class="mb-5">원하는 시간을 선택해주세요.</div>
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
						<div class="mb-5">원하는 시간을 선택해주세요.</div>
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
									<div class="box" data-id="${seat.seatCd}" style="${seat.seatAngle}">${seat.seatCd}</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="menuInfo" style="display: none">
					<div class="col-7 pe-2" style="color: black">
						<div class="mt-5 mb-5">메뉴 목록</div>
					    <div class="container-fluid mb-3">
						<c:set value="${menulist}" var="menuList" />
							<c:choose>
								<c:when test="${empty menuList }">
									<div style="color: rgb(0, 0, 0);"></div>
									<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
										<span class="">메뉴 리뉴얼 중입니다.</span>
									</p>
									<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${menuList }" var="menu">
										<div class="row mb-4">
											
						                    <div class="col-2" style="display: flex; justify-content: center; align-items: center;">
						                   		 <img src="${pageContext.request.contextPath }/resources/upload/img/${menu.attachOrgname }" style="width: 120px; height: 120px;">
						                    </div>
						                    <div class="col-9">
						                    	<input type="hidden" class="menuCd" name="menuCd" value="${menu.menuCd }" />
						                    	<div class="d-flex mb-5">
							                    	<div class="col-4 text-start menuName" style="font-size: 20px">${menu.menuName }</div>
							                    	<div class="col me-2 text-end" style="font-size: 12px">▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️ ▪️  </div>
							                    	<div class="col-1 text-end menuPrice" style="font-size: 16px">${menu.menuPrice }</div>
						                    	</div>
						                    	<div class="menuDes" style="font-size: 16px">${menu.menuDes }</div>
						                    </div>
						                    <button type="button" class="col-1 selectMenuPlus" style="display: flex; justify-content: center; align-items: center; background-color: white; border: none;">&#10133;</button>
					                    </div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
					    </div>
					</div>
					<div class="col-5 ps-2" id="resDetail" style="color: black">
						<div class="card mt-5 mb-3 mx-auto" style="max-width: 25rem;">
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
							    		<option>쿠폰을 선택해주세요.</option>
							    	<c:set value="${couponList }" var="couponList"/>
								    	<c:choose>
								    		<c:when test="${empty couponList }">
								    			<option>보유하신 쿠폰이 없습니다.</option>
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
						  		<input type="hidden" name="memId" id="memId" value="<sec:authentication property="principal.member.memId"/>" />
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
			alert('이미 선택한 인원입니다.')
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
		var menuPrice = parseInt($(this).closest('.row').find('.menuPrice').text());
		
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
			newMenu += '<div class="col menuPrice" style="display: flex; justify-content: right; align-items: center;">' + menuArr[i].split("_")[2] + '원</div>';
			newMenu += '</div>';
            price += parseInt(menuArr[i].split("_")[2] * menuArr[i].split("_")[3]);
		}

		selectMenuList.html(newMenu);
        
		// 총 가격 변수
		var restotalPrice = $("#restotalPrice");
		restotalPrice.text(price);
		
	});
	
	// 메뉴 목록 삭제 변수
	var selectMenuMinus = $(".selectMenuMinus")
	
	// 메뉴 목록 삭제 변수
	selectMenuList.on("click", ".selectMenuMinus", function(){
		
		var price = 0;
		var menuFlag = true;
		var menuCd = $(this).closest('.selectMenu').attr('id');
		var menuName = $(this).closest('.selectMenu').find('.menuName').text();
		var menuPrice = parseInt($(this).closest('.selectMenu').find('.menuPrice').text());
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
		restotalPrice.html(price);
	});
	
	// 쿠폰 적용 기능
	var mycouponList = $("#mycouponList")
	
	mycouponList.on("change", function(){
		
		// 선택한 옵션
		var selectedOption = $(this).find('option:selected');
		
		// 기존 가격
		var restotalPrice = $("#restotalPrice").text();
		
		// 쿠폰 선택시 할인율
		var memcpnId = selectedOption.data('memcpnid');
		var distotal = $("#distotal")
		var distotalPrice = $("#distotalPrice")
		
		if(memcpnId == null){
			distotal.hide();
			distotalPrice.hide();
			$('#restotalPrice').css('text-decoration', 'none');
		}else {
			distotal.show();
			distotalPrice.show();
			$('#restotalPrice').css('text-decoration', 'line-through');
			var cpnContent = selectedOption.data('cpncontent');

			var disprice = parseInt(cpnContent.slice(0,2));
			
			var totalPrice = parseInt(restotalPrice)
			var disPrice = totalPrice * (disprice / 100)
			
			distotalPrice.html(totalPrice - disPrice)
		}
	});
	
	
	// 최종 예약 버튼
	var resBtn = $("#resBtn");
	
	resBtn.on("click", function(){
		
		var chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'
		var resvNo = ''
		for (var i = 0; i < 6; i++) {
			var rnum = Math.floor(Math.random() * chars.length)
			resvNo += chars.substring(rnum, rnum + 1)
	    }
		
		var memId = $("#memId").val();
		var frcsId = $("#frcsId").val();
		var distotalPrice = $("#distotalPrice").text();
		var restotalPrice = '';
		
		if(distotalPrice != null){
			restotalPrice = distotalPrice;
		}else {
			restotalPrice = $("#restotalPrice").text();
		}
		
// 		var restotalPrice = $("#restotalPrice").text();
		
		var selectedOption = mycouponList.find('option:selected');
		var memcpnId = selectedOption.data('memcpnid');
		
		// 예약 버튼 누를 시 넘어가야할 menuList
		var menuList = [];
		for(var i = 0; i < menuArr.length; i++){
			menuList.push({
				memId : memId,
				menuCd : menuArr[i].split("_")[0],
				frcsId : frcsId,
				menuCnt : menuArr[i].split("_")[3]
			})
		}
		
		
		var data = {
				resvNo : resvNo,
				memId : memId,
				frcsId : frcsId,
				resvMcnt : old_resvMcnt,
				resvTime : old_resvTime,
				seatCd : old_resvSeat,
				resvPrice : restotalPrice,
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
					location.href = "/elly/main.do";
				}
			}
		});
	});
	
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
</script>
