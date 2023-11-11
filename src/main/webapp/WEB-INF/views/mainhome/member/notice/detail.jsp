<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member"/>
</sec:authorize> 
 
 <!-- ======= menubar Section ======= -->
<div id="menubar" class="d-flex align-items-center h-75 d-inline-block align-middle">
	<div class="container position-relative text-center text-lg-center"
		data-aos="zoom-in" data-aos-delay="100">
		<div class="row" style="height: 400px">
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/noticelist.do">
					<img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주">
				</a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/faqlist.do"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
			</div>
		</div>
	</div>
</div>
<!-- menubar Hero -->
 
 
<!-- 메뉴 mini bar -->
<div id="main">
	<div class="container-fluid">
		<div class="row">
			<div class="col-1 bg-white">
			</div>
			<div class="col-10 bg-white">
				<div class="row mt-5 mb-5">
					<nav id="navbar" class="navbar order-last order-lg-0">
						<ul>
							<li class="me-5">
								<a class="nav-link scrollto active" style="color: black; font-size: 1rem;" href="#home" id="home">Home</a>
							</li>
							<li class="dropdown me-5">
								<a href="/elly/noticelist.do">
									<span style="color: black; font-size: 1rem;">공지사항</span>
									<i class="bi bi-chevron-down"></i>
								</a>
								<ul>
									<li><a href="/elly/noticelist.do">공지사항</a></li>
									<li><a href="/elly/faqlist.do">FAQ</a></li>
									<li><a href="/elly/list.do">칭찬합니다</a></li>
									<li><a href="/elly/tendilist.do">건의합니다</a></li>
								</ul>
							</li>
						</ul>
						<i class="bi bi-list mobile-nav-toggle"></i>
					</nav>
				</div>
				<!-- 메뉴 mini bar 끝-->				
				
				<!-- 제목 시작 -->
				<div class="row mb-5">
					<p class="d-flex justify-content-center" style="color: black; font-size: 2.5rem;">공지사항</p>
				</div>
				<!-- 제목 끝 -->
				
				<!-- 게시판 영역 시작 -->
				<div>
					<div class="text-end pe-3 mb-4" style="color: black; font-size: 20px"><fmt:formatDate value="${headBoardVO.boardRegdate }" pattern="yyyy. MM. dd"/></div>
				</div>
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;"></div>
				<div class="row">
					<div>
						<div class="text-center" style="color: black; font-size: 40px">${headBoardVO.boardTitle }</div>
					</div>
				</div>
				<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
				<div class="mb-5" style="color: rgb(0, 0, 0);">
					<div class="row text-center">
						<input type="hidden" name="boardNo" id="boardNo" value="${headBoardVO.boardNo }"/>
					</div>
					<div class="text-center pt-5 pb-5">${headBoardVO.boardContent }</div>
				<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;"></div>
				<div class="d-flex justify-content-center">
					<button type="button" id="btnList" class="btn btn-dark btn-lg">목록</button>
				</div>
				</div>
			</div>
			<div class="col-1 bg-white"></div>
         </div>
      </div>
	<sec:csrfInput/>
</div>
<!-- 게시판 영역 끝 -->
  

<script type="text/javascript">
$(function(){
	var btnList = $("#btnList");
	
	btnList.on("click", function(){
		location.href = "/elly/noticelist.do";
	});
	
	var cpn = $("#cpn").find("img");
	
	cpn.on("click", function(){
		
		var cpnCd = $("#cpnCd").val();
		var memId = '${member.memId}'
		
		if(memId == null && memId == ""){
			alert("로그인 후 이용해주세요!");		
		}else{
			
			var data = {
					cpnCd : cpnCd,
					memId : memId
			}
			
			$.ajax({
				type: 'post',
				url: '/elly/mypage/mycpninsert.do',
				data: JSON.stringify(data),
				beforeSend: function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
				},
				contentType : "application/json; charset=utf-8",
				success : function(res){
					if(res === "OK"){
						Swal.fire({
							title: '알림창',
							text: '쿠폰 등록이 완료되었습니다 !',
							icon: 'success',
						}).then((result) => {
							if (result.isConfirmed) {
								location.href = "/elly/main.do"; 
							}
						});
					}else {
				        Swal.fire({
				            title: '경고',
				            text: '중복으로 등록 불가능한 쿠폰입니다 !',
				            icon: 'warning'
				        });
					}
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
		};
	});
});
</script>