<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member.memGrade" var="grade"/>
</sec:authorize>

<div style="display: none;">
<form action="/logout" method="post" id="logoutForm"> 
	<button>로그아웃</button>
	<sec:csrfInput/>
</form>
</div>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-cente">
	<div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">
		<a href="/elly/main.do" class="logo me-auto me-lg-0">
			<img src="${pageContext.request.contextPath }/resources/assets/img/logo.png" alt="" class="img-fluid" style="width: 130px; height: 40px;">
		</a>

			
		<!-- 상단 메뉴바 시작 -->
		<nav id="navbar" class="navbar order-last order-lg-0">
			<ul>
				<li class="me-5">
					<a class="nav-link scrollto active" href="/elly/main.do" id="home">Home</a>
				</li>
				<li class="dropdown me-5">
					<a href="/elly/beerMenu.do">
						<span>메뉴</span> 
						<i class="bi bi-chevron-down"></i>
					</a>
					<ul>
						<li><a href="/elly/beerMenu.do">살얼음맥주</a></li>
						<li><a href="/elly/menu.do?searchWord=마른안주">마른안주</a></li>
						<li><a href="/elly/menu.do?searchWord=튀김안주">튀김류</a></li>
						<li><a href="/elly/menu.do?searchWord=식사안주">안주류</a></li>
						<li><a href="/elly/menu.do?searchWord=주류메뉴">기타류</a></li>
					</ul>
				</li>
				<li class="me-5">
					<a href="/elly/store/find.do">매장</a>
				</li>
				<li class="dropdown me-5">
					<a href="/elly/noticelist.do">
						<span>커뮤니티</span>
						<i class="bi bi-chevron-down"></i>
					</a>
					<ul>
						<li><a href="/elly/noticelist.do">공지사항</a></li>
						<li><a href="/elly/faqlist.do">FAQ</a></li>
						<li><a href="/elly/list.do">칭찬합니다</a></li>
						<li><a href="/elly/tendilist.do">건의합니다</a></li>
					</ul>
				</li>
				<li>
					<a href="/elly/consult.do">창업문의</a>
				</li>
			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- 상단 메뉴바 끝 -->
		
		
		
		<!-- //////////////////////////// 알림 아이콘 및 드롭다운 시작 //////////////////////////// -->

        <!-- App css -->
		<%-- <link href="${pageContext.request.contextPath }/resources/assets/css/app-saas.min.css" rel="stylesheet" type="text/css" id="app-style" /> --%>

	<ul>
		<li class="dropdown" style="list-style: none;">
                <a class="nav-link dropdown-toggle arrow-none mt-3" data-bs-toggle="dropdown"  id="alarmBtn" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                  <i class="ri-notification-3-line text-white fs-4 text"></i>
				<span id="noti-badge" class="noti-icon-badge"></span>
                </a>
                    

                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg py-0">
                    <div class="p-2 border-top-0 border-start-0 border-end-2 border-dashed border">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="m-0 font-16 fw-semibold">알림</h6>
                            </div>
                             <div class="col-auto">
                                  <a href="javascript: void(0);" class="text-dark text-decoration-underline clearAll">
									    <small>Clear All</small>
									</a>
                             </div>
                        </div>
                    </div>

                    <!-- /////////////////// 알림들 시작 /////////////////////////// -->
                    <div class="px-1" style="max-height: 500px; width: 15rem;" data-simplebar id="alims">
                        
                    </div>
                   <a href="javascript:void(0);" class="dropdown-item text-center text-dark notify-item border-top py-2">닫기</a>
                    <!-- /////////////////// 알림들 끝 /////////////////////////// -->

                </div>
           </li>
		</ul>
		<!-- //////////////////////////// 알림 아이콘 및 드롭다운 끝 //////////////////////////// -->
		
		<sec:authorize access="isAnonymous()">
			<a href="/elly/login.do" class="book-a-table-btn scrollto d-none d-lg-flex">로그인</a>
		</sec:authorize>
		
		<!-- 인증된 사용자의 경우 : isAuthenticated() - 인증된 사용자면 true -->
		<sec:authorize access="isAuthenticated()">
			<nav id="navbar" class="navbar order-last order-lg-0">
				<ul>
					<li class="dropdown">
						<a href="#"> 
							<img src="${pageContext.request.contextPath}/resources/assets/images/users/avatar-12.png" alt="user-image" width="35" class="rounded-circle" data-bs-toggle="dropdown" aria-expanded="false">
						</a>
						<ul>
							<sec:authentication property="principal.member.memId" var="memId"/>
							<li><a href="/elly/mypage.do?memId=${memId }">마이페이지</a></li>
							<li><a href="/elly/mypage.do?memId=${memId }">예약내역조회</a></li>
							<li><a href="/elly/mypage.do?memId=${memId }">내 쿠폰함</a></li>
							<li><a href="#" id="logout">로그아웃</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</sec:authorize>
	</div>
