<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">홈</a></li>
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">주문 거래 관리</a></li>
		                        <li class="breadcrumb-item active">발주 내역</li>
		                    </ol>
		                </div>
		                <h4 class="page-title">발주 내역</h4>
		            </div>
		        </div>
		    </div>
		    <!-- end page title -->
		
		    <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
							    <div class="col-xl-8">
							        <form id="searchForm" class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">		                                
 									<input type="hidden" name="page" id="page"/>
									 <div class="col-2">
                                       	<input class="form-control" id="afterDate" name="afterDate" type="date" name="date" value="${afterDate }">
                                     </div>
                                     <div class="col-auto">-</div>
                                     <div class="col-2">
                                       	<input class="form-control" id="beforeDate" name="beforeDate" type="date" name="date" value="${beforeDate }">
                                     </div>
	                                 <div class="col-auto">
	                                    <div class="d-flex align-items-center d-flex align-items-baseline">
	                                 <button type="submit" class="btn btn-primary" id="searchBtn">
									    <i class="mdi mdi-magnify search-icon"></i>검색                            			
	                                 </button>
	                                	</div>
	                                 </div>
	                           		 </form> 
							    </div>
							    <div class="col-xl-4">
							        <div class="text-xl-end mt-xl-0 mt-2">
							            <button type="button" class="btn btn-success mb-2" onclick="location.href='/owner/orderDetail/excel.do'">엑셀 다운로드</button>
							        </div>
							    </div>
							</div>
		                    <div class="table-responsive">
		                        <table class="table table-centered table-nowrap mb-0 table-hover">
		                            <thead class="table-light">
		                                <tr>
		                                   <th style="width: 20px;"></th>
		                                    <th style="text-align:center; width:100px;">주문번호</th>
		                                    <th style="text-align:center; width:150px;">주문명</th>
		                                    <th style="text-align:center; width:150px;">주문금액</th>
		                                    <th style="text-align:center; width:150px;">주문일자</th>
		                                    <th style="text-align:center; width:150px;">승인여부</th>
		                                    <th style="text-align:center; width:150px;"></th>
		                                </tr>
		                            </thead>
		                            <tbody id="tBody">
		                            <c:set value="${pagingVO.dataList }" var="orderList" />
		                            <c:choose>
		                            	<c:when test="${empty orderList }">
		                            		<tr>
		                            			<td colspan="7" style="text-align:center">
		                            				발주 내역이 존재하지 않습니다.
		                            			</td>
		                            		</tr>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<c:forEach items="${orderList }" var="order" varStatus="stat">
			                            		<tr>
				                                    <td></td>
				                                    <td style="text-align:center" class="orderNo">${order.frcsOrderNo }</td>
				                                    <td style="text-align:center">
				                                    <a href="javascript: void(0);" data-bs-toggle="modal" data-bs-target="#detailModal">${order.frcsOrderName }</a>
					                                    <div id="detailModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
													    <div class="modal-dialog modal-dialog-centered modal-lg">
													        <div class="modal-content">
													        <div class="modal-header">
                                                                <h3 class="modal-title" id="mySmallModalLabel">발주 상세내역</h3>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
													            <div class="modal-body">
													                <div class="table-responsive">
												                        <table class="table table-centered table-nowrap mb-0">
												                            <thead class="table-light">
												                                <tr>
												                                    <th style="text-align:center; width:100px;">순번</th>
												                                    <th style="text-align:center; width:200px;">제품명</th>
												                                    <th style="text-align:center; width:150px;">주문수량</th>
												                                    <th style="text-align:center; width:150px;">구매가</th>
												                                </tr>
												                            </thead>
												                            <tbody id="tbdArea">
												                            		
												                            </tbody>
												                        </table>
												                    </div>
													            </div>
													        </div>
													    </div>
													</div>
				                                    </td>
					                                <td style="text-align:center"><fmt:formatNumber value="${order.frcsOrderAmt }" type="number"/>(원)
					                                </td>
				                                    <td style="text-align:center">
				                                    <fmt:formatDate value="${order.frcsOrderDate }" pattern="yyyy/MM/dd"/>
				                                    </td>
				                                    <td style="text-align:center" class="orderConfm">${order.frcsOrderConfm }</td>
				                                    <td style="text-align:center">
				                                    	<c:if test="${order.frcsOrderConfm eq '승인' }">
					                                	    <button type="button" class="btn btn-light" disabled>승인 완료</button>
				                                    	</c:if>
				                                    	<c:if test="${order.frcsOrderConfm eq '대기' }">
					                                	    <button type="button" class="btn btn-danger cancelModalBtn">주문 취소</button>
				                                    	</c:if>
				                                    	<c:if test="${order.frcsOrderConfm eq '취소' }">
					                          	        	<button type="button" class="btn btn-light" disabled>취소 완료</button>
				                                    	</c:if>
		                                    			<c:if test="${order.frcsOrderConfm eq '반려' }">
		                                    			<button  type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#bs-example-modal-lg">반려사유확인</button>
															<div id="bs-example-modal-lg" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
															    <div class="modal-dialog modal-sm modal-dialog-centered">
															        <div class="modal-content">
															            <div class="modal-body p-4">
															                <div class="text-center">
															                    <i class="ri-alert-line h1 text-warning"></i>
															                    <h3 class="mt-2">반려사유</h3>
															                    <h4 class="mt-3">${order.frcsOrderReturn }</h4>
															                    <button type="button" class="btn btn-warning my-2" data-bs-dismiss="modal">확인</button>
															                </div>
															            </div>
															        </div>
															    </div>
															</div>
				                                    	</c:if>
					                                </td>
				                                </tr>
	                            			</c:forEach>
		                            	</c:otherwise>
		                            </c:choose>
		                            </tbody>
		                        </table>
		                    </div>
		                    <br>
							<nav aria-label="Page navigation example" id="pagingArea">
								${pagingVO.pagingHTML }
							</nav>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
