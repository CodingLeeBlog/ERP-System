<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri= "http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<input type="hidden" id="frcsId" value="${frcsId }">
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">
		
		    <div class="row">
		        <div class="col-12">
		            <div class="page-title-box">
		                <div class="page-title-right">
		                    <ol class="breadcrumb m-0">
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">홈</a></li>
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">주문 거래 관리</a></li>
		                        <li class="breadcrumb-item active">자동 발주 관리</li>
		                    </ol>
		                </div>
		                <h4 class="page-title">자동 발주 관리</h4>
		            </div>
		        </div>
		    </div>
		
		    <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
		                        <div class="col-xl-8">
		                            <form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between" id="searchForm">
		                                <input type="hidden" name="page" id="page">
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
		                                <button type="submit" class="btn btn-primary">
										    <i class="mdi mdi-magnify search-icon"></i>검색                            			
		                                </button>
		                                	</div>
		                                </div>
		                            </form>                            
		                        </div>
		                        <div class="col-xl-4">
		                            <div class="text-xl-end mt-xl-0 mt-2">
		                                <button type="button" class="btn btn-warning rowAdd">행추가</button>
		                            </div>
		                        </div>
		                    </div>
		
		                    <div class="table-responsive">
		                        <table class="table table-centered table-nowrap mb-0 table-hover">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="width: 20px;">
		                                    </th>
		                                    <th style="text-align:center; width:100px;">제품 코드</th>
		                                    <th style="text-align:center; width:200px;">제품명</th>
		                                    <th style="text-align:center; width:150px;">자동발주 기준수량</th>
		                                    <th style="text-align:center; width:150px;">자동발주 수량</th>
		                                    <th style="text-align:center; width:150px;">구매가</th>
		                                    <th style="text-align:center; width:150px;">주문예상금액</th>
		                                    <th style="text-align:center; width:150px;"></th>
		                                </tr>
		                            </thead>
		                            <tbody id="tbdArea">
		                            <c:set value="${pagingVO.dataList }" var="autoOrderList"/>
		                                <c:choose>
		                                	<c:when test="${empty autoOrderList }">
		                                		<tr>
		                                			<td colspan="8" style="text-align:center">
		                                				등록된 자동발주가 없습니다.
		                                			</td>
		                                		</tr>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<c:forEach items="${autoOrderList }" var="autoOrder">
		                                			<tr>
					                                    <td>
					                                        <div></div>
					                                    </td>
					                                    <td style="text-align:center" class="vdprodCd">${autoOrder.vdprodCd }</td>
					                                    <td style="text-align:center" class="vdprodName">
					                                    	${autoOrder.vdprodName }
					                                    </td>
						                                <td style="text-align:center" class="atorderStdrqy">
						                                   	${autoOrder.atorderStdrqy }
						                                </td>
					                                    <td style="text-align:center" class="atorderQy">
					                                        ${autoOrder.atorderQy }
					                                    </td>
					                                    <td style="text-align:center" class="hdforwardPrice">
					                                        <fmt:formatNumber value="${autoOrder.hdforwardPrice }" type="number"/>
					                                    </td>
					                                    <td style="text-align:center" class="amount">
					                                        <fmt:formatNumber value="${autoOrder.hdforwardPrice*autoOrder.atorderQy }" type="number"/>
					                                    </td>
					                                    <td style="text-align:center">
															<button type="button" class="btn btn-info updateBtn" data-autono=${autoOrder.autoorderNo }> 수정</button>
					                                    	<c:if test="${autoOrder.atorderAt eq 'Y' }">
																<button type="button" class="btn btn-danger disabledBtn" data-autono=${autoOrder.autoorderNo }>비활성화</button>
					                                    	</c:if>
					                                    	<c:if test="${autoOrder.atorderAt eq 'N'}">
																<button type="button" class="btn btn-success disabledBtn" data-autono=${autoOrder.autoorderNo }>활성화</button>
					                                    	</c:if>
					                                    </td>
					                                </tr>
		                                		</c:forEach>
		                                	</c:otherwise>
		                                </c:choose>
		                                
										<!--  행추가 테이블  -->
										<tr class="hiddenEle" style="display:none;">
										    <td>
										    </td>
										    <td style="text-align:center" class="vdprodCd">
										        <input type="text" disabled placeholder="제품을 검색해주세요">
										        <a href="javascript:void(0);" class="action-icon" data-bs-toggle="modal" data-bs-target="#modal1">
										            <i class="uil-search-alt action-icon"></i>
										        </a>
										        <!-- 모달 창 -->
										    </td>
										    <td style="text-align:center" class="vdprodName">
										    </td>
										    <td style="text-align:center" class="atorderStdrqy">
										    </td>
										    <td style="text-align:center" class="atorderQy">
										    </td>
										    <td style="text-align:center" class="hdforwardPrice">
										    </td>
										    <td style="text-align:center" class="amount">
										    </td>
										    <td style="text-align:center" class="btnArea">
										    </td>
										</tr>
		                            </tbody>
		                        </table>
		                    </div>
		                    <br>
	                    <!-- 모달창 요소 -->
	          			    <div class="modal fade modal" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true">
								<div class="modal-dialog modal-lg">
							       <div class="modal-content">
							           <div class="modal-header">
							               <h4 class="modal-title" id="modalLabel1">제품 정보 조회</h4>
							               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
							           </div>
							           <div class="modal-body">
							           <div class="mb-3">
							           <div class="input-group">
				                            <input type="text" class="form-control searchText" placeholder="제품코드 또는 제품명을 입력하세요.">
				                            <button class="btn btn-info searchBtn" type="button">검색</button>
				                        </div>
				                        <br>
				                        <div class="card-body py-0" data-simplebar style="max-height: 580px;">
				                        
							               <table class="table-hover table">
							                   <thead>
							                       <tr>
								                       <th style="width: 20px;">
				                                       </th>
							                           <th style="text-align:center;">제품 코드</th>
							                           <th style="text-align:center;">제품명</th>
							                           <th style="text-align:center;">가격</th>
							                       </tr>
							                   </thead>
							                   <tbody id="modalBody">
							                       <c:forEach items="${inventList}" var="invent">
							                           <tr>
								                           <td>
														       <div class="form-check">
														            <input type="checkbox" class="form-check-input checkBox">
														       </div>
													       </td>
							                               <td style="text-align:center;" class="vdprodCd">${invent.vdprodCd}</td>
							                               <td style="text-align:center;" class="vdprodName">${invent.vdprodName}</td>
							                               <td style="text-align:center;" class="hdforwardPrice"><fmt:formatNumber value="${invent.hdforwardPrice }" type="number"/></td>
							                           </tr>
							                       </c:forEach>
							                    </tbody>								            
							                </table>
						                </div>
						                <br>
								       	<button type="button" class="btn btn-info" style="float: right;" id="bringingBtn">불러오기</button>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
						<nav aria-label="Page navigation example" id="pagingArea">
 							${pagingVO.pagingHTML }
						</nav>
						<input type="hidden" id="frcsId" value="${pagingVO.frcsId }"/>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	var pagingArea = $("#pagingArea");
	var searchForm = $("#searchForm");
	var rowAdd = $(".rowAdd");	// 행 추가 버튼 
	var hiddenEle = $(".hiddenEle"); // 행
	var tBodyArea = $("#tbdArea"); // 행을 추가할 영역
	var searchBtn = $(".searchBtn"); // 검색 버튼
	var modalBody = $("#modalBody"); // 모달 tBody
	var checkBox = $(".checkBox");	// 체크박스
	var bringingBtn = $("#bringingBtn"); // 불러오기 버튼
	var orderStdrqyVal;	// +- 처리 후 자동발주기준수량
	var atorderQyVal; // +- 처리 후 자동발주수량
	var addDelBtn = $(".addDelBtn"); // 추가한 행 삭제 버튼
	var thisTr; // 값 들어가야할 행
	
	// 페이징처리
	pagingArea.on("click","a",function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	// 행 추가 이벤트
	rowAdd.on("click",function(){
		var newRow = tBodyArea.find(hiddenEle).clone();
        newRow.css("display", "");
        tBodyArea.append(newRow);
	});
	
	// 누른 아이콘이 뭔지 저장
	tBodyArea.on("click",".action-icon",function(){
		thisTr = $(this).closest('tr');
	});
	
	
	// 검색 ajax
	searchBtn.on("click",function(){
		var searchWord = $(".searchText").val();
		$.ajax({
			type : "post",
			url : "/owner/autoArder/orderSearch.do",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			}, 
			data : {searchWord : searchWord},
			success : function(res){
				modalBody.empty();
				
				if(res.length>0){
					for(var i=0; i<res.length; i++){
						var str = "<tr>";
						str += "<td><div class='form-check'><input type='checkbox' class='form-check-input checkBox'></div></td>";
						str += "<td class='vdprodCd'>"+res[i].vdprodCd+"</td>";
						str += "<td class='vdprodName'>"+res[i].vdprodName+"</td>";
						str += "<td class='hdforwardPrice'>"+res[i].hdforwardPrice+"</td>";
						str += "</tr>";
						modalBody.append(str);
					}
				}else{
					var str = "<tr>";
					str += "<td colspan='4' style='text-align:center;'>검색하신 제품이 존재하지 않습니다.</td>"
					str += "</tr>";
					tBody.append(str);
				}
			}
		});
	});

	// 불러오기 클릭
	bringingBtn.on("click",function(){
		
		var vdprodCd; 
		var vdprodName;
		var hdforwardPrice;
		
		var checkObj = $(".checkBox");
		for(var i=0; i< checkObj.length; i++){
			if(checkObj[i].checked){
				var tr = $(checkObj[i]).closest('tr');
				var td = tr.children();
				vdprodCd = td.eq(1).text();
				vdprodName = td.eq(2).text();
				hdforwardPrice = td.eq(3).text();
			}
		}
		
		var frcsId = $("#frcsId").val();
		console.log(vdprodCd);
		console.log(frcsId);
		
		var data = {
			frcsId : frcsId,
			vdprodCd : vdprodCd
		}
		
		// 이미 db에 등록되어 있는 제품인지 중복체크
		$.ajax({
			type: "post",
			url : "/owner/autoOrderCheck.do",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log(res);
				if(res === "EXIST"){
					Swal.fire({
			            title: "중복",
			            text: "해당 제품은 이미 등록된 정보입니다.",
			            icon: "warning",
			            confirmButtonText: "확인",
			        });
				}else{
					thisTr.find('.vdprodCd').text(vdprodCd);
					thisTr.find('.vdprodName').text(vdprodName);
					thisTr.find('.hdforwardPrice').text(hdforwardPrice);
					thisTr.find('.amount').text(0);
					var btnAreaStr = "<button type='button' class='btn btn-info saveBtn' style='margin-right:0.2rem;'>저장</button>";
					btnAreaStr += "<button type='button' class='btn btn-danger addDelBtn'>삭제</button>";
					
					thisTr.find('.btnArea').html(btnAreaStr);
					
					var atorderStdrqyStr = "<div class='input-group bootstrap-touchspin bootstrap-touchspin-injected'>";
					atorderStdrqyStr += "<span class='input-grsoup-btn input-group-prepend'><button class='btn btn-primary bootstrap-touchspin-down orderStdrqyDown' type='button'>-</button></span>";
					atorderStdrqyStr += "<input data-toggle='touchspin' type='text' value='0' class='form-control text-end orderStdrqyInput'>";
					atorderStdrqyStr += "<span class='input-group-btn input-group-append'><button class='btn btn-primary bootstrap-touchspin-up orderStdrqyUp' type='button'>+</button></span></div>";
					
					var atorderQyStr = "<div class='input-group bootstrap-touchspin bootstrap-touchspin-injected'>";
					atorderQyStr += "<span class='input-group-btn input-group-prepend'><button class='btn btn-primary bootstrap-touchspin-down atorderQyDown' type='button'>-</button></span>";
					atorderQyStr += "<input data-toggle='touchspin' type='text' value='0' class='form-control text-end atorderQyInput'>";
					atorderQyStr += "<span class='input-group-btn input-group-append'><button class='btn btn-primary bootstrap-touchspin-up atorderQyUp' type='button'>+</button></span></div>";
					
					thisTr.find('.atorderStdrqy').html(atorderStdrqyStr);
					thisTr.find('.atorderQy').html(atorderQyStr);
					
					$('#modal1').modal('hide');
				}
			}
		});
	});
	
		
	
 // 자동발주 기준수량 + 버튼 눌렀을 때 숫자 증가
 	tBodyArea.on("click",".orderStdrqyUp", function () {
 		var ele = $(this)[0];	// 누른 버튼
 		var injectEle = $(ele).parents(".bootstrap-touchspin-injected");	
 		var inputEle = $(injectEle).find(".orderStdrqyInput").val();
 		orderStdrqyVal = parseInt(inputEle) + 1;
 		$(injectEle).find(".orderStdrqyInput").val(orderStdrqyVal);
 	});
 
 
 // 자동발주 기준수량 - 버튼 눌렀을 때 숫자 감소
 	tBodyArea.on("click", ".orderStdrqyDown", function () {
 	    var ele = $(this)[0]; // 누른 버튼
 	    var injectEle = $(ele).parents(".bootstrap-touchspin-injected");
 	    var inputEle = $(injectEle).find(".orderStdrqyInput");
 	    var currentValue = parseInt(inputEle.val());	//  - 누르기 전 현재 값

 	    if (currentValue > 0) {
 	        var orderStdrqyVal = currentValue - 1;
 	        inputEle.val(orderStdrqyVal);
 	    }
 	});
 
 
 
	// 0일때 마우스를 대면 빈값으로 클리어
	tBodyArea.on("focus", ".atorderQyInput", function() {
	    var atorderQyInput = $(this);
	    if (atorderQyInput.val() === '0') {
	    	atorderQyInput.val('');
	    }
	});
	
	// 여전히 빈값 상태로 포커스를 옮기면 다시 0으로
	tBodyArea.on("blur", ".atorderQyInput", function() {
	    var atorderQyInput = $(this);
	    if (atorderQyInput.val() === '') {
	    	atorderQyInput.val('0'); 
	    }
	});
	
	// 주문수량 키보드로 입력
	tBodyArea.on("input", ".atorderQyInput", function() {
    var atorderQyInput = $(this);
    var amount = atorderQyInput.closest('tr').find(".amount");
    var hdforwardPriceTd = atorderQyInput.closest('tr').find(".hdforwardPrice").text();
//     var hdforwardPrice = parseInt(hdforwardPriceTd);
    var atorderQyVal = parseInt(atorderQyInput.val());

    if (isNaN(atorderQyVal)) {
    	atorderQyVal = 0;
        atorderQyInput.val(0);
    }
    var tempInt = parseInt(hdforwardPriceTd.replace(/,/g, ''))*atorderQyVal;
	var temp = tempInt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
//     var total = hdforwardPrice * atorderQyVal;
    amount.text(temp);
	});
 
	 
	 
 	 // 자동발주 수량 + 버튼 눌렀을 때 숫자 증가
 	tBodyArea.on("click",".atorderQyUp", function () {
 		var ele = $(this)[0];	// 누른 버튼
 		var injectEle = $(ele).parents(".bootstrap-touchspin-injected");	// 모든 부모 요소 중 .bootstrap-touchspin-injected를 가지고 있는 녀석
 		var hdforwardPrice =  $(ele).parents("tr").find(".hdforwardPrice").text();	// 구매가
 		var amount =  $(ele).parents("tr").find(".amount")	// 주문 예상금액
 		var inputEle = $(injectEle).find(".atorderQyInput").val();
 		atorderQyVal = parseInt(inputEle) + 1;
 		$(injectEle).find(".atorderQyInput").val(atorderQyVal);
 		var tempInt = parseInt(hdforwardPrice.replace(/,/g, ''))*atorderQyVal;
 		var temp = tempInt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 		amount.text(temp);
 	});

 	 // 자동발주 기준수량 - 버튼 눌렀을 때 숫자 감소
 	tBodyArea.on("click",".atorderQyDown",function(){
 		var ele = $(this)[0];	// 누른 버튼
 		var injectEle = $(ele).parents(".bootstrap-touchspin-injected");
 		var hdforwardPrice =  $(ele).parents("tr").find(".hdforwardPrice").text();	// 구매가
 		var amount =  $(ele).parents("tr").find(".amount")	// 주문 예상금액
 		var inputEle = $(injectEle).find(".atorderQyInput");
 		var currentValue = parseInt(inputEle.val());	//  - 누르기 전 현재 값
 		
 		if(currentValue > 0){
 			var atorderQyVal = currentValue - 1;
	 		$(injectEle).find(".atorderQyInput").val(atorderQyVal);
	 		var tempInt = parseInt(hdforwardPrice.replace(/,/g, ''))*atorderQyVal;
	 		var temp = tempInt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	 		amount.text(temp);
 		}
 	});
	 
	// 추가한 행 삭제
	tBodyArea.on("click",".addDelBtn",function(){
		var delTr = $(this).closest('tr');
		delTr.remove();
	});
	
	// 자동발주 등록
	tBodyArea.on("click",".saveBtn",function(){
		var addTr = $(this).closest('tr');
		var vdprodCd = addTr.find('.vdprodCd').text();	// 제품코드
		var atorderStdrqy = addTr.find('.orderStdrqyInput').val();	// 자동발주 기준수량
		var atorderQy = addTr.find('.atorderQyInput').val();	// 자동발주 수량
		var frcsId = $("#frcsId").val();
		
		var data = {
			vdprodCd : vdprodCd,
			atorderStdrqy : atorderStdrqy,
			atorderQy : atorderQy,
			frcsId : frcsId
		}
		
		$.ajax({
			type : "post",
			url : "/owner/autoOrder/insert.do",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				if (res === "OK") {
			        Swal.fire({
			            title: "알림",
			            text: "자동발주 등록이 되었습니다",
			            confirmButtonText: "확인",
			            icon: "success",
			            preConfirm: function () {
			                location.href = "/owner/autoOrder.do";
			            }
			        });
				}
			}
		});
	});
	
	// 비활성화 버튼	
	tBodyArea.on("click",".disabledBtn",function(){
		var thisTr = $(this).closest('tr');
		var autoorderNo = $(this).data("autono");
		var btnText = $(this).text();
		var atorderAt;
		var alertText;
		
		if(btnText == '활성화'){
			atorderAt = "Y";
			alertText = "활성화 처리 되었습니다.";
		}else{
			atorderAt = "N";
			alertText = "비활성화 처리 되었습니다.";
		}
		
		var data = {
			autoorderNo : autoorderNo,
			atorderAt : atorderAt
		}
		
		$.ajax({
			type : "post",
			url : "/owner/autoOrder/disabled.do",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				if (res === "OK") {
			        Swal.fire({
			            title: "알림",
			            text: alertText,
			            confirmButtonText: "확인",
			            icon: "success",
			            preConfirm: function () {
			                location.href = "/owner/autoOrder.do";
			            }
			        });
				}
			}
		});
	});
	
	// 수정
	tBodyArea.on("click",".updateBtn",function(){
		var thisTr = $(this).closest('tr');
		var autoorderNo = $(this).data("autono");
		var atorderStdrqy = parseInt(thisTr.find(".atorderStdrqy").text());	// 이미 저장되어 있는 자동발주 기준수량
		var atorderQy = parseInt(thisTr.find(".atorderQy").text());	// 이미 저장되어 있는 자동발주 수량
		var hdforwardPrice = thisTr.find('.hdforwardPrice').text();
		
		var atorderStdrqyStr = "<div class='input-group bootstrap-touchspin bootstrap-touchspin-injected'>";
		atorderStdrqyStr += "<span class='input-grsoup-btn input-group-prepend'><button class='btn btn-primary bootstrap-touchspin-down orderStdrqyDown' type='button'>-</button></span>";
		atorderStdrqyStr += "<input data-toggle='touchspin' type='text' value='"+atorderStdrqy+"' class='form-control text-end orderStdrqyInput'>";
		atorderStdrqyStr += "<span class='input-group-btn input-group-append'><button class='btn btn-primary bootstrap-touchspin-up orderStdrqyUp' type='button'>+</button></span></div>";
		
		var atorderQyStr = "<div class='input-group bootstrap-touchspin bootstrap-touchspin-injected'>";
		atorderQyStr += "<span class='input-group-btn input-group-prepend'><button class='btn btn-primary bootstrap-touchspin-down atorderQyDown' type='button'>-</button></span>";
		atorderQyStr += "<input data-toggle='touchspin' type='text' value='"+atorderQy+"' class='form-control text-end atorderQyInput'>";
		atorderQyStr += "<span class='input-group-btn input-group-append'><button class='btn btn-primary bootstrap-touchspin-up atorderQyUp' type='button'>+</button></span></div>";
		
		thisTr.find('.atorderStdrqy').html(atorderStdrqyStr);
		thisTr.find('.atorderQy').html(atorderQyStr);
	
		$(this).attr('class','btn btn-info updateSaveBtn');
		// 제품 코드나 자동발주 번호..., 자동발주 기준 수량, 자동발주 수량, 프랜차이즈 아이디 보내면 된다.
		
	});
	
	
	tBodyArea.on("click",".updateSaveBtn",function(){
		var frcsId = $("#frcsId").val();
		var atorderStdrqy = $(this).closest('tr').find('.orderStdrqyInput').val();
		var atorderQy = $(this).closest('tr').find('.atorderQyInput').val();
		var autoorderNo = $(this).data("autono");
		
		data = {
				frcsId : frcsId,
				atorderStdrqy : atorderStdrqy,
				atorderQy : atorderQy,
				autoorderNo : autoorderNo
			}
			
			
			$.ajax({
				type : "post",
				url : "/owner/autoOrder/update.do",
				beforeSend : function(xhr){	// csrf토큰 보내기 위함
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
				},
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					if (res === "OK") {
				        Swal.fire({
				            title: "수정 성공",
				            text: "정상적으로 수정되었습니다.",
				            confirmButtonText: "확인",
				            icon: "success",
				            preConfirm: function () {
				                location.href = "/owner/autoOrder.do";
				            }
				        });
					}
				}
			});
		
	});
	
	
	// 체크박스 하나만 선택할 수 있게
	$("#modal1").on("click", ".checkBox", function () {
	    $(".checkBox").prop("checked", false);
	    $(this).prop("checked", true);
	});
	
	// 모달창 닫기 후 입력값 초기화
	$("#modal1").on("click",".btn-close",function(){
		$(".checkBox").prop("checked",false);
	});
});


</script>