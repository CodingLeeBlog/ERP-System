<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- 해더 시작 -->
    <!-- ========== 상단 툴바 시작 ========== -->
    <div class="navbar-custom">
        <div class="topbar container-fluid">
            <div class="d-flex align-items-center gap-lg-2 gap-1">

                <!-- 툴바 로고 시작(dark, light 로고 똑같아요!) -->
                <div class="logo-topbar">
                    <!-- Logo light -->
                    <a href="index.html" class="logo-light">
                        <span class="logo-simple">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/logo.png" alt="logo" style="width:140px; height:49px;">
                        </span>
                        <span class="logo-sm">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/logo-sm.png" alt="small logo">
                        </span>
                    </a>

                    <!-- Logo Dark -->
                    <a href="index.html" class="logo-dark">
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
                    <i class="mdi mdi-menu"></i>
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
                        <div class="input-group">
                            <input type="search" class="form-control dropdown-toggle" placeholder="검색하기..." id="top-search">
                            <span class="mdi mdi-magnify search-icon"></span>
                            <button class="input-group-text btn btn-primary" type="submit">검색</button>
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
                        <span class="align-middle d-none d-lg-inline-block">English</span> <i class="mdi mdi-chevron-down d-none d-sm-inline-block align-middle"></i>
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
                    <a class="nav-link dropdown-toggle arrow-none"  id="alarmBtn"  data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <i class="ri-notification-3-line font-22"></i>
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

	 <!-- 알림창의 끝-->
                    </div>
                </li>
	 <!-- 어플리케이션 시작 -->
                <li class="dropdown d-none d-sm-inline-block">
                    <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <i class="ri-apps-2-line font-22"></i>
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

<!-- 테마 설정 (건들면 로고 깨져용) 맨하단에 Theme Settings 테마 설정이랑 연결됨-->
                <li class="d-none d-sm-inline-block">
                    <a class="nav-link" data-bs-toggle="offcanvas" href="#theme-settings-offcanvas">
                        <i class="ri-settings-3-line font-22"></i>
                    </a>
                </li>

<!-- 다크모드/라이트모드 -->
                <li class="d-none d-sm-inline-block">
                    <div class="nav-link" id="light-dark-mode" data-bs-toggle="tooltip" data-bs-placement="left" title="Theme Mode">
                        <i class="ri-moon-line font-22"></i>
                    </div>
                </li>

<!-- 풀스크린 -->
                <li class="d-none d-md-inline-block">
                    <a class="nav-link" href="" data-toggle="fullscreen">
                        <i class="ri-fullscreen-line font-22"></i>
                    </a>
                </li>

