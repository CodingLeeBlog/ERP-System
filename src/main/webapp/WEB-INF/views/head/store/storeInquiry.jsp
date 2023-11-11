<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806a49ec63336f4fd1e46074f5163d44&libraries=services"></script>

<!-- Start Content-->
<div class="content-page">
   <div class="content">
      <!-- Start Content-->
      <div class="container-fluid">

            <!-- start page title -->
      <div class="col-sm-12 card widget-inline mt-3" style="height:100px;">
         <div class="row ">
               <div class="card-body col-4 align-items-center">
                  <div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">가맹점조회</div>
                  <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">전국 가맹점을 조회합니다.</div>
               </div>
               <div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
                  매장관리 / &nbsp;<span class="text-decoration-underline">가맹점조회</span>
               </div>
            </div>
         </div>
            <!-- end page title -->

<!-- 		색   상  color: 색상이름 또는 색상코드 ; -->
<!-- 		굵   기  font-weight: bold ; -->
<!-- 		기울임  font-style: italic; -->
<!-- 		크   기  font-size: 숫자px, 숫자% 또는 숫자em ; -->
<!-- 		글   꼴  font-family: 굴림, 돋움, 궁서, Arial, 등등 ; -->
<!-- 		줄높이  line-height: 숫자px, 숫자% 또는 숫자em ; -->

         <div class="row">
            <div class="col-xl-12">
               <div class="card">
                  <div class="card-body">
                     <div id="map" style="width:100%;height:300px;"></div>
                        <div class="d-flex justify-content-between">
                           <p>
                               <button onclick="setCenter()">지도 중심좌표 이동시키기</button> 
   <!--                             <button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button>  -->
                           </p>
                           <p>
                              <span style="color:red; font-weight: bold ;">＊</span>지도 아래 표의 가맹점명을 클릭하시면 해당 가맹점의 위치를 조회할수있어요<br>
                              <span style="color:red;">＊</span>지도 위 아이콘의 지점명을 클릭하시면 해당 가맹점상세를 확인할수있어요
                           </p>
                        </div>
                        
                  </div>
                  <!-- end card-body-->
               </div>
               <!-- end card-->
            </div>
            <!-- end col-->
         </div>
         <!-- end row-->

         <div class="row">
            <div class="col-md-6">
               <div class="card">
                  <div class="card-body">
                     <!-- 좌측 컨텐츠 -->
                     <div class="col-12">
                        <h4 class="operation-status">
                           운영상태 : &nbsp;&nbsp;&nbsp; <span style="color: green;"><i
                              class="fas fa-square"></i></span>&nbsp;&nbsp;운영중 <span
                              style="color: orange;"><i class="fas fa-square"></i></span>&nbsp;&nbsp;휴업중
                           <span style="color: aquamarine;"><i
                              class="fas fa-square"></i></span>&nbsp;&nbsp;개점예정 <span
                              style="color: black;"><i class="fas fa-square"></i></span>&nbsp;&nbsp;계약만료
                        </h4>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-6">
               <div class="card">
                  <div class="card-body">
                     <!-- 우측 컨텐츠 -->
                     <form id="searchForm" method="post">
                     <div class="row">
                               <input type="hidden" name="page" id="page"/>
                           
                           <div class="input-group">
                           <div class="col-md-3">
                              <select class="form-select" id="example-select" name="searchStatus">
                                 <option value="">운영상태선택</option>
                                 <option value="운영중" <c:if test="${searchStatus eq '운영중' }">selected</c:if>>운영중</option>
                                 <option value="휴업중" <c:if test="${searchStatus eq '휴업중' }">selected</c:if>>휴업중</option>
                                 <option value="개점예정" <c:if test="${searchStatus eq '개점예정' }">selected</c:if>>개점예정</option>
                                 <option value="계약만료" <c:if test="${searchStatus eq '계약만료' }">selected</c:if>>계약만료</option>
                              </select>
                           </div>
                           <div class="col-md-9">
                              <div class="input-group" >
                                 <input type="search" class="form-control" placeholder="지역이름을 검색하세요.." id="frcsSearch" name="searchWord">
                                 <button class="btn btn-secondary" type="submit" style="background-color: #abb2b8;">검색</button>
                              </div>
                           </div>
                           </div>
                        </div>
                        <sec:csrfInput/>
                     </form>
                  </div>
               </div>
            </div>
         </div>

         <div class="card">
        <div class="card-body">
          <div class="row">
            <div class="col-md-6">
              <p class="header">총 건수 : ${pagingVO.totalRecord }</p>
            </div>
            <div class="col-md-6 text-md-end">
              <button id="excelDownload" class="btn btn-sm btn-success" onclick="location.href = '/head/excel.do' ">엑셀다운로드</button>
                 <!-- Primary Header Modal -->
            <button type="button"  id="excelUpload" class="btn btn-sm btn-success" data-bs-toggle="modal" data-bs-target="#primary-header-modal">엑셀업로드</button>
            <div id="primary-header-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="primary-header-modalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-success">
                            <h4 class="modal-title" id="primary-header-modalLabel">파일업로드</h4>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                           <form action="/head/excelUpload.do" method="post" id="excelFile" accept=".xls" enctype="multipart/form-data">
                              <div class="modal-body">
                                  <div class="col-6" >
                                    <label class="form-label">
                                    <span class="text-danger">*</span>
                                    업로드할 파일 선택
                                    </label>
                                    <input class="form-control" type="file" id="uploadFile" name="excelFile" />
                                </div>
                              </div>
                              <div class="modal-footer">
                                  <button id="modalButton" type="button" class="btn btn-primary">확인</button>
                                  <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                              </div>
                            <sec:csrfInput/>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
              
            </div>
          </div>
               <table class="table mt-3" style="text-align: center;">
                  <thead>
                     <tr>
                        <th></th>
                        <th>순번</th>
                        <th>가맹점명</th>
                        <th>가맹점주명</th>
                        <th>위치</th>
                        <th>운영상태</th>
                        <th>오픈일자</th>
                        <th>매장전화번호</th>
                     </tr>
                  </thead>
                  <c:set value="${pagingVO.dataList }" var="frcsList"/>
                  <c:choose>
                     <c:when test="${empty frcsList }">
                                <tbody>
                                    <tr>
                              <td colspan="7">조회하신 가맹점이 존재하지 않습니다.</td>
                           </tr>
                        </tbody>
                            </c:when>
                     <c:otherwise>
                        <c:forEach items="${frcsList }" var="frcs">
                           <tbody>
                              <tr>
                                 <td>
                                    <div class="frcsXYmap">
                                       <input class="xMap" type="hidden" value="${frcs.frcsXmap }">
                                       <input class="yMap" type="hidden" value="${frcs.frcsYmap }">
                                       <input class="fcName" type="hidden" value="${frcs.frcsName }">
                                       <input class="memId" type="hidden" value="${frcs.memId }">
                                    </div>
                                 </td>
                                 <td>${frcs.rnum }</td>
                                 <td><a href="#" class="frcsNameLink" data-x="${frcs.frcsXmap }" data-y="${frcs.frcsYmap }"> ${frcs.frcsName }</a></td>
                                 <td>${frcs.memName }</td>
                                 <td>${frcs.frcsAdd1 }&nbsp;${frcs.frcsAdd2 }</td>
                                 <td>
                                    <c:if test="${frcs.frcsState eq '운영중' }">
                                       <span style="color: green;">
                                          <i class="fas fa-square" ></i>
                                       </span>
                                    </c:if>
                                    <c:if test="${frcs.frcsState eq '휴업중' }">
                                       <span style="color: orange;">
                                          <i class="fas fa-square" ></i>
                                       </span>
                                    </c:if>
                                    <c:if test="${frcs.frcsState eq '개점예정' }">
                                       <span style="color: aquamarine;">
                                          <i class="fas fa-square" ></i>
                                       </span>
                                    </c:if>
                                    <c:if test="${frcs.frcsState eq '계약만료' }">
                                       <span style="color: black;">
                                          <i class="fas fa-square" ></i>
                                       </span>
                                    </c:if>
                                 </td>
                                 <td>${frcs.frOpdate }</td>
                                 <td>${frcs.frcsTel }</td>
                              </tr>
                           </tbody>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
                  
               </table>
        
                <nav aria-label="Page navigation example" id="pagingArea">
               ${pagingVO.pagingHTML }
            </nav>
            </div>
         </div>
    </div>
      <!-- End Content-->

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
      <!-- container -->
   </div>
   <!-- end -->

