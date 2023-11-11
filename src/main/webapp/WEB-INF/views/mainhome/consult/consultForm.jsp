<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				
				<div class="pt-5 pb-5 text-dark" style="font-size: 50px">개인정보 수집 및 활용동의</div>
				<div class="border border-dark pt-3">
					<div class="row">
						<div class="col"></div>
						<div class="col-11" style="color: black">
							<div class="mb-3">
								<div>1. 개인정보의 수집 및 이용 목적</div>
								<div>&nbsp;&nbsp;&nbsp;가맹 관련 문의 확인 및 답변을 위한 연락통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.</div>
							</div>
							<div class="mb-3">
								<div>2. 처리하는 개인정보 항목</div>
								<div>&nbsp;&nbsp;&nbsp;- 필수항목 : 이름, 연락처,창업희망지역,창업예상비용,상가 보유 유무,문의내용,문의내용상세 (접속 IP 정보, 쿠키, 서비스 이용 기록, 접속 로그)</div>
								<div>&nbsp;&nbsp;&nbsp;- 선택항목 : 나이, 이메일, 상가주소, 창업경험, 상담희망시간</div>
							</div>
							<div class="mb-3">
								<div>3. 개인정보의 처리 및 보유 기간</div>
								<div>&nbsp;&nbsp;&nbsp;① 법령에 따른 개인정보 보유.이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유, 이용기간 내에서 개인정보를 처리, 보유합니다.</div>
								<div>&nbsp;&nbsp;&nbsp;② 개인정보의 보유 기간은 5년입니다.</div>
							</div>
						</div>
						<div class="col"></div>
					</div>
				</div>
				<div class="pt-3 text-dark">
					<input type="checkbox" name="privacy_agree" id="inquiryPolicyCheck">
					<label for="inquiryPolicyCheck" class="b_ff_m b_c_l text-dark">위 개인정보 수집 및 활용에 동의합니다.</label>
				</div>
				
				<div class="d-flex mt-5 mb-5">
					<div class="col-4" style="color: black; font-size: 20px;">&#8251; 표기된 항목은 필수입력 항목입니다.</div>
					<button class="col-1 btn btn-light" id="consultant">자동완성</button>
					<div class="col-7"></div>
				</div>
				<div class="mb-5" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
				<input type="hidden" name="ownerId" id="ownerId"/>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 이름</div>
					<div class="col-auto">
						<input type="text" class="form-control" name="ownerName" id="ownerName" style="width: 334px" min="6" max="20" placeholder="이름을 입력해주세요" value="">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">휴대폰 번호</div>
					<div class="col-auto d-flex justify-content-start align-items-center">
						<input class="form-control" type="hidden" id="ownerTel" name="ownerTel" value="">
						<input class="form-control" type="text" id="mobile1" name="mobile1" style="width: 144px;" placeholder="" value=""  maxlength="3">
						&nbsp;-&nbsp;<input class="form-control" type="text" id="mobile2" name="mobile2" style="width: 144px;" placeholder="" value=""  maxlength="4">
						&nbsp;-&nbsp;<input class="form-control" type="text" id="mobile3" name="mobile3" style="width: 144px;" placeholder="" value=""  maxlength="4">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 생년월일</div>
					<div class="col-auto">
						<input type="text" class="form-control" name="ownerBir" id="ownerBir" style="width: 334px" min="6" max="20" placeholder="생년월일 입력해주세요(ex:940101)" value="">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">이메일</div>
					<div class="col-10">
						<div class="row">
							<div class="col-8" style="width: 700px;">
								<input type="text" class="form-control mb-2" name="ownerEmail" id="ownerEmail" placeholder="이메일" >
							</div>
							<div class="col-4">
								<button type="button" class="btn btn-dark mb-2" id="mailCheckBtn">본인인증</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">이메일 인증</div>
					<div class="col-10">
						<div class="row mb-3">
							<div class="col-8" style="width: 700px;">
								<input type="text" class="form-control mailCheckInput mb-2" id="ownerEmailAuth" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
							</div>
							<div class="col-4">
								<button type="button" class="btn btn-secondary" id="mailCheckBtn2">이메일인증</button>
								<input type="hidden" id="ownerEmailDoubleCheck" name="ownerEmailDoubleCheck">
							</div>
						</div>
						<div class="row" style="font-size: 15px;">
							<div class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</div>
							<div class="text02 fc05 mt10">※ 개인 정보 분리/저장에 대한 고지 및 포인트 소멸에 대해 이메일로 안내 드립니다.</div>
						</div>
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 창업 희망 지역</div>
					<div class="col-auto">
						<input type="text" class="form-control" name="ownerArea" id="ownerArea" style="width: 334px" min="6" max="20" placeholder="창업 희망 지역을 입력해주세요" value="">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 창업 희망동</div>
					<div class="col-auto">
						<input type="text" class="form-control" name="ownerDong" id="ownerDong" style="width: 334px" min="6" max="20" placeholder="창업 희망동을 입력해주세요" value="">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 창업 예상 비용</div>
					<div class="col-auto">
						<select class="form-select" id="ownerMoney" name="ownerMoney">
							<option value="1억원 미만">1억원 미만</option>
							<option value="1억 5천만원 미만">1억 5천만원 미만</option>
							<option value="2억원">2억원</option>
							<option value="2억 5천만원">2억 5천만원</option>
							<option value="3억 이상">3억 이상</option>
						</select>
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 상가 보유 유무</div>
					<div class="col-auto">
						<input type="radio" name="ownerBuilding" id="ownerBuilding" value="유" checked="checked">&nbsp;유
						<span class="nbsp"></span>
						<input type="radio" name="ownerBuilding" id="ownerBuilding" value="무">&nbsp;무
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 상가 주소</div>
					<div class="col-auto">
						<input type="text" class="form-control" name="ownerBuildingadd" id="ownerBuildingadd" style="width: 334px" min="6" max="20" placeholder="보유 상가 주소를 입력해주세요" value="">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 창업 경험</div>
					<div class="col-auto">
						<select class="form-select" id="ownerExp" name="ownerExp">
							<option value="없음">없음</option>
							<option value="치킨&amp;호프">치킨&amp;호프</option>
							<option value="주류업">주류업</option>
							<option value="일반음식점">일반음식점</option>
							<option value="카페&amp;디저트">카페&amp;디저트</option>
							<option value="기타">기타</option>
						</select>
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 상담 희망 시간</div>
					<div class="col-auto">
						<input type="text" class="form-control" name="ownerHopetime" id="ownerHopetime" style="width: 334px" min="6" max="20" placeholder="희망 시간을 입력하세요(ex:15시)" value="">
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 문의 내용</div>
					<div class="col-auto">
						<input type="radio" name="ownerInfocontent" id="ownerInfocontent" value="신규창업" checked="checked">&nbsp;신규창업
						<span class="nbsp"></span>
						<input type="radio" name="ownerInfocontent" id="ownerInfocontent" value="업종변경">&nbsp;업종변경
						<span class="nbsp"></span>
						<input type="radio" name="ownerInfocontent" id="ownerInfocontent" value="단순문의">&nbsp;단순문의
						<span class="nbsp"></span>
						<input type="radio" name="ownerInfocontent" id="ownerInfocontent" value="입점제안">&nbsp;입점제안
					</div>
				</div>
				<div class="row mb-3" style="color: black; font-size: 20px;">
					<div class="col-2 d-flex justify-content-start align-items-center">&#8251; 문의 내용 상세</div>
					<div class="col-auto">
						<textarea class="form-control" cols="60" rows="2" name="ownerContentdetail" id="ownerContentdetail"></textarea>
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

