<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- ======= menubar Section ======= -->
<div id="menubar" class="d-flex align-items-center h-75 d-inline-block align-middle">
	<div class="container position-relative text-center text-lg-center"
		data-aos="zoom-in" data-aos-delay="100">
		<div class="row" style="height: 500px">
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="${pageContext.request.contextPath}/resources/img/brand_title2.png" />
			</div>
		</div>
	</div>
</div>
<!-- menubar Hero -->
<main id="main">
	<div class="container-fluid">
		<div class="row">
			<div class="col-2 bg-white">
			</div>
		
			<!-- title-box02 -->
			<div class="col-8 bg-white">
				<div class="row mt-5 mb-5">
					<div class="" style="color: black;">
						<div class="mb-3" style="font-size: 30px;">회원정보 입력</div>
					</div>
				</div>
				
				<!-- 사용자에 따른 회원가입 구분 -->
				<div class="row mb-5">
					<div class="col-1">
					</div>
						<button id="memberTap" class="col" style="color: black; text-align: center; font-size: 30px; height: 75px; border: 2px black solid;">일반회원</button>
					<div class="col-1">
					</div>
						<button id="ownerTap" class="col" style="color: black; text-align: center; font-size: 30px; border: 0px; background-color: white">가맹점주</button>
					<div class="col-1">
					</div>
				</div>
				
				<div class="d-flex mt-5 mb-5">
					<div class="col-4" style="color: black; font-size: 20px;">&#8251; 표기된 항목은 필수입력 항목입니다.</div>
					<button class="col-1 btn btn-light" id="memregister">자동완성</button>
					<button class="col-1 btn btn-light" id="ownerregister" style="display: none;">자동완성</button>
					<div class="col-7"></div>
				</div>
				
				<div class="mb-5" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
				<div class="row mb-3" id="ownerIdTap" style="color: black; font-size: 20px; display: none">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 일련번호</div>
					<div class="col-10">
						<div class="row">
							<div class="col-4">
								<input type="text" class="form-control" id="ownerId" name="ownerId" style="width: 334px" min="6" max="20" placeholder="가맹점주 일련번호를 입력하세요" value="">
							</div>
							<div class="col-4">
								<input type="button" class="btn btn-secondary btn-flat" id="ownerIdCheckBtn" value="번호인증"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 아이디</div>
					<div class="col-10">
						<div class="row">
							<div class="col-4">
								<input type="text" class="form-control" id="memIdChk" name="memId" style="width: 334px" min="4" max="20" placeholder="아이디를 입력하세요" value="">
							</div>
							<div class="col-4">
								<input type="button" class="btn btn-secondary btn-flat" id="idCheckBtn" value="중복확인"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 패스워드</div>
					<div class="col-auto">
						<input type="password" class="form-control" id="memPw" name="memPw" style="width: 334px" min="6" max="20" placeholder="4자리 이상 입력해주세요" value="">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 패스워드 확인</div>
					<div class="col-auto">
						<input type="password" class="form-control" name="memPwConfirm" id="memPwConfirm" placeholder="패스워드를 재입력해주세요." style="width: 334px;"> 
						<span id="passwordConfirmValid" class="int-pass fc06" style="display: none;">입력된 패스워드가 일치하지 않습니다</span>
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 이름</div>
					<div class="col-auto">
						<input type="text" class="form-control" id="memName" name="memName" style="width: 334px" min="6" max="20" placeholder="이름을 입력하세요" value="">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 생년월일</div>
					<div class="col-auto">
						<input type="text" class="form-control" id="memBir" name="memBir" style="width: 334px" min="6" max="20" placeholder="생년월일 입력해주세요(ex:940101)" value="">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">휴대폰 번호</div>
					<div class="col-auto d-flex justify-content-start align-items-center">
						<input class="form-control" type="hidden" id="memTel" name="memTel" value="">
						<input class="form-control" type="text" id="mobile1" name="mobile1" style="width: 144px;" placeholder="" value=""  maxlength="3">
						&nbsp;-&nbsp;<input class="form-control" type="text" id="mobile2" name="mobile2" style="width: 144px;" placeholder="" value=""  maxlength="4">
						&nbsp;-&nbsp;<input class="form-control" type="text" id="mobile3" name="mobile3" style="width: 144px;" placeholder="" value=""  maxlength="4">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">이메일</div>
					<div class="col-10">
						<div class="row">
							<div class="col-8" style="width: 700px;">
								<input type="text" class="form-control" name="memEmail" id="memEmail" placeholder="이메일" >
							</div>
							<div class="col-4">
								<button type="button" class="btn btn-secondary" id="mailCheckBtn">본인인증</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">이메일 인증</div>
					<div class="col-10">
						<div class="row mb-3">
							<div class="col-8" style="width: 700px;">
								<input type="text" class="form-control mailCheckInput" id="memEmailAuth" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
							</div>
							<div class="col-4">
								<button type="button" class="btn btn-secondary" id="mailCheckBtn2">이메일인증</button>
								<input type="hidden" id="memEmailDoubleCheck" name="memEmailDoubleCheck"/>
							</div>
						</div>
						<div class="row" style="font-size: 15px;">
							<div class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</div>
							<div class="text02 fc05 mt10">※ 개인 정보 분리/저장에 대한 고지 및 포인트 소멸에 대해 이메일로 안내 드립니다.</div>
						</div>
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 주소</div>
					<div class="col-10">
						<div class="mb-3 d-flex">
							<input class="form-control me-3" type="text" id="memPost" name="memPost" style="width: 155px; min-width: 155px" readonly="readonly" value="" maxlength="5">
							<button type="button" onclick="DaumPostcode()" class="btn btn-secondary btn-flat">우편번호 찾기</button>
						</div>
						<div class="mb-3">
							<input class="form-control" type="text" id="memAdd1" name="memAdd1" style="width: 600px;" value="">
						</div>
						<div class="mb-3">
							<input class="form-control" type="text" id="memAdd2" name="memAdd2" style="width: 600px;" value="">
						</div>
						<div style="font-size: 15px;">
							<div class="text02 fc05 mt10">※ 주소 입력은 선택 사항 입니다.</div>
							<div class="text02 fc05 mt10">※ 단, 주소가 없는 경우 이벤트 참여 시 경품 발송에 제약을 받을 수 있습니다.</div>
						</div>
					</div>
				</div>
				<div class="row mb-3" id="frcsIdTap" style="color: black; font-size: 20px; display: none">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 가맹점 코드</div>
					<div class="col-10">
						<div class="row">
							<div class="col-4">
								<input type="text" class="form-control" id="frcsId" name="frcsId" style="width: 334px" min="6" max="20" placeholder="가맹점 코드를 입력하세요" value="">
							</div>
							<div class="col-4">
								<input type="button" class="btn btn-secondary btn-flat" id="frcsIdCheckBtn" value="가맹점인증"/>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-3" id="frcsNameTap" style="color: black; font-size: 20px; display: none">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 가맹점명</div>
					<div class="col-auto">
						<input type="text" class="form-control" name="frcsName" id="frcsName" style="width: 334px" min="6" max="20" placeholder="가맹점명" value="">
					</div>
				</div>
				<div class="mt-5 mb-5" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
				<div class="row mb-5">
					<div class="col-2">
					</div>
					<button class="col btn btn-secondary btn-block" style="text-align: center; font-size: 30px;" id="signupBtn">가입하기</button>
					<div class="col-2">
					</div>
				</div>
			</div>
			<div class="col-2 bg-white">
			</div>
		</div>
	</div>
