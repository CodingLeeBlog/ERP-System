<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="content-page">
   <div class="content">
      <!-- Start Content-->
      <div class="container-fluid">
         <!-- start page title -->
         <div class="col-sm-12 card widget-inline mt-3" style="height: 100px;">
            <div class="row ">
               <div class="card-body col-4 align-items-center">
                  <div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">점검(위생)관리</div>
                  <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">가맹점의
                     점검(위생)을 관리합니다.</div>
               </div>
               <div
                  class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">
                  매장관리 > &nbsp;<span class="text-decoration-underline">점검(위생)관리</span>
               </div>
            </div>
         </div>
         <!-- end page title -->
               <div class="row">
                  <div class="col-12">
                     <div class="card">
                        <div class="card-body">
                           <!-- Modal -->
                           <div id="multiple-one" class="modal fade" tabindex="-1"
                              role="dialog" aria-labelledby="multiple-oneModalLabel"
                              aria-hidden="true">
                              <div class="modal-dialog">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h4 class="modal-title" id="multiple-oneModalLabel">등록</h4>
                                       <button type="button" class="btn-close"
                                          data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                       <div class="input-group">
                                          <input type="text" class="form-control searchText"
                                             placeholder="가맹점을 입력하세요.">
                                          <button class="btn btn-info searchBtn" type="button">검색</button>
                                       </div>
                                       <br>
                                       <div class="card-body py-0" data-simplebar
                                          style="max-height: 580px;">

                                          <table class="table-hover table">
                                             <thead>
                                                <tr>
                                                   <th style="width: 20px;"></th>
                                                   <th>가맹점코드</th>
                                                   <th>가맹점명</th>
                                                </tr>
                                             </thead>
                                             <tbody id="modalBody">
                                                <c:forEach items="${franchiseList}" var="franchise">
                                                   <tr>
                                                      <td>
                                                         <div class="form-check">
                                                            <input type="checkbox"
                                                               class="form-check-input checkBox">
                                                         </div>
                                                      </td>
                                                      <td class="frcsId">${franchise.frcsId}</td>
                                                      <td class="frcsName">${franchise.frcsName}</td>
                                                   </tr>
                                                </c:forEach>
                                             </tbody>
                                          </table>
                                       </div>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-primary"
                                          data-bs-target="#multiple-two" data-bs-toggle="modal"
                                          data-bs-dismiss="modal">다음</button>
                                    </div>
                                 </div>
                                 <!-- /.modal-content -->
                              </div>
                              <!-- /.modal-dialog -->
                           </div>
                           <!-- /.modal -->

                           <!-- Modal -->
                           <div id="multiple-two" class="modal fade" tabindex="-1"
                              role="dialog" aria-labelledby="multiple-twoModalLabel"
                              aria-hidden="true">
                              <div class="modal-dialog">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h4 class="modal-title" id="multiple-twoModalLabel">등록</h4>
                                       <button type="button" class="btn-close"
                                          data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                       <form enctype="multipart/form-data">
                                          <div class="mb-3 col-md-6">
                                             <label for="ownerFile8" class="col-form-label">점검일자</label>
                                             <input class="form-control" id="inspDate" type="date"
                                                name="ipDate">
                                          </div>
                                          <div class="mb-3 col-md-6">
                                             <label for="ownerConst1" class="col-form-label">위생총점</label>
                                             <select class="form-select form-select-sm mb-3"
                                                id="inspScore" name="ipStts">
                                                <option selected>선택</option>
                                                <option value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                             </select>
                                          </div>
                                          <div class="mb-3 col-md-6">
                                             <label for="ownerFile8" class="col-form-label">점검표</label>
                                             <input type="file" class="form-control" id="inspFile">
                                          </div>
                                       </form>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-primary"
                                          data-bs-dismiss="modal" id="saveBtn">저장</button>
                                    </div>
                                 </div>
                                 <!-- /.modal-content -->
                              </div>
                              <!-- /.modal-dialog -->
                           </div>
                           <!-- /.modal -->
                           <!-- Date Range -->
                           <form id="searchForm">
                              <input type="hidden" name="page" id="page">
                           </form>
                           <div class="col-md d-flex">
                              <div class="col-md-10"></div>
                              <label class="form-label">월로 검색</label>
                           </div> 
                           <div class="col-md d-flex">
                              <div class="col-md-10" style="color: black; font-family: 'GmarketSansBold'; font-size: 18px; font-weight: 900;">
                              	&#8251; 매달 점검일은 1일, 15일 입니다.
                              </div>
                              <div class="col-md me-2">
                              <select class="form-select" id="monthSelect">
                                 <option selected>선택</option>
                                 <option value="1">1월</option>
                                 <option value="2">2월</option>
                                 <option value="3">3월</option>
                                 <option value="4">4월</option>
                                 <option value="5">5월</option>
                                 <option value="6">6월</option>
                                 <option value="7">7월</option>
                                 <option value="8">8월</option>
                                 <option value="9">9월</option>
                                 <option value="10">10월</option>
                                 <option value="11">11월</option>
                                 <option value="12">12월</option>
                              </select>
                              </div>
                              <div>
                                 <button type="button" id="insertBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#multiple-one">등록</button>
                              </div>
                           </div>

                           <br />
                           <div class="table-responsive">
                              <table class="table table-centered w-100 dt-responsive nowrap"
                                 id="products-datatable">
                                 <thead class="table-light">
                                    <tr>
                                       <th style='text-align: center'>순번</th>
                                       <th style='text-align: center'>가맹점명</th>
                                       <th style='text-align: center'>위생총점</th>
                                       <th style='text-align: center'>점검표</th>
                                       <th style='text-align: center'>점검일자</th>
                                    </tr>
                                 </thead>
                                 <tbody id="tBody">
                                    <c:set value="${pagingVO.dataList }" var="inspectionList" />
                                    <c:choose>
                                       <c:when test="${empty inspectionList }">
                                          <tr class="text-center">
                                             <td colspan="5" class="text-dark font-weight-bolder">자료가
                                                존재하지 않습니다.</td>
                                          </tr>
                                       </c:when>
                                       <c:otherwise>
                                          <c:forEach items="${inspectionList }" var="inspection">
                                             <tr class="text-left">
                                                <td style='text-align: center'>${inspection.rnum }</td>
                                                <td style='text-align: center'><a href="#" class="viewDetails"
                                                   data-bs-toggle="modal" data-bs-target="#standard-modal"
                                                   data-row-id="${inspection.frcsId}">${inspection.frcsName }</a></td>
                                                <td style='text-align: center'>${inspection.ipStts }</td>
                                                <td style='text-align: center'>
                                                   <div id="fileArea"></div>
                                                   <button type="button"
                                                      class="btn btn-success btn-sm fileDownload"
                                                      data-attach-no="${inspection.attachNo }">보기</button>
                                                </td>
                                                <td style='text-align: center'><fmt:formatDate value="${inspection.ipDate }"
                                                      pattern="yy/MM/dd" /></td>
                                             </tr>
                                          </c:forEach>
                                       </c:otherwise>
                                    </c:choose>
                                 </tbody>
                              </table>
                              <nav aria-label="Page navigation example" id="pagingArea">
                                 ${pagingVO.pagingHTML }</nav>
                           </div>
                           <div id="standard-modal" class="modal fade" tabindex="-1"
                              role="dialog" aria-labelledby="standard-modalLabel"
                              aria-hidden="true">
                              <div class="modal-dialog">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h4 class="modal-title" id="standard-modalLabel">상세보기</h4>
                                       <button type="button" class="btn-close"
                                          data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                       <table
                                          class="table table-centered w-100 dt-responsive nowrap"
                                          id="products-datatable">
                                          <thead class="table-light">
                                             <tr>
                                                <th style='text-align: center'>순번</th>
                                                <!--                                        <th>가맹점명</th> -->
                                                <th style='text-align: center'>위생점수</th>
                                                <th style='text-align: center'>점검일자</th>
                                             </tr>
                                          </thead>
                                          <tbody id="tbdArea">

                                          </tbody>
                                       </table>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-primary"
                                          id="updateBtn">수정</button>
                                       <button type="button" class="btn btn-secondary"
                                          data-bs-dismiss="modal">목록</button>
                                    </div>
                                 </div>
		                      </div>
                           </div>
                        </div>
                        <!-- end card-body-->
                     </div>
                     <!-- end card-->

                  </div>
                  <!-- end col -->

               </div>
               <!-- end row -->

            </div>
            <!-- container -->

         </div>
         <!--                             content -->
      </div>


