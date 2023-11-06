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
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">주문 거래 관리</a></li>
		                        <li class="breadcrumb-item active">발주 신청</li>
		                    </ol>
		                </div>
		                <h4 class="page-title">발주 신청</h4>
		            </div>
		        </div>
		    </div>

		    <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
		                        <div class="col-xl-8"><h4 class="mt-1 mb-3">발주 가능 리스트</h4></div>
		                        <div class="col-xl-4">
		                            <form id="searchForm" class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">		                                
<!--  									<input type="hidden" name="page" id="page"/> -->
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
		                    </div>
		                    <br>
							<div class="card-body py-0" data-simplebar style="max-height: 580px;">
		                    <div class="table-responsive">
		                        <table class="table table-centered table-nowrap mb-0 table-hover">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:150px;">제품 코드</th>
		                                    <th style="text-align:center; width:200px;">제품명</th>
		                                    <th style="text-align:center; width:150px;">현 재고수량</th>
		                                    <th style="text-align:center; width:150px;">적정 재고수량</th>
		                                    <th style="text-align:center; width:150px;">구매가</th>
		                                    <th style="text-align:center; width:150px;">주문수량</th>
		                                    <th style="text-align:center; width:150px;">주문예상금액</th>
		                                    <th style="text-align:center; width:150px;"></th>
		                                </tr>
		                            </thead>
		                            <tbody id="tBody">
		                            <c:choose>
		                            	<c:when test="${empty inventList }">
		                            		<tr id="empty">
		                            			<td colspan="8" style="text-align:center">
		                            				주문 가능한 제품이 존재하지 않습니다.
		                            			</td>
		                            		</tr>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<c:forEach items="${inventList }" var="invent">
		                            			<tr	class="addTr" >
				                                    <td style="text-align:center"><p data-prodCd="${invent.vdprodCd }" align="center" style="margin: 0;">${invent.vdprodCd }</p></td>
				                                    <td style="text-align:center" class="vdProdNameTd">${invent.vdprodName }</td>
					                                <td style="text-align:center" class="invntryQyTd">${invent.invntryQy }</td>
				                                    <td style="text-align:center" class="proprtQyTd">${invent.proprtQy }</td>
				                                    <td style="text-align:center" class="hdforwardPriceTd">${invent.hdforwardPrice }</td>
				                                    <td style="text-align:center">
					                                    <div class="input-group bootstrap-touchspin bootstrap-touchspin-injected"><span class="input-group-btn input-group-prepend"><button class="btn btn-primary bootstrap-touchspin-down orderDown" type="button">-</button></span>
					                                    <input data-toggle="touchspin" type="text" value="0" class="form-control text-end orderQyInput">
					                                    <span class="input-group-btn input-group-append"><button class="btn btn-primary bootstrap-touchspin-up orderUp" type="button">+</button></span></div>
				                                    </td>
				                                    <td style="text-align:center">
				                                    	<span class="orderTotal">0</span>
				                                    </td>
				                                    <td style="text-align:center">
														<button type="button" class="btn btn-info addBtn">추가</button>
				                                    </td>
		                              			 </tr>
		                            		</c:forEach>
		                            	</c:otherwise>
		                            </c:choose>
		                            </tbody>
		                        </table>
		                    </div>
		                    </div>
		                    <br>
