<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- ======= menubar Section ======= -->
<div id="menubar" class="d-flex align-items-center h-75 d-inline-block align-middle">
	<div class="container position-relative text-center text-lg-center"
		data-aos="zoom-in" data-aos-delay="100">
		<div class="row" style="height: 400px">
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/beerMenu.do">
					<img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주">
				</a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/menu.do?searchWord=마른안주"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
			</div>
		</div>
	</div>
</div>
<!-- menubar Hero -->


<div id="main">
	<div class="container-fluid">
		<div class="row">
			<div class="bg-white">
				<div class="mt-5 mb-5">
					<nav id="navbar" class="navbar order-last order-lg-0">
						<ul>
							<li class="me-5">
								<a class="nav-link scrollto active" style="color: black; font-size: 1rem;" href="#home" id="home">Home</a>
							</li>
							<li class="dropdown me-5">
								<a href="/elly/noticelist.do">
									<span style="color: black; font-size: 1rem;">살얼음맥주</span>
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
						</ul>
						<i class="bi bi-list mobile-nav-toggle"></i>
					</nav>
				</div>
				
				<!-- menu 영역 시작 -->
				<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
				<div>
					
				<!-- 내용 -->
				
				<div class="d-flex justify-content-center align-items-center">
				<img class=""  src="../resources/img/sub_title01.png" />
				</div>
				<br><br>
						<div class="d-flex justify-content-center align-items-center" data-motion-offset="1" data-diff="-200">
						    <div class="" style="position: relative;">
						        <video autoplay loop muted style="height: 640px; width: 1706px; z-index: 1;">
						            <source src="../resources/img/menu_1_20200615_.webm" type="video/webm">
						        </video>
						        <img  id="blinkingImage" src="../resources/img/neon_txt.png" alt="" style="position: absolute; top: 50px; left: 50px; z-index: 2;">
						        <img src="../resources/img/menu_txt02.png" alt="" style="position: absolute; top: 80px; right: 100px; z-index: 2;">
						        <img src="../resources/img/menu_txt01.png" alt="" style="position: absolute; bottom: 80px; left: 50px; z-index: 2;">
						        <img src="../resources/img/menu_txt03.png" alt="" style="position: absolute; bottom: 80px; right: 50px; z-index: 2;">
						    </div>
						</div>
						
						<br><br>
						
					</div>				
				</div>				
			</div>
		</div>
	</div>
</div>
