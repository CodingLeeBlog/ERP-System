<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
        <!-- 해더 시작 -->
            <!-- ========== 상단 툴바 시작 ========== -->
            <div class="navbar-custom">
              <div class="topbar container-fluid" style="background-color:#65A4BE;">
                  <div class="d-flex align-items-center gap-lg-2 gap-1">
          
                      <!-- 툴바 로고 시작(dark, light 로고 똑같아요!) -->
                      <div class="logo-topbar">
                          <!-- Logo light -->
                          <a href="/head/dashboard.do" class="logo-light">
                              <span class="logo-simple">
                                  <img src="${pageContext.request.contextPath }/resources/assets/images/logo.png" alt="logo" style="width:140px; height:49px;">
                              </span>
                          </a>

                          <!-- Logo Dark -->
                          <a href="/head/dashboard.do" class="logo-dark">
                              <span class="logo-lg">
                                  <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark.png" alt="dark logo">
                              </span>
                              <span class="logo-sm">
                                  <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png" alt="small logo">
                              </span>
                          </a>
                      </div>
           
                      <!-- 사이드 여는 버튼 -->
                      <button class="button-toggle-menu">
                          <i class="mdi mdi-menu text-white"></i>
                      </button>

                      <!-- Horizontal Menu Toggle Button : 지워도 아무반응 없음 -->
                      <button class="navbar-toggle" data-bs-toggle="collapse" data-bs-target="#topnav-menu-content">
                          <div class="lines">
                              <span></span>
                              <span></span>
                              <span></span>
                          </div>
                      </button>

                      <!-- 상단 툴바 검색하기 -->
                      <div class="app-search dropdown d-none d-lg-block">
                          <form>
                              <div class="input-group" >
                                  <input type="search" class="form-control dropdown-toggle" placeholder="검색하기..." id="top-search">
                                  <span class="mdi mdi-magnify search-icon"></span>
                                  <button class="input-group-text btn btn-primary" type="submit" style="background-color:#abb2b8;">검색</button>
                              </div>
                          </form>

               <!-- 상단 툴바 검색하기 누르면 나오는 내용 -->
                          <div class="dropdown-menu dropdown-menu-animated dropdown-lg" id="search-dropdown">
                              <!-- item-->
                              <div class="dropdown-header noti-title">
                                  <h5 class="text-overflow mb-2">Found <span class="text-danger">17</span> results</h5>
                              </div>

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item notify-item">
                                  <i class="uil-notes font-16 me-1"></i>
                                  <span>Analytics Report</span>
                              </a>

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item notify-item">
                                  <i class="uil-life-ring font-16 me-1"></i>
                                  <span>How can I help you?</span>
                              </a>

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item notify-item">
                                  <i class="uil-cog font-16 me-1"></i>
                                  <span>User profile settings</span>
                              </a>

                              <!-- item-->
                              <div class="dropdown-header noti-title">
                                  <h6 class="text-overflow mb-2 text-uppercase">Users</h6>
                              </div>

                              <div class="notification-list">
                                  <!-- item-->
                                  <a href="javascript:void(0);" class="dropdown-item notify-item">
                                      <div class="d-flex">
                                          <img class="d-flex me-2 rounded-circle" src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-2.jpg" alt="Generic placeholder image" height="32">
                                          <div class="w-100">
                                              <h5 class="m-0 font-14">Erwin Brown</h5>
                                              <span class="font-12 mb-0">UI Designer</span>
                                          </div>
                                      </div>
                                  </a>

                                  <!-- item-->
                                  <a href="javascript:void(0);" class="dropdown-item notify-item">
                                      <div class="d-flex">
                                          <img class="d-flex me-2 rounded-circle" src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-5.jpg" alt="Generic placeholder image" height="32">
                                          <div class="w-100">
                                              <h5 class="m-0 font-14">Jacob Deo</h5>
                                              <span class="font-12 mb-0">Developer</span>
                                          </div>
                                      </div>
                                  </a>
                              </div>
                          </div>
                      </div>
                  </div>

            <!-- 상단 툴바 화면 작아졌을때 돋보기 누르면 나오는 부분 -->
                  <ul class="topbar-menu d-flex align-items-center gap-3">
                      <li class="dropdown d-lg-none">
                          <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                              <i class="ri-search-line font-22"></i>
                          </a>
                          <div class="dropdown-menu dropdown-menu-animated dropdown-lg p-0">
                              <form class="p-3">
                                  <input type="search" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                              </form>
                          </div>
                      </li>

                      <!-- 국가별 언어 -->
                      <li class="dropdown">
                        <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/flags/us.jpg" alt="user-image" class="me-0 me-sm-1" height="12">
                            <span class="align-middle d-none d-lg-inline-block text-white">English</span> <i class="mdi mdi-chevron-down d-none d-sm-inline-block align-middle text-white"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated">

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/flags/germany.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">German</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/flags/italy.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Italian</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/flags/spain.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Spanish</span>
                            </a>

                            <!-- item-->
                            <a href="javascript:void(0);" class="dropdown-item">
                                <img src="${pageContext.request.contextPath }/resources/assets/images/flags/russia.jpg" alt="user-image" class="me-1" height="12"> <span class="align-middle">Russian</span>
                            </a>

                        </div>
                    </li>

         	      	 <!-- 알림창 시작 -->
                      <li class="dropdown notification-list">
                          <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" id="alarmBtn" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                              <i class="ri-notification-3-line font-22 text-white"></i>
                                <span id="noti-badge" class="noti-icon-badge" style="display: none;"></span>
                          </a>
                          <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg py-0">
                              <div class="p-2 border-top-0 border-start-0 border-end-0 border-dashed border">
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
                              <div class="px-2" data-simplebar id="alims"></div>


                              <!-- 알림창의 모두보기-->
                              <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item border-top py-2">닫기</a>

                          </div>
                      </li>
             		  <!-- 알림창의 끝-->

                      <!-- 어플리케이션 시작 -->
                      <li class="dropdown d-none d-sm-inline-block">
                        <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <i class="ri-apps-2-line font-22 text-white"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated dropdown-lg p-0">

                            <div class="p-2">
                                <div class="row g-0">
                                    <div class="col">
                                        <a class="dropdown-icon-item" href="#">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/brands/slack.png" alt="slack">
                                            <span>Slack</span>
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a class="dropdown-icon-item" href="#">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/brands/github.png" alt="Github">
                                            <span>GitHub</span>
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a class="dropdown-icon-item" href="#">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/brands/dribbble.png" alt="dribbble">
                                            <span>Dribbble</span>
                                        </a>
                                    </div>
                                </div>

                                <div class="row g-0">
                                    <div class="col">
                                        <a class="dropdown-icon-item" href="#">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/brands/bitbucket.png" alt="bitbucket">
                                            <span>Bitbucket</span>
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a class="dropdown-icon-item" href="#">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/brands/dropbox.png" alt="dropbox">
                                            <span>Dropbox</span>
                                        </a>
                                    </div>
                                    <div class="col">
                                        <a class="dropdown-icon-item" href="#">
                                            <img src="${pageContext.request.contextPath }/resources/assets/images/brands/g-suite.png" alt="G Suite">
                                            <span>G Suite</span>
                                        </a>
                                    </div>
                                </div> 
             <!-- 어플리케이션 끝 -->
                            </div>

                        </div>
                    </li>

            <!-- 풀스크린 -->
                      <li class="d-none d-md-inline-block">
                          <a class="nav-link" href="" data-toggle="fullscreen">
                              <i class="ri-fullscreen-line font-22 text-white"></i>
                          </a>
                      </li>

            <!-- 프로필 -->
                      <li class="dropdown">
                          <a class="nav-link dropdown-toggle arrow-0 nav-user border-2 border-end-0 border-bottom-0 border-top-0 px-2 text-white" style="background-color:#65A4BE;" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                              <span class="account-user-avatar">
                                  <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png" alt="user-image" width="32" class="rounded-circle">
                              </span>
                              <span class="d-lg-flex flex-column gap-1 d-none">
                                  <h5 class="my-0">관리자</h5>
                                  <h6 class="my-0 fw-normal">환영합니다!!</h6>
                              </span>
                          </a>
                          <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated profile-dropdown">
                              <!-- item-->
                              <div class=" dropdown-header noti-title">
                                  <h6 class="text-overflow m-0">Welcome !</h6>
                              </div>

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item">
                                  <i class="mdi mdi-account-circle me-1"></i>
                                  <span>My Account</span>
                              </a>

                              <!-- item-->
                              <a href="javascript:void(0);" class="dropdown-item">
                                  <i class="mdi mdi-lock-outline me-1"></i>
                                  <span>Lock Screen</span>
                              </a>

                              <!-- item-->
                              <form action="/logout" method="post" id="logoutForm">
                              <div class="dropdown-item" id="logoutButton">
                                  <i class="mdi mdi-logout me-1"></i>
                                  <span>Logout</span>
                              </div>
                              <sec:csrfInput/>
                              </form>
                          </div>
                      </li>
                  </ul>
              </div>
          </div>
          <!-- ========== 툴바 상단 끝 ========== -->

      <!-- ========== 왼쪽 사이드 바 시작 ========== -->
          <div class="leftside-menu" style="background-color:#ffffff;">

      <!-- 로고 (Light, Dark 같아요) -->
              <!-- Brand Logo Light -->
              <a href="/head/dashboard.do" class="logo logo-light" style="background-color:#ffffff;">
                  <span class="logo-lg">
                      <img src="${pageContext.request.contextPath }/resources/assets/images/logo-white.png" alt="logo" style="width:140px; height:49px;">
                  </span>
                  <span class="logo-sm">
                      <img src="${pageContext.request.contextPath }/resources/assets/images/logo-sm.png" alt="small logo">
                  </span>
              </a>

              <!-- Brand Logo Dark -->
              <a href="/head/dashboard.do" class="logo logo-dark">
                  <span class="logo-lg">
                      <img src="${pageContext.request.contextPath }/resources/assets/images/logo-white.png" alt="dark logo">
                  </span>
                  <span class="logo-sm">
                      <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark-sm.png" alt="small logo">
                  </span>
              </a>

              <!-- Sidebar Hover Menu Toggle Button 왼쪽 사이드 바 작아진것-->
              <div class="button-sm-hover" data-bs-toggle="tooltip" data-bs-placement="right" title="Show Full Sidebar">
                  <i class="ri-checkbox-blank-circle-line align-middle"></i>
              </div>

              <!-- Full Sidebar Menu Close Button -->
              <div class="button-close-fullsidebar">
                  <i class="ri-close-fill align-middle"></i>
              </div>

              <!-- Sidebar -left 왼쪽 사이드바와 연결된 프로필 이미지-->
              <div class="h-100" id="leftside-menu-container" data-simplebar>
                  <!-- Leftbar User -->
                  <div class="leftbar-user">
                      <a href="pages-profile.html">
                          <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" alt="user-image" height="42" class="rounded-circle shadow-sm">
                          <span class="leftbar-user-name mt-2">Dominic Keller</span>
                      </a>
                  </div>

                  <!--- 왼쪽 사이드바 글씨들 -->
                   <!--- 단락1 -->
                  <ul class="side-nav">

                      <li class="side-nav-title font-15">관리자</li>

                      <li class="side-nav-item">
                          <a data-bs-toggle="collapse" href="#sidebarFounded" aria-expanded="false" aria-controls="sidebarFounded" class="side-nav-link">
                              <i class="uil-store"></i>
                              <span class="menu-arrow"></span>
                              <span> 창업상담관리 </span>
                          </a>
                          <div class="collapse" id="sidebarFounded">
                              <ul class="side-nav-second-level">
                                  <li>
                                      <a href="/head/salesArea.do">영업지역관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/counseling.do">가맹상담관리</a>
                                  </li>
                              </ul>
                          </div>
                      </li>
          <!--- 단락2 -->