<input type="hidden" name="" id="memId" value="${memId }"/>
</header>
 	
 	<!-- Vendor js 있어야하는 기능 -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>


<script type="text/javascript">
$(function(){
	var logout = $("#logout");
	var logoutForm = $("#logoutForm");
	var mypagelogout = $("#mypagelogout");
	
	logout.on("click", function(){
		logoutForm.submit();
	});
	
	mypagelogout.on("click", function(){
		logoutForm.submit();
	});
	
	
	$(document).ready(function () {
    // 페이지 로드시 1회 실행
    updateNotificationBadge();

    // 3초마다 업데이트
    setInterval(function () {
        updateNotificationBadge();
    }, 3000);
	});

	let showBadge = false;
	
	function updateNotificationBadge() {
			
		    var data = {
		        memId: $("#memId").val()
		    };

		    $.ajax({
		        type: "post",
		        url: "/elly/selectAlarm.do",
		        beforeSend: function (xhr) {
		            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        },
		        data: JSON.stringify(data),
		        contentType: "application/json; charset=utf-8",
		        success: function (rst) {
		            if (rst == null || rst.length == 0) {
		                console.log('null');
		                showBadge = false;
		                $("#noti-badge").css({
	                        display: "none"
	                    });
		            } else {
		                console.log("rst : " + JSON.stringify(rst));

		                $("#alims").empty();
		              
		                showBadge = true;
		                let str = "";

		                $.each(rst, function (idx, data) {
		                        showBadge = true;
		                        str += "<a href='" + data.alarmUrl + "' class='dropdown-item p-0 notify-item card unread-noti shadow-none mb-2 mt-2'>";
		                        str += "<div class='notify-icon'></div>";
		                        str += '<div class="row">';
		                        str += "<div class='col-9 clsAlarm text-center' data-alarm-no='" + data.alarmNo + "'><div class=''>" + data.alarmContent + "</div>";
		                        str += "</div>";
		                        str += "<div class='col-3 clsHref text-center' data-alarm-no='" + data.alarmNo + "'>x</div>";
		                        str += "</div></a>";
		                });

		                $("#alims").append(str);

		                
                //1개 삭제
                $(".clsHref").on("click", function(event) {
            	    event.preventDefault(); // 링크의 기본 동작(페이지 이동)을 방지합니다.

            	    let alarmNo = $(this).data("alarmNo");
            	    console.log("clsHref alarmNo : " + alarmNo);

                    var data = { 
                    		alarmNo : alarmNo 
                    	}
            	    
            	        $.ajax({
            	            type: "POST",
            	            url: "/elly/deleteAlarm.do",
            	            beforeSend: function (xhr) {
            	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            	            },
            	            data: JSON.stringify(data),
            	            contentType: "application/json; charset=utf-8",
            	            success: function(response) {
            	                if (response === "OK") {
            	                	$("#alims").empty();
            	                    console.log("항목 삭제에 성공했습니다.");
            	                } else {
            	                    console.log("항목 삭제에  실패했습니다.");
            	                }
            	            }
            	        });
	            	});

	            //전체삭제
				$(".clearAll").on("click", function(event) {
				    event.preventDefault(); // 링크의 기본 동작 방지
				    let memId = $(this).data("memId");
				    var data = {
				       		memId: $("#memId").val()
				    };
				    
			        $.ajax({
			            type: "POST",
			            url: "/elly/deleteclearAllAlarm.do",
			            beforeSend: function (xhr) {
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			            },
			            data: JSON.stringify(data),
			            contentType: "application/json; charset=utf-8",
			            success: function(response) {
			                if (response === "OK") {
			                    console.log("항목 삭제에 성공했습니다.");
				                $("#alims").empty();

           	                    $("#noti-badge").css({
          		                        display: "none"
          		                    });
				                
			                } else {
			                    console.log("항목 삭제에  실패했습니다.");
			                }
			            }
			      	});
				});

	            if (showBadge == true) {
	                    $("#noti-badge").css({
	                        display: "inline-block",
	                        position: "absolute",
	                        left: "40%",
	                        top: "15%",
	                        borderRadius: "50%",
	                        height: "7px",
	                        width: "7px",
	                        backgroundColor: "#fa5c7c"
	                    });
	                }
	            }
	        }
	    });
	}
});
	
//동적 요소 클릭
$(document).on("click",".clsAlarm",function(){
	console.log("clsAlarm");
	let alarmNo = $(this).data("alarmNo");
	location.href = "/elly/updateAlarm.do?alarmNo="+alarmNo;
	console.log("alarmNo : " + alarmNo);
});

</script>
