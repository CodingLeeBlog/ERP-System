<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
.auth-fluid {
	background: url(${pageContext.request.contextPath }/resources/assets/images/bg-login.jpg) center;
	background-size: cover;
}
</style>


<div class="auth-fluid">

    <!--Auth fluid left content -->
    <div class="auth-fluid-form-box">
        <div class="card-body d-flex flex-column h-100 gap-3">

            <!-- Logo -->
            <div class="auth-brand text-center text-lg-start">
                <a href="/elly/main.do" class="logo-dark">
                    <span class="d-flex justify-content-center align-items-center">
                    	<img src="${pageContext.request.contextPath }/resources/assets/images/login_logo2.png" alt="dark logo" height="150">
                    </span>
                </a>
            </div>

            <div class="">
            
				<!-- 시큐리티는 무조건 action 경로는 /login, method 방식은 포스트 -->
                <form action="/login" method="post">
                    <div class="mb-4" style="color: black; font-size: 20px">
                        <label for="username" class="form-label">아이디</label>
                        <input class="form-control" style="height: 50px" type="text" id="username" name="username" placeholder="아이디">
                    </div>
                    <div class="mb-4" style="color: black; font-size: 20px">
                        <label for="password" class="form-label">패스워드</label>
                        <input class="form-control" style="height: 50px" type="password" id="password" name="password" placeholder="패스워드">
                    </div>
                    <div class="mb-4" style="color: black">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="checkbox-signin" name="remember-me">로그인 상태 유지
                            <a href="/elly/forget.do"><span style="display: inline-block; float: right; color: black;">아이디 찾기 | 비밀번호 찾기</span></a>
                        </div>
                    </div>
                    <div class="d-grid mb-0 text-center" style="font-size: 20px">
                        <input class="btn btn-secondary" style="font-size: 20px;" type="submit" value="로그인"/>
                    </div>
                    <sec:csrfInput/>
                </form>
                <!-- form 끝 -->
                
                <br/>
                <div class="d-grid mb-0 text-center">
                <sec:authorize access="isAnonymous()">
                    <a href="/elly/register02.do" class="btn btn-secondary" style="font-size: 20px;">회원가입</a>
                </sec:authorize>
                </div>
                <!-- social-->
                <div class="text-center mt-4">
                    <p class="text-muted font-16">Sign in with</p>
                    <ul class="social-list list-inline mt-3">
                        <li class="list-inline-item">
                            <a href="javascript: void(0);" class="social-list-item border-primary text-primary"><i class="mdi mdi-facebook"></i></a>
                        </li>
                        <li class="list-inline-item">
                            <a href="javascript: void(0);" class="social-list-item border-danger text-danger"><i class="mdi mdi-google"></i></a>
                        </li>
                        <li class="list-inline-item">
                            <a href="javascript: void(0);" class="social-list-item border-info text-info"><i class="mdi mdi-twitter"></i></a>
                        </li>
                        <li class="list-inline-item">
                            <a href="javascript: void(0);" class="social-list-item border-secondary text-secondary"><i class="mdi mdi-github"></i></a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Footer-->
            <footer class="footer footer-alt">
                <p class="text-muted">이용약관 | 개인정보처리방침 | 회원정보 고객센터</p>
            </footer>
            
        </div>
    </div>
    
    <div class="auth-fluid-right text-center">
        <div class="auth-user-testimonial">
            <h2 class="mb-3">I love the beer!</h2>
            <p class="lead"><i class="mdi mdi-format-quote-open">남녀노소, 시대와 세대를 아우르는 정감있는 추억을 마시는 엘리할머니 맥주입니다.</i>  <i class="mdi mdi-format-quote-close"></i></p>
        </div>
    </div>
</div>

<!-- Vendor js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>

<script type="text/javascript">
$(function(){
	var signForm = $("#signForm");
	var loginBtn = $("#loginBtn");
	
	loginBtn.on("click", function(){
		var id = $("#memId").val();
		var pw = $("#memPw").val();
		
		if(id == null || id == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		if(pw == null || pw == ""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		signForm.submit();
	});
})
</script>