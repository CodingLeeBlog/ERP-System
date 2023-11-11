<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jquery 데이터테이블 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>

<script type="text/javascript">
$(function() {
    var checkboxesAdded = false;
    var selectedCheckboxes = []; // 배열로 선택한 체크박스 추적

    var updateBtn = $("#updateBtn");
	var deleteBtn = $("#deleteBtn");
    
	updateBtn.on("click", function() {
		var table = $("#myTable");
        var tbody = table.find("tbody");
        var thead = table.find("thead");
        var container = table.parent(); // 테이블의 부모 컨테이너 가져오기

        // 예를 들어, 특정 조건을 만족하면 체크박스를 추가하도록 설정
        if (!checkboxesAdded) {
            thead.find("tr").each(function() {
                var th = $(this).find("th:first");
                if (th.find("input.chkbox").length === 0) {
                    // 빈 셀과 체크박스를 추가
                    $("<th style='text-align:center; width:100px; color: red'>선택</th>").insertBefore(th);
                }
            });

            tbody.find("tr").each(function() {
                var td = $(this).find("td:first");
                var checkbox = td.find("input.chkbox");
                // 이미 체크박스가 있는지 확인
                if (td.find("input.chkbox").length === 0) {
                    // 빈 셀과 체크박스를 추가
                    $("<td style='text-align:center'><input type='checkbox' class='chkbox'></td>").insertBefore(td);
                }
            });

            checkboxesAdded = true;
        }

     // 체크박스의 변경 이벤트를 처리하여 한 개만 선택되도록 함
        $("input.chkbox").on("change", function() {
            if ($(this).prop("checked")) {
                // 다른 체크박스 해제
                $("input.chkbox").not(this).prop("checked", false);

                var vdCode = $(this).parents("tr").find("#vcd").text();
                $("#vdCodeHidden").val(vdCode);
                console.log("update해야할 vdCode값 -> ",$("#vdCodeHidden").val(vdCode));
                // "확인" 버튼 추가
                addConfirmButton();
            } else {
                // "확인" 버튼 제거
                removeConfirmButton();
            }
        });
     
        function addConfirmButton() {
            // 이미 "확인" 버튼이 있는지 확인
            if ($("#confirmButton").length === 0) {
                // "확인" 버튼을 추가
                var confirmBtn = $("<button id='confirmButton' class='btn btn-primary confirmUpdate' style='position:absolute; bottom:0; right:20px;'>확인</button>");
                // "확인" 버튼을 부모 컨테이너에 추가
                container.append(confirmBtn);
            }
        }

        // "확인" 버튼 제거
        function removeConfirmButton() {
            // "확인" 버튼을 제거
            $("#confirmButton").remove();
        }
	});
	
	
	// DELETE 기능 수행 
 	deleteBtn.on("click", function() {
	var table = $("#myTable");
    var tbody = table.find("tbody");
    var thead = table.find("thead");
    var container = table.parent(); // 테이블의 부모 컨테이너 가져오기

    // 예를 들어, 특정 조건을 만족하면 체크박스를 추가하도록 설정
    if (!checkboxesAdded) {
        thead.find("tr").each(function() {
            var th = $(this).find("th:first");
            if (th.find("input.chkbox").length === 0) {
                // 빈 셀과 체크박스를 추가
                $("<th style='text-align:center; width:100px; color: red'>선택</th>").insertBefore(th);
            }
        });

        tbody.find("tr").each(function() {
            var td = $(this).find("td:first");
            var checkbox = td.find("input.chkbox");
            // 이미 체크박스가 있는지 확인
            if (td.find("input.chkbox").length === 0) {
                // 빈 셀과 체크박스를 추가
                $("<td style='text-align:center'><input type='checkbox' class='chkbox'></td>").insertBefore(td);
            }
        });

        checkboxesAdded = true;
    }

 // 체크박스의 변경 이벤트를 처리하여 한 개만 선택되도록 함
    $("input.chkbox").on("change", function() {
        if ($(this).prop("checked")) {
            // 다른 체크박스 해제
            $("input.chkbox").not(this).prop("checked", false);

            var vdCode = $(this).parents("tr").find("#vcd").text();
            $("#vdCodeHidden2").val(vdCode);
            console.log("delete해야할 vdCode값 -> ",$("#vdCodeHidden2").val(vdCode));
            // "확인" 버튼 추가
            addConfirmButton();
        } else {
            // "확인" 버튼 제거
            removeConfirmButton();
        }
    });
 
    function addConfirmButton() {
        // 이미 "확인" 버튼이 있는지 확인
        if ($("#confirmButton").length === 0) {
            // "확인" 버튼을 추가
            var confirmBtn = $("<button id='confirmButton' class='btn btn-primary confirmDelete' style='position:absolute; bottom:0; right:20px;'>확인</button>");
            // "확인" 버튼을 부모 컨테이너에 추가
            container.append(confirmBtn);
        }
    }

    // "확인" 버튼 제거
    function removeConfirmButton() {
        // "확인" 버튼을 제거
        $("#confirmButton").remove();
    }
});
	
	
 // 수정버튼 클릭 후 생성된 체크박스를 체크 한 후에 동적으로 생성된 확인 버튼을 클릭했을때 이벤트
	$("#cont").on("click", "#confirmButton", function(){
		
		console.log("confirmUpdate존재유무 -> ",  $(this).hasClass('confirmUpdate'));
		
		if($(this).hasClass('confirmUpdate')){
			$("#udtFrm").submit();	
		}else if($(this).hasClass('confirmDelete')){
 		    			    	
	    	Swal.fire({
	            title: "삭제불가!!",
	            text: "사장님에게문의하세요",
	            confirmButtonText: "확인",
	            icon: "error",
	            preConfirm: function () {
	                location.href = "/head/customerList.do";
	            }
	        });
	    	// SweetAlarm 끝
	    	
// 			$("#delFrm").submit();
		}
	});
 
 
});
</script>

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

		<!-- start page title -->
		<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">거래처관리</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">거래처를 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						주문거래관리 / &nbsp;<span class="text-decoration-underline">거래처관리</span>
					</div>
				</div>
			</div>
            <!-- end page title -->

            <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
		                        <div class="col-xl-10">
		                        <form id="searchForm" method="post" class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
		                           	<input type="hidden" name="page" id="page"/>
		                                <!-- Predefined Date Ranges -->
                                        <div class="col-2">
                                                <input class="form-control" id="example-date" type="date" name="date">
                                        </div>
                                        <div class="col-auto">
                                            <span>~</span>
                                        </div>
                                        <div class="col-2">
                                                <input class="form-control" id="example-date1" type="date" name="date">
                                        </div>

		                                <div class="col-2">
		                                    <div class="d-flex align-items-center">
		                                        <label for="status-select" class="col-3">분류</label>
		                                        <select class="form-select" id="vendorStatus" name="searchCategory">
		                                            <option value="">선택해주세요</option>
		                                            <option value="잡화" <c:if test="${searchCategory eq '잡화' }">selected</c:if>>잡화</option>
		                                            <option value="소스" <c:if test="${searchCategory eq '소스' }">selected</c:if>>소스</option>
		                                            <option value="수산" <c:if test="${searchCategory eq '수산' }">selected</c:if>>수산</option>
		                                            <option value="냉동제품" <c:if test="${searchCategory eq '냉동제품' }">selected</c:if>>냉동제품</option>
		                                        </select>
		                                    </div>
		                                </div>
                                        <div class="col-4">
                                            <div class="input-group">
                                                <label for="inputPassword2" class="visually-hidden">Search</label>
