<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sec:authentication property="principal.member" var="member"/>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- weather css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/weather/weather-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/weather/weather-icons.min.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/weather/weather-icons.wind.css"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/weather/weather-icons.wind.min.css"> --%>
<!-- weather js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/weather/index.js"></script>
<!-- weather font -->
<script src="${pageContext.request.contextPath }/resources/assets/js/hyper-config.js"></script>
<script type="text/javascript">

let today = new Date();

let hours = today.getHours();		// 시
let minutes = today.getMinutes();	// 분
let minute = parseInt(minutes);
let hour = parseInt(hours);
console.log("parsing한 hour -> " + hour);
hour = hour - 1;
console.log("hour-1 한 값 -> " + hour);

if(minute < 10){
	minutes = "0" + minute;
}

if(hour < 10){
	hour = "0" + hour;
}

let basehour = (hour+""+minutes);

console.log("base_time에 들어갈 시/분 -> " + basehour);


// $.getJSON("https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=mNJbZGrK%2BS6KbfQwh0IBJq0E1WaImT1BBASD4Vw1Q9%2BI1%2BiWktR4Go1ypzLt8TAWfKp9Yh25Y2bTrpYJtfZauw%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=20231106&base_time=0600&nx=" + ${member.nx} + "&ny=" + ${member.ny},
var url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=mNJbZGrK%2BS6KbfQwh0IBJq0E1WaImT1BBASD4Vw1Q9%2BI1%2BiWktR4Go1ypzLt8TAWfKp9Yh25Y2bTrpYJtfZauw%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=" + ${member.baseDate} + "&base_time="+basehour+"&nx=67&ny=100";
// var url = "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=mNJbZGrK%2BS6KbfQwh0IBJq0E1WaImT1BBASD4Vw1Q9%2BI1%2BiWktR4Go1ypzLt8TAWfKp9Yh25Y2bTrpYJtfZauw%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date=" + ${member.baseDate} + "&base_time=1400&nx=67&ny=100";
console.log(url);
$.getJSON(url,
function(data){
    console.log(data);
    console.log(data.response.body.items.item[3].obsrValue);
    var item = data.response.body.items.item[3];
    let content = item.baseDate + "," + item.baseTime + "," + item.obsrValue + "입니다.";
    
    var pty = data.response.body.items.item[0].obsrValue;		// 강수형태
    var reh = data.response.body.items.item[1].obsrValue;		// 습도
    var rn1 = data.response.body.items.item[2].obsrValue;		// 1시간 강수량
    var temp = data.response.body.items.item[3].obsrValue;		// 기온
    var uuu = data.response.body.items.item[4].obsrValue;		// 동서바람성분
    var vec = data.response.body.items.item[5].obsrValue;		// 풍향
    var vvv = data.response.body.items.item[6].obsrValue;		// 남북바람성분
    var wsd = data.response.body.items.item[7].obsrValue;		// 풍속
    
    console.log(content);
    console.log("강수형태 -> " + pty);
    console.log("습도 -> " + reh);
    console.log("1시간 강수량 -> " + rn1);
    console.log("기온 -> " + temp);
    console.log("동서바람성분 -> " + uuu);
    console.log("풍향 -> " + vec);
    console.log("남북바람성분 -> " + vvv);
    console.log("풍속 -> " + wsd);
    
    var str = "";
    var path = "${pageContext.request.contextPath }/resources/assets/svg/animation-ready/";
    
    // 온도(temp) 처리
    tp = parseInt(temp);
    var tempImg = "thermometer-celsius.svg";
    if(tp <= 0){
    	tempImg = "thermometer-colder.svg";
    }
    $('.first-line .temp').html("<img src='"+path+tempImg+"' style='width: 35px; height: 35px;'>"+temp);
    
    // 습도(reh)
    $('.second-line .humidity').html("<img src='"+path+"humidity.svg' style='width: 35px; height: 35px;'>"+reh);
    
    // 풍속(wsd)
    console.log("wsd : " + parseInt(wsd));
    var wsdInt = parseInt(wsd);
   	$('.third-line .wind').html("<img src='"+path+"wind-beaufort-"+wsdInt+".svg' style='width: 35px; height: 35px;'>");
    
    // 1시간 강수량
    // 0.0 ~ 0.49 : 쩅
    // 0.5 ~ 3 : 조금 내림
    // 3 ~ : 강하게 내림
    var rn1Float = parseFloat(rn1);
   	var rn1Img = "clear-day.svg";
    if(rn1Float >= 0.5 && rn1Float < 3){
    	rn1Img = "drizzle.svg";
    }else if(rn1Float >= 3){
    	rn1Img = "rain.svg";
    }
    $('.fourth-line .precipitation').html("<img src='"+path+rn1Img+"' style='width: 35px; height: 35px;'>"+rn1);
    
//     $('.weather').text(content);

});
    
    
setInterval(myTimer, 1000); // 1초마다 호출되게 한다.