</main>

<script type="text/javascript">
$(function(){
	
	// 일반회원 & 가맹점주 구분
	var memberTap = $("#memberTap");
	var ownerTap = $("#ownerTap");
	var selectFlag = false;
	
	// 아이디 중복체크
	var idCheckBtn = $("#idCheckBtn");
	var idCheckFlag = false;
	
	// 일련번호 아이디 체크
	var ownerIdCheckBtn = $("#ownerIdCheckBtn");
	var ownerIdCheckFlag = false;
	
	// 가맹점 아이디 중복체크
	var frcsIdCheckBtn = $("#frcsIdCheckBtn");
	var frcsIdCheckFlag = false;
	
	// 회원가입
	var signupBtn = $("#signupBtn")
	var signupForm = $("#signupForm");
	var imgFile = $("#imgFile");
	
	// 이메일 중북확인
	var mailCheckBtn = $("#mailCheckBtn");
	var mailCheckBtn2 = $("#mailCheckBtn2");
	var mailCheckInput = $(".mailCheckInput");

	// 회원탭
	memberTap.on("click", function(){
		$(this).css("background-color", "rgb(221 221 221)");
		$(this).css("border", "2px black solid")
		$("#ownerTap").css("background-color", "transparent");
		$("#ownerTap").css("border", "0px");
		$("#ownerIdTap").css("display", "none");
		$("#frcsIdTap").css("display", "none");
		$("#frcsNameTap").css("display", "none");
		$("#memregister").show();
		$("#ownerregister").hide();
		selectFlag = false;
		console.log(selectFlag)
	});
	
	// 가맹점주탭
	ownerTap.on("click", function(){
		$(this).css("background-color", "rgb(221 221 221)");
		$(this).css("border", "2px black solid")
		$("#memberTap").css("background-color", "transparent");
		$("#memberTap").css("border", "0px");
		$("#ownerIdTap").css("display", "");
		$("#frcsIdTap").css("display", "");
		$("#frcsNameTap").css("display", "");
		$("#memregister").hide();
		$("#ownerregister").show();
		selectFlag = true;
		console.log(selectFlag)
	});
	
	// 회원 아이디 중복 확인
	idCheckBtn.on("click", function(){
		var id =  $("#memIdChk").val();
		console.log(id)
		if(id == null || id == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		var data = {
			memId : id
		};
		
		$.ajax({
			type : "post",
			url : "/elly/idCheck.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log("아이디 중복 확인 결과 : " + res);
				if(res == "NOTEXIST"){					
    				Swal.fire({
    					title: '알림창',
    					text: '사용 가능한 아이디입니다 !',
    					icon: 'success',
    				})
					idCheckFlag = true; 
				}else{
    				Swal.fire({
    					title: '경고',
    					text: '이미 사용중인 아이디입니다 !',
    					icon: 'success',
    				})
				}
			}
		});
	});
	
	// 가맹점 본인인증
	ownerIdCheckBtn.on("click", function(){
		var ownerId =  $("#ownerId").val();
		
		if(ownerId == null || ownerId == ""){
			alert("가맹점 일련번호를 입력해주세요.");
			return false;
		}
		
		var data = {
				ownerId : ownerId
		};
		
		$.ajax({
			type : "post",
			url : "/elly/ownerIdCheck.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log("창업 상담자 일련번호 : " + res.ownerTel);
				
				ownerIdCheckFlag = true;
				
				var memTel = res.ownerTel.split('-');
				var memTel1 = memTel[0];
				var memTel2 = memTel[1];
				var memTel3 = memTel[2];
				
				$("#memName").val(res.ownerName);
				$("#memBir").val(res.ownerBir);
				$("#mobile1").val(memTel1);
				$("#mobile2").val(memTel2);
				$("#mobile3").val(memTel3);
				$("#memEmail").val(res.ownerEmail);
				
			},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '잘못된 일련번호입니다 !',
					icon: 'warning',
				})
			}
		});
	});
	
	// 가맹점 본인인증
	frcsIdCheckBtn.on("click", function(){
		var frcsId =  $("#frcsId").val();
		
		if(frcsId == null || frcsId == ""){
			alert("가맹점 코드를 입력해주세요.");
			return false;
		}
		
		var data = {
			frcsId : frcsId
		};
		
		$.ajax({
			type : "post",
			url : "/elly/frcsIdCheck.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log("아이디 중복 확인 결과 : " + res);
				
				frcsIdCheckFlag = true;
				
				$("#frcsName").val(res.frcsName)
			},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '잘못된 가맹점코드입니다 !',
					icon: 'warning',
				})
			}
		});
	});
	
	var code = "";
	
	mailCheckBtn.on("click", function(){
		
		var email = $('#memEmail').val();
				
		$.ajax({
	        type: "GET",
	        url: "/elly/mailCheck.do?email=" + email,
	        success:function(data){
				Swal.fire({
					title: '알림창',
					text: '해당 이메일로 인증번호호 발송이 완료되었습니다.',
					icon: 'success',
				})
	            mailCheckInput.attr('disabled', false);
	            console.log("data : "+data);
	            code = data;
        	},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '잘못된 이메일 인증번호입니다 !',
					icon: 'warning',
				})
			}
	    });
	});
	
	mailCheckBtn2.on("click", function(){
		
		var memEmailAuth = $("#memEmailAuth").val();
		
		if(memEmailAuth == code){
			$(".successEmailChk").text("인증번호가 일치합니다.");
			$(".successEmailChk").css("color","green");
			$("#memEmailDoubleCheck").val("true");
			$("#memEmailAuth").attr("disabled",true);
			console.log($("#memEmailDoubleCheck").val());
		}else{
			$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successEmailChk").css("color","red");
			$("#memEmailDoubleCheck").val("false");
			$("#memEmailAuth").attr("autofocus",true);
			console.log($("#memEmailDoubleCheck").val());
		}
	});
	
	signupBtn.on("click",function(){
		
		var id = $("#memIdChk").val();
		var pw = $("#memPw").val();
		var name = $("#memName").val();
		var bir = $("#memBir").val(); 
		var memTel = $("#memTel").val($("#mobile1").val() + '-' + $("#mobile2").val() + '-' + $("#mobile3").val());
		var memEmail = $("#memEmail").val();
		var memPost = $("#memPost").val();
		var memAdd1 = $("#memAdd1").val();
		var memAdd2 = $("#memAdd2").val();
		
		var ownerId = $("#ownerId").val();
		var frcsId = $("#frcsId").val();
		
		if(id == null || id == ""){			
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		if(pw == null || pw == ""){			
			alert("비밀번호를 입력해주세요.");
			return false;
		}
		if(name == null || name == ""){			
			alert("이름을 입력해주세요.");
			return false;
		}
		if(bir == null || bir == ""){
			alert("생년월일를 입력해주세요.");
			return false;
		}
		if(memTel == null || memTel == ""){			
			alert("전화번호를 입력해주세요.");
			return false;
		}
		if(memEmail == null || memEmail == ""){			
			alert("이메일을 입력해주세요.");
			return false;
		}
		
		if(selectFlag == false) {
			var data = {
					memId : id,
					memPw : pw,
					memName : name,
					memBir : bir,
					memTel : $("#memTel").val(),
					memEmail : memEmail,
					memPost : memPost,
					memAdd1 : memAdd1,
					memAdd2 : memAdd2
			}	
		}else {
			var data = {
					ownerId : ownerId,
					memId : id,
					memPw : pw,
					memName : name,
					memBir : bir,
					memTel : $("#memTel").val(),
					memEmail : memEmail,
					memPost : memPost,
					memAdd1 : memAdd1,
					memAdd2 : memAdd2,
					frcsId : frcsId
			}	
		};
		
		
		$.ajax({
			type : "post",
			url : "/elly/register02.do",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				Swal.fire({
					title: '알림창',
					text: '회원 가입이 완료되었습니다 !',
					icon: 'success',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/elly/login.do"; 
					}
				});
			},
			error : function(xhr, status, error) {
				Swal.fire({
					title: '경고',
					text: '회원 가입 중 오류 발생 !',
					icon: 'warning',
				}).then((result) => {
					if (result.isConfirmed) {
						location.href = "/elly/register02.do"; 
					}
				});
			}
		});
		
	});
	
	// 일반회원 자동완성
	$('#memregister').on("click", function(){
		$("#memIdChk").val("b001");
		$("#memPw").val("1234");
		$("#memPwConfirm").val("1234");
		$("#memName").val("윤선주");
		$("#memBir").val("940101");
		$("#mobile1").val("010");
		$("#mobile2").val("9514");
		$("#mobile3").val("9812");
		$("#memEmail").val("sunju_y@naver.com");
		$("#memPost").val("35275");
		$("#memAdd1").val("대전 서구 계룡로 314");
		$("#memAdd2").val("대전일보사");
	});
	
	// 가맹점주 자동완성
	$('#ownerregister').on("click", function(){
		$("#memIdChk").val("b001");
		$("#memPw").val("1234");
		$("#memPwConfirm").val("1234");
		$("#memPost").val("35275");
		$("#memAdd1").val("대전 서구 계룡로 314");
		$("#memAdd2").val("대전일보사");
	});
});

function DaumPostcode(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('memPost').value = data.zonecode;
            document.getElementById("memAdd1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("memAdd2").focus();
        }
    }).open();
};
</script>