<%-- 		                                        <input type="search" class="form-control" name="searchVendor" value="${param.searchVendor}" placeholder="Search"> --%>
		                                        <input type="search" class="form-control" name="searchVendor" placeholder="Search">
                                                <button type="submit" class="btn btn-secondary" >검색</button>
                                            </div>
		                                </div>
		                                <sec:csrfInput/>
		                            </form>               
		                        </div>
		                        
		                        <div class="col-xl-2">
		                            <div class="text-xl-end mt-xl-0 mt-2">
		                            	<div class="clickBtnGrp">
		                                	<button type="button" class="btn btn-info mb-2 fw-bold" onclick="javascript:location.href='/head/customerListRegister.do'">등록</button>
			                                <button id="updateBtn" data-type="upd" type="button" class="btn btn-info mb-2 fw-bold">수정</button>
			                                <button id="deleteBtn" data-type="del"  type="button" class="btn btn-danger mb-2 fw-bold">삭제</button>
		                                </div>
		                            </div>
		                        </div><!-- end col-->
		                    </div>
		
		                    <div class="table-responsive mb-3" id="cont">
		                    
		                        <table id="myTable" class="table table-centered table-nowrap mb-0 table-hover">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:100px;">순번</th>
		                                    <th style="text-align:center; width:100px;">거래처코드</th>
                                            <th style="text-align:center; width:150px;">거래처명</th>
		                                    <th style="text-align:center; width:100px;">연락처</th>
                                            <th style="text-align:center; width:120px;">거래처주소</th>
		                                    <th style="text-align:center; width:150px;">담당자</th>
                                            <th style="text-align:center; width:150px;">이메일</th>
		                                    <th style="text-align:center; width:150px;">분류</th>
		                                </tr>
		                            </thead>
		                            
		                            <c:set value="${pagingVO.dataList }" var="vendorList"/>
		                            <tbody id="tBody">
		                            <c:choose>
		                            	<c:when test="${empty vendorList }">
		                            			<tr>
		                            				<td colspan="7">조회하신 거래처가 존재하지 않습니다.</td>
		                            			</tr>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<c:forEach items="${vendorList }" var="vdList">
					                                <tr class="chktr">
					                                    <td style="text-align:center">${vdList.rnum }</td>
					                                    <td style="text-align:center" id="vcd">${vdList.vdCode }</td>
			                                            <td style="text-align:center">${vdList.vdName }</td>
					                                    <td style="text-align:center">
					                                    	${vdList.vdPhone }
					                                    </td>
						                                <td style="text-align:left">
			                                                ${vdList.vdAdd1 }&nbsp;${vdList.vdAdd2 }
						                                </td>
			                                            <td style="text-align:center">
			                                                ${vdList.vdManager }
			                                            </td>
			                                            <td style="text-align:left">
			                                                ${vdList.vdEmail }
			                                            </td>
					                                    <td style="text-align:center">
					                                        ${vdList.vdCategory }
					                                    </td>
					                                </tr>
		                            		</c:forEach>
		                            	</c:otherwise>
		                            </c:choose>
		                            </tbody>
		                        </table>
		                        <nav aria-label="Page navigation example" id="pagingArea">
									${pagingVO.pagingHTML }
								</nav>
		                    </div>
		               
		                </div> <!-- end card-body-->
		                <form action="/head/vendorUpdate.do" method="post" id="udtFrm">
		                	<input type="hidden" name="vdCode" value="" id="vdCodeHidden"/>
		                	<sec:csrfInput/>
		                </form>
		                <form action="/head/vendorDelete.do" method="post" id="delFrm">
		                	<input type="hidden" name="vdCode" value="" id="vdCodeHidden2"/>
		                	<sec:csrfInput/>
		                </form>
		            </div> <!-- end card-->
		        </div> <!-- end col -->
		    </div>

             <!-- 모달 창 -->
            

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
	var searchForm = $("#searchForm");
	
	$('#myTable').DataTable({
		 searching: false,
		 paging:false,
		 info:false
	 });
	
	var vendorStatus = $("#vendorStatus");
	var vdCategory = "";
	var data = "";
	var html = "";
	var tBody = $("#tBody");
	
	// a 태그를 클릭하면 이벤트 실행
	$("#pagingArea").on("click","a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	

// 	$("#vendorStatus").on("change", function(){
		
// 		console.log("vendorStatus_change");
		
// 		// select한 요소 (냉동, 수산, 잡화, 소스)
// 		vdCategory = vendorStatus.val();
// 		console.log("vdCategory : " + vdCategory);
		
// 		var vendorObject = {
// 				vdCategory : vdCategory
// 		}
		
// 		$.ajax({
// 			type : "post",
// 			url : "/head/selectVendorList.do",
// 			beforeSend : function(xhr){
// 				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
// 			},
// 			data : JSON.stringify(vendorObject),
// 			contentType : "application/json; charset=utf-8",
// 			success : function(res){
// 				tBody.empty();
// 				$.each(res, function(idx,dataList){
// 					data = 
// 						"<tr>" +
// 							"<td style='text-align:center'>"+ dataList.rnum +"</td>" +
// 							"<td style='text-align:center'>"+ dataList.vdName +"</td>" +
// 							"<td style='text-align:center'>"+ dataList.vdPhone +"</td>" +
// 							"<td style='text-align:center'>"+ dataList.vdAdd1 + "&nbsp;" + dataList.vdAdd2 +"</td>" +
// 							"<td style='text-align:center'>"+ dataList.vdManager +"</td>" +
// 							"<td style='text-align:center'>"+ dataList.vdEmail +"</td>" +
// 							"<td style='text-align:center'>"+ dataList.vdCategory +"</td>" +
// 						"</tr>"
// 				});
// 				tBody.append(data);
// 			}
// 		});
		
// 	});
});
</script>