<!--                         <li class="side-nav-title">Apps</li> -->

                      <li class="side-nav-item">
                          <a data-bs-toggle="collapse" href="#storeOpen" aria-expanded="false" aria-controls="storeOpen" class="side-nav-link">
                              <i class="uil-shop"></i>
                              <span class="menu-arrow"></span>
                              <span> 개점관리 </span>
                          </a>
                          <div class="collapse" id="storeOpen">
                              <ul class="side-nav-second-level">
                                  <li>
                                      <a href="/head/education.do">교육훈련관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/plan.do">개점일정계획</a>
                                  </li>
                              </ul>
                          </div>
                      </li>

                      <li class="side-nav-item">
                          <a data-bs-toggle="collapse" href="#sidebarStoreManagement" aria-expanded="false" aria-controls="sidebarStoreManagement" class="side-nav-link">
                              <i class="uil uil-tachometer-fast"></i>
              					<span class="menu-arrow"></span>
                              <span> 매장관리 </span>
                          </a>
                          <div class="collapse" id="sidebarStoreManagement">
                              <ul class="side-nav-second-level">
                                  <li>
                                      <a href="/head/storeInquiry.do">가맹점조회</a>
                                  </li>
                                  <li>
                                      <a href="/head/salesAnalysis.do">매출분석</a>
                                  </li>
                                  <li>
                                      <a href="/head/slumpStore.do">부진매장관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/officeLetter.do">공문관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/maintenanceCost.do">관리비관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/inspection.do">점검(위생)관리</a>
                                  </li>
                              </ul>
                          </div>
                      </li>

                      <li class="side-nav-item">
                          <a data-bs-toggle="collapse" href="#sidebarOrder" aria-expanded="false" aria-controls="sidebarOrder" class="side-nav-link">
                              <i class="uil-store"></i>
                              <span> 주문거래관리 </span>
                              <span class="menu-arrow"></span>
                          </a>
                          <div class="collapse" id="sidebarOrder">
                              <ul class="side-nav-second-level">
                                  <li>
                                      <a href="/head/storeOrderHistory.do">가맹점주문내역</a>
                                  </li>
                                  <li>
                                      <a href="/head/purchaseList.do">매입내역관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/headInventoryList.do">본사재고관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/customerList.do">거래처관리</a>
                                  </li>
                              </ul>
                          </div>
                      </li>


                      <li class="side-nav-item">
                          <a data-bs-toggle="collapse" href="#sidebarEmployee" aria-expanded="false" aria-controls="sidebarEmployee" class="side-nav-link">
                              <i class="uil-envelope"></i>
                              <span> 직원관리 </span>
                              <span class="menu-arrow"></span>
                          </a>
                          <div class="collapse" id="sidebarEmployee">
                              <ul class="side-nav-second-level">
                                  <li>
                                      <a href="/head/">조직관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/">직원교육관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/">근태급여관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/">파견일정</a>
                                  </li>
                              </ul>
                          </div>
                      </li>

                      <li class="side-nav-item">
                          <a data-bs-toggle="collapse" href="#sidebarMenu" aria-expanded="false" aria-controls="sidebarMenu" class="side-nav-link">
                              <i class="uil-briefcase"></i>
                              <span> 정보관리 </span>
                              <span class="menu-arrow"></span>
                          </a>
                          <div class="collapse" id="sidebarMenu">
                              <ul class="side-nav-second-level">
                                  <li>
                                      <a href="/head/menu.do">메뉴관리</a>
                                  </li>
                              </ul>
                          </div>
                      </li>

                      <li class="side-nav-item">
                          <a data-bs-toggle="collapse" href="#sidebarDashboards" aria-expanded="false" aria-controls="sidebarDashboards" class="side-nav-link">
                              <i class="uil-copy-alt"></i>
                              <span> 게시판 </span>
                              <span class="menu-arrow"></span>
                          </a>
                          <div class="collapse" id="sidebarDashboards">
                              <ul class="side-nav-second-level">
                                  <li>
                                      <a href="/head/list.do">공지사항</a>
                                  </li>
                                  <li>
                                      <a href="/head/inquiryList.do">1:1문의</a>
                                  </li>
                                  <li>
                                      <a href="/head/faqlist.do">FAQ</a>
                                  </li>
                                  <li>
                                      <a href="/head/complimentList.do">칭찬합니다</a>
                                  </li>
                                  <li>
                                      <a href="/head/proposalList.do">건의합니다</a>
                                  </li>
                
          <!-- 단락4 -->

                  </ul>
                  <!--- 단락끝 사이드바 끝 -->

                  <div class="clearfix"></div>
              </div>
          </div>
        </div>
 	<sec:authentication property="principal.member" var="member"/>
    <input type="hidden" name="" id="memId" value="${member.memId }"/>
    
        <!-- ========== Left Sidebar End ========== -->