<!-- 프로필 -->
                <li class="dropdown">
                    <a class="nav-link dropdown-toggle arrow-none nav-user px-2" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="account-user-avatar">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-1.jpg" alt="user-image" width="32" class="rounded-circle">
                        </span>
                        <span class="d-lg-flex flex-column gap-1 d-none">
                            <h5 class="my-0">Dominic Keller</h5>
                            <h6 class="my-0 fw-normal">Founder</h6>
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
                            <i class="mdi mdi-account-edit me-1"></i>
                            <span>Settings</span>
                        </a>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item">
                            <i class="mdi mdi-lifebuoy me-1"></i>
                            <span>Support</span>
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
    <div class="leftside-menu">

		<!-- 로고 (Light, Dark 같아요) -->
        <!-- Brand Logo Light -->
        <a href="/owner/home.do" class="logo logo-light">
            <span class="logo-lg">
                <img src="${pageContext.request.contextPath }/resources/assets/images/logo.png" alt="logo" style="width:140px; height:49px;">
            </span>
            <span class="logo-sm">
                <img src="${pageContext.request.contextPath }/resources/assets/images/logo-sm.png" alt="small logo">
            </span>
        </a>

        <!-- Brand Logo Dark -->
        <a href="index.html" class="logo logo-dark">
            <span class="logo-lg">
                <img src="${pageContext.request.contextPath }/resources/assets/images/logo-dark.png" alt="dark logo">
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

                <li class="side-nav-item">
                    <a href="/owner/home.do" class="side-nav-link">
                        <i class="uil-home-alt"></i>
                        <span>홈</span>
                    </a>
                </li>

                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarEcommerce" aria-expanded="false" aria-controls="sidebarEcommerce" class="side-nav-link">
                        <i class="uil-store"></i>
                        <span> 매장 점검 관리 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarEcommerce">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/check.do">매장 위생 관리</a>
                            </li>
                        </ul>
                    </div>
                </li>


                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarEmail" aria-expanded="false" aria-controls="sidebarEmail" class="side-nav-link">
                        <i class="uil-bill"></i>
                        <span> 납부 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarEmail">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/dues.do">공과금 및 월세 내역</a>
                            </li>
                            <li>
                                <a href="/owner/bill.do" class="bill">본사 청구액 납부</a>
                                <script type="text/javascript">
                            	$(function(){
                            		var date = new Date();
                            		var year = date.getFullYear();
                            		var month = ('0' + (date.getMonth() + 1 )).slice(-2);
                            		var day = ('0' + date.getDate()).slice(-2);
                            		
                            		var dateString = year + "/" + month;
                            		
                            		$(".bill").attr("href","/owner/bill.do?yearMonth=" + dateString);
                            	});
                            	</script>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarProjects" aria-expanded="false" aria-controls="sidebarProjects" class="side-nav-link">
                        <i class="uil-box"></i>
                        <span> 상품 물류 관리 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarProjects">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/inventory.do">재고 관리</a>
                            </li>
                        </ul>
                    </div>
                </li>


                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarTasks" aria-expanded="false" aria-controls="sidebarTasks" class="side-nav-link">
                        <i class="uil-clipboard-alt"></i>
                        <span> 주문 거래 관리 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarTasks">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/order.do">발주 신청</a>
                            </li>
                            <li>
                                <a href="/owner/orderDetail.do">발주 내역</a>
                            </li>
                            <li>
                                <a href="/owner/autoOrder.do">자동 발주 관리</a>
                            </li>
                        </ul>
                    </div>
                </li>


                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarLayouts" aria-expanded="false" aria-controls="sidebarLayouts" class="side-nav-link">
                        <i class="uil-exchange-alt"></i>
                        <span> 재고 트레이딩 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarLayouts">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/trading.do">트레이딩 요청</a>
                            </li>
                            <li>
                                <a href="/owner/tradingList.do">트레이딩 내역</a>
                            </li>
                        </ul>
                    </div>
                </li>


                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarBaseUI" aria-expanded="false" aria-controls="sidebarBaseUI" class="side-nav-link">
                        <i class="uil-users-alt"></i>
                        <span> 직원 관리 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarBaseUI">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/emp.do">조직 관리</a>
                            </li>
                            <li>
                                <a href="/owner/attendance.do">근태 관리</a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarExtendedUI" aria-expanded="false" aria-controls="sidebarExtendedUI" class="side-nav-link">
                        <i class="uil-info-circle"></i>
                        <span> 가맹점 정보 관리 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarExtendedUI">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/menu.do">메뉴 관리</a>
                            </li>
                            <li>
                                <a href="/owner/seat.do">좌석 관리</a>
                            </li>
                            <li>
                                <a href="/owner/days.do">영업일 관리</a>
                            </li>
                            <li>
                                <a href="/owner/mypageDetail.do">마이페이지</a>
                            </li>
                        </ul>
                    </div>
                </li>


                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarIcons" aria-expanded="false" aria-controls="sidebarIcons" class="side-nav-link">
                        <i class="uil-calendar-alt"></i>
                        <span> 예약 관리 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarIcons">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/resv.do">매장 예약 관리</a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarForms" aria-expanded="false" aria-controls="sidebarForms" class="side-nav-link">
                        <i class="uil-chart"></i>
                        <span> 매입/매출 분석 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarForms">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/dailySales.do">일일 매출 분석</a>
                            	<script type="text/javascript">
//                             	$(function(){
                            		
//                             		var date = new Date();
//                             		var year = date.getFullYear();
//                             		var month = ('0' + (date.getMonth() + 1 )).slice(-2);
//                             		var day = ('0' + date.getDate()).slice(-2);
                            		
//                             		var dateString = year + "-" + month + "-" + day;
                            		
