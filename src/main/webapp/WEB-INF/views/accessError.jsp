<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied Page</title>
</head>
<body>
	<h3>Access Denied</h3>
	
	<!-- 
		SPRING_SECURITY_403_EXCEPTION.message는 권한이 없어 접근이 거부됐을 때 'Access is denied' 문자열이 출력된다.
	 -->
	<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.message }"></c:out></h2>
	<h2><c:out value="${msg }"></c:out></h2>
</body>
</html>