<!-- 창업 문의 완료시 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="color: black">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="max-width: 600px;">
		<div class="modal-content">
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				 <a href="/elly/main.do"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button></a>
			</div>
		</div>
	</div>
</div>

<script>

$(function(){
	
	var signupBtn = $("#signupBtn");
	var signupForm = $("#signupForm")
	
	// 이메일 중북확인
	var mailCheckBtn = $("#mailCheckBtn");
	var mailCheckBtn2 = $("#mailCheckBtn2");
	var mailCheckInput = $(".mailCheckInput");
	
	var code = "";
	
	// 이메일 중복 클릭 이벤트
	mailCheckBtn.on("click", function(){
		
		var email = $('#ownerEmail').val();
				
		$.ajax({
	        type: "GET",
	        url: "/elly/mailCheck.do?email=" + email,
	        success:function(data){
				Swal.fire({
					title: '알림창',
					text: '해당 이메일로 인증번호 발송이 완료되었습니다.',
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
	
	// 인증된 이메일 인증번호 클릭 이벤트
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
	
	// 창업문의 이벤트
	signupBtn.on("click", function(){
		
		var id = $("#ownerId").val(Math.floor(Math.random() * 89999999) + 10000000);
		var ownerName = $("#ownerName").val();
		var ownerBir = $("#ownerBir").val(); 
		var tel = $("#ownerTel").val($("#mobile1").val() + '-' + $("#mobile2").val() + '-' + $("#mobile3").val());
		var ownerEmail = $("#ownerEmail").val();
		var ownerArea = $("#ownerArea").val();
		var ownerDong = $("#ownerDong").val();
		var ownerMoney = $("#ownerMoney option:selected").val();
		var ownerBuilding = $("input[name='ownerBuilding']:checked").val();
		var ownerBuildingadd = $("#ownerBuildingadd").val();
		var ownerExp = $("#ownerExp option:selected").val();
		var ownerHopetime = $("#ownerHopetime").val();
		var ownerArea = $("#ownerArea").val();
		var ownerInfocontent = $("input[name='ownerInfocontent']:checked").val();
		var ownerContentdetail = $("#ownerContentdetail").val();
		
		var data = {
				ownerId : $("#ownerId").val(),
				ownerName : ownerName,
				ownerBir : ownerBir,
				ownerTel : $("#ownerTel").val(),
				ownerEmail : ownerEmail,
				ownerArea : ownerArea,
				ownerDong : ownerDong,
				ownerMoney : ownerMoney,
				ownerBuilding : ownerBuilding,
				ownerBuildingadd : ownerBuildingadd,
				ownerExp : ownerExp,
				ownerHopetime : ownerHopetime,
				ownerArea : ownerArea,
				ownerInfocontent : ownerInfocontent,
				ownerContentdetail : ownerContentdetail
		};
			
			$.ajax({
				type : "post",
				url : "/elly/consult.do",
				beforeSend: function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
				},
				data: JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					var msg = '<div class="container-fluid">'
						msg += '<div class="row">'
						msg += '<div class="col-1"></div>'
						msg += '<div class="col">'
						msg += '<div class="row justify-content-center mt-4 mb-4">'
						msg += '<img src="${pageContext.request.contextPath }/resources/assets/images/consult_success.png" style="height: 20%; width: 20%;" alt="">'
						msg += '</div>'
						msg += '<div class="row mb-4">'
						msg += '<div class="col text-center" style="font-size:30px">창업 문의 완료</div>'
						msg += '</div>'
						msg += '<div class="row mb-4">'
						msg += '<div class="col text-center">고객님의 문의번호는 ' + $("#ownerId").val() + ' 입니다.</div>'
						msg += '</div>'
						msg += '<div class="row mb-4">'
						msg += '<div class="col text-center">문의해주신 내용은 본사에서 검토, 승인 후 </div>'
						msg += '</div>'
						msg += '<div class="row mb-4">'
						msg += '<div class="col text-center">창업문의 시 입력하신 이메일로 가맹점 코드를 보내드립니다.</div>'
						msg += '</div>'
						msg += '<div class="row mb-4">'
						msg += '<div class="col text-center">감사합니다.</div>'
						msg += '</div>'
						msg += '</div>'
						msg += '<div class="col-1"></div>'
						msg += '</div>'
						msg += '</div>'
					$(".modal-body").html(msg);
				},
				error : function(xhr, status, error) {
					Swal.fire({
						title: '경고',
						text: '창업문의 중 오류 발생 ! 다시 시도해주세요 !',
						icon: 'warning',
					})
				}
			});
			
		$('#exampleModal').modal('show');
	});
	
	// 자동완성
	$('#consultant').on("click", function(){
		$("#ownerName").val("윤선주");
		$("#ownerBir").val("940101");
		$("#mobile1").val("010");
		$("#mobile2").val("9514");
		$("#mobile3").val("9812");
		$("#ownerEmail").val("sunju_y@naver.com");
		$("#ownerArea").val("대전");
		$("#ownerDong").val("오류동");
		$("#ownerBuildingadd").val("없음");
		$("#ownerHopetime").val("15시");
		$("#ownerContentdetail").val("2조 다들 고생 많았어~~!!");
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
            document.getElementById('ownerPost').value = data.zonecode;
            document.getElementById("ownerAdd1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("ownerAdd2").focus();
        }
    }).open();
};

</script>