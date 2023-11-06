<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Restaurantly Bootstrap Template - Index</title>

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/boxicons/css/boxicons.min.css"rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/assets/css/mainpage.css" rel="stylesheet">

</head>
<body>

	<!-- ======= Top Bar ======= -->
	<div id="topbar" class="d-flex align-items-center fixed-top">
		<div class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
			</div>
			<div class="languages d-none d-md-flex align-items-center">
				<ul>
					<li>En</li>
					<li>
						<a href="#">De</a>
					</li>
				</ul>
			</div>
		</div>
	</div>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-cente">
	<div class="container-fluid container-xl d-flex align-items-center justify-content-lg-between">
		<a href="#hero" class="logo me-auto me-lg-0">
			<img src="${pageContext.request.contextPath }/resources/assets/img/logo.png" alt="" class="img-fluid" style="width: 130px; height: 40px;">
		</a>

		<!-- 상단 메뉴바 시작 -->
		<nav id="navbar" class="navbar order-last order-lg-0">
			<ul>
				<li>
					<a class="nav-link scrollto active" href="#hero" id="home">Home</a>
				</li>
				<li>
					<a class="nav-link scrollto active" href="#about">브랜드</a>
				</li>
				<li class="dropdown">
					<a href="#menu">
						<span>메뉴</span> 
						<i class="bi bi-chevron-down"></i>
					</a>
					<ul>
						<li><a href="#menu1">살얼음 맥주</a></li>
						<li><a href="#menu2">마른안주</a></li>
						<li><a href="#menu3">튀김류</a></li>
						<li><a href="#menu4">안주류</a></li>
						<li><a href="#menu5">기타류</a></li>
					</ul>
				</li>
				<li>
					<a class="nav-link scrollto" href="#menu">매장</a>
				</li>
				<li class="dropdown">
					<a href="/elly/list.do">
						<span>공지사항</span>
						<i class="bi bi-chevron-down"></i>
					</a>
					<ul>
						<li><a href="/elly/list.do">칭찬합니다</a></li>
						<li><a href="/elly/board2.do">건의합니다</a></li>
						<li><a href="/elly/board3.do">공지사항</a></li>
					</ul>
				</li>
				<li>
					<a class="nav-link scrollto" href="#menu">창업문의</a>
				</li>
			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- 상단 메뉴바 끝 -->
		
		<a href="#book-a-table" class="book-a-table-btn scrollto d-none d-lg-flex">로그인</a>
	</div>
</header>
<!-- End Header -->

<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">
	<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
		<div class="row">
			<div class="col-lg-8">
				<h1>
					단1%의 거짓도 없습니다! <span>1등 성공 신화!</span>
				</h1>

				<div class="btns">
					<a href="#menu" class="btn-menu animated fadeInUp scrollto">메뉴 확인하기</a> 
					<a href="#book-a-table" class="btn-book animated fadeInUp scrollto">예약 하기</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Hero -->

<main id="main">

	<!-- ======= About Section ======= -->
	<section id="about" class="about">
		<div class="container" data-aos="fade-up">
			<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
				<h3>Voluptatem dignissimos provident quasi corporis voluptates
					sit assumenda.</h3>
				<p class="fst-italic">Lorem ipsum dolor sit amet, consectetur
					adipiscing elit, sed do eiusmod tempor incididunt ut labore et
					dolore magna aliqua.</p>
				<ul>
					<li>
						<i class="bi bi-check-circle"></i> 
						Ullamco laboris nisi ut aliquip ex ea commodo consequat.
					</li>
					<li>
						<i class="bi bi-check-circle"></i> 
						Duis aute irure dolor in reprehenderit in voluptate velit.
					</li>
					<li>
						<i class="bi bi-check-circle"></i> 
						Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
						reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.
					</li>
				</ul>
				<p>Ullamco laboris nisi ut aliquip ex ea commodo consequat.
					Duis aute irure dolor in reprehenderit in voluptate velit esse
					cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
					cupidatat non proident, sunt in culpa qui officia deserunt mollit
					anim id est laborum</p>
			</div>
		</div>
	</section>
	<!-- End About Section -->

</main>
	
<!-- ======= Footer ======= -->
<footer id="footer">
	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 col-md-6">
					<div class="footer-info">
						<img src="${pageContext.request.contextPath }/resources/assets/img/logo.png" alt="" class="img-fluid" style="width: 140px; height: 49px;">
						<br>
						<br>
						<p>
							대덕인재개발원 엘리멘탈 <br>
							대전광역시 중구 계룡로 846<br><br> 
							<strong>Phone:</strong> +042 554 4444<br>
							<strong>Email:</strong>
							Elemental@example.com<br>
						</p>
						<div class="social-links mt-3">
							<a href="#" class="twitter">
								<i class="bx bxl-twitter"></i>
							</a> 
							<a href="#" class="facebook">
								<i class="bx bxl-facebook"></i>
							</a> 
							<a href="#" class="instagram">
								<i class="bx bxl-instagram"></i>
							</a>
							<a href="#" class="google-plus">
								<i class="bx bxl-skype"></i>
							</a>
							<a href="#" class="linkedin">
								<i class="bx bxl-linkedin"></i>
							</a>
						</div>
					</div>
				</div>

				<div class="col-lg-2 col-md-6 footer-links">
					<h4>자주 사용하는 기능</h4>
					<ul>
						<li>
							<i class="bx bx-chevron-right"></i> 
							<a href="#">Home</a>
						</li>
						<li>
							<i class="bx bx-chevron-right"></i> 
							<a href="#">브랜드</a>
						</li>
						<li>
							<i class="bx bx-chevron-right"></i>
							 <a href="#">메뉴</a>
						 </li>
						<li>
							<i class="bx bx-chevron-right"></i>
							<a href="#">매장</a>
						</li>
						<li>
							<i class="bx bx-chevron-right"></i> 
							<a href="#">창업문의</a>
						</li>
					</ul>
				</div>

				<div class="col-lg-3 col-md-6 footer-links">
					<h4>마이페이지</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="#">공지사항</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">내가 쓴
								글 조회</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">쿠폰
								조회</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">칭찬합니다</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">건의합니다</a></li>
					</ul>
				</div>

				<div class="col-lg-4 col-md-6 footer-newsletter">
					<h4>검색 하기</h4>
					<p>고객님의 만족을 위해 엘리 할머니 맥주는 노력하겠습니다!</p>
					<form action="" method="post">
						<input type="email" name="email"><input type="submit"
							value="검색하기">
					</form>

				</div>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="copyright">
			&copy; Copyright <strong><span>Restaurantly</span></strong>. All
			Rights Reserved
		</div>
		<div class="credits">
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</div>
</footer>
<!-- End Footer -->

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
	<i class="bi bi-arrow-up-short"></i>
</a>

<!-- Vendor JS Files -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/aos/aos.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/mainjs/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

</body>
</html>