<!-- 								<nav aria-label="Page navigation example" id="pagingArea"> -->
<%-- 									${pagingVO.pagingHTML } --%>
<!-- 								</nav> -->
		       		         </div>
		       		  	</div> 
		     	   </div> 
			</div>
			
			<!-- 발주 물품 내역 -->
			<div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                	<div class="row mb-2">
		                        <div class="col-xl-8"><h4 class="mt-1 mb-3">발주 리스트</h4></div>
		                        <div class="col-xl-3"><h4 class="mt-1 mb-3">총 발주 금액<input type="number" class="text-end" id="totalPrice" disabled style="margin-left: 1rem;" ></h4></div>
		                        <div class="col-xl-1">
	                            <!-- 모달 1 -->
								<div id="multiple-one" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="centermodal">
								    <div class="modal-dialog modal-dialog-centered modal-lg">
								        <div class="modal-content">
								            <div class="modal-header">
								                <h4 class="modal-title" id="myCenterModalLabel">발주내역확인</h4>
								                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								            </div>
								            <div class="modal-body">
								               <table class="table table-centered table-nowrap mb-0 table-hover">
						                            <thead class="table-light">
						                                <tr>
						                                    <th style="text-align:center; width:100px;">순번</th>
						                                    <th style="text-align:center; width:200px;">제품명</th>
						                                    <th style="text-align:center; width:150px;">수량</th>
						                                    <th style="text-align:center; width:150px;">합계</th>
						                                </tr>
						                            </thead>
						                            <tbody id="modalBody">
						                            </tbody>
						                        </table>
									            </div>
								            <div class="modal-footer">
								                <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
						               			<button type="button" class="btn btn-primary" id="orderBtn" data-bs-dismiss="modal">발주하기</button>
								            </div>
								        </div>
								    </div>
								</div>
								
								<!-- 이중 모달창 버튼 -->
								<div class="d-flex flex-wrap gap-2">
								    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#multiple-one" id="orderModalBtn">발주하기</button>
								</div>
		                    </div>
		                    </div>
		                    <br>
		                  	  <div class="table-responsive">
		                        <table class="table table-centered table-nowrap mb-0 table-hover">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:150px;">제품 코드</th>
		                                    <th style="text-align:center; width:200px;">제품명</th>
		                                    <th style="text-align:center; width:150px;">현 재고수량</th>
		                                    <th style="text-align:center; width:150px;">적정 재고수량</th>
		                                    <th style="text-align:center; width:150px;">구매가</th>
		                                    <th style="text-align:center; width:150px;">주문수량</th>
		                                    <th style="text-align:center; width:150px;">주문예상금액</th>
		                                    <th style="text-align:center; width:150px;"></th>
		                                </tr>
		                            </thead>
		                            <tbody id="addTbody">
		                            <c:choose>
		                            	<c:when test="${empty autoList }">
			                            	<tr>
			                            		<td colspan="8" style="text-align:center">
			                            			발주 내역이 존재하지 않습니다.
		                            			</td>
			                            	</tr>
		                            	</c:when>
										<c:otherwise>
											<c:forEach items="${autoList }" var="auto">
												<tr class="addTr">
													<td style="text-align:center" class="addTrProdCd">${auto.vdprodCd }</td>
													<td style="text-align:center">${auto.vdprodName }</td>
													<td style="text-align:center">${auto.invntryQy }</td>
													<td style="text-align:center">${auto.proprtQy }</td>
													<td style="text-align:center">${auto.hdforwardPrice }</td>
													<td style="text-align:center">${auto.atorderQy }</td>
													<td style="text-align:center" class="addTrOrderPrice">${auto.atorderQy*auto.hdforwardPrice }</td>
													<td style="text-align:center">
													<input type="button" class="btn btn-danger delBtn" value="삭제">
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>		                            
		                            </c:choose>
		                            
		                            </tbody>
		                        </table>
		                    </div>
		                    <br>
		       		        </div>
		       		  	</div>
		     	   </div>
			    </div>
			</div>
		</div>
	</div> 
