<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member"/>
</sec:authorize>

<div>

<style>

#let_find {
	transform: translateY(250px);
}

.silder-title {
	color : black;
	font-size : 70px;
	font-family : 'Gmarket Sans';
	font-weight : 700;
    top: 200px;
}

.let_find {
	color : white;
	font-size : 70px;
	font-family : 'Gmarket Sans';
	font-weight : 700;
    top: 200px;
}

.let_find_em {
	color : red;
	font-size : 70px;
	font-family : 'Gmarket Sans';
	font-weight : 700;
    top: 200px;
}

.let_find_el {
	color : white;
	font-size : 50px;
	font-family : 'Gmarket Sans';
	font-weight : 700;
}

.post-slider{
/*   width:70%; */
  margin:0px auto;
  position:relative;
}
.post-slider .silder-title{
  text-align:center;
  margin:30px auto;
}
.post-slider .next{
  position:absolute;
  top:50%;
  right:30px;
  font-size:2em;
  color:gray;
  cursor: pointer;
}
.post-slider .prev{
  position:absolute;
  top:50%;
  left:30px;
  font-size:2em;
  color:gray;
  cursor: pointer;
}
.post-slider .post-wrapper{

  width:84%;
  height:350px;
  margin:0px auto;
  overflow: hidden;
  padding:10px 0px 10px 0px;
}
.post-slider .post-wrapper .post{
  width:300px;
  height:300px;
  margin:0px 10px;
/*   display:inline-block; */
  background:white;
  border-radius: 5px;
}
.post-slider .post-wrapper .post .post-info{
/*   font-size:15px; */
/*   height:500px; */
/*   padding-left:10px; */
}
.post-slider .post-wrapper .post .slider-image{
/*   width:353px; */
/*   height:200px; */
/*   border-top-left-radius:5px; */
  border-top-right-radius:5px;
}


</style>


	<!-- ======= menubar Section ======= -->
	<div id="" class="d-flex align-items-center h-75 d-inline-block align-middle">
		<div class="container position-relative text-center text-lg-center aos-init aos-animate" data-aos="zoom-in" data-aos-delay="100">
			<div class="row text-start" style="height: 500px">
				<div class="col-8">
					<div id="let_find">
						<div class="d-inline let_find">Let’s find</div>
						<div class="d-inline ms-3 let_find_em">HALMAEK</div>
						<div class="let_find_el">할맥 매장찾기</div>
					</div>
				</div>
				<div class="col-4">
				</div>
			</div>
		</div>
	</div>
	<div class="pb-5" style="background-color: white;"></div>
	<!-- 슬라이더 시작 -->
	<div class="container-fluid page-wrapper">
		<div class="row">
			<div class="col" style="background-color: white;">
			</div>
			<div class="col-9">
				<div class="row text-start" style="background-color: white; height: 500px;">
					<!--page slider -->
					<div class="post-slider">
					<div class="silder-title align-baseline">
						<img src="${pageContext.request.contextPath }/resources/assets/img/store2.png" class="me-3 mb-4">신규 <span style="color: red;">오픈</span> 매장 <img src="${pageContext.request.contextPath }/resources/assets/img/store1.png">
					</div>
					<!-- 아이콘 -->
					<i class="ri-arrow-left-s-line prev"></i>  
					<i class="ri-arrow-right-s-line next"></i>  
					<!-- 내용 -->
						<div class="post-wrapper">
						<div class="post">
							<a>
								<img src="${pageContext.request.contextPath }/resources/assets/img/storepic1.png" style="width: 373px; height: 200px;">
							</a>
							<div class="text-center pt-4 pb-2" style="background-color: red;">
								<h4>
									<a href="#" class="fs-4 text text-white">대전 탄방점</a>
								</h4>
								<h4>
									<a class="fs-6 text text-white">2023.10.12 오픈</a>
								</h4>
							</div>
						</div>
						<div class="post">
							<a>
								<img src="${pageContext.request.contextPath }/resources/assets/img/storepic2.png" style="width: 373px; height: 200px;">
							</a>
							<div class="text-center pt-4 pb-2" style="background-color: red;">
								<h4>
									<a href="#" class="fs-4 text text-white">대전 시청점</a>
								</h4>
								<h4>
									<a class="fs-6 text text-white">2022.05.10 오픈</a>
								</h4>
							</div>	
						</div>
						<div class="post">
							<a>
								<img src="${pageContext.request.contextPath }/resources/assets/img/storepic3.png" style="width: 373px; height: 200px;">
							</a>
							<div class="text-center pt-4 pb-2" style="background-color: red;">
								<h4>
									<a href="#" class="fs-4 text text-white">대전 둔산점</a>
								</h4>
								<h4>
									<a class="fs-6 text text-white">2023.01.30 오픈</a>
								</h4>
							</div>
						</div>
						<div class="post">
							<a>
								<img src="${pageContext.request.contextPath }/resources/assets/img/storepic4.png" style="width: 373px; height: 200px;">
							</a>
							<div class="text-center pt-4 pb-2" style="background-color: red;">
								<h4>
									<a href="#" class="fs-4 text text-white">대전 대흥점</a>
								</h4>
								<h4>
									<a class="fs-6 text text-white">2021.08.25 오픈</a>
								</h4>
							</div>
						</div>
						</div>
					</div>
					<!--post slider-->
				</div>
			</div>
			<div class="col" style="background-color: white;">
			</div>
		</div>
	</div>
	<!-- 슬라이더 끝 -->
	
	<div class="pt-5" style="background-color: white;"></div>

	<!-- menubar Hero -->
	<div class="container-fluid">
		<div class="row">
			<div class="col m-0 p-0" style="background-color: white;">
			</div>
			<div class="col-9 m-0 p-0">
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;">
				    </div>
				
				    <div id="menu_wrap" class="bg_white" style="color: black;">
				        <div class="option">
				            <div>
				            	<form>
			                		키워드 : <input type="text" value="" id="keyword" size="15"> 
				                    <input type="button" id="searchBtn" value="검색하기"/> 
				                    <sec:csrfInput/>
				                </form>
				            </div>
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				</div>
			</div>
			<div class="col m-0 p-0" style="background-color: white;">
			</div>
		</div>
	</div>
	<div class="pt-5 pb-5" style="background-color: white;"></div>
	