<script type="text/javascript">

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(36.32500984844347, 127.40887599873284 ), // 지도의 중심좌표
    level: 7 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = "${pageContext.request.contextPath }/resources/assets/img/marker.png", 
   imageSize = new kakao.maps.Size(58, 71),  // 마커 이미지의 크기
   imageOption = {offset: new kakao.maps.Point(28, 8)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

function setCenter() {            
// 이동할 위도 경도 위치를 생성합니다 
var moveLatLon = new kakao.maps.LatLng(36.32500984844347, 127.40887599873284 );

// 지도 중심을 이동 시킵니다
map.setCenter(moveLatLon);
}

function panTo(x,y) {
// 이동할 위도 경도 위치를 생성합니다 
var moveLatLon = new kakao.maps.LatLng(x, y);

// 지도 중심을 부드럽게 이동시킵니다
// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
map.panTo(moveLatLon);            
}        


var frcsXYmap = document.querySelectorAll('.frcsXYmap');

function createMarker(x, y,fcName,memId){
   //마커를 찍을때 
   var markerPosition  = new kakao.maps.LatLng(x, y);
   
    //마커를 생성합니다
   markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
   markerPosition = new kakao.maps.LatLng(x, y);
    
   var marker = new kakao.maps.Marker({
       position: markerPosition,
       image: markerImage 
   });
   
   //마커가 지도 위에 표시되도록 설정합니다
   marker.setMap(map);
   
//    var iwContent = '<div style="width:100%; padding:5px; ">'+ fcName +'<br><a href="https://map.kakao.com/link/map/'+fcName+','+x+','+y+'" style="color:blue" target="_blank">큰지도보기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
//  iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다
//  iwRemoveable = true;  // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

//   // 인포윈도우를 생성합니다
//   var infowindow = new kakao.maps.InfoWindow({
//       position : iwPosition, 
//       content : iwContent,
////        removable : iwRemoveable
//   });
   
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
//    infowindow.open(map, marker); 
      
   var content = '<div class="customoverlay">' +
//                 '  <a href="https://map.kakao.com/link/map/'+fcName+','+x+','+y+'" target="_blank">' +
                '    <span class="fctitle" data-z="'+memId+'" style="font-weight:bold; background-color: azure;color: black;">'+fcName+'</span>' +
//                 '  </a>' +
              '</div>';
     
   // 커스텀 오버레이가 표시될 위치입니다 
   var position = new kakao.maps.LatLng(x, y);  

   // 커스텀 오버레이를 생성합니다
   var customOverlay = new kakao.maps.CustomOverlay({
       map: map,
       position: position,
       content: content,
       yAnchor: 1 
   });
   
}

frcsXYmap.forEach(function(item){
   var xMap = item.querySelector('.xMap');
   var yMap = item.querySelector('.yMap');
   var fcName = item.querySelector('.fcName');
   var memId = item.querySelector('.memId').value;
   var x = xMap.value;
   var y = yMap.value;
   var fcName = fcName.value;
   createMarker(x,y,fcName,memId);
});

$("a.frcsNameLink").on("click",function(event){
      event.preventDefault();
      var x = $(this).data("x");
      var y = $(this).data("y");
      panTo(x,y);

});

$(document).on("click", ".fctitle", function(event){
   var frcsNamed = $(this).text().trim();
   var z = $(this).data("z");
    console.log(frcsNamed);
    console.log(z);
   location.href = "/head/storeDetails.do?frcsName="+frcsNamed+"&memId="+z;
});

$(function(){
   var searchForm = $("#searchForm");
   var pagingArea = $("#pagingArea");
   var modalButton = $("#modalButton");
   
   // a 태그를 클릭하면 이벤트 실행
   pagingArea.on("click","a", function(event){
      event.preventDefault();
      var pageNo = $(this).data("page");
      searchForm.find("#page").val(pageNo);
      searchForm.submit();
   });
   
   modalButton.on("click", function(){
      
       var formData = new FormData();
         
         var excelFile = document.getElementsByName('excelFile')[0].files[0];
         
         formData.append("excelFile", excelFile);
         
         console.log(excelFile);
      
      $.ajax({
            url: "/head/excelUpload.do",
            type: "post",
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(res) {
               if(res === "OK"){
                  Swal.fire({
                       title: '알림창',
                       text: '수정이 완료되었습니다.',
                       icon: 'success',
                   }).then((result) => {
                       if (result.isConfirmed) {
                           location.href = "/head/storeInquiry.do"; 
                       }
                   });
               }
                
            },
            error: function(err) {
                alert("데이터 저장 중 오류가 발생했습니다.", err);
                console.log(data);
            }
        });
         
//          $("#excelFile").submit();
      });
      
   });
</script>