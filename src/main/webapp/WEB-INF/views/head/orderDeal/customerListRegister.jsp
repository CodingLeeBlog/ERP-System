<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.ttr th{
	color: white;
}
</style>
<!-- Start Content-->

<script type="text/javascript">

function selectAll(selectAll){
	const checkBoxes = document.querySelectorAll('input[type = "checkbox"]');
	
	checkBoxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
	});
};
</script>

<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

			<!-- start page title -->
			<div class="col-sm-12 card widget-inline mt-3" style="height: 110px;">
				<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">거래처등록</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">거래처를
							등록합니다.</div>
					</div>
					<div
						class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						거래처관리 / &nbsp;<span class="text-decoration-underline">등록</span>
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
														class="d-none d-lg-block">거래처를 등록해주세요</span>
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
																<input type="hidden" name="vdCode" id="vdCode" value=""/>
																<div class="col-12">
                                                                        <div class="mb-3">
                                                                            <label class="form-label">분류</label>
                                                                            <select data-toggle="select2" id="vendorStatus">
                                                                                <option value="">선택해주세요</option>
                                                                                <option value="잡화">잡화</option>
                                                                                <option value="소스">소스</option>
                                                                                <option value="수산">수산</option>
                                                                                <option value="냉동제품">냉동제품</option>
                                                                                <option value="주류">주류</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                    
																	<div class="col-12">
																		<div class="mb-3">
																			<label class="form-label">거래처명</label> 
																			<select data-toggle="select2"  id="vendorName">
																				<option value="선택하세요">선택하세요</option>
																			</select>
																		</div>
																	</div>
																</div>
																<!-- end row -->
																
																<div class="row mb-5" >
																	<div class="col-md-12" style="overflow: auto; height:400px; ">
																		<table class="table table-outline" style="border-collapse: collapse;">
																			<thead style="position: sticky;top: 0px; background-color:#65A4BE;">
																				<tr class="ttr">
																					<th>
																						<div class="form-check">
                                                                                            <input type="checkbox" class="form-check-input" id="vendorCheck1" value="selectAll" onclick="selectAll(this)"/>
                                                                                            <label class="form-check-label" for="vendorCheck1">&nbsp;</label>
                                                                                        </div>
																					</th>
																					<th style="text-align: center;">제품코드</th>
																					<th style="text-align: center;">제품명</th>
																					<th style="text-align: center;">거래처코드</th>
																					<th style="text-align: center;">재고잔량</th>
																					<th style="text-align: center;">출고단가/최종입고단가</th>
																					<th style="text-align: center;">유통기한시작일</th>
																					<th style="text-align: center;">유통기한종료일</th>
																				</tr>
																			</thead>
																			<tbody id="tbody">
																				
																			</tbody>
																		</table>																			
																	</div>
																</div>
																<div id="ss" style="position: relative;"></div>
																<!-- end row -->
																<div class="row">
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-phone" class="form-label">담당자
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="text"
																				placeholder="차수연" id="vdManager" />
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-email-address" class="form-label">이메일
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="email"
																				placeholder="bark33@naver.com"
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
																			</label> <input class="form-control" type="email"
																				placeholder="[guide]13561" id="vdPost" />
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-phone" class="form-label">주소
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="text"
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
																				placeholder="042-333-1122"
																				id="vdPhone" />
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="mb-3">
																			<label for="billing-phone" class="form-label">분류
																				<span class="text-danger">*</span>
																			</label> <input class="form-control" type="text"
																				placeholder="육가공/수산" id="vdCategory" />
																		</div>
																	</div>
																</div>
																<!-- end row -->

																<div class="row">
																	<div class="col-12">
																		<div class="mb-3">
																			<label for="example-textarea" class="form-label">비고</label>
																			<textarea class="form-control" id="example-textarea"
																				rows="3" placeholder="특이사항"></textarea>
																		</div>
																	</div>
																</div>
																<!-- end row -->

																<div class="row mt-2">
																	<div class="col-sm-6">
																		<a href="/head/customerList.do"
																			class="btn text-muted d-none d-sm-inline-block btn-link fw-semibold">
																			<i class="mdi mdi-arrow-left"></i> 돌아가기
																		</a>
																	</div>
																	<!-- end col -->
																	<div class="col-sm-6">
																		<div class="text-sm-end">
																			<button id="vendorBtn" type="button" class="btn btn-danger">
																			<i class="mdi mdi-truck-fast me-1"></i>등록하기
																			</button>
																		</div>
																	</div>
																	<!-- end col -->
																</div>
																<!-- end row -->
																<sec:csrfInput/>
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
					<!-- Footer Start -->
					<footer class="footer">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-6">
									<script>
										document.write(new Date().getFullYear())
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
	var vendorStatus = $("#vendorStatus");
	var vdCategory = "";
	var vendorName = $("#vendorName");
	
	function formatWon(number) {
	    // 숫자를 한국 표준 통화 형식으로 포맷팅
	    var formattedNumber = new Intl.NumberFormat('ko-KR', {
	      style: 'currency',
	      currency: 'KRW'
	    }).format(number);
	    
	    // "₩" 통화 기호 제거
	    formattedNumber = formattedNumber.replace("₩", "");
	    
	    // "(원)" 추가
	    return formattedNumber + "(원)";
	}
	
	function typeNumber(number) {
	    // 숫자를 한국 표준 통화 형식으로 포맷팅
	    var formattedNumber = new Intl.NumberFormat('ko-KR', {
	      style: 'currency',
	      currency: 'KRW'
	    }).format(number);
	    
	    // "₩" 통화 기호 제거
	    formattedNumber = formattedNumber.replace("₩", "");
	    
	    // "(원)" 추가
	    return formattedNumber;
	}
	
	function typeDate(dateString) {
		  // 입력된 날짜 문자열을 Date 객체로 파싱
		  var date = new Date(dateString);

		  // 년, 월, 일을 가져와서 원하는 형식으로 조합
		  var year = date.getFullYear();
		  var month = (date.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리로 패딩
		  var day = date.getDate().toString().padStart(2, '0'); // 일자를 2자리로 패딩

		  // 원하는 형식으로 조합해서 반환
		  var formattedDate = year + '/' + month + '/' + day;
		  return formattedDate;
		}
	
	vendorStatus.on("change", function(){
		
		vdCategory = vendorStatus.val();
		
		console.log(vdCategory);
		
		var vendorObject = {
				vdCategory : vdCategory
		}
		
		$.ajax({
			type : "post",
			url : "/head/vendorList.do",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data : JSON.stringify(vendorObject),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log("여기까지왔나");
				var data = "<option value=''>선택하세요</option>";
				$.each(res, function(idx,vendorVO){
					data += "<option class='sec' value = '"+vendorVO.vdCode+"'> "+vendorVO.vdName+"</option> ";
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
		
		var vendorObject = {
			vdCode : vdCode,
			vdName : vdName
		}
		
		$.ajax({
			type : "post",
			url : "/head/vendorNameSelect.do",
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data : JSON.stringify(vendorObject),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				$("#vdManager").val(res.vdManager);
				$("#vdEmail").val(res.vdEmail);
				$("#vdPost").val(res.vdPost);
				$("#vdAdd").val(res.vdAdd1 + " " + res.vdAdd2);
				$("#vdPhone").val(res.vdPhone);
				$("#vdCategory").val(res.vdCategory);
				
				var html = "";
				$.each(res.headInventoryList, function(idx,headInventoryVO){
					html += "<tr class='checkBtn'>";
					html += "	<td class='chk'>";
					html += "		<div class='form-check'>";
					html += "			<input type='checkbox' class='form-check-input' id='vendorCheck" + checkboxId +"' value='" + headInventoryVO.vdprodCd + "," + headInventoryVO.vdprodName + "," + headInventoryVO.vdCode +"," + headInventoryVO.vdremainQy +"," + headInventoryVO.vdforwardPrice +"," + headInventoryVO.vdprodLifestartday + "," + headInventoryVO.vdprodLifeendday + "," + headInventoryVO.vdrtrcvPrice + "," + headInventoryVO.vdmaxQy + "'>";
					html += "			<label class='form-check-label' for='vendorCheck" + checkboxId + "'>&nbsp;</label>";
					html += "	</td>";
					checkboxId++;
					html += "	<td style='text-align: center;'>"+headInventoryVO.vdprodCd+"</td>";
					html += "	<td style='text-align: center;'>"+headInventoryVO.vdprodName+"</td>";
					html += "	<td style='text-align: center;'>"+headInventoryVO.vdCode+"</td>";
					html += "	<td style='text-align: center;'>"+typeNumber(headInventoryVO.vdremainQy)+"</td>";
// 					html += "	<td>"+headInventoryVO.hdforwardPrice+"/"+headInventoryVO.hdrtrcvPrice+"</td>";
					html += "	<td style='text-align: center;'>"+formatWon(headInventoryVO.vdforwardPrice)+"</td>";
					html += "	<td style='text-align: center;'>"+typeDate(headInventoryVO.vdprodLifestartday)+"</td>";
					html += "	<td style='text-align: center;'>"+typeDate(headInventoryVO.vdprodLifeendday)+"</td>";
					html += "</tr>";
					
				});
				$("#tbody").html(html);
				
			}
		});
	});
	
	$("#vendorBtn").on("click", function() {
		// 체크된 체크박스 엘리먼트를 선택
        var checkedCheckboxes = $("input[type='checkbox']:checked");
		
        var checkedValues = [];
        
     // 체크된 체크박스의 값을 배열에 추가
        checkedCheckboxes.each(function(i, item) {

        	console.log("item ",i, item );
        	
        	if($(this).val() !== "selectAll"){
        		
        	var values = $(this).val().split(","); // 값을 쉼표로 분리
	            checkedValues.push({
	                vdprodCd: values[0], // 첫 번째 값
	                vdprodName: values[1], // 두 번째 값
	                vdCode: values[2], 
	                vdremainQy: values[3], 
	                vdforwardPrice: values[4], 
	                vdprodLifestartday: values[5], 
	                vdprodLifeendday: values[6],
	                vdrtrcvPrice: values[7],
	                vdmaxQy: values[8]
	            });
        	}
        });
     
        var dataObject = JSON.stringify(checkedValues);
        
        console.log("dataObject : ", dataObject);
        
        Swal.fire({
            title: "거래처를 등록 하시겠습니까?",
            text: "다시 되돌릴 수 없습니다. 신중하세요.",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: "확인",
            cancelButtonText: "취소",
            // 확인 버튼 시 등록처리
            preConfirm: function() {
               
            	$.ajax({
                    type: "POST", 
                    url: "/head/vendorRegister.do",
                    beforeSend : function(xhr){
        				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        			},
        			contentType: "application/json; charset=UTF-8",
                    data: dataObject, // 전송할 데이터
                    success: function(res) {
                            Swal.fire({
                                title: "알림",
                                text: "승인이 완료되었습니다",
                                confirmButtonText: "확인",
                                icon: "success",
                                preConfirm: function () {
                                    location.href = "/head/customerList.do";
                                }
                            });
                    },
                    error: function(xhr, status, error) {
                        // 오류 발생 시 처리하는 로직
                        console.error(error);
                    }
                });
            },
        });
       // SweetAlarm 끝
        
        
	});
	
});
</script>