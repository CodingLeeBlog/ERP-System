<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="content-page">
	<div class="content">
	
	    <!-- Start Content-->
	    <div class="container-fluid">
	
	        <!-- start page title -->
	        <div class="row">
	            <div class="col-12">
	                <div class="page-title-box">
	                    <div class="page-title-right">
	                        <ol class="breadcrumb m-0">
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">가맹점정보관리</a></li>
	                            <li class="breadcrumb-item active">마이페이지</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">마이페이지</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	
	        <div class="row">
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
							<!-- **나중에 수정할수 없는 것에 색깔이나 아이콘으로 표시하기** -->
	                        <form id="mypageForm" method="post" action="/owner/mypageUpdate.do" >
	                        	<div class="row">
	                           		<div class="col-lg-6">
	                                    <div class="mb-3">
	                                        <label for="frcsName" class="form-label">가맹점명</label>
	                                        <input type="text" id="frcsName" name="frcsName" class="form-control" readonly="" value="${frcs.frcsName }">
	                                    </div>
	
										<!-- 회원아이디는 조인해서 넣을것 -->
	                                    <div class="mb-3">
	                                        <label for="memId" class="form-label">회원ID</label>
	                                        <input type="text" id="memId" name="memId" class="form-control" readonly="" value="${frcs.memId }">
	                                    </div>
	
	                                    <!-- 비밀번호 확인 입력란은 수정했을때만 보여주기?! 어떻게 할지 생각해보고 추가하기 -->
	                                    <div class="mb-3">
	                                        <label for="memPw" class="form-label text-primary">비밀번호 *</label>
<!-- 	                                        <div class="input-group input-group-merge"> -->
										        <input type="text" id="memPw" class="form-control" value="${frcs.memPw }">
<!-- 										        <div class="input-group-text" data-password="false"> -->
<!-- 										            <span class="password-eye"></span> -->
<!-- 										        </div> -->
<!-- 										    </div> -->
	                                    </div>
	                                    
	                                    <div class="mb-3">
	                                        <label for="frcsStdate" class="form-label">가맹등록일자</label>
	                                        <input type="text" id="frcsStdate" class="form-control" readonly="" value="<fmt:formatDate value="${frcs.frcsStdate }" pattern="yyyy-MM-dd"/>" >
	                                    </div>
	
	                                    <div class="mb-3">
	                                        <label for="frcsEnddate" class="form-label">계약만료일자</label>
	                                        <input type="text" id="frcsEnddate"  class="form-control" readonly="" value="<fmt:formatDate value="${frcs.frcsEnddate }" pattern="yyyy-MM-dd"/>">
	                                    </div>
	
	                                    <div class="mb-3">
	                                        <label for="frcsCdate" class="form-label">계약체결일자</label>
	                                        <input type="text" id="frcsCdate"  class="form-control" readonly="" value="<fmt:formatDate value="${frcs.frcsCdate }" pattern="yyyy-MM-dd"/>" >
	                                    </div>
	
	                                    <div class="mb-3">
	                                        <label for="frcsOpdate" class="form-label">그랜드오픈일자</label>
	                                        <input type="text" id="frcsOpdate"  class="form-control" readonly="" value="<fmt:formatDate value="${frcs.frcsOpdate }" pattern="yyyy-MM-dd"/>">
	                                    </div>
	                          	  	</div> <!-- end col -->
	                            
	                            	<div class="col-lg-6">
	                                    <div class="mb-3">
	                                        <label for="frcsId" class="form-label">가맹점코드</label>
	                                        <input type="text" id="frcsId" name="frcsId" class="form-control" readonly="" value="${frcs.frcsId }" >
	                                    </div>
	
										<div class="mb-3">
	                                        <label for="frcsTel" class="form-label text-primary">전화번호 *</label>
	                                        <input type="text" id="frcsTel" name="frcsTel" class="form-control" value="${frcs.frcsTel }">
	                                    </div>
	
	                                    <!-- 카카오지도 API넣기 -->
	                                    <div class="mb-3">
	                                        <label for="simpleinput" class="form-label text-primary">주소 *</label>
	                                        <div class="input-group">
			                                    <input type="text" id="sample6_postcode" name="frcsPost" class="form-control" value="${frcs.frcsPost }">
												<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary"><br>
	                                        </div>
											<input type="text" id="sample6_address" name="frcsAdd1" class="form-control" value="${frcs.frcsAdd1 }">
											<input type="text" id="sample6_detailAddress" name="frcsAdd2" class="form-control" value="${frcs.frcsAdd2 }">
											<input type="hidden" id="sample6_extraAddress" placeholder="참고항목" class="form-control">
										</div>

										<div id="map" style="width:100%;height:310px;margin-top:30px;"></div>
	                            	</div> <!-- end col -->	
	                  			</div>
	                  			<sec:csrfInput/>
	                        </form>
	                        <!-- end row-->   
							
							<div class="text-sm-end mt-3">
								<button type="button" class="btn btn-light me-2" onclick="javascript:location.href='/owner/mypageDetail.do?frcsId=${frcs.frcsId}'">취소</button>                   
								<button type="button" class="btn btn-primary " id="udtBtn">저장</button>                   
							</div>	                                                                           
	                            
	                    </div> <!-- end card-body -->
	                </div> <!-- end card -->
	            </div><!-- end col -->
	        </div><!-- end row -->
	        
    	</div>   
    	           
	</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99dae329a5133218a9bbd0ae71750f34&libraries=services"></script>
<script>
    function sample6_execDaumPostcode() {
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
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                
             // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
                
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").value='';
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	//주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
    
    $(function(){
        var udtBtn = $("#udtBtn");
        var mypageForm = $("#mypageForm");
        
        udtBtn.on("click", function(){
        	var pw = $("#memPw").val();
        	var tel = $("#frcsTel").val();
        	var post = $("#sample6_postcode").val();
//         	var add1 = $("#sample6_address").val();
//         	var add2 = $("#sample6_detailAddress").val();
        	
        	if(pw == null || pw == ""){
    			alert("비밀번호를 입력해주세요.");
    			return false;
    		}
        	if(tel == null || tel == ""){
    			alert("전화번호를 입력해주세요.");
    			return false;
    		}
        	if(post == null || post == ""){
    			alert("우편번호를 입력해주세요.");
    			return false;
    		}
        	
        	Swal.fire({
			      title: '수정 완료',
			      icon: 'success',
			      text: '수정이 완료되었습니다!'
			    }).then((result) => {
		            if (result.isConfirmed) {
		            	mypageForm.submit();
		                    }
		          });
        });
    });
</script>