<script type="text/javascript">
   $(function() {
      var pagingArea = $("#pagingArea");
      var searchForm = $("#searchForm");
      var searchBtn = $(".searchBtn"); // 검색 버튼
      var modalBody = $("#modalBody"); // 모달 tBody
      var checkBox = $(".checkBox");   // 체크박스
      var saveBtn = $("#saveBtn");
      var tBody = $("#tBody");
      
      // 페이징
      pagingArea.on("click", "a", function(event) {
         event.preventDefault();
         var pageNo = $(this).data("page");
         searchForm.find("#page").val(pageNo);
         searchForm.submit();
      });
      
      // 중복된 frcsName 숨기기
//       var previousFrcsName = null;

//       $("#tBody tr").each(function() {
//           var currentFrcsName = $(this).find("td:nth-child(1) a").text();
          
//           if (currentFrcsName !== previousFrcsName) {
//               $(this).show();
//           } else {
//               $(this).hide();
//           }

//           previousFrcsName = currentFrcsName;
//       });

      
      // 월 선택 이벤트 리스너를 추가하여 월별 데이터 필터링을 수행합니다.
      $("#monthSelect").on("change", function() {
         var selectedMonth = $(this).val();

         // 선택한 월을 기반으로 데이터 필터링
         $("#tBody tr").each(function() {
            var rowDate = $(this).find("td:nth-child(4)").text();
            var rowMonth = new Date(rowDate).getMonth() + 1;

            if (rowMonth === parseInt(selectedMonth)) {
               $(this).show();
            } else {
               $(this).hide();
            }
         });
      });

      $("#tBody").on("click", ".viewDetails", function (e) {
      
           var str = "";
           var frcsId = $(this).data('row-id'); 
           console.log('this => ', this);
           console.log('e => ', e);
           console.log(frcsId);

           $.ajax({
               type: "post",
               url: "/head/inspectionDetailModal.do",
               data: {
                   frcsId: frcsId
               },
               beforeSend: function (xhr) { // csrf 토큰 보내기 위함
                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); // key value로 보낸다.
               },
               success: function (res) {
                   console.log(res.length);
                   console.log(res);

                   for (var i = 0; i < res.length; i++) {
                       var frcsId = res[i].frcsId;
                       console.log(frcsId);

//                        var frcsName = res[i].frcsName;
                       var ipStts = res[i].ipStts;
                    // res에서 일자 값을 가져와서 변환
                       var ipDate = new Date(res[i].ipDate);
                       var formattedIpDate = ipDate.toLocaleDateString('ko-KR', {
                           year: '2-digit',
                           month: '2-digit',
                           day: '2-digit'
                       });

                       str += "<tr><td style='text-align:center' class='count'>" + (i + 1) + "</td>";
//                        str += "<td style='text-align:center' class='frcsName'>" + frcsName + "</td>";
                       str += "<td style='text-align:center' class='ipStts'>" + ipStts + "</td>";
                       str += "<td style='text-align:center' class='ipDate'>" + formattedIpDate + "</td>";
                   }
                   $("#tbdArea").html(str);
                   $('#detailModal').modal('show');
               }
           });
       });
      
      // 검색 ajax
      searchBtn.on("click",function(){
         var searchWord = $(".searchText").val();
         $.ajax({
            type : "post",
            url : "/head/frcsSearch.do",
            beforeSend : function(xhr){   // csrf토큰 보내기 위함
               xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");   //key value로 보낸다.
            }, 
            data : {searchWord : searchWord},
            success : function(res){
               modalBody.empty();
               
               if(res.length>0){
                  for(var i=0; i<res.length; i++){
                     var str = "<tr>";
                     str += "<td><div class='form-check'><input type='checkbox' class='form-check-input checkBox'></div></td>";
                     str += "<td class='frcsId'>"+res[i].frcsId+"</td>";
                     str += "<td class='frcsName'>"+res[i].frcsName+"</td>";
                     str += "</tr>";
                     modalBody.append(str);
                  }
               }else{
                  var str = "<tr>";
                  str += "<td colspan='4' style='text-align:center;'>검색하신 가맹점이 존재하지 않습니다.</td>"
                  str += "</tr>";
                  tBody.append(str);
               }
            }
         });
      });
      // 등록
      var selectedFrcsId; // 전역 변수로 선언
      
      // 첫 번째 모달에서 frcsId 선택 시
      modalBody.on("click", ".checkBox", function() {
         selectedFrcsId = $(this).closest("tr").find(".frcsId").text();
      });

      $("#saveBtn").on("click", function() {
          // 여기서 전역 변수 frcsId를 사용할 수 있음
          var inspDate = $("#inspDate").val();
          var inspScore = $("#inspScore").val();
      
          var formData = new FormData();
          formData.append("boFile", inspFile.files[0]);
           formData.append("frcsId", selectedFrcsId); // 선택한 frcsId를 사용
          formData.append("ipDate", inspDate);
          formData.append("ipStts", inspScore);
          
          $.ajax({
              type: "post",
              url: "/head/inspectionRegister.do",
              data: formData,
              processData: false,
              contentType: false,
              dataType: "json",
              beforeSend: function(xhr) {
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success: function(res) {
                  Swal.fire({
                          title: '알림창', // Alert 제목
                          text: '등록이 완료되었습니다.', // Alert 내용
                          icon: 'success', // Alert 타입
                      }).then((result) => {
                          if (result.isConfirmed) {
                            location.href = "/head/inspection.do";
                          }
                      });
                      console.log(res);
                  },
                  error: function() {
                      alert("데이터 저장 중 오류가 발생했습니다.");
                      console.log(data);
                  }
          });
      });

      // 파일 다운로드
      $(".fileDownload").on("click", function() {
         var attachNo = $(this).data("attach-no");

         location.href = "/head/inspectionDownload.do?attachNo=" + attachNo;
      });
   
      
});

</script>