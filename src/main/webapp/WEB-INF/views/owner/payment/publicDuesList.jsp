<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<input type="hidden" value=${frcsId } id="frcsId">
<div class="content-page">
	<div class="content">
		<div class="container-fluid">
		    <div class="row">
		        <div class="col-12">
		            <div class="page-title-box">
		                <div class="page-title-right">
		                    <ol class="breadcrumb m-0">
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">홈</a></li>
		                        <li class="breadcrumb-item"><a href="javascript: void(0);">납부</a></li>
		                        <li class="breadcrumb-item active">공과금 및 월세 관리</li>
		                    </ol>
		                </div>
		                <h4 class="page-title">공과금 및 월세 관리</h4>
		            </div>
		        </div>
		    </div>
		    
		    <!-- 월별 차트 -->
			<div class="row">
                <div class="col-xl-7">
                    <div class="card" style="height: 450px;">
                        <div class="card-body">
                            <h4 class="header-title mb-4">월별 차트</h4>
                            <div dir="ltr">
                                <div class="mt-3 chartjs-chart">
                                    <canvas id="monthChart" data-colors="#727cf5,#0acf97" style="box-sizing: border-box; display: block; height: 320px; width: 795px;" width="795" height="320"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xl-5">
	                <div class="card" style="height:450px;">
		                <div class="alert alert-warning border-0 rounded-0" role="alert">
		                    <i class="ri-bar-chart-box-line me-1 h4 align-middle"></i><b></b>전체 가맹점 평균 공과금 대비 내 가맹점 평균 공과금입니다.
		                </div>
		                <div class="card-body pt-1" style="display: flex; flex-direction: column; justify-content: center;">
		                    <div class="d-flex align-items-center border border-light rounded p-2 mb-2">
		                        <div class="flex-shrink-0 me-2">
		                            <i class="ri-drop-line widget-icon rounded-circle bg-info-lighten text-info"></i>
		                        </div>
		                        
                                <c:set value="${((totalAverage.duesWater-average.duesWater)/totalAverage.duesWater)*-100 }" var="duesW"/>
				                <c:set value="${((totalAverage.duesElcty-average.duesElcty)/totalAverage.duesElcty)*-100 }" var="duesE"/>
				                <c:set value="${((totalAverage.duesGas-average.duesGas)/totalAverage.duesGas)*-100 }" var="duesG"/>
				                <c:set value="${((totalAverage.duesMtht-average.duesMtht)/totalAverage.duesMtht)*-100 }" var="duesM"/>
		                        
		                        <div class="flex-grow-1">
		                            <h5 class="fw-semibold my-0">수도세</h5>
		                            <p class="mb-0"><span><fmt:formatNumber value="${average.duesWater }" type="number"/>원</span>
		                            <c:if test="${duesW ge 0}">
		                            <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesW }"/>%</span>
		                            </c:if>
		                            <c:if test="${duesW le 0}">
		                            <span class="text-danger me-2"><i class="mdi mdi-arrow-down-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesW }"/>%</span>
		                            </c:if>
		                            </p>
		                        </div>
		                    </div>
		                    
		                    <div class="d-flex align-items-center border border-light rounded p-2 mb-2">
		                        <div class="flex-shrink-0 me-2">
		                            <i class="ri-flashlight-line widget-icon rounded-circle bg-warning-lighten text-warning"></i>
		                        </div>
		                        <div class="flex-grow-1">
		                            <h5 class="fw-semibold my-0">전기세</h5>
		                            <p class="mb-0"><span><fmt:formatNumber value="${average.duesElcty }" type="number"/>원</span>
		                            <c:if test="${duesE ge 0}">
		                            <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesE }"/>%</span>
		                            </c:if>
		                            <c:if test="${duesE le 0}">
		                            <span class="text-danger me-2"><i class="mdi mdi-arrow-down-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesE }"/>%</span>
		                            </c:if>
		                            </p>
		                        </div>
		                    </div>
		
		                    <div class="d-flex align-items-center border border-light rounded p-2 mb-2">
		                        <div class="flex-shrink-0 me-2">
		                            <i class="ri-fire-line widget-icon rounded-circle bg-danger-lighten text-danger"></i>
		                        </div>
		                        <div class="flex-grow-1">
		                            <h5 class="fw-semibold my-0">가스비</h5>
		                            <p class="mb-0"><span><fmt:formatNumber value="${average.duesGas }" type="number"/>원</span>
		                            <c:if test="${duesG ge 0}">
		                            <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesG }"/>%</span>
		                            </c:if>
		                            <c:if test="${duesG le 0}">
		                            <span class="text-danger me-2"><i class="mdi mdi-arrow-down-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesG }"/>%</span>
		                            </c:if>
		                            </p>
		                        </div>
		                    </div>
		
		                    <div class="d-flex align-items-center border border-light rounded p-2">
		                        <div class="flex-shrink-0 me-2">
		                            <i class="ri-building-line widget-icon rounded-circle bg-success-lighten text-success"></i>
		                        </div>
		                        <div class="flex-grow-1">
		                            <h5 class="fw-semibold my-0">월세</h5>
		                            <p class="mb-0"><span><fmt:formatNumber value="${average.duesMtht }" type="number"/>원</span>
		                            <c:if test="${duesM ge 0}">
		                            <span class="text-success me-2"><i class="mdi mdi-arrow-up-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesM }"/>%</span>
		                            </c:if>
		                            <c:if test="${duesM le 0}">
		                            <span class="text-danger me-2"><i class="mdi mdi-arrow-down-bold"></i><fmt:formatNumber maxFractionDigits="3" value="${duesM }"/>%</span>
		                            </c:if>
		                            </p>
		                            
		                        </div>
		                    </div>
		                </div>
		           	</div>
	            </div>
            </div>

	        <div class="col-12">
	            <div class="card">
	                <div class="card-body">
	                    <div class="row mb-2">
							<!-- 검색창  -->
	                        <div class="col-xl-10">
	                            <form id="searchForm" class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
	                                <input type="hidden" name="page" id="page"/>
	                                <div class="col-auto">
		                                <div class="d-flex align-items-center">
	                                  		<select class="form-select" id="searchYear" name="searchYear">
	                                            <option value="">년도</option>
	                                            <option value="2023"<c:if test="${searchYear eq '2023' }">selected</c:if>>2023</option>
	                                            <option value="2022"<c:if test="${searchYear eq '2022' }">selected</c:if>>2022</option>
	                                            <option value="2021"<c:if test="${searchYear eq '2021' }">selected</c:if>>2021</option>
	                                            <option value="2020"<c:if test="${searchYear eq '2020' }">selected</c:if>>2020</option>
	                                            <option value="2019"<c:if test="${searchYear eq '2019' }">selected</c:if>>2019</option>
	                                        </select>
										</div>
	                                </div>
	                                <div class="col-auto">
	                                    <div class="d-flex align-items-center">
	                                        <select class="form-select" id="searchMonth" name="searchMonth">
	                                            <option value="">월</option>
	                                            <option value="01" <c:if test="${searchMonth eq '01' }">selected</c:if>>1월</option>
	                                            <option value="02" <c:if test="${searchMonth eq '02' }">selected</c:if>>2월</option>
	                                            <option value="03" <c:if test="${searchMonth eq '03' }">selected</c:if>>3월</option>
	                                            <option value="04" <c:if test="${searchMonth eq '04' }">selected</c:if>>4월</option>
	                                            <option value="05" <c:if test="${searchMonth eq '05' }">selected</c:if>>5월</option>
	                                            <option value="06" <c:if test="${searchMonth eq '06' }">selected</c:if>>6월</option>
	                                            <option value="07" <c:if test="${searchMonth eq '07' }">selected</c:if>>7월</option>
	                                            <option value="08" <c:if test="${searchMonth eq '08' }">selected</c:if>>8월</option>
	                                            <option value="09" <c:if test="${searchMonth eq '09' }">selected</c:if>>9월</option>
	                                            <option value="10" <c:if test="${searchMonth eq '10' }">selected</c:if>>10월</option>
	                                            <option value="11" <c:if test="${searchMonth eq '11' }">selected</c:if>>11월</option>
	                                            <option value="12" <c:if test="${searchMonth eq '12' }">selected</c:if>>12월</option>
	                                        </select>
	                                    </div>
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
	                        
	                        <div class="col-xl-2">
	                            <div class="text-xl-end mt-xl-0 mt-2">
									<!-- 등록 모달창 -->
									<button type="button" class="btn btn-warning mb-2" data-bs-toggle="modal" data-bs-target="#registerModal" id="registerFormBtn">등록</button>
									<div id="registerModal" class="modal fade text-start" tabindex="-1" role="dialog" aria-hidden="true"> <!-- data-bs-backdrop="static" 모달창 안닫기게 하려면 이거 설정 -->
									    <div class="modal-dialog modal-dialog-centered">
									        <div class="modal-content">
									            <div class="modal-body">
									                <div class="text-center mt-2 mb-4"> 
									                	<h3>공과금 납부 내역 등록</h3>
									                </div>
									                <form class="ps-3 pe-3" action="/owner/dues/register.do" method="post" id="registerForm">
									             	   <input type="hidden" name="frcsId" value="${frcsId }"/>
									                   <div class="mb-3 d-flex align-items-baseline">
									                        <label for="duesPayde" class="form-label col-2">납부년월</label>
                                                               <input class="form-control" id="duesPayde" type="month" name="duesPayde">
									                    </div>
									                    <div class="mb-3 d-flex align-items-baseline">
									                        <label for="duesElcty" class="form-label col-2">전기세</label>
									                        <input class="form-control text-end" type="text" id="duesElcty" name="duesElcty" placeholder="전기세를 입력해주세요.">
									                    </div>
									
									                    <div class="mb-3 d-flex align-items-baseline">
									                        <label for="duesWater" class="form-label col-2">수도세</label>
									                        <input class="form-control text-end" type="text" id="duesWater" name="duesWater" placeholder="수도세를 입력해주세요.">
									                    </div>
									
									                    <div class="mb-3 d-flex align-items-baseline">
									                        <label for="duesGas" class="form-label col-2">가스비</label>
									                        <input class="form-control text-end" type="text" id="duesGas" name="duesGas" placeholder="가스비를 입력해주세요.">
									                    </div>
									                    
									                    <div class="mb-3">
														    <div class="d-flex align-items-baseline">
														        <label for="duesmthtYN" class="form-label" style="margin-right: 2rem;">월세여부</label>
														        <div class="form-check form-check-inline">
														            <input type="radio" id="duesmthtYes" name="duesMthtYN" class="form-check-input" value="Y">
														            <label class="form-check-label" for="duesmthtYes">월세</label>
														        </div>
														        <div class="form-check form-check-inline">
														            <input type="radio" id="duesmthtNo" name="duesMthtYN" class="form-check-input" checked="checked" value="N">
														            <label class="form-check-label" for="duesmthtNo">월세아님</label>
														        </div>
														    </div>
														    <input class="form-control text-end" type="text" id="duesMtht" name="duesMtht" value="0" disabled>
														</div>
														
									                    <div class="mb-3 text-center">
									                        <input type="button" class="btn btn-light" style="margin-right: 0.08rem;" data-bs-dismiss="modal" value="닫기">
									                        <input type="button" class="btn btn-primary" id="registerBtn" value="등록">
									                        <input type="button" class="btn btn-success" id="autoBtn" value="자동완성">
									                    </div>
									                    <sec:csrfInput/>
									                </form>
									            </div>
									        </div>
									    </div>
									</div>
									<!-- 등록 모달창 끝 -->
	                                <button type="button" class="btn btn-success mb-2" onclick="location.href='/owner/publicDues/excel.do'">엑셀 다운로드</button>
	                            </div>
	                        </div>
	                    </div>
	
						<!-- 리스트 출력 -->
	                    <div class="table-responsive">
	                        <table class="table table-centered table-nowrap mb-0 table-hover fold-table">
	                            <thead class="table-light">
	                                <tr>
	                                    <th style="width: 20px;">
	                                        <div class="form-check">
	                                        </div>
	                                    </th> 
	                                    <th style="text-align:center; width:200px;">제목</th>
	                                    <th style="text-align:center; width:150px;">등록일자</th>
	                                    <th style="text-align:center; width:150px;">총 납부금액</th>
	                                    <th style="text-align:center; width:150px;"></th>
	                                </tr>
	                            </thead>
	                            <tbody id="tBody">
	                            	<c:set value="${pagingVO.dataList }" var="duesList"/>
	                            	<c:choose>
	                            		<c:when test="${empty duesList }">
		                            	<tr>
	                            			<td colspan="5" style="text-align:center">
	                            				등록된 납부내역이 존재하지 않습니다.
	                            			</td>
	                            		</tr>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<c:forEach items="${duesList }" var="dues" varStatus="stat">
			                                <tr class="view">
			                                    <td>
			                                        <div class="form-check">
			                                            <input type="checkbox" class="form-check-input" id="customCheck2">
			                                            <label class="form-check-label" for="customCheck2">&nbsp;</label>
			                                        </div>
			                                    </td>
			                                    <td style="text-align:center">${dues.duesPayde }월 공과금 내역</td>
			                                    <td style="text-align:center"><fmt:formatDate value="${dues.duesDate }" pattern="yyyy/MM/dd"/></td>
			                                    <td style="text-align:center"><fmt:formatNumber value="${dues.duesGas+dues.duesWater+dues.duesElcty+dues.duesMtht }" type="number"/>(원)</td>
			                                    <td style="text-align:center">
												<!-- 수정 모달창  -->
												<button type="button" class="btn btn-primary" id="updateFormBtn" data-payde="${dues.duesPayde }" data-bs-target="#updatemodal${stat.count }"> 수정 </button>
												<div id="updatemodal${stat.count }" class="modal fade text-start" tabindex="-1" role="dialog" aria-hidden="true">
											    <div class="modal-dialog modal-dialog-centered">
											        <div class="modal-content">
											            <div class="modal-body">
											                <div class="text-center mt-2 mb-4"> 
											                	<h3>공과금 납부 내역 수정</h3>
											                </div>
											                <form class="ps-3 pe-3" action="/owner/dues/duesUpdate.do" method="post" id="duesUpdateForm">
											             		<input type="hidden" name="frcsId" value="${frcsId }"/>
											             		<input type="hidden" name="duesPayde" value="${dues.duesPayde }"/>
											                   <div class="mb-3 d-flex align-items-baseline">
											                        <label for="duesPayde1" class="form-label col-2">납부년월</label>
	                                                                <input class="form-control" id="duesPayde1" type="month" name="duesPayde">
											                    </div>
											                    <div class="mb-3 d-flex align-items-baseline">
											                        <label for="duesElcty1" class="form-label col-2">전기세</label>
											                        <input class="form-control text-end" type="text" id="duesElcty1" name="duesElcty" placeholder="전기세를 입력해주세요.">
											                    </div>
											
											                    <div class="mb-3 d-flex align-items-baseline">
											                        <label for="duesWater1" class="form-label col-2">수도세</label>
											                        <input class="form-control text-end" type="text" id="duesWater1" name="duesWater" placeholder="수도세를 입력해주세요.">
											                    </div>
											
											                    <div class="mb-3 d-flex align-items-baseline">
											                        <label for="duesGas1" class="form-label col-2">가스비</label>
											                        <input class="form-control text-end" type="text" id="duesGas1" name="duesGas" placeholder="가스비를 입력해주세요.">
											                    </div>
											                    
											                    <div class="mb-3">
																    <div class="d-flex align-items-baseline">
																        <label for="duesmthtYN" class="form-label" style="margin-right: 2rem;">월세여부</label>
																        <div class="form-check form-check-inline">
																            <input type="radio" id="duesmthtYes1" name="duesMthtYN" class="form-check-input" value="Y">
																            <label class="form-check-label" for="duesmthtYes">월세</label>
																        </div>
																        <div class="form-check form-check-inline">
																            <input type="radio" id="duesmthtNo1" name="duesMthtYN" class="form-check-input" value="N">
																            <label class="form-check-label" for="duesmthtNo">월세아님</label>
																        </div>
																    </div>
																    <input class="form-control text-end" type="text" id="duesMtht1" name="duesMtht" value="0">
																</div>
																
											                    <div class="mb-3 text-center">
											                        <input type="button" class="btn btn-light" style="margin-right: 0.08rem;" data-bs-dismiss="modal" value="닫기">
											                        <input type="button" class="btn btn-primary" id="updateBtn" value="수정">
											                    </div>
											                    <sec:csrfInput/>
											                </form>
											            </div>
											        </div>
											    </div>
											</div>
												
												<!-- 삭제 모달창 -->
												<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#delmodal${stat.count }" data-payde="${dues.duesPayde }" id="delFormBtn">삭제</button>
												<div id="delmodal${stat.count }" class="modal fade text-start" tabindex="-1" role="dialog" aria-hidden="true" >
												    <div class="modal-dialog modal-dialog-centered">
												        <div class="modal-content">
												            <div class="modal-body">
												                <div class="text-center mt-2 mb-4"> 
												                </div>
												                <form class="ps-3 pe-3" action="/owner/dues/delete.do" method="post" id="delForm">
												                	<input type="hidden" name="frcsId" value="${frcsId }"/>
												                	<input type="hidden" name="duesPayde" value="${dues.duesPayde }" />
												                 	  <div class="text-center mt-2 mb-4"> 
												                		<h4>정말 삭제하시겠습니까?</h4>
												                		</div>
												                    <div class="mb-3 text-center">
												                        <input type="button" class="btn btn-light" style="margin-right: 0.08rem;" data-bs-dismiss="modal" value="취소">
												                        <input id="delBtn" type="button" class="btn btn-primary" value="확인">
												                    </div>
												                    <sec:csrfInput/>
												                </form>
												            </div>
												        </div>
												    </div>
												</div>
												<!-- 삭제 모달창 종료 -->			
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
<script type="text/javascript">
$(function(){
	var duesmthtYes = $("#duesmthtYes");
	var duesmthtNo = $("#duesmthtNo");
	var duesMtht = $("#duesMtht");
	var registerForm = $("#registerForm");	// 등록 모달 폼
	var registerBtn = $("#registerBtn");	// 등록 폼 안의 등록버튼
	var tBody = $("#tBody");
	var delBtn = $("#delBtn");	// 삭제 모달창
	var delConfirm = $("#delConfirm");	// 삭제 모달창 안의 삭제버튼
	var searchForm = $("#searchForm");	// 검색 폼
	var pagingArea = $("#pagingArea");
	var frcsId = $("#frcsId").val();
	var autoBtn = $("#autoBtn");
	
	// 자동완성
	autoBtn.on("click",function(){
		$("#duesElcty").val(180000);
		$("#duesWater").val(300000);
		$("#duesGas").val(200000);
		$("#duesmthtYes").attr("checked", true);
		$("#duesMtht").attr("disabled", false);
		$("#duesMtht").val(1000000);
	});
	
	// a 태그를 클릭하면 이벤트 실행 (페이징 처리)
	pagingArea.on("click","a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	// 월세로 체크하면 입력칸 활성화
	duesmthtYes.on("click",function(){
		duesMtht.attr("disabled",false);
	});
	
	// 월세아님으로 체크하면 입력칸 비활성화
	duesmthtNo.on("click",function(){
		duesMtht.attr("disabled",true);
		duesMtht.val(0);
	});

	// 등록 시 납부년월 중복체크 및 입력여부 검증
	registerBtn.on("click",function(){
		var duesPayde = $("#duesPayde").val();	// 납부년월 
		var duesElcty = $("#duesElcty").val();
		var duesWater = $("#duesWater").val();
		var duesGas = $("#duesGas").val();
		var duesMtht = $("#duesMtht").val();
		var frcsId = $("#frcsId").val();
		
		if(duesPayde == null || duesPayde == ""){
			alert("납부년월을 선택해주세요.");
			return false;
		}
		
		// 숫자만 입력할 수 있게 정규식체크
		if(!isNum(duesElcty) || !isNum(duesWater) || !isNum(duesGas) || !isNum(duesMtht)){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		// 숫자이면 true, 숫자가 아니면 false를 리턴
		function isNum(val){
			return /^\d+$/.test(val);
		}
	
		var data = {
			frcsId : frcsId,
			duesPayde : duesPayde
		}
		
		// 납부년월 중복 체크
		$.ajax({
			type: "post",
			url : "/owner/dues/duesPaydeCheck.do",
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			success: function(res){
				
				console.log("납부년월 중복 확인 결과 : " + res);
				if(res == "EXIST"){
					Swal.fire({
			            title: "중복",
			            text: "이미 등록된 납부일자입니다.",
			            confirmButtonText: "확인",
			            icon: "error",
			            preConfirm: function () {
			            }
			        });
						return false;
				}else{
					registerForm.submit();
				}
			}
		});
	});
		
	// 삭제
	tBody.on("click","#delFormBtn",function(){	// 삭제버튼을 클릭하면
		var thisEle = $(this);	// 클릭한 버튼 요소
		
		thisEle.next().find("#delBtn").on("click",function(){
			thisEle.next().find("#delForm").submit();
		});
	});
	
	// 수정
	tBody.on("click","#updateFormBtn",function(){	// 수정버튼을 클릭하면
		var thisEle = $(this);	// 클릭한 버튼
		var duesPaydeDate = $(this).data("payde");	
		
		
		var data = {
			duesPayde : duesPaydeDate,
			frcsId : frcsId
		};

		// 해당 모달창을 띄우기 위해
		var targetModal = $($(this).data("bs-target"));
		
		// 상세내역 ajax + 수정
		$.ajax({
			type: "post",
			url : "/owner/dues/duesDetail.do",
			beforeSend : function(xhr){	// csrf토큰 보내기 위함
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
			},
			data : JSON.stringify(data),
			contentType : "application/json; charset=utf-8",
			success : function(res){
				console.log(res);

				var duesPayde = res.duesPayde;
				var duesElcty = res.duesElcty;
				var duesWater = res.duesWater;
				var duesGas = res.duesGas;
				var duesMthtYN = res.duesMthtYN;
				var duesMtht = res.duesMtht;
				
				thisEle.next().find("#duesPayde1").val(duesPayde);
				thisEle.next().find("#duesPayde1").attr("disabled",true);
				thisEle.next().find("#duesElcty1").val(duesElcty);
				thisEle.next().find("#duesWater1").val(duesWater);
				thisEle.next().find("#duesGas1").val(duesGas);
				thisEle.next().find("#duesMtht1").val(duesMtht);
				thisEle.next().find("#duesMthtYN1").val(duesMthtYN);
				
				// 월세여부  라디오버튼 체크 
				if(duesMthtYN == "Y"){
					thisEle.next().find("#duesmthtYes1").attr("checked", true);
				}else{
					thisEle.next().find("#duesmthtNo1").attr("checked", true);
					thisEle.next().find("#duesMtht1").attr("disabled", true);
				}

				// 월세여부 N로 했을 때 월세 금액 적는 칸 비활성화 및 0으로 셋팅
				thisEle.next().find("#duesmthtNo1").on("click",function(){
					thisEle.next().find("#duesMtht1").attr("disabled",true);
					thisEle.next().find("#duesMtht1").val(0);
				});
				
				// 월세여부를 다시 Y로 바꿨을 때 월세 금액 적는 칸 다시 활성화 및 원래 값 셋팅
				thisEle.next().find("#duesmthtYes1").on("click",function(){
					thisEle.next().find("#duesMtht1").attr("disabled",false);
					thisEle.next().find("#duesMtht1").val(duesMtht);
				});
				
				targetModal.modal("show");
				console.log(targetModal);
				 
				thisEle.next().find("#updateBtn").on("click",function(){
					Swal.fire({
			            title: "수정 성공",
			            text: "내역 수정에 성공하였습니다.",
			            confirmButtonText: "확인",
			            icon: "success",
			            preConfirm: function () {
							thisEle.next().find("#duesUpdateForm").submit();
			            }
			        });
				});
			}
		});
	});
	
	// 월세 차트
	var frcsId = $("#frcsId").val();
	var duesMthtChart = [];	// 월세내역 
	var duesPayTotal = [];	// 공과금내역
	
	// 월세/공과금 배열 크기 12로 지정
	for(var i=0; i<12; i++){
		duesMthtChart.push(0);	// 기본값 0으로 지정
		duesPayTotal.push(0);
	}
	
	$.ajax({
		type : "post",
		url : "/owner/dues/chart.do",
		beforeSend : function(xhr){	// csrf토큰 보내기 위함
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
		},
		data : {frcsId : frcsId},
		success : function(res){
			
			for(var i=0; i<res.length; i++){
				console.log(res[i].duesPayde);
				var month = (res[i].duesPayde).substr(5);	// 월만 추출
				var index; 
				
				// 0으로 시작하는 달은 0 자르기
				if(month.startsWith(0)){
					index = parseInt((res[i].duesPayde).substr(6))-1; 	
				}else{
					index = parseInt(month)-1;
				}
				console.log(index);
				
				duesMthtChart[index] = res[i].duesMtht;
				duesPayTotal[index] =  res[i].duesElcty+res[i].duesWater+res[i].duesGas;
			}
			console.log(duesMthtChart);
			console.log(duesPayTotal);
			
			// 월별
		    var months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
		    
		    // 캔버스 엘리먼트 설정
			var ctx = document.getElementById('monthChart').getContext('2d');

		    // Chart 객체 생성
			var chart = new Chart(ctx, {
			    type: 'bar', // 막대그래프
			    data: {
			        labels: months,
			        datasets: [
			            {
			                label: '공과금',
			                data: duesPayTotal,
			                backgroundColor: 'rgba(255, 99, 132, 0.2)',
			                borderColor: 'rgba(255, 99, 132, 1)',
			                borderWidth: 1
			            },
			            {
			                label: '월세',
			                data: duesMthtChart,
			                type: 'line', // 꺾은선 그래프
			                fill: false,
			                borderColor: 'rgba(54, 162, 235, 1)',
			                borderWidth: 2
			            }
			        ]
			    },
			    options: {
			        responsive: true,
			        scales: {
			            x: {
			                title: {
			                    display: true,
			                    text: '월'
			                }
			            },
			            y: {
			                beginAtZero: true,
			                title: {
			                    display: true,
			                    text: '금액'
			                },
			                grid: {
			                    display: false
			                }
			            }
			        }
			    }
			});
			
		}
	});
});

</script>