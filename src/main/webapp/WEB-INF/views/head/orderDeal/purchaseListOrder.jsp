<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height: 110px;">
				<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">거래처발주</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">거래처에게
							제품을 발주합니다.</div>
					</div>
					<div
						class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						매입내역관리 / &nbsp;<span class="text-decoration-underline">발주</span>
					</div>
				</div>
			</div>
			<!-- end page title -->

			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">

							<div class="row">
								<div class="col-12">
									<div class="card">
										<div class="card-body">

											<!-- Checkout Steps -->
											<ul class="nav nav-pills bg-nav-pills nav-justified mb-3">
												<li class="nav-item"><a href="#billing-information"
													data-bs-toggle="tab" aria-expanded="false"
													class="nav-link rounded-0 active"> <i
														class="mdi mdi-account-circle font-18"></i> <span
														class="d-none d-lg-block">발주하실 거래처를 선택 후 제품명을
															클릭하세요.</span>
												</a></li>
											</ul>

											<!-- Steps Information -->
											<div class="tab-content">

												<!-- Billing Content-->
												<div class="tab-pane show active" id="billing-information">
													<div class="row">
														<div class="col-lg-12">

															<form>
																<div class="row">
																	<div class="col-12">
																		<div class="mb-3">
																			<label class="form-label">분류</label> 
																			<select data-toggle="select2" id="vendorCategory">
																				<option value="">선택해주세요</option>
                                                                                <option value="잡화">잡화</option>
                                                                                <option value="소스">소스</option>
                                                                                <option value="수산">수산</option>
                                                                                <option value="냉동제품">냉동제품</option>
                                                                                <option value="주류">주류</option>
																			</select>
																		</div>
																	</div>
																</div>
																<!-- end row -->
																<div class="col-12">
																	<div class="mb-3">
																			<label class="form-label">거래처명</label> 
																			<select data-toggle="select2"  id="vendorName">
																				<option value="선택하세요">선택하세요</option>
																			</select>
																	</div>
																</div>
																
																<div class="row mb-5" >
																	<div class="col-md-12" style="overflow: auto ; height:400px; position:relative;">
																		<table class="table table-outline" style="border-collapse: collapse;">
																			<thead style="position: sticky;top: 0px; background-color:#65A4BE; z-index: 1;">
																				<tr class="ttr">
																					<th style="text-align:center; width:150px; color:white;">제품코드</th>
																					<th style="text-align:center; width:150px; color:white;">제품명</th>
																					<th style="text-align:center; width:150px; color:white;">한계 재고수량</th>
																					<th style="text-align:center; width:150px; color:white;">현 재고수량</th>
																					<th style="text-align:center; width:150px; color:white;">구매가</th>
																					<th style="text-align:center; width:150px; color:white;">주문수량</th>
																					<th style="text-align:center; width:150px; color:white;">주문예상금액</th>
