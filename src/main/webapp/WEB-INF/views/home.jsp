<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>

<sec:authorize access="isAnonymous()">
	<a href="/elly/login.do">로그인</a>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
	<a href="/elly/logout.do">로그아웃</a>
</sec:authorize>


<div>
	<a href="/board/list">게시판 목록</a> / <a href="/elly/head/list.do">공지사항 목록</a>
</div>

</html>
