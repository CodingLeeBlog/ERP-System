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
                            <div id="findInfo" style="display: inline-block; float: right; color: rgb(183 183 183);">아이디 찾기 | 비밀번호 찾기</div>
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
                <div class="text-center mt-4">
                    <ul class="list-inline">
                    	<li class="list-inline-item">
                    		<button class="btn btn-light" type="button" id="admin">본사</button>
                    	</li>
                    	<li class="list-inline-item">
                    		<button class="btn btn-light" type="button" id="owner">봉명점</button>
                    	</li>
                    	<li class="list-inline-item">
                    		<button class="btn btn-light" type="button" id="pika">시청점</button>
                    	</li>
                    	<li class="list-inline-item">
                    		<button class="btn btn-light" type="button" id="a001">일반회원</button>
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

<!-- 아이디 패스워드 찾기 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="color: black">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 600px;">
		<div class="modal-content">
			<div class="modal-body">
				<div class="d-flex justify-content-center">
				    <div class="container-fluid">
				        <div class="row">
				            <div class="col-md p-0 center-div bg-white">
				                <div class="container-fluid">
				                    <div class="row">
				                        <div class="mb-5">
				                        </div>
										<div class="col-1">
										</div>
											<button id="idBtn" class="col" style="color: black; text-align: center; font-size: 20px; height: 50px; border: 2px black solid;">아이디 찾기</button>
										<div class="col-1">
										</div>
											<button id="pwBtn" class="col" style="color: black; text-align: center; font-size: 20px; border: 0px; background-color: white">비밀번호 찾기</button>
										<div class="col-1">
										</div>
										<div class="mb-5 md-d-none">
				                        </div>
				                        <div id="nameForm ps-0 pe-0">
					                        <div class="col-md-12 text-left mb-3">
					                            <span class="fs-4">이름</span>
					                        </div>
					                        <div class="col-md-12 text-left mb-3">
					                            <input type="text" id="memName" name="memName" class="form-control" placeholder="이름 입력해주세요"/>
					                        </div>
				                        </div>
				                        <div id="emailForm">
					                        <div class="col-md-12 text-left mb-3">
					                            <span class="fs-4">이메일</span>
					                        </div>
					                        <div class="col-md-12 text-left mb-3">
					                            <input type="text" id="memEmail" name="memEmail" class="form-control" placeholder="이메일 입력해주세요"/>
					                        </div>
				                        </div>
				                        <div id="idForm" style="display: none;">
											<div class="col-md-12 text-left mb-3">
					                            <span class="fs-4">아이디</span>
					                        </div>
					                        <div class="col-md-12 text-left mb-3">
					                            <input type="text" id="memIdChk" name="memIdChk" class="form-control" placeholder="아이디 입력해주세요"/>
					                        </div>
				                        </div>
				                        <button class="btn btn-secondary mt-3 mb-3" id="idFindBtn" type="button">아이디 찾기</button>
				                        <button class="btn btn-secondary mt-3 mb-3" id="pwFindBtn" type="button" style="display: none;">비밀번호 찾기</button>
				                        <div class="d-flex justify-content-center">
				                        	<div>비밀번호가 기억나지 않으세요?</div>
				                        	&nbsp;
				                        	<div style="color: rgb(183 183 183);">비밀번호 찾기</div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
			<div class="modal-footer">
				 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Vendor js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/vendor.min.js"></script>

<script type="text/javascript">
$(function(){
	
	// 회원가입 버튼
	var signForm = $("#signForm");
	
	// 로그인 버튼
	var loginBtn = $("#loginBtn");
	
	// 아이디 패스워드 찾기 버튼
	var findInfo = $("#findInfo");
	
	// 로그인 버튼 클릭 이벤트
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
	
	findInfo.on("click", function(){
		$('#exampleModal').modal('show');
	})
	
	// 아이디 & 비밀번호 탭 전환
	var idBtn = $("#idBtn")
	var pwBtn = $("#pwBtn")
	
	// 아이디 & 비밀번호 찾기 버튼
	var idFindBtn = $("#idFindBtn")
	var pwFindBtn = $("#pwFindBtn")

	idBtn.on("click", function(){
		
		$(this).css("background-color", "rgb(221 221 221)");
		$(this).css("border", "2px black solid")
		$("#pwBtn").css("background-color", "transparent");
		$("#pwBtn").css("border", "0px");
		
		var idForm = $("#idForm")
		
		idForm.hide();
		idFindBtn.show();
		pwFindBtn.hide();
		
		idFindBtn.html('아이디 찾기')
	})
	
	pwBtn.on("click", function(){
		
		$(this).css("background-color", "rgb(221 221 221)");
		$(this).css("border", "2px black solid")
		$("#idBtn").css("background-color", "transparent");
		$("#idBtn").css("border", "0px");

		var idForm = $("#idForm")
		
		idForm.show();
		idFindBtn.hide();
		pwFindBtn.show();
		
		idFindBtn.html('비밀번호 찾기')
	})
	
	// 아이디 찾기 버튼 클릭 이벤트
	idFindBtn.on("click", function(){
		
		var memName = $("#memName").val();
		var memEmail = $("#memEmail").val();
		
		var userObject = {
			memName : memName,
			memEmail : memEmail
		}
		
		$.ajax({
			type : "post",
			url : "/elly/findid.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data : JSON.stringify(userObject),
			contentType : "application/json; charset=utf-8",
	        success:function(data){
				Swal.fire({
					title: '알림창',
					text: '회원님의 아이디는 "' + data.memId + '" 입니다.',
					icon: 'success',
				})
        	},
		});
	});
	
	// 아이디 찾기 버튼 클릭 이벤트
	pwFindBtn.on("click", function(){
		
		var memName = $("#memName").val();
		var memEmail = $("#memEmail").val();
		var memIdChk = $("#memIdChk").val();
		
		var userObject = {
			memName : memName,
			memEmail : memEmail,
			memId : memIdChk
		}
		
		$.ajax({
			type : "post",
			url : "/elly/findpw.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data : JSON.stringify(userObject),
			contentType : "application/json; charset=utf-8",
	        success:function(data){
				Swal.fire({
					title: '알림창',
					text: '해당 이메일로 비밀번호가 발송 되었습니다.',
					icon: 'success',
				})
        	},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '입력 양식을 다시 입력해주세요 !',
					icon: 'warning',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/elly/login.do"; 
					}
				});
			}
		});
	});
	
	$("#admin").on("click", function(){
		$("#username").val("admin");
		$("#password").val("1234");
	});
	$("#owner").on("click", function(){
		$("#username").val("owner");
		$("#password").val("1234");
	});
	$("#pika").on("click", function(){
		$("#username").val("pika");
		$("#password").val("1234");
	});
	$("#a001").on("click", function(){
		$("#username").val("a001");
		$("#password").val("1234");
	});
})
</script>