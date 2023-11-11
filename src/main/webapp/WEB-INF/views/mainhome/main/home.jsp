<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<main id="main">

<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">
	<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
		<div class="row">
			<div class="col-lg-12">
				<div class="col-lg-4">
				  <img id="sliderImage1" class="slider-image" src="../resources/img/mv_title1.png" alt="">
				</div>
				
				<div class="col-lg-4">
				  <img id="sliderImage2" class="slider-image" src="../resources/img/mv_title2.png" alt="">
				</div>
			</div>
		</div>

		<div class="btns">
			<a href="/elly/beerMenu.do" id="mainbtn1" class="btn btn-outline-light animated fadeInUp scrollto btn-lg">메뉴 확인하기</a> 
			<a href="/elly/store/find.do" id="mainbtn2" class="btn btn-outline-light animated fadeInUp scrollto btn-lg">예약 바로가기</a>
		</div>
	</div>
</section>
<!-- End Hero -->


<!-- brand Section -->
<div class="d-flex justify-content-center align-items-center" data-motion-offset="1" data-diff="-200">
    <div class="" style="position: relative;">
        <video autoplay loop muted style="z-index: 1;">
            <source src="../resources/img/mv01_bg_video.webm" type="video/webm">
        </video>
        <img  id="blinkingImage" src="../resources/img/mv5_title.png" alt="" style="position: absolute; top: 90px; left: 150px; z-index: 2;">
        <img  id="Image" src="../resources/img/mv5_beer.png" alt="" style="position: absolute; top: -70px; right: 100px; z-index: 2;">
    </div>
</div>




<div id="new">
   <img class="" id="newImage" src="../resources/img/sec2_title.png">
   <a href="/elly/consult.do" id="newbtn" class="btn btn-outline-light btn-lg mt-4">창업문의 바로가기</a>
   <img class="" id="newbrand" src="../resources/img/family_bg.jpg" alt="" style=" background-size: cover;">
</div>
<!-- brand Section -->

</main>

<!-- 창업 문의 완료시 모달창 -->
<sec:authorize access="isAuthenticated()">
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="color: black">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 400px;">
			<div class="modal-content">
				<div class="modal-body">
				</div>
				<div class="modal-footer">
					<div class="col" id="check">
						<input type="checkbox" value="checkbox" name="checkbox" id="modalchkbox">
					    <label for="chkbox" style="font-size: 17px;">&nbsp;&nbsp;오늘 하루동안 보지 않기</label>
					</div>
					<div class="col-1" id="modalclose">
						<a href="/elly/main.do" style="color: black">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</sec:authorize>
<script type="text/javascript">
$(function(){
	var msg = '<div class="container-fluid">'
		msg += '<div class="row">'
		msg += '<div class="col-1"></div>'
		msg += '<div class="col">'
		msg += '<div class="row justify-content-center mt-4 mb-5">'
		msg += '<div class="col text-center" style="font-size:25px;"><span style="border-bottom: 1px black solid; padding-bottom: 10px;">WELCOME EVENT</span></div>'
		msg += '</div>'
		msg += '<div class="row mb-5">'
		msg += '<img src="${pageContext.request.contextPath }/resources/assets/images/welcomcoupon.png" style="" alt="">'
		msg += '</div>'
		msg += '<div class="row mb-4">'
		msg += '<div class="col"><a href="/elly/noticedetail.do?boardNo=74"><div class="d-flex justify-content-center align-items-center" style="color: white; font-size: 20px; background-color: #6c757d; height: 50px">자세히 보기</div></a></div>'
		msg += '</div>'
		msg += '</div>'
		msg += '<div class="col-1"></div>'
		msg += '</div>'
		msg += '</div>'
	$(".modal-body").html(msg);
		
// 	$('#exampleModal').modal('show');
	
	var cookiedata = document.cookie;
	if (cookiedata.indexOf("close=Y")<0){
		$('#exampleModal').modal('show');
	}else{
		$('#exampleModal').modal('hide')
	}
	
	$('#modalclose').on("click", function(){
		 couponClose();
	});
})

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) != -1) return c.substring(name.length,c.length);
    }
    return "";
}

function setCookie(cname, cvalue, exdays) {
	var todayDate = new Date();
	todayDate.setTime(todayDate.getTime() + (exdays*24*60*60*1000));
	var expires = "expires=" + todayDate.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}

function couponClose() {
	if($("input[name='checkbox']").is(":checked") == true){
		setCookie("close","Y",1);
	}
	$("#exampleModal").hide();
}


</script>