//                             		$(".sales").attr("href","/owner/dailySales.do?date=" + dateString);
//                             	});
                            	</script>
                            </li>
                            <li>
                                <a href="/owner/salesAnalysis.do" class="sales">매출액 분석</a>
                          		<script type="text/javascript">
                            	$(function(){
                            		var date = new Date();
                            		var year = date.getFullYear();
                            		var month = ('0' + (date.getMonth() + 1 )).slice(-2);
                            		var day = ('0' + date.getDate()).slice(-2);
                            		
                            		var dateString = year + "/" + month;
                            		
                            		$(".sales").attr("href","/owner/salesAnalysis.do?yearMonth=" + dateString);
                            	});
                            	</script>
                            </li>
                            <li>
                                <a href="/owner/totalProfit.do" class="total">매출 총이익 분석</a>
	                            <script type="text/javascript">
	                            	$(function(){
	                            		var date = new Date();
	                            		var year = date.getFullYear();
	                            		var month = ('0' + (date.getMonth() + 1 )).slice(-2);
	                            		var day = ('0' + date.getDate()).slice(-2);
	                            		
	                            		var dateString = year + "/" + month;
	                            		
	                            		$(".total").attr("href","/owner/totalProfit.do?yearMonth=" + dateString);
	                            	});
                            	</script>
	                            
                            </li>
                            <li>
                                <a href="/owner/operationProfit.do" class="profit">순이익 분석</a>
                                <script type="text/javascript">
	                            	$(function(){
	                            		var date = new Date();
	                            		var year = date.getFullYear();
	                            		var month = ('0' + (date.getMonth() + 1 )).slice(-2);
	                            		var day = ('0' + date.getDate()).slice(-2);
	                            		
	                            		var dateString = year + "/" + month;
	                            		
	                            		$(".profit").attr("href","/owner/operationProfit.do?yearMonth=" + dateString);
	                            	});
                            	</script>
                            </li>
                            <li>
                                <a href="/owner/purchaseAnalysis.do" class="purchase">매입 분석</a>
                                <script type="text/javascript">
	                            	$(function(){
	                            		var date = new Date();
	                            		var year = date.getFullYear();
	                            		var month = ('0' + (date.getMonth() + 1 )).slice(-2);
	                            		var day = ('0' + date.getDate()).slice(-2);
	                            		
	                            		var dateString = year + "/" + month;
	                            		
	                            		$(".purchase").attr("href","/owner/purchaseAnalysis.do?yearMonth=" + dateString);
	                            	});
                            	</script>
                                
                                
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarTables" aria-expanded="false" aria-controls="sidebarTables" class="side-nav-link">
                        <i class="uil-comment-heart"></i>
                        <span> 리뷰 관리 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarTables">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="tables-basic.html">리뷰 현황</a>
                            </li>
                            <li>
                                <a href="/owner/review.do">리뷰 관리</a>
                            </li>
                        </ul>
                    </div>
                </li>

                <li class="side-nav-item">
                    <a data-bs-toggle="collapse" href="#sidebarMaps" aria-expanded="false" aria-controls="sidebarMaps" class="side-nav-link">
                        <i class="uil-comment-edit"></i>
                        <span> 게시판 </span>
                        <span class="menu-arrow"></span>
                    </a>
                    <div class="collapse" id="sidebarMaps">
                        <ul class="side-nav-second-level">
                            <li>
                                <a href="/owner/officialDoc.do">공문 조회</a>
                            </li>
                            <li>
                                <a href="/owner/inquiry.do">1대1 문의</a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
            <!--- 단락끝 사이드바 끝 -->
            <div class="clearfix"></div>
        </div>
    </div>
 	<sec:authentication property="principal.member" var="member"/>
    <input type="hidden" name="" id="memId" value="${member.memId }"/>
    <!-- ========== Left Sidebar End ========== -->

<!-- END wrapper -->
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
				url : "/owner/selectAlarm.do",
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
				url : "/owner/selectAlarm.do",
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
			url : "/owner/selectAlarm.do",
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
		location.href = "/owner/updateAlarm.do?alarmNo=" + alarmNo;
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
			url : "/owner/deleteAlarm.do",
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
			url : "/owner/deleteclearAllAlarm.do",
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