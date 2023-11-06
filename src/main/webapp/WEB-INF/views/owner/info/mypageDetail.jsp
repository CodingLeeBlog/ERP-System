<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	                        <form>
	                        	<div class="row">
	                           		<div class="col-lg-6">
	                                    <div class="mb-3">
	                                        <label for="frcsName" class="form-label">가맹점명</label>
	                                        <input type="text" id="frcsName" class="form-control" readonly="" value="${frcs.frcsName }">
	                                    </div>
	
										<!-- 회원아이디는 조인해서 넣을것 -->
	                                    <div class="mb-3">
	                                        <label for="memId" class="form-label">회원ID</label>
	                                        <input type="text" id="memId" class="form-control" readonly="" value="${frcs.memId }">
	                                    </div>
	
	                                    <!-- 비밀번호 확인 입력란은 수정했을때만 보여주기?! -->
	                                    <!-- 비밀번호 조인해서 넣을것 -->
	                                    <div class="mb-3">
	                                        <label for="memPw" class="form-label">비밀번호</label>
                                            <input type="password" id="memPw" class="form-control" readonly="" value="${frcs.memPw }">
	                                    </div>
	
	                                    <div class="mb-3">
	                                        <label for="frcsStdate" class="form-label">가맹등록일자</label>
	                                        <input type="text" id="frcsStdate" class="form-control" readonly="" value="<fmt:formatDate value="${frcs.frcsStdate }" pattern="yyyy-MM-dd"/>">
	                                    </div>
	
	                                    <div class="mb-3">
	                                        <label for="frcsEnddate" class="form-label">계약만료일자</label>
	                                        <input type="text" id="frcsEnddate" class="form-control" readonly="" value="<fmt:formatDate value="${frcs.frcsEnddate }" pattern="yyyy-MM-dd"/>">
	                                    </div>
	
	                                    <div class="mb-3">
	                                        <label for="frcsCdate" class="form-label">계약체결일자</label>
	                                        <input type="text" id="frcsCdate" class="form-control" readonly="" value="<fmt:formatDate value="${frcs.frcsCdate }" pattern="yyyy-MM-dd"/>">
	                                    </div>
	
	                                    <div class="mb-3">
	                                        <label for="frcsOpdate" class="form-label">그랜드오픈일자</label>
	                                        <input type="text" id="frcsOpdate" class="form-control" readonly="" value="<fmt:formatDate value="${frcs.frcsOpdate }" pattern="yyyy-MM-dd"/>">
	                                    </div>
	                          	  	</div> <!-- end col -->
	                            
	                            	<div class="col-lg-6">
	                                    <div class="mb-3">
	                                        <label for="frcsId" class="form-label">가맹점코드</label>
	                                        <input type="text" id="frcsId" class="form-control" readonly="" value="${frcs.frcsId }">
	                                    </div>
	
										<div class="mb-3">
	                                        <label for="frcsTel" class="form-label">전화번호</label>
	                                        <input type="text" id="frcsTel" class="form-control" readonly="" value="${frcs.frcsTel }">
	                                    </div>
	
	                                    <!-- 카카오지도 API넣기 -->
	                                    <div class="mb-3">
	                                        <label for="simpleinput" class="form-label">주소</label>
	                                        <div class="input-group">
			                                    <input type="text" id="sample6_postcode" class="form-control" readonly="" value="${frcs.frcsPost }">
												<input type="hidden" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary"><br>
	                                        </div>
											<input type="text" id="sample6_address" class="form-control" readonly="" value="${frcs.frcsAdd1 }">
											<input type="text" id="sample6_detailAddress" class="form-control" readonly="" value="${frcs.frcsAdd2 }">
											<!-- <input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control"> -->
										</div>

										<div id="map" style="width:100%;height:310px;margin-top:30px;"></div>
<!-- 										<div id="clickLatlng"></div> -->
	                            	</div> <!-- end col -->
	                  			</div>
	                        </form>
	                        <!-- end row-->   
							
							<form id="mypageForm" action="/owner/mypageUpdate.do" method="get">
								<input type="hidden" name="frcsId" value="${frcs.frcsId }"/>
							</form>
							<div class="text-sm-end mt-3">
								<button type="button" class="btn btn-primary " id="udtBtn">수정</button>                   
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
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var add1 = document.getElementById('sample6_address').value;
var add2 = document.getElementById('sample6_detailAddress').value;
var frcsName = document.getElementById('frcsName').value;
// 주소로 좌표를 검색합니다
geocoder.addressSearch(add1, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
// 		var message = 'latlng: new kakao.maps.LatLng(' + result[0].y + ', ';
// 		message += result[0].x + ')';
		
// 		var resultDiv = document.getElementById('clickLatlng'); 
// 		resultDiv.innerHTML = message;
		
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+frcsName+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    


$(function(){
	var udtBtn = $("#udtBtn");
	var mypageForm = $("#mypageForm");
	
	udtBtn.on("click", function(){
		mypageForm.submit();
	});
	
});
</script>