<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>

.img-container {
    position: relative;
    width: 370px;
    height: 250px;
}

.img-container img {
    width: 100%;
    height: 100%;
    display: block;
}

.img-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: transparent;
    display: none;
    clip-path: circle(30% at 50% 50%); /* 동그라미 모양으로 클리핑, 반지름 조절 */
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
    justify-content: center;
    align-items: center;
}

.img-container:hover .img-overlay {
    display: flex;
}


</style>

<!-- ======= menubar Section ======= -->
<div id="menubar" class="d-flex align-items-center h-75 d-inline-block align-middle">
	<div class="container position-relative text-center text-lg-center"
		data-aos="zoom-in" data-aos-delay="100">
		<div class="row" style="height: 400px">
		<c:choose>
	   <c:when test="${param.searchWord == '마른안주'}">
			<div class="col-4 d-flex justify-content-center align-items-center">
	     	 <a href="/elly/beerMenu.do"><img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주"></a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
			<a href="/elly/menu.do?searchWord=튀김안주"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
			</div>
	   </c:when>
	      <c:when test="${param.searchWord == '튀김안주'}">
	      <div class="col-4 d-flex justify-content-center align-items-center">
	     	 <a href="/elly/menu.do?searchWord=마른안주"><img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주"></a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
			<a href="/elly/menu.do?searchWord=식사안주"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
			</div>
	   </c:when>
	      <c:when test="${param.searchWord == '식사안주'}">
	        <div class="col-4 d-flex justify-content-center align-items-center">
	     	 <a href="/elly/menu.do?searchWord=튀김안주"><img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주"></a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
			<a href="/elly/menu.do?searchWord=주류메뉴"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
			</div>
	   </c:when>
	      <c:when test="${param.searchWord == '주류메뉴'}">
	        <div class="col-4 d-flex justify-content-center align-items-center">
	     	 <a href="/elly/menu.do?searchWord=식사안주"><img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주"></a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
			<a href="/elly/beerMenu.do"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
			</div>
	   </c:when>
	</c:choose>
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
					
				<!-- 제목 -->
				<c:set var="imagePath" value="../resources/img/sub_title02.png" />
				
				<c:choose>
				   <c:when test="${param.searchWord == '마른안주'}">
				       <c:set var="imagePath" value="../resources/img/sub_title02.png" />
				   </c:when>
				      <c:when test="${param.searchWord == '튀김안주'}">
				       <c:set var="imagePath" value="../resources/img/sub_title03.png" />
				   </c:when>
				      <c:when test="${param.searchWord == '식사안주'}">
				       <c:set var="imagePath" value="../resources/img/sub_title04.png" />
				   </c:when>
				      <c:when test="${param.searchWord == '주류메뉴'}">
				       <c:set var="imagePath" value="../resources/img/sub_title05.png" />
				   </c:when>
				</c:choose>
				
				<div class="d-flex justify-content-center align-items-center">
				    <img src="${imagePath}" alt="이미지 설명">
				</div>
				<br><br>


				
				<!-- card -->
				
				<section class="">
				   <div class="container">
				       <div class="row">
				           <input type="hidden" name="page" id="page" />
				           <c:set value="${pagingVO.dataList}" var="menuList" />
				           <c:choose>
				               <c:when test="${not empty menuList}">
				                   <c:forEach items="${menuList}" var="menuVO">
				                       <div class="col-sm-4 mb-4">
				                           <div class="card card-primary border border-white" >
				                               <div class="card">
				                                   <div class="card-body" style="width: 396px; height: 345px;">
				
				                                       <c:if test="${not empty menuVO.menuFileList}">
				                                           <c:forEach items="${menuVO.menuFileList}" var="attachVO" varStatus="vs">
				                                               <!-- 이미지 출력 -->
				                                               <div class="img-container">
																    <div class="img-overlay">
																        <!-- 여기에 추가 내용을 넣어 오버레이에 표시할 내용을 작성할 수 있습니다 -->
				                                            			   <img src="../resources/img/look.png" alt="" style="width: 50px; height: 50px; cursor:pointer;" class="d-flex justify-content-center align-items-center seatmodal"  data-bs-toggle="modal" data-bs-target="#seatmodal" data-menucd="${menuVO.menuCd}">
																    </div>
																    <img src="/resources/upload/img/${attachVO.attachOrgname}" alt="">
																</div>
				                                      	 	<h5 class="card-title text-center fs-5 text">${menuVO.menuName}</h5>
				                                           </c:forEach>
				                                       </c:if>
				
				                                   </div>
				                               </div>
				                           </div>
				                       </div>
				                   </c:forEach>
				               </c:when>
				               <c:otherwise>
				                   <p class="d-flex justify-content-center align-items-center n-table-none" style="color: rgb(0, 0, 0); height: 400px">
				                       <span class="">작성하신 게시글이 없습니다.</span>
				                   </p>
				               </c:otherwise>
				           </c:choose>
				       </div>
				   </div>
				</section>



		<br>
		<!-- card 끝 -->
		
		
		<!-- 페이징 버튼 시작 -->
			<div class="pagination justify-content-center text-dark" id="drymenupagingArea"> ${pagingVO.pagingHTML }</div>
		<!-- 페이징 버튼 끝 -->

		
		<!-- modal -->
				<div class="modal fade" id="seatmodal" tabindex="-1" role="dialog" aria-hidden="true">
				    <div class="modal-dialog modal-dialog-centered modal-lg" style="height: 400px;">
				        <div class="modal-content" style="background-image: url('../resources/img/menu_bg.jpg');">
				            <button type="button" class="btn-close ms-1 fs-2" data-bs-dismiss="modal" aria-hidden="true"></button>
				            <div class="modal-body" id="modal" >
				                <img class="card-img-top d-flex justify-content-center align-items-center ms-5" id="modalImg" style="width: 628px; height: 361px;" src="" alt="메뉴사진">
								<div class="mb-4" >
									<a class=" border-0 bg-transparent d-flex justify-content-center align-items-center text-dark fs-4" id="modalMenuName" ></a>
								</div>
								<div class="mb-4">
									<a class="border-0 bg-transparent d-flex justify-content-center align-items-center text-dark fs-5" id="modalDescription" ></a>
								</div>
				            </div>
				        </div>
				    </div>
				</div>
				</div>
				</div>			
				</div>			
				</div>			
			</div>				
		</div>
		<!-- modal 끝 -->
			
			
	<form method="get" id="searchForm" class="input-group input-group-sm" style="width: 440px;">
		<input type="hidden" name="searchWord" id="searchWord" value="${param.searchWord}" />
		<input type="hidden" name="page" id="page"/>
		<sec:csrfInput/>
	</form>
	
<script type="text/javascript">
$(function(){
	 var searchForm = $("#searchForm");
	 var drymenupagingArea = $("#drymenupagingArea");
	 var seatmodal = $("#seatmodal")
	 
	 drymenupagingArea.on("click", "a", function(event){
		 event.preventDefault();
		 var pageNo = $(this).data("page");
		 console.log("pageNo : " + pageNo);
		 searchForm.find("#page").val(pageNo);
		 searchForm.submit();
	 });
	 
	 $(".seatmodal").on("click", function(){
		 var menuCd = $(this).data("menucd");
		 
		 var data = {
				 menuCd : menuCd
		 }
		 
		 $.ajax({
				url : "/head/menuDetail.do",
				type : "post",
				data : JSON.stringify(data),
				contentType : 'application/json; charset=utf-8',
				dataType : "json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}"); // csrf 토큰 보내기 위함
				},
				success : function(res) {
					$("#modalImg").attr("src", ("/resources/upload/img/"+ res.menuFileList[0].attachOrgname));
					$("#modalMenuName").html(res.menuName);
					$("#modalDescription").html(res.menuDes);
					seatmodal.modal("show");
			}
		});
	 })
});
	 
</script>
