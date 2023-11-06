<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
				<div class="row ">
						<div class="card-body col-4 align-items-center">
							<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">거래처수정</div>
							<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">거래처를 수정합니다.</div>
						</div>
						<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
							거래처관리 / &nbsp;<span class="text-decoration-underline">거래처수정</span>
						</div>
					</div>
			</div>
            <!-- end page title -->

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">

                            <!-- Checkout Steps -->
                            <ul class="nav nav-pills bg-nav-pills nav-justified mb-3">
                                <li class="nav-item">
                                    <a href="#billing-information" data-bs-toggle="tab" aria-expanded="false"
                                        class="nav-link rounded-0 active">
                                        <span class="d-none d-lg-block">&nbsp;</span>
                                        <span class="d-none d-lg-block">&nbsp;</span>
                                        <span class="d-none d-lg-block">&nbsp;</span>
                                    </a>
                                </li>
                            </ul>

                            <!-- Steps Information -->
                            <div class="tab-content">

                                <!-- Billing Content-->
                                <div class="tab-pane show active" id="billing-information">
                                    <div class="row justify-content-center">
                                        <div class="col-lg-8">
                                            <h4 class="mt-2">수정가능 사항</h4>

                                            <p class="text-muted mb-4">거래처명, 연락처, 담당자, 주소, 이메일</p>

											<c:set value="${vendor }" var="vendor" />
                                            <form id="submitForm" action="/head/vendorUpdateFinish.do" method="post">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="billing-first-name" class="form-label">거래처코드<span class="text-danger">*</span></label>
                                                            <input class="form-control" name="vdCode" type="text" readonly="readonly" placeholder="${vendor.vdCode }" value="${vendor.vdCode }" id="vendorCode" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="billing-last-name" class="form-label">거래처명<span class="text-danger">*</span></label>
                                                            <input class="form-control" name="vdName" type="text" placeholder="${vendor.vdName }" value="${vendor.vdName }" id="vendorName" />
                                                        </div>
                                                    </div>
                                                </div> <!-- end row -->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="billing-email-address" class="form-label">연락처<span class="text-danger">*</span></label>
                                                            <input class="form-control" name="vdPhone" type="text" placeholder="${vendor.vdPhone }" value="${vendor.vdPhone }" id="vendorPhone" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="billing-phone" class="form-label">담당자<span class="text-danger">*</span></label>
                                                            <input class="form-control" name="vdManager" type="text" placeholder="${vendor.vdManager }" value="${vendor.vdManager }" id="vendorManager" />
                                                        </div>
                                                    </div>
                                                </div> <!-- end row -->
                                                <div class="row">
                                                    <div class="col-10">
                                                        <div class="mb-3">
                                                            <label for="billing-address" class="form-label">주소<span class="text-danger">*</span></label>
                                                            <div class="input-group">
                                                            <input type="text" class="form-control"  id="vendorPost" name="vdPost" placeholder="${vendor.vdPost }" style="width: 155px; min-width: 155px" readonly="readonly" value="${vendor.vdPost }" maxlength="5">
                                                            <button type="button" onclick="DaumPostcode()" class="btn btn-secondary btn-sm">우편번호 찾기</button>
                                                            </div>
                                                            <input id="vendorAdd1" name="vdAdd1" class="form-control" type="text" readonly="readonly"  placeholder="${vendor.vdAdd1 }" value="${vendor.vdAdd1 }" />
                                                            <input id="vendorAdd2" name="vdAdd2" class="form-control" type="text" placeholder="${vendor.vdAdd2 }" value="${vendor.vdAdd2 }" />
                                                        </div>
                                                    </div>
                                                </div> <!-- end row -->
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <div class="mb-3">
                                                            <label for="billing-town-city" class="form-label">Email<span class="text-danger">*</span></label>
                                                            <input class="form-control" name="vdEmail" type="email" placeholder="${vendor.vdEmail }" id="vendorEmail" value="${vendor.vdEmail }"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="mb-3">
                                                            <label for="billing-zip-postal" class="form-label">분류<span class="text-danger">*</span></label>
                                                            <input class="form-control" name="vdCategory" type="text" placeholder="${vendor.vdCategory }" id="vendorCategory" value="${vendor.vdCategory }"/>
                                                        </div>
                                                    </div>
                                                </div> <!-- end row -->


                                                <div class="row mt-4">
                                                    <div class="col-sm-6">
                                                        <a href="/head/customerList.do" class="btn text-muted d-none d-sm-inline-block btn-link fw-semibold">
                                                            <i class="mdi mdi-arrow-left"></i>돌아가기 </a>
                                                    </div> <!-- end col -->
                                                    <div class="col-sm-6">
                                                        <div class="text-sm-end">
                                                           <button id="updateBtn" type="button" class="btn btn-danger">확인</button>
                                                        </div>
                                                    </div> <!-- end col -->
                                                </div> <!-- end row -->
                                                <sec:csrfInput/>
                                            </form>
                                        </div>
                                    </div> <!-- end row-->
                                </div>
                                <!-- 수정 끝-->

                            </div> <!-- end tab content-->

                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col -->
            </div>
            <!-- end row-->


        <!-- Footer Start -->
        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <script>document.write(new Date().getFullYear())</script> © Hyper - Coderthemes.com
                    </div>
                    <div class="col-md-6">
                        <div class="text-md-end footer-links d-none d-md-block">
                            <a href="javascript: void(0);">About</a>
                            <a href="javascript: void(0);">Support</a>
                            <a href="javascript: void(0);">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end Footer -->
		
        </div>
        <!-- End Container-fluid-->
	</div>
	<!-- content -->
</div>
<!-- content-page -->

<script type="text/javascript">
$(function(){
	var submitForm = $("#submitForm");
	var updateBtn = $("#updateBtn");
	
	updateBtn.on("click", function(){
		submitForm.submit();
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
            document.getElementById('vendorPost').value = data.zonecode;
            document.getElementById("vendorAdd1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("vendorAdd2").focus();
        }
    }).open();
};
</script>