function myTimer() {
    let today = new Date(); //데이트객체생성
    let y = today.getFullYear();
    let m = today.getMonth() + 1; //0부터 시작하므로 +1을 더해야 현재 월 이 된다.
    let d = today.getDate(); //일 값을 받아낸다.
    let day = today.getDay(); // 요일의 값을 받아낸다.
    let weekday = new Array(7); // 어레이의 각 요일을 할당하고
    weekday[0] = "Sunday";
    weekday[1] = "Monday";
    weekday[2] = "Tuesday";
    weekday[3] = "Wednesday";
    weekday[4] = "Thursday";
    weekday[5] = "Friday";
    weekday[6] = "Saturday";

    let t_time = today.toLocaleTimeString();

    $(".today-time .year").text(y);
    $(".today-time .month").text(m);
    $(".today-time .date").text(d);
    $(".day").text(weekday[today.getDay()]); //어레이의 요일의 값을 할당해 요일 출력
    $(".today-time .todayTimes").text(t_time);
}  
$(function(){
	let area = '대전광역시 오류동';
	$(".areas").text(area);
});

</script>

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

					<!-- 날씨 및 위치 -->				
					  <div id="today">
		           	    	<div class="col-12">
		               			<div class="row">
						        <div class="today-weather col-5 ms-2">
						            <h6 class="fs-5 text" style="color: white; font-weight: bold;">오늘의 날씨<span style="color: white; font-weight: bold;"> (</span><span style="color: white; font-weight: bold;" class="day">000</span><span style="color: white; font-weight: bold;">)</span></h6>
						           <span style="color: white; font-weight: bold;" class="fs-6 text">위치 : <span style="color: white; font-weight: bold;" class="areas"></span></span>
						        </div>
						            <div class="weather-text col-4">
						            	<div class="col-12">
						           			 <div class="row">
						            				<div class="col-3">
								                		<div class="first-line "><span style="color: white; font-weight: bold;" class="first-span"><span style="color: white; font-weight: bold;" class="temp"></span>&#8451</span></div>
								                  	</div>
								                  	<div class="col-3">
								                		<div class="second-line"> <span style="color: white; font-weight: bold;" class="second-span"><span style="color: white; font-weight: bold;" class="humidity"></span>%</span></div>
								                	</div>
								                  	<div class="col-3">
								                		<div class="third-line"><span style="color: white; font-weight: bold;" class="wind"></span><span style="color: white; font-weight: bold;">km/h</span></div>
								                	</div>
								                  	<div class="col-3">
										                <div class="fourth-line"><span style="color: white; font-weight: bold;" class=precipitation></span><span style="color: white; font-weight: bold;">mm</span></div>
								                	</div>
						         			  </div>
						          		 </div>
						            </div>
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

					<!-- 현재 시간 -->
						<div class="weather">
			               <div class="today-time">
			               <h5><i class="fs-4 text uil-clock-eight" style="color: white; font-weight: bold;"></i> &nbsp;
								<span class="year" style="color: white; font-weight: bold;">0000</span><span style="color: white; font-weight: bold;">.</span>
			             	    <span class="month" style="color: white; font-weight: bold;">00</span><span style="color: white; font-weight: bold;">.</span>
								<span class="date" style="color: white; font-weight: bold;">00</span><span style="color: white; font-weight: bold;">.</span>
								<span class="todayTimes" style="color: white; font-weight: bold;">00000</span>
							</h5>
							</div>
						</div>

                      <!-- 국가별 언어 -->
                      <li class="dropdown">
                        <a class="nav-link dropdown-toggle arrow-none" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <img src="${pageContext.request.contextPath }/resources/assets/images/flags/korea.jpg" style="width: 26px; height: 17px;"  alt="user-image" class="me-0 me-sm-1" height="12">
                            <span class="align-middle d-none d-lg-inline-block text-white">Korea</span> <i class="mdi mdi-chevron-down d-none d-sm-inline-block align-middle text-white"></i>
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
                                      <a href="/head/officeLetter.do">공문관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/inspection.do">점검(위생)관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/salesAnalysis.do">본사매출분석</a>
                                  </li>
                                  <li>
                                      <a href="/head/franchiseSalesAnalysis.do">가맹점매출분석</a>
                                  </li>
<!--                                   <li> -->
<!--                                       <a href="/head/maintenanceCost.do">관리비관리</a> -->
<!--                                   </li> -->
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
                                      <a href="/head/customerList.do">거래처관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/purchaseList.do">본사발주내역관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/headInventoryList.do">본사재고관리</a>
                                  </li>
                                  <li>
                                      <a href="/head/storeOrderHistory.do">가맹점주문내역</a>
                                  </li>
                              </ul>
                          </div>
                      </li>

                      <li class="side-nav-item">
					    <a href="/head/menu.do" class="side-nav-link">
					        <i class="uil-briefcase"></i>
					        <span>메뉴관리</span>
					    </a>
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
	setTimeout(() => {
	    if(alarmCount > 0){
	    	startBlinking();
	    }else{
	    	stopBlinking();
	    }
	}, 300);
	
	logoutButton.on("click", function() {
		logoutForm.submit();
	});
	
	setInterval(() => {
		checkNotificationCountCheck();	
	}, 500);
	
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

	function startBlinking() {
		blinkInterval = setInterval(blinkBadge, 300); // 0.3초 간격으로 깜빡임
	}

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