</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806a49ec63336f4fd1e46074f5163d44&libraries=services"></script>
<script>

//마커를 표시할 위치와 title 객체 배열입니다 
$(function(){
	
	//마커를 담을 배열입니다
	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});            

	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${member.memAdd1}', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
//	         var infowindow = new kakao.maps.InfoWindow({
//	             content: '<div style="width:150px; text-align:center; padding:6px 0; color:black">내위치</div>'
//	         });
//	         infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	
	var searchBtn = $("#searchBtn");
	
	searchBtn.on("click", function(){
		var keyword = $("#keyword").val();
		var memId = '${member.memId}'
		
		var data = {
			keyword : keyword,
			memId : memId
		};
		
		search(data);
		
	});
	
	<c:set value="${resfrcsName }" var="resfrcsName"/>	// 리뷰쓰기를 클릭했을때 마이페이지에서 넘어온 flag 키 값 
	<c:set value="${resfrcsReview }" var="resfrcsReview"/>
	var pointX = "";
	var pointY = "";
	
	function search(data){
		$.ajax({
			type : "post",
			url : "/elly/store/list.do",
			data : JSON.stringify(data),
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
			contentType : "application/json; charset=utf-8",
			success : function(res){
				var listEl = document.getElementById('placesList'), 
			    menuEl = document.getElementById('menu_wrap'),
			    fragment = document.createDocumentFragment(), 
			    bounds = new kakao.maps.LatLngBounds(), 
			    listStr = '';
				
			    // 검색 결과 목록에 추가된 항목들을 제거합니다
			    removeAllChildNods(listEl);

			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			    
			    for ( var i=0; i<res.length; i++ ) {
			    	
			    	// 마이페이지에서 넘어온 flag 키값이 존재한다면 아래 if가 돌아간다
			    	if('${resfrcsReview}' == "review"){
			    		if(res[i].frcsName == '${resfrcsName}'){
			    			pointX = res[i].frcsXmap;
			    			pointY = res[i].frcsYmap;
			    		}
			    	}
			    	
			    	// 마커를 생성하고 지도에 표시합니다
			    	var placePosition = new kakao.maps.LatLng(res[i].frcsXmap, res[i].frcsYmap)
		            var marker = addMarker(placePosition, i) 
		            var itemEl = getListItem(i, res[i]); // 검색 결과 항목 Element를 생성합니다
			    	
			    	bounds.extend(placePosition);
			    	
			    	(function(marker, title) {
			    		
			    		var openInfoFlag = false;
			    		
			            kakao.maps.event.addListener(marker, 'click', function() {
			                
			            	if(openInfoFlag === false){
			            		openInfoFlag = true;
				            	displayInfowindow(marker, title);
				                
				                $("#resBtn").on("click", function(){
				            		$("#resForm").submit();
				            	})
				            	
								$('.stars .fa').on("click",function () {
									$(this).addClass('active')
									$(this).prevAll().addClass('active')
									$(this).nextAll().removeClass('active')
								
									let num = $(this).index()
									let starRate = num + 1
									
									//$('.print').text(starRate)
									if(starRate == 1){
										$('.print').html("1")
									}else if(starRate == 2) {
										$('.print').html("2")
									}else if(starRate == 3) {
										$('.print').html("3")
									}else if(starRate == 4) {
										$('.print').html("4")
									}else {
										$('.print').html("5")
									};
									
									var review = parseInt($("#review").text());
									console.log(reviewStar)
									$("#reviewStar").val(review);
								});
								
								$("#reviewBtn").on("click", function(){
									
									var memId = $("#memId").val();
									var resvNo = $("#resvNo").val();
									var reviewStar = $("#reviewStar").val();
									var reviewContent = $("#reviewContent").val();
									var frcsId = $("#frcsId").val();
									
									var data = {
											memId : memId,
											resvNo : resvNo,
											reviewStar : reviewStar,
											reviewContent : reviewContent,
											frcsId : frcsId
									}
									
									$.ajax({
										type: "post",
										url: "/elly/store/review.do",
										beforeSend: function(xhr){
											xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
										},
										data: JSON.stringify(data),
										contentType : "application/json; charset=utf-8",
										success : function(res){
											Swal.fire({
												title: '알림창',
												text: '리뷰 등록이 완료되었습니다 !',
												icon: 'success',
											}).then((result) => {
												if (result.isConfirmed) {
													location.href = "/elly/mypage/review.do?memId=${member.memId }"; 
												}
											});
										},
										error : function(xhr, status, error) {
											Swal.fire({
												title: '경고',
												text: '리뷰 등록 오류 발생 ! 다시 시도해주세요 !',
												icon: 'warning',
											})
										}
									});
									
								});
			            	}else {
			            		openInfoFlag = false;
			            		infowindow.close();
			            	}
			            	
			            });
			            
			            itemEl.onclick =  function () {
			            	var dataX = $(this).find('.xMap').data('x');
			            	var dataY = $(this).find('.xMap').data('y');
			            	
			                console.log("data-x 값: " + dataX);
			                
			            	panTo(dataX,dataY);
			            };

			        })(marker, res[i]);
			    	
			    	fragment.appendChild(itemEl);
			    	
			    }
			    
			 	// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;

			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
			}
		})
	}
	
	setTimeout(() => {
		if('${resfrcsReview}' == "review"){
			$("#keyword").val('${resfrcsName}');
			console.log("review click...!");
			var keyword = $("#keyword").val();
			var memId = '${member.memId}'
			
			var data = {
				keyword : keyword,
				memId : memId
			};
			search(data)
		}
	}, 500);
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = "${pageContext.request.contextPath }/resources/assets/img/marker.png"; 
	        imageSize = new kakao.maps.Size(58, 71),  // 마커 이미지의 크기
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, res) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>'
	    itemStr += '<div class="info">' 
	    itemStr += '<h5>' + res.frcsName + '</h5>';

	    if (res.frcsAdd1) {
	        itemStr += '<span>' + res.frcsAdd1 + '</span>'
		    itemStr += '<span class="gray">' +  res.frcsAdd2  + '</span>';
	    } else {
	        itemStr += '<span>' +  res.frcsName  + '</span>'; 
	    }
	                 
		itemStr += '<span class="tel">' + res.frcsTel  + '</span>'
	    itemStr += '<input class="xMap" type="hidden" data-x="' + res.frcsXmap + '" data-y="' + res.frcsYmap + '">'
		itemStr += '</div>';
	              

	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}
	
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	 
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		
		if(title.memId != '${member.memId}'){
			var content = '<div style="padding:5px;z-index:1;color:black;">' + title.frcsName + '</div>'
		    + '<div style="color: #f5f5f5; border-bottom: 2px solid; width:146px"></div>'
		    + '<div style="padding-left: 5px; padding-top: 10px; padding-bottom: 10px;">'
		    + '<form action="/elly/store/res.do" method="get" id="resForm">'
		    + '<input type="hidden" name="frcsId" id="frcsId" value="' + title.frcsId + '"/>'
		    + '<input type="hidden" name="frcsName" id="frcsName" value="' + title.frcsName + '"/>'
		    + '<input type="hidden" name="memId" id="memId" value="${member.memId}"/>'
		    + '<input type="button" id="resBtn" style="padding:5px; margin-left: 38px; z-index:1; color:black;" value="예약하기" />'
		    + '<sec:csrfInput/></form>'
		    + '</div>'
		}else {
			if(title.reviewYn == 'N'){
				var content = '<div class="container-fluid">'
				+ '<div class="text-center mt-1" style="padding:5px; z-index:1; color:black; font-size: 16px; font-weight: bold;">' + title.frcsName + '</div>'
			    + '<form action="/elly/store/review.do" method="post" id="reviewForm">'
			    + '<input type="hidden" name="resvNo" id="resvNo" value="' + title.resvNo +'"/>'
			    + '<input type="hidden" name="memId" id="memId" value="' + title.memId + '"/>'
			    + '<input type="hidden" name="frcsId" id="frcsId" value="' + title.frcsId + '"/>'
			    + '<input type="hidden" name="reviewStar" id="reviewStar" value=""/>'
			    + '<div>'
			    + '<div class="col" style="color:black; font-size: 15px">매장만족도</div>'
			    + '<div class="col d-flex align-items-end" style="color:black; font-size: 12px">(별점을 눌러 평가해주세요)</div>'
			    + '<div class="d-flex justify-content-center align-items-center mt-3 ">'
				+ '<div class="star-rating"><div class="d-flex stars"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><div class="ms-2 print" style="color: black; font-size: 15px;" name="review" id="review"></div><div style="color: black; font-size: 15px;">/5</div></div></div></div>'
				+ '</div>'
			    + '<div class="d-flex">'
			    + '<div class="col-4 mt-3" style="color:black; font-size: 15px">이용후기</div>'
			    + '<div class="col d-flex align-items-end ms-1" style="color:black; font-size: 12px">(선택사항)</div>'
			    + '</div>'
			    + '<div class="mt-3 mb-3">'
			    + '<textarea class="form-control" rows="3" cols="20" class="pe-2" name="reviewContent" id="reviewContent"  style="color:black; font-size: 12px" placeholder="음식의 맛, 양, 서비스 등 매장에 대한 솔직한 리뷰를 남겨주세요."></textarea>'
				+ '</div>'
				+ '<div class="d-flex justify-content-center align-items-center mb-3">'
				+ '<input class="btn btn-secondary" type="button" id="reviewBtn" style="z-index:1; color:white;" value="리뷰쓰기" />'
				+ '</div>'
			    + '<sec:csrfInput/></form>'
			    + '</div>';
			}else {
				var content = '<div style="padding:5px;z-index:1;color:black;">' + title.frcsName + '</div>'
			    + '<div style="color: #f5f5f5; border-bottom: 2px solid; width:146px"></div>'
			    + '<div style="padding-left: 5px; padding-top: 10px; padding-bottom: 10px;">'
			    + '<form action="/elly/store/res.do" method="get" id="resForm">'
			    + '<input type="hidden" name="frcsId" id="frcsId" value="' + title.frcsId + '"/>'
			    + '<input type="hidden" name="memId" id="memId" value="${member.memId}"/>'
			    + '<input type="button" id="resBtn" style="padding:5px; margin-left: 38px; z-index:1; color:black;" value="예약하기" />'
			    + '<sec:csrfInput/></form>'
			    + '</div>'
			}
		}
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	// 지도 이동 기능
	function panTo(dataX,dataY) {
	    
		// 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new kakao.maps.LatLng(dataX, dataY);
	    
	    // level: 7 // 지도의 확대 레벨
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);
    	map.setCenter(moveLatLon);
    	map.setLevel(2);
	}  
	
    // 리뷰 제출 버튼 클릭 이벤트 처리
    var reviewBtn = $('#reviewBtn');
    reviewBtn.on("click", function() {
        if (selectedRating === 0) {
            alert('별점을 선택하세요.');
        } else {
            alert('선택된 별점: ' + selectedRating);
            // 여기에 리뷰 제출 로직을 추가할 수 있습니다.
            // 서버로 리뷰 데이터를 전송하거나 다른 동작을 수행합니다.
        }
    });
});


$('.post-wrapper').slick({
	slidesToShow: 3,
	slidesToScroll: 1,
	autoplay: true,
	autoplaySpeed: 2000,
	nextArrow:$('.next'),
	prevArrow:$('.prev'),
	lazyLoad: 'ondemand', // lazy loading을 사용
	initialSlide: 0 // 첫 번째 슬라이드를 미리 로드
});
</script>