var tBody = $("#tBody");
var pagingArea = $("#pagingArea");
var searchForm = $("#searchForm");

	// 페이징처리
	pagingArea.on("click","a",function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});	

	tBody.on("click",".cancelModalBtn",function(){
    	var msg = "<p style='font-size: 25px; margin: 0;'>주문 취소하시겠습니까?</p>";
        msg += "<p style='font-size: 15px; color:red; margin: 0;'> (※ 한 번 취소한 내역은 복구 할 수 없습니다)</p>";

        // 주문 번호
        var frcsOrderNo = $(this).closest('tr').find('.orderNo').text();
        console.log(frcsOrderNo);
        
        Swal.fire({
            title: "알림",
            html: msg,
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "확인",
            cancelButtonText: "취소",
            // 확인 버튼 시 상태  취소 상태로 변경
            preConfirm: function() {
	           	$.ajax({
	           		type: "post",
	           		url : "/owner/orderCancel.do",
	           		data : {frcsOrderNo : frcsOrderNo},
	           		beforeSend : function(xhr){	// csrf토큰 보내기 위함
	    				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
	    			},
	    			success: function (res) {
	    			    console.log(res);
	    			    if (res === "OK") {
	    			        Swal.fire({
	    			            title: "알림",
	    			            text: "취소가 완료되었습니다",
	    			            confirmButtonText: "확인",
	    			            icon: "success",
	    			            preConfirm: function () {
	    			                location.href = "/owner/orderDetail.do";
	    			            }
	    			        });
	    			    }
	    			}
	           	});
            },
        });
	});

	// 주문 상세 내역
	tBody.on("click","a",function(){
		var str= "";
		var thisTr = $(this).closest('tr');
		var frcsOrderNo = thisTr.find('.orderNo').text();
		console.log(frcsOrderNo);
		
		$.ajax({
			type : "post",
			url : "/owner/orderDetailModal.do",
			data : {frcsOrderNo : frcsOrderNo},
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			success: function (res) {
				console.log(res.orderDetailList.length);
				console.log(res);
					
					var orderNo = res.frcsOrderNo;	// 주문번호
					var	orderAmt = res.frcsOrderAmt;	// 주문 총 금액
					console.log(orderNo);
					console.log(orderAmt);
				
				for(var i=0; i<res.orderDetailList.length; i++){
					var vdprodName= res.orderDetailList[i].vdprodName;
					var hdforwardPrice = res.orderDetailList[i].hdforwardPrice;
					var frcsOrderQy = res.orderDetailList[i].frcsOrderQy;
					
					str += "<tr><td style='text-align:center' class='count'>" + (i+1) + "</td>";
					str += "<td style='text-align:center' class='vdprodName'>" + vdprodName + "</td>";
					str += "<td style='text-align:center' class='frcsOrderQy'>" + frcsOrderQy + "</td>";
					str += "<td style='text-align:center' class='hdforwardPrice'>" + hdforwardPrice + "</td></tr>";
					}
					$("#tbdArea").html(str);
				    $('#detailModal').modal('show');
			}
		});
	});
});
</script>