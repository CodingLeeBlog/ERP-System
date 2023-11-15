<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content-page">
	<div class="content">
		<div class="container-fluid">
		
		    <div class="row">
		        <div class="col-12">
		            <div class="page-title-box">
		                <div class="page-title-right">
		                    <ol class="breadcrumb m-0">
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">홈</a></li>
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">재고 트레이딩</a></li>
		                        <li class="breadcrumb-item active">트레이딩 요청</li>
		                    </ol>
		                </div>
		                <h4 class="page-title">트레이딩 요청</h4>
		            </div>
		        </div>
		    </div>

		    <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
		                        <div class="col-xl-9"><h4 class="mt-1 mb-3">내 가맹점 주변 매장</h4></div>
		                    </div>
							<div id="map" style="width:100%;height:350px;"></div>
							<div>
								<input type="hidden" id="myXMap" value="${frcsVO.frcsXmap }">
								<input type="hidden" id="myYMap" value="${frcsVO.frcsYmap }">
								<input type="hidden" id="myAddr" value="${frcsVO.frcsAdd1 }">
								<input type="hidden" id="myFrcsName" value="${frcsVO.frcsName }">
								<input type="hidden" id="myFrcsId" value="${frcsVO.frcsId }">
							</div>
	       		        </div>
	       		  	</div>
	     	   </div>
			</div>
			
			<!-- 트레이딩 물품 조회 -->
			<div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		               		 <div class="row mb-2">
		                        <div class="col-xl-8">
		                            <form id="searchForm" class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">		                                
		                                <div class="col-auto">
		                                    <div class="d-flex align-items-center">
		                                        <label for="searchType" class="me-2"></label>
		                                        <select class="form-select" name="searchType" id="searchType">
		                                            <option value="vdprodName" <c:if test="${searchType eq 'vdprodName' }">selected</c:if>>제품명</option>
		                                            <option value="vdprodCd" <c:if test="${searchType eq 'vdprodCd' }">selected</c:if>>제품코드</option>
		                                        </select>
		                                    </div>
		                                </div>
		                                <div class="col-auto">
		                                    <label for="searchWord" class="visually-hidden">Search</label>
		                                    <input type="search" class="form-control" id="searchWord" name="searchWord" placeholder="검색어를 입력해주세요." value="${searchWord }">
		                                </div>
		                                <div class="col-auto">
		                                    <div class="d-flex align-items-center d-flex align-items-baseline">
		                                <button type="button" class="btn btn-primary" id="searchBtn">
										    <i class="mdi mdi-magnify search-icon"></i>검색                            			
		                                </button>
		                                	</div>
		                                </div>
		                            </form>                             
		                        </div>
		                        
		                        <div class="col-xl-4">
		                            <div class="text-xl-end mt-xl-0 mt-2">
<!-- 		                                <button type="button" class="btn btn-light mb-2">엑셀 다운로드</button> -->
		                            </div>
		                        </div><!-- end col-->
		                    </div>
		                  	  <div class="table-responsive">
		                        <table class="table table-centered table-nowrap mb-0">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:40px;"></th>
		                                    <th style="text-align:center; width:100px;">가맹점명</th>
		                                    <th style="text-align:center; width:200px;">위치</th>
		                                    <th style="text-align:center; width:150px;">제품명</th>
		                                    <th style="text-align:center; width:150px;">예상 보유수량</th>
		                                    <th style="text-align:center; width:150px;"></th>
		                                </tr>
		                            </thead>
		                            <tbody id="addArea">
		                                <tr>
		                                    <td colspan="6" style="text-align:center">
		                                    	트레이딩 할 제품을 검색해주세요.
		                                    </td>
		                                </tr>
		                            </tbody>
		                        </table>
		                    </div>
		                    <br>
	       		         </div> <!-- end card-body-->
	       		  	</div> <!-- end card-->
	     	   </div> <!-- end col -->
		    </div>
		</div>
	</div> <!-- container -->
</div> <!-- content -->
	