<script type="text/javascript">
$(function(){
// 	var pagingArea = $("#pagingArea");
// 	var searchForm = $("#searchForm");
	var tBody = $("#tBody");
	var addTbody = $("#addTbody");
	var orderQyVal;
	var dataArr = new Array();	// 발주 상품 추가 시 제품 정보를 저장하는 배열
	var totalPrice = 0;	// 발주 상품 추가 시 총 금액을 저장
	var orderModalBtn = $("#orderModalBtn");	// 발주하기 모달 버튼
	var orderBtn = $("#orderBtn"); 	// 발주 모달 안 발주하기 버튼
	
	// 페이징처리
// 	pagingArea.on("click","a",function(event){
// 		event.preventDefault();
// 		var pageNo = $(this).data("page");
		
// 		$.ajax({
			
// 		});
		
// 		searchForm.find("#page").val(pageNo);
// 		searchForm.submit();
// 	});

	// 검색 ajax
	$("#searchBtn").on("click",function(){
		var searchType = $("#searchType").val();
		var searchWord = $("#searchWord").val();
		
		var data = {
			searchType : searchType,
			searchWord : searchWord
		};
		
		$.ajax({
			type: "post",
			url : "/owner/order/orderSearch.do",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(list){
				console.log(list);
				// tBody 안에 있는 정보 초기화
				tBody.empty();
				
				console.log(list.length);
				
				// 검색 결과가 없으면
				if(list.length == 0){
					var newRow = "<tr id='empty'>";
					newRow += "<td colspan='8' style='text-align:center'>검색하신 제품이 존재하지 않습니다.</td></tr>"
					tBody.append(newRow);
				}else{
				$.each(list, function(index, res){
                    // 검색 결과 넣기
                    var newRow = "<tr class='addTr'>" +
                        "<td style='text-align:center'><p data-prodCd='"+res.vdprodCd+"' align='center' style='margin: 0;''>" + res.vdprodCd + "</p></td>" +
                        "<td style='text-align:center' class='vdProdNameTd'>" + res.vdprodName + "</td>" +
                        "<td style='text-align:center' class='invntryQyTd'>" + res.invntryQy + "</td>" +
                        "<td style='text-align:center' class='proprtQyTd'>" + res.proprtQy + "</td>" +
                        "<td style='text-align:center' class='hdforwardPriceTd'>" + res.hdforwardPrice + "</td>" +
                        "<td style='text-align:center'><div class='input-group bootstrap-touchspin bootstrap-touchspin-injected'><span class='input-group-btn input-group-prepend'><button class='btn btn-primary bootstrap-touchspin-down orderDown' type='button'>-</button></span>" +
                        "<input data-toggle='touchspin' type='text' value='0' class='form-control text-end orderQyInput'>" +
                        "<span class='input-group-btn input-group-append'><button class='btn btn-primary bootstrap-touchspin-up orderUp' type='button'>+</button></span></div></td>" +
                        "<td style='text-align:center'><span class='orderTotal'>0</span></td>" +
                        "<td style='text-align:center'><button type='button' class='btn btn-info addBtn'>추가</button></td>" + 
                        "</tr>";
                      tBody.append(newRow);
                });
				}
			}
		});
	});
	
	// 주문수량 -
	tBody.on("click",".orderDown",function(){
		console.log($(this));
	    var orderQyInput = $(this).closest('tr').find(".orderQyInput"); 
	    var orderTotalSpan = $(this).closest('tr').find(".orderTotal");	// 주문예상금액
	    var hdforwardPriceTd = $(this).closest('tr').find(".hdforwardPriceTd").text();	// 제품금액
	   	var hdforwardPrice = parseInt(hdforwardPriceTd);
	    orderQyVal = parseInt(orderQyInput.val());
	    if(orderQyVal > 0){
	    orderQyVal -= 1; // 1 감소
	    orderQyInput.val(orderQyVal);
	    // 주문수량 * 구매가 
	    orderTotalSpan.text(hdforwardPrice*orderQyVal);
	    }
	});
	    	
	
	// 주문수량 +
	tBody.on("click",".orderUp",function(){
	    var orderQyInput = $(this).closest('tr').find(".orderQyInput"); 
	    var orderTotalSpan = $(this).closest('tr').find(".orderTotal");	// 주문예상금액
	    var hdforwardPriceTd = $(this).closest('tr').find(".hdforwardPriceTd").text();	// 제품금액
	   	var hdforwardPrice = parseInt(hdforwardPriceTd);
	    orderQyVal = parseInt(orderQyInput.val()); 
	    orderQyVal += 1; // 1 증가
	    orderQyInput.val(orderQyVal); 
	    // 주문수량 * 구매가 
	    orderTotalSpan.text(hdforwardPrice*orderQyVal);
	});
	
	
	// 자동발주리스트 가져오기
	for(var i=0; i<addTbody.children().length; i++){
		var tr = addTbody.children().eq(i);
		var td = tr.children();
		var orderProdCd = td.eq(0).text();
		var orderProdName = td.eq(1).text();
		var orderInvntryQy = td.eq(2).text();
		var orderProprtQy = td.eq(3).text();
		var orderHdforwardPrice = parseInt(td.eq(4).text());
		var orderQy = parseInt(td.eq(5).text());
		var orderPrice = parseInt(td.eq(6).text());

		dataArr.push(orderProdCd + "/" + orderProdName + "/" + orderInvntryQy + "/" + orderProprtQy + "/" +  orderHdforwardPrice + "/" + orderQy + "/" + orderPrice);
		totalPrice += orderPrice;

	}
		$("#totalPrice").val(totalPrice);
	
	
	// 추가 버튼 클릭 시 하단 card에 장바구니처럼 담기게
	tBody.on("click",".addBtn",function(){
		var dataFlag = false;	// 중복 제품을 확인하기 위한 플래그
		var html = "";
		
		var orderProdCd = $(this).closest('tr').find('p').data('prodcd');	// 제품코드
		var orderProdName = $(this).closest('tr').find('.vdProdNameTd').text();	// 제품명
		var orderInvntryQy = $(this).closest('tr').find('.invntryQyTd').text();	// 현 재고량
		var orderProprtQy = $(this).closest('tr').find('.proprtQyTd').text();	// 적정재고수량
		var orderHdforwardPrice = parseInt($(this).closest('tr').find(".hdforwardPriceTd").text());	// 구매가
	    var orderQy = parseInt($(this).closest('tr').find(".orderQyInput").val()); 	// 주문 수량
		var orderPrice = parseInt($(this).closest('tr').find(".orderTotal").text());	// 주문예상금액

		console.log("dataArr : " , dataArr);
		console.log("orderQy : " ,  orderQy);
		console.log("orderProdCd : " ,  orderProdCd);
		
		
		// 배열에 데이터가 없으면
		if(dataArr.length == 0){
			console.log("배열에 아무 데이터도 없음");
			// 배열에 데이터 추가
			dataArr.push(orderProdCd + "/" + orderProdName + "/" + orderInvntryQy + "/" + orderProprtQy + "/" +  orderHdforwardPrice + "/" + orderQy + "/" + orderPrice);
			totalPrice += orderPrice;
		}else{
			// 배열에 데이터가 있으면
			for(var i=0; i<dataArr.length; i++){
				// 배열에 존재하는 데이터와 내가 누른 데이터가 일치하면
				if(orderProdCd == dataArr[i].split("/")[0]){
					console.log("배열에 내가 이미 누른 데이터가 존재함");
					
					// 추가한 만큼 수량과 총 금액을 더해줘야한다...
					var existOrderQy = parseInt(dataArr[i].split("/")[5]);
					existOrderQy += orderQy;
					var existOrderPrice = parseInt(dataArr[i].split("/")[6]);
					existOrderPrice += orderPrice;
					
					totalPrice += orderPrice;
					// 다시 배열에 넣기
					dataArr[i] = dataArr[i].split("/")[0] + "/" + dataArr[i].split("/")[1] + "/" + dataArr[i].split("/")[2] + "/" + dataArr[i].split("/")[3] + "/" + dataArr[i].split("/")[4] + "/" + existOrderQy + "/" + existOrderPrice;
					
					dataFlag = true;
					break;
				}
			}
			// 배열에 존재하는 데이터에 내가 누른 데이터는 없음
			if(dataFlag == false){
				console.log("배열에 데이터는 있으나 내가 원하는 데이터는 없음");
				dataArr.push(orderProdCd+ "/" + orderProdName + "/" + orderInvntryQy + "/" + orderProprtQy + "/" +  orderHdforwardPrice + "/" + orderQy + "/" + orderPrice);
				totalPrice += orderPrice;
			}
		}
		
		for(var i=0; i<dataArr.length; i++){
			html += "<tr class='addTr'>";
			html += "<td style='text-align:center' class='addTrProdCd'>" + dataArr[i].split("/")[0] + "</td>";
			html += "<td style='text-align:center'>" + dataArr[i].split("/")[1] + "</td>";
			html += "<td style='text-align:center'>" + dataArr[i].split("/")[2] + "</td>";
			html += "<td style='text-align:center'>" + dataArr[i].split("/")[3] + "</td>";
			html += "<td style='text-align:center'>" + dataArr[i].split("/")[4] + "</td>";
			html += "<td style='text-align:center'>" + dataArr[i].split("/")[5] + "</td>";
			html += "<td style='text-align:center'class='addTrOrderPrice'>" + dataArr[i].split("/")[6] + "</td>";
			html += "<td style='text-align:center'>";
			html += "<input type='button' class='btn btn-danger delBtn' value='삭제'></td>";
			html += "</tr>";
		}
			
			addTbody.html(html);
			$("#totalPrice").val(totalPrice);
			
			$(this).closest('tr').find(".orderQyInput").val(0); 
			$(this).closest('tr').find(".orderTotal").text(0);
			
		});
	

	
	// 삭제 버튼 클릭 시 발주 주문 내역에서 사라지게
	addTbody.on("click",".delBtn",function(){
		// 내가 클릭한 제품 코드
		var clickProdCd = $(this).closest('tr').find(".addTrProdCd").text();
		var clickOrderPrice = $(this).closest('tr').find(".addTrOrderPrice").text();
		var findIndex;
		
		// 배열에서 해당 제품코드와 동일한 인덱스 찾기
		for(var i=0; i<dataArr.length; i++){
			if(dataArr[i].split("/")[0] === clickProdCd){
				findIndex = i;
				break;
			}
		}
		
		// 배열에서 삭제
		dataArr.splice(findIndex,1);
		console.log("삭제 후 : ", dataArr);
		// 목록에서 제거
		$(this).closest('tr').remove();
		// 전체 금액에서 -처리한 후 다시 입력
		totalPrice -= clickOrderPrice;
		$("#totalPrice").val(totalPrice);
	});
	
	// 발주하기 버튼
	orderModalBtn.on("click",function(){
		var orderList;
		
		console.log(dataArr);
		
		for(var i=0; i<dataArr.length; i++){
			
			orderList += "<tr>";
			orderList += "<td style='text-align:center'>" + (i+1) + "</td>";
			orderList += "<td style='text-align:center'>" + dataArr[i].split("/")[1] + "</td>";
			orderList += "<td style='text-align:center'>" + dataArr[i].split("/")[5] + "</td>";
			orderList += "<td style='text-align:center'>" + dataArr[i].split("/")[6] + "</td>";
			orderList += "</tr>";
		}
		
		orderList += "<tr><td colspan='3' style='text-align:right'><h3>총 " + (dataArr.length) +"건</h3></td>";
		orderList += "<td colspan='3'style='text-align:right'><h3>합계 " + totalPrice  +"원</h3></td></tr>";
		
		$("#modalBody").html(orderList);

	});

	// 발주 등록 ajax
	orderBtn.on("click",function(){
		
		var orderList = [];
		
	    for (var i = 0; i < dataArr.length; i++) {
	        orderList.push({
	        	vdprodCd : dataArr[i].split("/")[0],
	            hdforwardPrice: dataArr[i].split("/")[4],
	            frcsOrderQy: dataArr[i].split("/")[5],
	        });
	    }
		
	    var orderName = dataArr[0].split("/")[1];
	    var orderListSize = orderList.length;

	    if(orderListSize == 1){
	    	var frcsOrderName = orderName + " " + (orderListSize) + "건"; 	    	
	    }else{
		    var frcsOrderName = orderName+ " 외 " + (orderListSize - 1) + "건"; 
	    }
	    console.log(frcsOrderName);
	    
	    
	    var data = {
	    	frcsOrderName : frcsOrderName, 	
			frcsOrderAmt : totalPrice,
			orderDetailList : orderList
		}
		
		$.ajax({
			type : "post",
			url : "/owner/order/frcsOrder.do",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log(res);
				if(res == "OK"){
					Swal.fire({
			            title: "발주 성공",
			            text: "발주에 성공하였습니다",
			            confirmButtonText: "확인",
			            icon: "success",
			            preConfirm: function () {
			                location.href = "/owner/orderDetail.do";
			            }
			        });
				}else if(res == "FAILED"){
					Swal.fire({
			            title: "발주 실패",
			            text: "발주에 실패 하였습니다",
			            confirmButtonText: "확인",
			            icon: "error",
			            preConfirm: function () {
			                location.href = "/owner/order.do";
			            }
			        });
				}
			}
		});
	});
});
</script>