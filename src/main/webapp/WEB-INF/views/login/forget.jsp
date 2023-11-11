<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<link href="${pageContext.request.contextPath }/resources/assets/css/login/login.css" rel="stylesheet" type="text/css" />

<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<div class="d-flex justify-content-center">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 m-0 p-0 bg-white">
            </div>
            <div class="col-md-4 mx-auto p-0 center-div bg-white">
                <div class="container-fluid">
                    <div class="row">
                        <div class="mb-5">
                        </div>
                        <div class="col-md-6 text-center ps-0 pe-0">
                            <span class="fs-2" id="idBtn">아이디 찾기</span>
                        </div>
                        <div class="col-md-6 text-center ps-0 pe-0">
                            <span class="fs-2" id="pwBtn">비밀번호 찾기</span>
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
	                            <input type="text" id="memId" name="memId" class="form-control" placeholder="아이디 입력해주세요"/>
	                        </div>
                        </div>
                        <button class="btn btn-secondary mt-3 mb-5" id="idFindBtn" type="button">아이디 찾기</button>
                        <div class="text-center">
                        	<p>비밀번호가 기억나지 않으세요?<a href="#pwBtn">&nbsp비밀번호 찾기</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 m-0 p-0 bg-white">
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
	
	// 아이디 & 비밀번호 탭 전환
	var idBtn = $("#idBtn")
	var pwBtn = $("#pwBtn")
	
	
	// 아이디 찾기 버튼
	var idFindBtn = $("#idFindBtn")
	
	
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
					text: '해당 이메일로 비밀번호가 발송 되었습니다.',
					icon: 'success',
				})
        	},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '로그인 후 이용해주세요!',
					icon: 'warning',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/elly/login.do"; 
					}
				});
			}
		});
	});
	
	idBtn.on("click", function(){
		
		var idForm = $("#idForm")
		
		idForm.hide();
		
		idFindBtn.html('아이디 찾기')
	})
	
	pwBtn.on("click", function(){

		var idForm = $("#idForm")
		
		idForm.show();
		
		idFindBtn.html('비밀번호 찾기')
	})
});
</script>