<script type="text/javascript">
$(function(){
	var addArea = $("#addArea");
	
	var myXMap = $("#myXMap").val();	// 내 가맹점 x좌표
	var myYMap = $("#myYMap").val();	// 내 가맹점 y좌표
	var myAddr = $("#myAddr").val();		// 내 가맹점 주소
	var myFrcsName = $("#myFrcsName").val();	// 내 가맹점 이름
	var myFrcsId = $("#myFrcsId").val();	// 내 가맹점 아이디
	
	var otherFrcsInfo = [];	// 내 가맹점이 아닌  다른 가맹점 정보 담을 배열
	var markers = [];	// 마커를 저장할 배열	
	var nearList = [];	// 근처 가맹점을 담을 배열
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
        center: new kakao.maps.LatLng(myXMap, myYMap), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 내 가맹점 마커 표시
	addMarker(new kakao.maps.LatLng(myXMap, myYMap),"내 가맹점");

	function addMarker(position, frcsName) {
	    var imageSrc = "${pageContext.request.contextPath}/resources/assets/img/marker.png";
	    var imageSize = new kakao.maps.Size(58, 71); // 마커 이미지의 크기
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
	    var marker = new kakao.maps.Marker({
	        position: position, // 마커의 위치
	        image: markerImage
	    });

	    var content = '<div class="customoverlay">' +
	     '<span class="fctitle" style="font-weight:bold; font-size: 12px; background-color: azure;color: black;">' + frcsName + '</span></div>';

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker); // 배열에 생성된 마커를 추가

	    // 커스텀 오버레이가 표시될 위치입니다
	    var overlayPosition = new kakao.maps.LatLng(position.getLat(), position.getLng());

	    // 커스텀 오버레이를 생성하고 설정합니다
	    var customOverlay = new kakao.maps.CustomOverlay({
	        map: map,
	        position: overlayPosition,
	        content: content,
	        yAnchor: 1
	    });
	}
			
	// 중심점에서 반경 5km 이내의 원형 영역 그리기
	var circle = new kakao.maps.Circle({
	    center: new kakao.maps.LatLng(myXMap, myYMap), // 중심 좌표 설정
	    radius: 5000, // 미터단위
	    strokeWeight: 3, // 선의 두께 설정
	    strokeColor: '#75B8FA', // 선의 색깔 설정
	    strokeOpacity: 0.4, // 선의 불투명도 설정
	    fillColor: '#CFE7FF', // 채우기 색깔 설정
	    fillOpacity: 0.3 // 채우기 불투명도 설정
	});
	
	// 원형 영역 지도에 추가
	circle.setMap(map);
	
	// Haversine 공식을 사용하여 두 지점 간의 거리를 계산
	function getDistance(lat1, lon1, lat2, lon2) {
	    const R = 6371; // 지구 반지름 (킬로미터)

	    const dLat = (lat2 - lat1) * (Math.PI / 180);
	    const dLon = (lon2 - lon1) * (Math.PI / 180);

	    const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) *  Math.sin(dLon / 2) * Math.sin(dLon / 2);

	    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	    const distance = R * c;

	    return distance;
	}
	
	// 모든 가맹점 정보 가져오기
	$.ajax({
		type : "post",
		url : "/owner/allFrcsList.do",
		beforeSend : function(xhr){	// csrf토큰 보내기 위함
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
		},
		success : function(res){
			// 반경 10km 안에 있는 가맹점은 가맹점코드를 따로 배열에 저장하기 > 리스트로 출력해줘야해서...	
			var radius = 5000; // 10km 반경 (미터)
			
			
			for(var i=0; i<res.length; i++){
				var otherXMap = res[i].frcsXmap;				
				var otherYMap = res[i].frcsYmap;				
				var otherFrcsName = res[i].frcsName;				
				var otherFrcsId = res[i].frcsId;				
				
				// 내 가맹점 빼고 배열에 넣기
				if(otherFrcsId !== myFrcsId){
					var otherInfo = {
						otherXMap : otherXMap, 
						otherYMap : otherYMap, 
						otherFrcsName : otherFrcsName, 
						otherFrcsId : otherFrcsId
					};
					otherFrcsInfo.push(otherInfo);
					}
				}
			
				for(var j=0; j<otherFrcsInfo.length; j++){
				 	var otherXMap = otherFrcsInfo[j].otherXMap;
				    var otherYMap = otherFrcsInfo[j].otherYMap;
				    var otherFrcsId = otherFrcsInfo[j].otherFrcsId;
				    var otherFrcsName = otherFrcsInfo[j].otherFrcsName;
					
				    // 거리 계산
		            var distance = getDistance(myXMap, myYMap, otherXMap, otherYMap);
		
		            // 10km 이내에 있는 가맹점들을 nearList에 추가
	                if (distance <= 5) {
	                    nearList.push(otherFrcsId);
	                }
					
					console.log(nearList);

					// 모든 가맹점 마커 찍기
					addMarker(new kakao.maps.LatLng(otherXMap, otherYMap),otherFrcsName);
				}
			}
		});
	
	// 검색을 클릭하면 
	// nearList에 담긴 배열별로 해당 목록 리스트가 떠야한다.
	$("#searchBtn").on("click",function(){
		
		var searchWord = $("#searchWord").val();
		var searchType = $("#searchType").val();
		
		var data = {
			nearList : nearList,
			searchWord : searchWord,
			searchType : searchType
		}
		
		$.ajax({
			type : "post",
			url : "/owner/nearFrcsInventList.do",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			data: JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log(res);
				
				var str = "";
				
				for(var i=0; i<res.length; i++){
					var frcsId = res[i].frcsId;
					var frcsName = res[i].frcsName;
					var frcsAdd = res[i].frcsAdd1;
					var vdprodName = res[i].vdprodName;
					var invntryQy = res[i].invntryQy;
					var vdprodCd = res[i].vdprodCd;
					str += '<tr><td><div><input type="hidden" value="'+frcsId+'" class="frcsId2">';
					str += '<input type="hidden" value="'+vdprodCd+'" class="vdprodCd"></div></td>';
					str += '<td style="text-align:center" class="frcsName">'+frcsName+'</td>';
					str += '<td style="text-align:center">'+frcsAdd+'</td>';
					str += '<td style="text-align:center" class="vdprodName">'+vdprodName+'</td>';
					str += '<td style="text-align:center">'+invntryQy+'</td>';
					if(invntryQy>0){
					str += '<td style="text-align:center"><button type="button" class="btn btn-info tradeBtn">트레이딩 신청</button></td></tr>';
					}else{
					str += '<td style="text-align:center"><button type="button" class="btn btn-info tradeBtn" disabled>트레이딩 신청</button></td></tr>'
					}
				}
								
				$("#addArea").html(str);
			}
		});
	});
	
	
	addArea.on("click", ".tradeBtn", function(){
		
		
		// 선택한 가맹점 코드
		var frcsId2 = $(this).closest('tr').find('.frcsId2').val();
		var vdprodCd = $(this).closest('tr').find('.vdprodCd').val();
		var frcsName = $(this).closest('tr').find('.frcsName').text();
		var vdprodName = $(this).closest('tr').find('.vdprodName').text();
		
		console.log(frcsId2);
		console.log(vdprodCd);
		var text = "요청 매장 : " + frcsName + "<br>";
		text += "요청 재료 : " + vdprodName ;
		// 모달에 요청 개수를 몇개할건지가 뜨고
		// 최종확인버튼을 누르면 트레이딩 테이블에 insert되도록
		Swal.fire({
            title: "트레이딩 수량 입력",
            html: text,
            input : "number",
            inputAttributes: {
                min: 1, // 최소값 1로 설정
            },
            confirmButtonText: "트레이딩 요청하기",
            showCancelButton: true, // 취소 버튼 표시
            icon: "question",
            preConfirm: function (quantity) {
            	 if (quantity === "" || isNaN(quantity) || quantity < 1) {
                     Swal.showValidationMessage("유효한 숫자를 입력하세요.");
                 } else {
                     var tradQy = parseInt(quantity);	// 트레이딩 수량
                     // 요청 가맹점 코드, 제품명코드, 응답 가맹점 코드, 제품 수량 보내줘야함.

                     var frcsId = $("#myFrcsId").val();	// 내 가맹점 코드
                     
                     var data = {
                    	frcsId : frcsId,
                    	vdprodCd : vdprodCd,
                    	frcsId2 : frcsId2,
						tradQy : tradQy                 	
                     }
                     
                     $.ajax({
                    	type : "post",
                   		url : "/owner/tradingInsert.do",
                   		beforeSend : function(xhr){	// csrf토큰 보내기 위함
        					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
        				},
                    	data : JSON.stringify(data),
                    	contentType : "application/json; charset=utf-8",
        				success : function(res){
        					
        					if(res === "OK"){
        						Swal.fire({
        				            title: "트레이딩 신청 완료",
        				            text: "정상적으로 신청 되었습니다",
        				            confirmButtonText: "확인",
        				            icon: "success",
        				            preConfirm: function () {
        				                location.href = "/owner/tradingList.do";
        				            }
        				        });
        					}
        				}
                     });
                 }
             },
        });
		
		
	});
});
</script>