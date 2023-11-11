<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Log in</title>

<!-- App favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">

<!-- Theme Config Js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/hyper-config.js"></script>

<!-- App css -->
<link href="${pageContext.request.contextPath }/resources/assets/css/app-creative.min.css" rel="stylesheet" type="text/css" id="app-style" />

<!-- Icons css -->
<link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />

<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath }/resources/assets/css/mainpage.css" rel="stylesheet">

<!-- JQUERY CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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

<body class="hold-transition ${bodyText }">
	<!-- 로그인 템플릿  content 위치 -->
	<tiles:insertAttribute name="content"/>
	
</body>
</html>