<!-- 																					<th style="text-align:center; width:150px; color:white;"></th> -->
																				</tr>
																			</thead>
																			<tbody id="tbody">
																				
																			</tbody>
																		</table>
																	</div>
																</div>
																<div id="ss" style="position: relative;"></div>
																
																<div class="row">
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-phone" class="form-label">담당자
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="text"
																				placeholder="차수연" readonly="readonly" id="vdManager" />
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-email-address" class="form-label">이메일
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="email"
																				placeholder="bark33@naver.com" readonly="readonly" 
																				id="vdEmail" />
																		</div>
																	</div>
																</div>
																<!-- end row -->
																<div class="row">
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-email-address" class="form-label">우편번호
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="email" readonly="readonly" 
																				placeholder="[guide]13561" id="vdPost" />
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-phone" class="form-label">주소
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="text" readonly="readonly" 
																				placeholder="경기도 성남시 분당구 정자일로 95" id="vdAdd" />
																		</div>
																	</div>
																</div>
																<!-- end row -->
																<div class="row">
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-email-address" class="form-label">연락처
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="email"
																				placeholder="042-333-1122" readonly="readonly" 
																				id="vdPhone" />
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-phone" class="form-label">분류
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="text" readonly="readonly" 
																				placeholder="육가공/수산" id="vdCategory" />
																		</div>
																	</div>
																</div>
																<!-- end row -->

																<div class="row">
																	<div class="col-12">
																		<div class="mb-3">
																			<label for="example-textarea" class="form-label">의견</label>
																			<textarea class="form-control" id="example-textarea"
																				rows="3" placeholder="건의사항을 말씀하세요"></textarea>
																		</div>
																	</div>
																</div>
																<!-- end row -->

																<div>
																	<input type="hidden" id="vdCd" value="">
																</div>

																<div class="row mt-2">
																	<div class="col-sm-6">
																		<a href="/head/purchaseList.do"
																			class="btn text-muted d-none d-sm-inline-block btn-link fw-semibold">
																			<i class="mdi mdi-arrow-left"></i> 돌아가기
																		</a>
																	</div>
																	<!-- end col -->
																	<div class="col-sm-6">
																		<div class="text-sm-end">
																			<button id="orderBtn" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#modal"><i class="mdi mdi-truck-fast me-1"></i> 주문하기</button>
																		</div>
																	</div>
																	<!-- end col -->
																</div>
																<!-- end row -->
															</form>
														</div>

													</div>
													<!-- end card-body-->

												</div>
												<!-- end card-->
											</div>
											<!-- end col -->
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- End Container-fluid-->
					
					 <!-- 모달 창 -->
            <div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                <div class="modal-dialog" style="max-width: 700px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="standard-modalLabel"><span style="color: brown; font-weight: bold; font-size: large;">발주리스트</span></h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header align-items-center">
                                        <label for="billing-phone" class="form-label">선택내역
												<span class="text-danger">*</span></label> 
                                        <table class="table table-hover">
                                            <thead>
                                                    <tr>
                                                        <th style="text-align: center;">순번</th>
                                                        <th style="text-align: center;">제품코드</th>
                                                        <th style="text-align: center;">제품명</th>
                                                        <th style="text-align: center;">구매가</th>
                                                        <th style="text-align: center;">주문수량</th>
                                                        <th style="text-align: center;">주문예상금액</th>
                                                    </tr>
                                            </thead>
                                            <tbody id="modalTbody">
                                            
                                            </tbody>
                                        </table>
                                    </div>
                                    <hr>
                                    <div class="card-body">
                                        <div class="col-6 mb-2 input-group">
											<label for="billing-phone" class="form-label">
											<span class="text-danger">*</span>총계</label> 
											<input class="form-control" type="text" placeholder="0(원)" id="headorderTotal" value=""/>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button id="modalButton" type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                            <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal --> 
					
					<!-- Footer Start -->
					<footer class="footer">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-6">
									<script>
										document
												.write(new Date().getFullYear())
									</script>
									© Hyper - Coderthemes.com
								</div>
								<div class="col-md-6">
									<div class="text-md-end footer-links d-none d-md-block">
										<a href="javascript: void(0);">About</a> <a
											href="javascript: void(0);">Support</a> <a
											href="javascript: void(0);">Contact Us</a>
									</div>
								</div>
							</div>
						</div>
					</footer>
					<!-- end Footer -->
				</div>
				<!-- content -->
			</div>
			<!-- content-page -->
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	var vendorCategory = $("#vendorCategory");	// 분류 셀렉트박스
	var vendorName = $("#vendorName");			// 거래처명 셀렉트박스
	var vdCategory = "";
	
	var tbody = $("#tbody");
	
	var orderBtn = $("#orderBtn");
	
	var modalTbody = $("#modalTbody");
	
	var orders = [];
	
	vendorCategory.on("change", function(){
		vdCategory = vendorCategory.val();
		
		console.log(vdCategory);
		
		var purchaseObject = {
			vdCategory : vdCategory	
		};
		
		$.ajax({
			type : "post",
			url : "/head/selectPurchaseVendorName.do",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data : JSON.stringify(purchaseObject),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log("여기까지왔나");
				var data = "<option value=''>선택하세요</option>";
				$.each(res, function(idx,purchaseVO){
					data += "<option class='sec' value = '"+purchaseVO.vdCode+"'> "+purchaseVO.vdName+"</option> ";
				});
				vendorName.html(data);
			}
		});
	});
	
	vendorName.on("change", function(){
		vdCode = $(this).val();
		vdName = $(this).find("option:selected").text().trim();
		
		var checkboxId = 2;	// 초기 체크박스 ID 값
		
		console.log(vdCode); 
		console.log(vdName); 
		
		var purchaseObject = {
				vdCode : vdCode,
				vdName : vdName
		};
		
		$.ajax({
			type : "post",
			url : "/head/selectPurchaseDataList.do",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data : JSON.stringify(purchaseObject),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				$("#vdManager").val(res[0].vdManager);
				$("#vdEmail").val(res[0].vdEmail);
				$("#vdPost").val(res[0].vdPost);
				$("#vdAdd").val(res[0].vdAdd1 + " " + res[0].vdAdd2);
				$("#vdPhone").val(res[0].vdPhone);
				$("#vdCategory").val(res[0].vdCategory);
				$("#vdCd").val(res[0].vdCode);
				
				var html = "";
				$.each(res, function(idx,purchaseVO ){
				    html += "<tr class='orderList'>";
				    html += "<td style='text-align:center;width:150px;'>" + purchaseVO.vdprodCd + "</td>";
				    html += "<td style='text-align:center;width:150px;'>" + purchaseVO.vdprodName + "</td>";
				    html += "<td style='text-align:center;width:150px;'>" + purchaseVO.hdmaxQy + "</td>";
				    html += "<td style='text-align:center;width:150px;'>" + purchaseVO.hdremainQy + "</td>";
				    html += "<td class='sellPrice' style='text-align:center;width:150px;'>" + purchaseVO.hdrtrcvPrice + "</td>";
				    html += "<td style='text-align:center;width:150px;'>";
				    html += "   <div class='input-group bootstrap-touchspin bootstrap-touchspin-injected' style='z-index: 0;' >";
				    html += "       <span class='input-group-btn input-group-prepend'><button class='btn btn-primary bootstrap-touchspin-down minus' type='button'>-</button></span>";
				    html += "       <input data-toggle='touchspin' type='text' placeholder='0' value='0' class='orderQty form-control text-end'>";
				    html += "       <span class='input-group-btn input-group-append'><button class='btn btn-primary bootstrap-touchspin-up plus' type='button'>+</button></span>";
				    html += "   </div>";
				    html += "</td>";
				    html += "<td class='orderTotal' style='text-align:center;width:150px;'>0(원)</td>";
// 				    html += "<div>";
// 				    html += "	<input class='vdCd' type='hidden' value='"+purchaseVO.vdCode+"'>";
// 				    html += "</div>";
// 				    html += "<td style='text-align:center;width:150px;'>";
// 				    html += "   <button type='button' class='btn btn-info addBtn'>추가</button>";
// 				    html += "</td>";
				    html += "</tr>";
				});
				$("#tbody").html(html);
			}
		});
	});
	
	tbody.on("keyup", ".orderQty",function(){
		// 주문예상금액
		var orderTotal = $(this).closest("tr").find(".orderTotal");
		var totalText = orderTotal.text();
		var totalValue = totalText.replace(/[^\d]/g, '');
		var total = parseInt(totalValue, 10);
		
		// 현재 input 필드 값
	    var inputValue = $(this).val();
		 // 숫자가 아닌값은 제외시킴
		 var numericValue = inputValue.replace(/[^0-9]/g, '');
		var numberValue = $(this).val(numericValue);
		// 주문수량에 들어온 값
		 var orderNum = $(this).val();
		 
		// 구매가
		var sellPrice = $(this).closest("tr").find(".sellPrice");
		var price = parseInt(sellPrice.text().replace(/[^\d]/g, ''), 10);
		
		var totalCount = orderNum * price;
		console.log("주문수량 -> ",orderNum);
		console.log("주문수량 * 구매가 -> ", orderTotal);
		
		orderTotal.text((totalCount).toLocaleString() + "(원)");
	});
		 
	
	tbody.on("click", ".plus", function(){
		console.log($(this));
		
		// 주문수량 값
		var orderQty = $(this).closest("tr").find(".orderQty");
		var plusQty = parseInt(orderQty.val());
		
		// 주문수량 숫자를 지웠을때 NaN이 뜨는걸 막기위함
		if(isNaN(plusQty) || plusQty < 0){
			plusQty = 0;
		}
		
		plusQty += 50;
		orderQty.val(plusQty);
		
		// 주문예상금액
		var orderTotal = $(this).closest("tr").find(".orderTotal");
		var totalText = orderTotal.text();
		var totalValue = totalText.replace(/[^\d]/g, '');
		var total = parseInt(totalValue, 10);
// 		console.log(total);
		
		// 구매가
		var sellPrice = $(this).closest("tr").find(".sellPrice");
		var price = parseInt(sellPrice.text().replace(/[^\d]/g, ''), 10);
// 		console.log(price);
		
		orderTotal.text((price*plusQty).toLocaleString() + "(원)");
	});
	
	tbody.on("click", ".minus", function(){
		console.log($(this));
		
		// 주문수량 값
		var orderQty = $(this).closest("tr").find(".orderQty");
		var minusQty = parseInt(orderQty.val());
		
		// 주문수량 숫자를 지웠을때 NaN이 뜨는걸 막기위함
		if(isNaN(minusQty)){
			minusQty = 0;
		}
		
		if(minusQty > 0){
			minusQty -= 50;
			orderQty.val(minusQty);
		}
		
		// 주문예상금액
		var orderTotal = $(this).closest("tr").find(".orderTotal");
		var totalText = orderTotal.text();
		var totalValue = totalText.replace(/[^\d]/g, '');
		var total = parseInt(totalValue, 10);
// 		console.log(total);
		
		// 구매가
		var sellPrice = $(this).closest("tr").find(".sellPrice");
		var price = parseInt(sellPrice.text().replace(/[^\d]/g, ''), 10);
// 		console.log(price);
		
		orderTotal.text((price*minusQty).toLocaleString() + "(원)");
	});
	
	
	
	orderBtn.on("click", function(){
		
		var vdCode = $("#vdCd").val();
		console.log(vdCd);
		
		var cnt = 1;
		modalTbody.empty();
		var write = "";
		
		var headorderTotal = $("#headorderTotal");
		var totalExpectPrice = 0; // 주문예상금액 합계를 저장할 변수
		
		$(".orderList").each(function(){
		    var orderQty = $(this).find(".orderQty");
		    var qty = parseInt(orderQty.val()); // 주문수량
		    if (!isNaN(qty) && qty !== 0) {
		    	var vdprodCd = $(this).find("td:eq(0)").text(); // 제품코드
		    	var vdprodName = $(this).find("td:eq(1)").text(); // 제품명
		    	var hdrtrcvPrice = parseInt($(this).find(".sellPrice").text().replace(/[^\d]/g, '')); // 구매 가격
		    	var expectPrice = parseInt($(this).find("td:eq(6)").text().replace(/[^\d]/g, '')); // 총계 주문예상금액
		    	var expectPriced = expectPrice.toLocaleString() + "(원)"; // 모달안에들어갈 주문예상금액
		    	
		    	var write = "<tr>";
		    	write += "<td style='text-align:center;'>" + cnt + "</td>";
		    	write += "<td style='text-align:center;'>" + vdprodCd + "</td>";
		    	write += "<td style='text-align:center;'>" + vdprodName + "</td>";
		    	write += "<td style='text-align:center;'>" + hdrtrcvPrice + "</td>";
		    	write += "<td style='text-align:center;'>" + qty + "</td>";
		    	write += "<td style='text-align:center;'>" + expectPriced + "</td>";
		    	write += "</tr>";
		    	
	            modalTbody.append(write);
	            cnt++;
	            
		    	var order = {
		    			vdprodCd : vdprodCd,
		    			vdprodName : vdprodName,
		    			hdrtrcvPrice : hdrtrcvPrice,
		    			hdorderQy : qty,
		    			hdordertotalPrice : expectPrice
		    	};
		    	
		    	orders.push(order);
				
		    	 // 주문예상금액 누적
		        totalExpectPrice += expectPrice;
		    }
		});
		
		// 모달안에 총계를 넣어줌
		var totalExpectPriced = totalExpectPrice.toLocaleString() + "(원)";
		headorderTotal.val(totalExpectPriced);
		
		console.log("주문예상금액 합계: " + totalExpectPrice);
		
		for(var i = 0; i < orders.length; i++){
			orders[i].vdCode = vdCode;
		}
		
		console.log(orders);
		
		// HEAD_ORDER에 INSERT하기위한 JSON객체
		var headOrder = {
				vdCode : vdCode,
				hdordertotalPrice : totalExpectPrice
		};
		
		console.log(headOrder);
		$("#modalButton").on("click", function(){
				
				Swal.fire({
		            title: "발주하시겠습니까?",
		            text: "다시 되돌릴 수 없습니다. 신중하세요.",
		            icon: "warning",
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: "확인",
		            cancelButtonText: "취소",
		            // 확인 버튼 시 반려처리
		            preConfirm: function() {
		            	
		            	// HEAD_ORDER에 INSERT
						$.ajax({
							type : "post",
							url : "/head/insertHeadOrder.do",
							beforeSend : function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							},
							data : JSON.stringify(headOrder),
							contentType : "application/json; charset=utf-8",
							success : function(res){
								if(res === 'OK'){
									console.log("HEAD_ORDER -> INSERT성공!!");
									
//					 				HEAD_ORDER_DETAIL에 INSERT
									$.ajax({
										type : "post",
										url : "/head/selectPurchaseOrderList.do",
										beforeSend : function(xhr){
											xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
										},
										data : JSON.stringify(orders),
										contentType : "application/json; charset=utf-8",
										success : function(res){
											console.log("HEAD_ORDER_DETAIL -> INSERT성공!!");
											console.log("HEAD_INVENTORY -> UPDATE성공!!");
											console.log("VENDOR_INVENTORY -> UPDATE성공!!");
											
											Swal.fire({
					    			            title: "알림",
					    			            text: "발주처리 되었습니다",
					    			            confirmButtonText: "확인",
					    			            icon: "success",
					    			            preConfirm: function () {
					    			                location.href = "/head/purchaseList.do";
					    			            }
					    			        });
										}
									});
								}
							}
						});
			           	
		            },
		        });
		    	// SweetAlarm 끝
			
				
				
		});
		
	});
	
});
</script>