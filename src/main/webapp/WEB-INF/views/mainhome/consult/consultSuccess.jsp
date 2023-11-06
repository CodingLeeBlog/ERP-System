<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- ======= Hero Section ======= -->
<section id="store_hero" class="d-flex align-items-center">
	<div class="container position-relative text-center text-lg-start" data-aos="zoom-in" data-aos-delay="100">
		<div class="row">
			<div class="col-lg-8">
				<h1>
					단1%의 거짓도 없습니다! <span>1등 성공 신화!</span>
				</h1>

				<div class="btns">
					<a href="#menu" class="btn-menu animated fadeInUp scrollto">메뉴 확인하기</a> 
					<a href="#book-a-table" class="btn-book animated fadeInUp scrollto">예약 하기</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Hero -->

<main id="main">
	<div class="">
		<div class="container-fluid">
			<div class="row">
				<div class="col-2">
				</div>
				<div class="col-8">
				
					<div class="border border-white" style="margin-top: 50px; margin-bottom: 50px; background-color: white; height: 300px; font-size: 5rem; color: black;">
						<div>접수하신 창업문의 일련번호</div>
						<div>${ownerId }</div>
					</div>
					
				</div>
				<div class="col-2">
				</div>
			</div>
		</div>

	</div>
</main>
<script>

$(function(){
	
	var signupBtn = $("#signupBtn");
	var signupForm = $("#signupForm")
	
	// 이메일 중북확인
	var mailCheckBtn = $("#mailCheckBtn");
	var mailCheckBtn2 = $("#mailCheckBtn2");
	var mailCheckInput = $(".mailCheckInput");
	
	var code = "";
	
	mailCheckBtn.on("click", function(){
		
		var email = $('#ownerEmail').val();
				
		$.ajax({
	        type: "GET",
	        url: "/elly/mailCheck.do?email=" + email,
	        success:function(data){
	            alert("해당 이메일로 인증번호호 발송이 완료되었습니다. \n 확인부탁드립니다.")
	            mailCheckInput.attr('disabled', false);
	            console.log("data : "+data);
	            code = data;
        	}
	    });
	});
	
	mailCheckBtn2.on("click", function(){
		
		var ownerEmailAuth = $("#ownerEmailAuth").val();
		
		if(ownerEmailAuth == code){
			$(".successEmailChk").text("인증번호가 일치합니다.");
			$(".successEmailChk").css("color","green");
			$("#ownerEmailDoubleCheck").val("true");
			$("#ownerEmailAuth").attr("disabled",true);
			console.log($("#ownerEmailDoubleCheck").val());
		}else{
			$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successEmailChk").css("color","red");
			$("#ownerEmailDoubleCheck").val("false");
			$("#ownerEmailAuth").attr("autofocus",true);
			console.log($("#ownerEmailDoubleCheck").val());
		}
	});
	
	signupBtn.on("click", function(){
		
		var id = $("#ownerId").val(Math.floor(Math.random() * 89999999) + 10000000);
		var name = $("#ownerName").val();
		var bir = $("#ownerBir").val(); 
		var tel = $("#ownerTel").val($("#mobile1").val() + '-' + $("#mobile2").val() + '-' + $("#mobile3").val());
		var ownerEmail = $("#ownerEmail").val();
		var ownerArea = $("#ownerArea").val();
		var ownerDong = $("#ownerDong").val();
		var ownerMoney = $("#ownerMoney").val();
		var ownerBuilding = $("#ownerBuilding").val();
		var ownerBuildingadd = $("#ownerBuildingadd").val();
		var ownerExp = $("#ownerExp").val();
		var ownerHopetime = $("#ownerHopetime").val();
		var ownerArea = $("#ownerArea").val();
		var ownerInfocontent = $("#ownerInfocontent").val();
		var ownerContentdetail = $("#ownerContentdetail").val();
		
		signupForm.submit();
	});
});

</script>