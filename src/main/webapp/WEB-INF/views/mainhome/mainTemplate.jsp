<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- Kakaomap css -->
<link href="${pageContext.request.contextPath }/resources/assets/css/main/store/kakaomap.css" rel="stylesheet">

<!-- Favicons -->
<link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Icons css -->
<link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

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
<link href="${pageContext.request.contextPath }/resources/assets/css/main/store/storesection.css" rel="stylesheet">

<!-- Quill css -->
<!-- <link href="assets/vendor/quill/quill.core.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet" type="text/css" />                                                   -->
                                                            
<!-- quill js -->
<!-- <script src="assets/vendor/quill/quill.min.js"></script> -->
<!-- quill Init js-->
<!-- <script src="assets/js/pages/demo.quilljs.js"></script> -->

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- kakaomap api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- sweetAlert cdn -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">

</head>
<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
		<c:remove var="message" scope="request"/>
		<c:remove var="message" scope="session"/>
	</script>
</c:if>
<body>

	<!-- ======= Top Bar ======= -->
	<div id="topbar" class="d-flex align-items-center fixed-top">
		<div class="container d-flex justify-content-center justify-content-md-between">
			<div class="contact-info d-flex align-items-center">
			</div>
			<div class="languages d-none d-md-flex align-items-center">
<!-- 				<ul> -->
<!-- 					<li>En</li> -->
<!-- 					<li> -->
<!-- 						<a href="#">De</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
			</div>
		</div>
	</div>

	<!-- header의 위치 -->
	<tiles:insertAttribute name="header"/>
	
	<!-- content의 위치 -->
	<tiles:insertAttribute name="content"/>
	
	<!-- footer 위치 -->
	<tiles:insertAttribute name="footer"/>

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

<!-- Vendor js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>

<!-- Code Highlight js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/highlightjs/highlight.pack.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/vendor/clipboard/clipboard.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/hyper-syntax.js"></script>

<!-- Quill Editor js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/quill/quill.min.js"></script> --%>

<!-- Quill Demo js -->
<%-- <script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.quilljs.js"></script> --%>

<!-- Simplemde Editor js -->
<script src="${pageContext.request.contextPath }/resources/assets/vendor/simplemde/simplemde.min.js"></script>

<!-- Simplemde Demo js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/demo.simplemde.js"></script>

<!-- App js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/app.min.js"></script>


</body>
</html>