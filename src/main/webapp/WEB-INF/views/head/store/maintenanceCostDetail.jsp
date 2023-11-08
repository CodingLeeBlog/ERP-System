<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jquery 데이터테이블 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>
<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

		<c:set value="${pagingVO.dataList }" var="dataList" />

		<!-- start page title -->
		<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">미납내역</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">가맹점의 미납내역을 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						관리비관리 / &nbsp;<span class="text-decoration-underline">미납내역 상세</span>
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
                                                <input class="form-control" id="example-date" type="date" name="date">
                                        </div>
		                                <div class="col-2">
		                                    <div class="d-flex align-items-center">
		                                        <label for="status-select" class="col-3">거래처</label>
		                                        <select class="form-select" id="status-select">
		                                            <option selected>선택해주세요</option>
		                                            <option value="1">대전대흥점</option>
		                                            <option value="2">대전선화점</option>
		                                        </select>
		                                    </div>
		                                </div>
                                        <div class="col-4">
                                            <div class="input-group">
                                                <label for="inputPassword2" class="visually-hidden">Search</label>
		                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search">
                                                <button type="button" class="btn btn-secondary">검색</button>
                                            </div>
		                                </div>
		                                <sec:csrfInput/>
		                            </form>                            
		                        </div>
		                        
		                        <div class="col-xl-2">
		                            <div class="text-xl-end mt-xl-0 mt-2">
		                                <a href="/head/officeLetter.do"><button type="button" class="btn btn-info mb-2 fw-bold">공문발송</button></a>
		                                <a href="/head/maintenanceCost.do"><button type="button" class="btn btn-danger mb-2 fw-bold">뒤로가기</button></a>
		                            </div>
		                        </div><!-- end col-->
		                    </div>
								                    
		                    <div class="table-responsive">
								                    
		                        <table class="table table-centered table-nowrap mb-0 table-hover" id="myTable">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:100px;">순번</th>
		                                    <th style="text-align:center; width:150px;">가맹점명</th>
		                                    <th style="text-align:center; width:100px;">미납연월</th>
		                                    <th style="text-align:center; width:150px;">가맹점비</th>
		                                    <th style="text-align:center; width:150px;">로열티</th>
		                                    <th style="text-align:center; width:150px;">매입금액</th>
		                                    <th style="text-align:center; width:150px;">트레이딩추가결제비</th>
		                                    <th style="text-align:center; width:150px;">트레이딩삭감비</th>
		                                    <th style="text-align:center; width:150px;">연체이자</th>
		                                    <th style="text-align:center; width:150px;">미납입금</th>
		                                </tr>
		                            </thead>
		                            <tbody id="tbody">
		                            	<c:forEach items="${dataList }" var="frlist" varStatus="status">
			                                <tr class="trclass">
			                                    <td style="text-align:center">
			                                    	${status.count }
			                                    </td>
				                                <td style="text-align:center">
	                                                ${frlist.frcsName }
				                                </td>
			                                    <td class="nonpay" style="text-align:center">${frlist.frcsNonpaydate }</td>
	                                            <td style="text-align:center">
	                                                ${frlist.frcsAmt }
	                                            </td>
			                                    <td style="text-align:center">
			                                        ${frlist.frcsRowal }
			                                    </td>
			                                    <td class="tdmodal" style="text-align:center; font-weight: bold; " data-frcsid="${frlist.frcsId }">
			                                    	<span class="tdspan" style="color: crimson; text-decoration: underline;">${frlist.orderAmt }</span>
			                                    </td>
			                                    <td style="text-align:center">
			                                    	${frlist.tradAdd }
			                                    </td>
			                                    <td style="text-align:center">
			                                    	${frlist.tradRedct }
			                                    </td>
			                                    <td style="text-align:center">
			                                    	${frlist.frcsbillOverdue }
			                                    </td>
			                                    <td style="text-align:center">
			                                    	${frlist.nonpayTotal }
			                                    </td>
			                                </tr>
	                                	</c:forEach>
                                        <tr>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center; color: brown; font-weight: bold;">총계 :</td>
                                            <td style="text-align:center; color: brown; font-weight: bold;">${total} (원)</td>
                                        </tr>
		                            </tbody>
		                        </table>
		                    </div>
		                    <br>
								<nav aria-label="Page navigation example" id="pagingArea">
		                           ${pagingVO.pagingHTML }
		                        </nav>
		               
		                </div> <!-- end card-body-->
		                
		            </div> <!-- end card-->
		        </div> <!-- end col -->
		    </div>
			<c:set value="${modalData }" var="modal" />	
             <!-- 모달 창 -->
            <!-- Standard modal -->
            <div id="standard-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="standard-modalLabel">매입금액</h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header align-items-center">
                                        <span style="color: brown; font-weight: bold; font-size: large;">매입내역</span>
                                    </div>
                                    <hr>
                                    <div class="card-body" style="overflow: auto; height:400px; ">
                                        <table class="table table-outline table-hover" style="border-collapse: collapse;">
                                            <thead style="position: sticky;top: 0px; background-color:#65A4BE;">
                                                    <tr>
                                                        <th style="text-align:center; font-weight: bold; color: white;">순번</th>
                                                        <th style="text-align:center; font-weight: bold; color: white;">발주번호</th>
                                                        <th style="text-align:center; font-weight: bold; color: white;">발주일자</th>
                                                        <th style="text-align:center; font-weight: bold; color: white;">발주총액</th>
                                                    </tr>
                                            </thead>
                                            <tbody id="modaltbody">
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->  

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
    var standardModal = $("#standard-modal");
    var tbody = $("#tbody");
    var modaltbody = $("#modaltbody");
    
    $('#myTable').DataTable({
        searching: false,
        paging: false,
        info: false,
        order: [[1, 'desc']]	// 정렬순서 바꿔주기
    });

    // a 태그를 클릭하면 이벤트 실행
    $("#pagingArea").on("click", "a", function(event){
        event.preventDefault();
        var pageNo = $(this).data("page");
        searchForm.find("#page").val(pageNo);
        searchForm.submit();
    });

    $("#tbody").on("click", ".tdmodal", function() {
        var frcsId = $(this).data("frcsid");
        var frcsNonpaydate = $(this).parents("tr").find(".nonpay").text();
        console.log(frcsId + " ::::: " + frcsNonpaydate);
        
        var modalHtml = "";
        
        var data = {
       		frcsId : frcsId,
       		frcsNonpaydate : frcsNonpaydate
        }
        
        $.ajax({
			type : "post",
			url : "/head/selectNonpayList.do",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log("여기까지왔나");
				
				var count = 1;
				
				$.each(res, function(idx, storeOrderHistoryVO){
					modalHtml += "<tr>";
					modalHtml += "      <td>" + count + "</td>";
					modalHtml += "      <td>" + storeOrderHistoryVO.frcsorderNo + "</td>";
					modalHtml += "      <td>" + storeOrderHistoryVO.frcsorderDate + "</td>";
					modalHtml += "      <td>" + storeOrderHistoryVO.frcsorderAmt + "</td>";
					modalHtml += "</tr>";
					
					count++;
				});
				
				modaltbody.html(modalHtml);
				
				$("#standard-modal").modal("show");	
			}
		});
        // ajax끝
        
    });
});


</script>