<script type="text/javascript">
$(function(){
	var logoutForm = $("#logoutForm");
	var logoutButton = $("#logoutButton");
	var alarmBtn = $("#alarmBtn");
	var alarmCount = 0;

	checkNotificationCount();
	
	// 알람 갯수에 따른 배치 깜빡임 시작/멈춤 이벤트
// 	setTimeout(() => {
// 	    if(alarmCount > 0){
// 	    	startBlinking();
// 	    }else{
// 	    	stopBlinking();
// 	    }
// 	}, 300);
	
	logoutButton.on("click", function() {
		logoutForm.submit();
	});
	
// 	setInterval(() => {
// 		checkNotificationCountCheck();	
// 	}, 500);
	
	// 알람 아이콘을 클릭했을때
	alarmBtn.on("click", function(){
		updateNotificationBadge();	// 알람 목록 가져오기
		stopBlinking();
	});
	
	
	// 배찌 깜빡이기 위한 이벤트 그룹
	var blinkInterval;
    var badge = $("#noti-badge");
	function blinkBadge() {
	    badge.css("display", badge.css("display") === "none" ? "inline-block" : "none");
	}

// 	function startBlinking() {
// 		blinkInterval = setInterval(blinkBadge, 300); // 0.3초 간격으로 깜빡임
// 	}

	function stopBlinking(str) {
		clearInterval(blinkInterval);
		badge.css("display", "none");
		if(str == "noequals"){
			startBlinking();
		}
	}
	// 배찌 깜빡이기 위한 이벤트 그룹 end
	
	function checkNotificationCount(){
		var data = {
				memId : $("#memId").val()
			};

			$.ajax({
				type : "post",
				url : "/head/selectAlarm.do",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success : function(rst) {
					alarmCount = rst.length;
				}
			});
	}
	
	function checkNotificationCountCheck(){
		var data = {
				memId : $("#memId").val()
			};

			$.ajax({
				type : "post",
				url : "/head/selectAlarm.do",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success : function(rst) {
					var flag = false;
					if(rst.length != alarmCount){
						stopBlinking('noequals');
					}else{
						console.log("뭐니?");
					}
				}
			});
	}
	
	//알림 조회
	function updateNotificationBadge() {
		var data = {
			memId : $("#memId").val()
		};

		$.ajax({
			type : "post",
			url : "/head/selectAlarm.do",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(rst) {
				updateNotificationList(rst);
				alarmCount = rst.length;
			}
		});
	}
	
	//append로 알림 리스트 보내기
	function updateNotificationList(rst) {
		$("#alims").empty();
		var str = "";
		$.each(rst,	function(idx, data) {
			str += "<a href='" + data.alarmUrl + "' class='dropdown-item p-0 notify-item card unread-noti shadow-none mb-2 mt-2'>";
			str += "<div class='card-body'>";
			str += "<span class='float-end noti-close-btn text-muted'></span>";
			str += "<div class='d-flex align-items-center'><div class='flex-shrink-0'><div class='notify-icon bg-primary'><i class='mdi mdi-comment-account-outline'></i>";
			str += "</i></div></div>";
			str += "<div class='flex-grow-1 text-truncate ms-3 mb-1 clsAlarm' data-alarm-no='" + data.alarmNo + "'><h5 class='noti-item-title fw-semibold font-14'></h5>"
					+ data.alarmContent + "</div>";
			str += "<div class='col-3 clsHref' data-alarm-no='" + data.alarmNo + "'><i class='mdi mdi-close ms-3'></i></div>";
			str += "</div></a>";
		});
		$("#alims").append(str);
	}
	

	//알림 눌렀을때 '읽음 처리'
	$(document).on("click", ".clsAlarm", function() {
		console.log("clsAlarm");
		let alarmNo = $(this).data("alarmNo");
		console.log("alarmNo: " + alarmNo);
		location.href = "/head/updateAlarm.do?alarmNo=" + alarmNo;
	});

	//알림 1개 삭제
	$(document).on("click",".clsHref",function(event) {
		event.preventDefault(); // 링크의 기본 동작 방지

		let alarmNo = $(this).data("alarmNo");
		console.log("clsHref alarmNo : " + alarmNo);

		var data = {
			alarmNo : alarmNo
		}

		$.ajax({
			type : "POST",
			url : "/head/deleteAlarm.do",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(response) {
				if (response === "OK") {
					console.log("항목 삭제에 성공했습니다.");
					$("#alims").empty();
				} else {
					console.log("항목 삭제에  실패했습니다.");
				}
			}
		});
	});

	//알림 전체 삭제
	$(document).on("click",".clearAll",function(event) {
		event.preventDefault(); // 링크의 기본 동작 방지
		let memId = $(this).data("memId");
		var data = {
			memId : $("#memId").val()
		};
		$.ajax({
			type : "POST",
			url : "/head/deleteclearAllAlarm.do",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(response) {
				if (response === "OK") {
					console.log("항목 삭제에 성공했습니다.");
					$("#alims").empty();
				} else {
					console.log("항목 삭제에  실패했습니다.");
				}
			}
		});
	});
});
</script>