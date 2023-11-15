<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style>

td{
  padding: 10px;
  text-align: left;
}

tr > td {
    vertical-align: left;
}

#scrolling-text-container {
  width: 100%;
  overflow: hidden;
}

#scrolling-text {
  white-space: nowrap;
  animation: scrolling 18s linear infinite;
}

@keyframes scrolling {
  0% {
    transform: translateX(100%);
  }
  100% {
    transform: translateX(-100%);
  }
}



.blinking{
  -webkit-animation: blink 1s ease-in-out infinite alternate;
  -moz-animation: blink 1s ease-in-out infinite alternate;
  animation: blink 1s ease-in-out infinite alternate;
}

@-webkit-keyframes blink{
  0% {opacity: 0;}
  100% {opacity: 1;}
}

@-moz-keyframes blink{
  0% {opacity: 0;}
  100% {opacity: 1;}
}

@keyframes blink{
  0% {opacity: 0;}
  100% {opacity: 1;}
}
</style>

<!-- ============================================================== -->
<!-- Start Page Content here -->
<!-- ============================================================== -->
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
                             <li class="breadcrumb-item"><a href="javascript: void(0);">엘리할머니맥주</a></li>
                             <li class="breadcrumb-item active">관리자페이지</li>
                         </ol>
                     </div>
                     <h4 class="page-title"><span class="text-primary">관리자님 </span>환영합니다!</h4>
                 </div>
             </div>
         </div>
			
			
		<div class="row">
	        <div class="col-12">
	            <div class="row">
	                <div class="col-sm-6 col-xl-3 mb-3">
	                    <div class="card mb-0 h-100">
	                            
                            <div class="card-body text-center">
                            <span class="d-inline-block" tabindex="0" data-bs-placement="top" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="전국 가맹점을 조회합니다.">
                            	<a href="/head/storeInquiry.do" class="link-primary">
					               <i class="ri-calendar-2-line text-muted font-24"></i>
					               <h3 class="text-muted font-15 mb-0">가맹점 관리</h3>
					               <p class="text-primary font-15 mb-0 mt-1">가맹점 목록 조회, 상세조회</p>
				               </a>
                            	</span>
				           	</div>
	                    </div> 
	                </div>
	                <div class="col-sm-6 col-xl-3 mb-3">
	                    <div class="card mb-0 h-100">
	                         
	                    	<div class="card-body text-center">
	                    	 <span class="d-inline-block" tabindex="0" data-bs-placement="top" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="본사의 매입내역을 조회합니다.">
		                        <a href="/head/purchaseList.do" class="link-primary">
									<i class="ri-list-check-2 text-muted font-24"></i>
									<h3 class="text-muted font-15 mb-0">매입 내역 관리</h3>
									<p class="text-primary font-15 mb-0 mt-1">거래처 매입내역 조회, 추가</p>
					           	</a>
					           	</span>
				           	</div>
	                    </div>
	                </div>
	
	                <div class="col-sm-6 col-xl-3 mb-3">
	                    <div class="card mb-0 h-100">
	                        <div class="card-body text-center">
	                         <span class="d-inline-block" tabindex="0" data-bs-placement="top" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="가맹점의 매출정보를 조회합니다.">
	                        	<a href="/head/salesAnalysis.do" class="link-primary">
									<i class="uil-analysis text-muted font-24"></i>
									<h3 class="text-muted font-15 mb-0">매출 분석</h3>
									<p class="text-primary font-15 mb-0 mt-1">영업이익, 당기순이익 조회</p>
				                </a>
				                </span>
				           	</div>
	                    </div> 
	                </div>
	
	                <div class="col-sm-6 col-xl-3 mb-3">
	                    <div class="card mb-0 h-100">
	                        <div class="card-body text-center">
	                        <span class="d-inline-block" tabindex="0" data-bs-placement="top" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="본사의 매입내역을 조회합니다.">
	                        	<a href="/head/headInventoryList.do" class="link-primary">
					              	<i class="ri-add-line text-muted font-24"></i>
					                <h3 class="text-muted font-15 mb-0">상품 재고 현황</h3>
					                <p class="text-primary font-15 mb-0 mt-1">상품별 재고현황 조회</p>
				                </a>
				                </span>
				           	</div>
	                    </div>
	                </div>
	            </div>

		
	         <!-- 최근 가맹점 주문 -->
	        <c:set value="${dataList }" var="data" />
			
			<div class="row">
			    <div class="col-12">
			         <div class="row">
			        	<div class="col">
							<div class="col-md-12 card widget-inline p-3 gap-2">
						<div class="col-md-12">
							<div class="col-md-6 text-primary font-20" style="float:left; font-weight: bold;"><i class="uil-exclamation-circle me-2"></i>최근 가맹점주문 <strong class="blinking">${orderCount }</strong>건</div>
							<div class="col-md-6 d-flex justify-content-end" style="float:left;">
							<span class="d-inline-block" tabindex="0" data-bs-placement="left" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="가맹점 주문내역을 확인할 수 있습니다!">
							<button type="button" class="btn btn-sm btn-danger" onclick="location.href='/head/storeOrderHistory.do'">더보기</button></div>
							</span>
						</div>
					<div class="col-12 mt-1">
						<div class="col-md-12 text-muted font-16">최근 3일간 데이터 최대 3건만 조회되며, 모두 보려면 
							  <strong>
							    <a href="/head/storeOrderHistory.do" class="link-primary">더보기</a>
							  </strong>를 클릭하세요
						</div>
						</div>
							<c:choose>
								<c:when test="${empty data }">
								<table style="background-color:#ffedb8; border-radius:25px;">
									<tbody>
										<tr>
											<td style="text-align: center;" colspan="4">최근 주문내역이 존재하지 않습니다.</td>
										</tr>
									</tbody>
								</table>
								</c:when>
								<c:otherwise> 
									<c:forEach items="${data }" var="dt" begin="0" end="2">
										<table style="background-color:#ffedb8; border-radius:25px;">
											<tbody>		
												<tr>
											        <td class="col-3">${dt.frcsName }</td>
											        <td class="col-3">${dt.frcsTel }</td>
											        <td class="col-3">
											        	<fmt:formatNumber value="${dt.frcsorderAmt }" type="number"/>(원)
											        </td>
										            <td class="col-3">${dt.frcsorderDate }</td>
									        	</tr>
											</tbody>
										</table>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					
			 	<!-- 최근 오픈매장 -->
				<c:set value="${openFranchise }" var="op" />
			
				<div class="col">
					<div class="col-md-12 card widget-inline p-3 gap-2">
						<div class="col-lg-12">
							<div class="col-md-6 text-primary font-20" style="float:left; font-weight: bold;"><i class="uil-exclamation-circle me-2"></i>최근 오픈매장 <strong class="blinking">${openCount }</strong>건</div>
																				
							<div class="col-md-6 d-flex justify-content-end" style="float:left">
								<span class="d-inline-block" tabindex="0" data-bs-placement="left" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="개점 일정 계획을 확인할 수 있습니다!">
							<button type="button" class="btn btn-sm btn-danger" onclick="location.href='/head/plan.do'">더보기</button></div>
								</span>
						</div>
						<div class="col-md-12 mt-1">
							<div class="col-md-12 text-muted mb-1 font-16">최근 3개월 데이터 최대 3건만 조회되며, 모두 보려면
							  <strong>
							    <a href="/head/plan.do" class="link-primary">더보기</a>
							  </strong>를 클릭하세요
							</div>
						</div>
						<c:choose>
							<c:when test="${empty op }">
							<table style="background-color:#ffe5e5; border-radius:25px;">
								<tbody>
									<tr>
										<td colspan="4">최근 오픈한 가맹점이 존재하지 않습니다.</td>
									</tr>
								</tbody>
							</table>
							</c:when>
							<c:otherwise> 
								<c:forEach items="${op }" var="open" begin="0" end="2">
									<table style="background-color:#ffe5e5; border-radius:25px;">
										<tbody>		
											<tr>
										        <td class="col-2">${open.frcsId }</td>
										        <td class="col-2">${open.frcsName }</td>
										        <td class="col-6">${open.frcsAdd1 } ${open.frcsAdd2 }</td>
									            <td class="col-2">${open.frcsOpdate }</td>
								        	</tr>
										</tbody>
									</table>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<!-- 최근 공문 -->
		<c:set value="${officeLetterList }" var="list" />
			
			<div class="row">
			    <div class="col-12">
			         <div class="row">
			        	<div class="col">
							<div class="col-md-12 card widget-inline p-3 gap-2">
						<div class="col-md-12">
							<div class="col-md-6 text-primary font-20" style="float:left; font-weight: bold;"><i class="uil-exclamation-circle me-2"></i>오늘 공문 <strong class="blinking">${officeLetterCount }</strong>건</div>
							<div class="col-md-6 d-flex justify-content-end" style="float:left;">
							<span class="d-inline-block" tabindex="0" data-bs-placement="left" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="오늘 공문을 확인할 수 있습니다!">
							<button type="button" class="btn btn-sm btn-danger" onclick="location.href='/head/officeLetter.do'">더보기</button></div>
							</span>
						</div>
					<div class="col-12 mt-1">
						<div class="col-md-12 text-muted font-16">금일 수신공문 최대 3건만 조회되며, 모두 보려면 
							  <strong>
							    <a href="/head/officeLetter.do" class="link-primary">더보기</a>
							  </strong>를 클릭하세요
						</div>
						</div>
							<c:choose>
								<c:when test="${empty list }">
								<table style="background-color:#cef5ea; border-radius:25px;">
									<tbody>
										<tr>
											<td style="text-align: center;" colspan="4">최근 공문이 존재하지 않습니다.</td>
										</tr>
									</tbody>
								</table>
								</c:when>
								<c:otherwise> 
									<c:forEach items="${list }" var="officelist" begin="0" end="2">
										<table style="background-color:#cef5ea; border-radius:25px;">
											<tbody>		
												<tr>
											        <td class="col-3">${officelist.frcsOfldcNo }</td>
											        <td class="col-3">${officelist.frcsOfldcSndpty }</td>
											        <td class="col-3">${officelist.frcsOfldcTtl}</td>
										       		<td class="col-3">
														    <fmt:formatDate value="${officelist.frcsOfldcDspymd}" pattern="yy-MM-dd" />
													</td>
									        	</tr>
											</tbody>
										</table>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					
					
				<!-- 창업문의 -->
				<c:set value="${counselList }" var="counsel" />
			
				<div class="col">
					<div class="col-md-12 card widget-inline p-3 gap-2">
						<div class="col-lg-12">
							<div class="col-md-6 text-primary font-20" style="float:left; font-weight: bold;"><i class="uil-exclamation-circle me-2"></i>최근 창업 문의 <strong class="blinking">${counselCount }</strong>건</div>
																				
							<div class="col-md-6 d-flex justify-content-end" style="float:left">
								<span class="d-inline-block" tabindex="0" data-bs-placement="left" data-bs-toggle="popover" data-bs-trigger="hover focus" data-bs-content="창업문의를 확인할 수 있습니다!">
							<button type="button" class="btn btn-sm btn-danger" onclick="location.href='/head/counseling.do'">더보기</button></div>
								</span>
						</div>
						<div class="col-md-12 mt-1">
							<div class="col-md-12 text-muted mb-1 font-16">최근 3개월 데이터 최대 3건만 조회되며, 모두 보려면
							  <strong>
							    <a href="/head/counseling.do" class="link-primary">더보기</a>
							  </strong>를 클릭하세요
							</div>
						</div>
						<c:choose>
							<c:when test="${empty counsel }">
							<table style="background-color:#AEDFF7; border-radius:25px;">
								<tbody>
									<tr>
										<td style="text-align: center;" colspan="4">최근 창업문의가 없습니다.</td>
									</tr>
								</tbody>
							</table>
							</c:when>
							<c:otherwise> 
								<c:forEach items="${counsel }" var="counsel" begin="0" end="2">
									<table style="background-color:#AEDFF7; border-radius:25px;">
										<tbody>		
											<tr>
										        <td class="col-3">${counsel.ownerId }</td>
										        <td class="col-3">${counsel.ownerName } 님</td>
										        <td class="col-3">${counsel.ownerInfocontent }</td>
									          	<td class="col-3">
												    <fmt:formatDate value="${counsel.ownerRgdate}" pattern="yy-MM-dd" />
												</td>
								        	</tr>
										</tbody>
									</table>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 슬라이드 -->  
	 
<c:set value="${officeLetterList}" var="list" />
<c:set value="${openFranchise}" var="op" />
<c:set value="${dataList}" var="data" />
<c:set value="${counselList}" var="counsel" />

<div class="col-12 card widget-inline" style="height: 50px; background-color: #65A4BE; display: flex; justify-content: space-between;">
    <div id="scrolling-text-container" class="text-center p-1">
        <c:choose>
            <c:when test="${not empty list or not empty op or not empty data or not empty counsel}">
                <div id="scrolling-text" style="color: #fff; font-size: 16px; font-weight: bold;">
                    <c:if test="${not empty list}">
                        <i class="ri-send-plane-2-fill text-white"></i>&nbsp;<a href="/head/officeLetter.do" class="text-warning fw-bold fs-4 text">${list[0].frcsOfldcSndpty}</a> 님이 보낸 공문을 확인해주세요! 오늘 공문은 <a href="/head/officeLetter.do" class="text-warning fw-bold fs-3 text">${officeLetterCount}</a>건입니다!
                    </c:if>
                    <c:if test="${not empty op}">
                        &nbsp;&nbsp;&nbsp;&nbsp; <i class="ri-send-plane-2-fill text-white"></i> &nbsp; 
                        오픈 매장 <a href="/head/plan.do" class="text-warning fw-bold fs-4 text">${open[0].frcsName}</a>을 확인해주세요!&nbsp; 최근 오픈 매장은 <a href="/head/plan.do" class="text-warning fw-bold fs-3 text">${openCount}</a>건 입니다!
                    </c:if>
                    <c:if test="${not empty data}">
                        &nbsp;&nbsp;&nbsp;&nbsp;<i class="ri-send-plane-2-fill text-white"></i> &nbsp; 
                        최근 가맹점 주문 <a href="/head/storeOrderHistory.do" class="text-warning fw-bold fs-4 text">${data[0].frcsName}</a>을 확인해주세요!&nbsp; 가맹점 주문은 <a href="/head/plan.do" class="text-warning fw-bold fs-3 text">${orderCount}</a>건 입니다!
                    </c:if>
                    <c:if test="${not empty counsel}">
                        &nbsp;&nbsp;&nbsp;&nbsp;<i class="ri-send-plane-2-fill text-white"></i> &nbsp; 
                        창업 문의 <a href="/head/counseling.do" class="text-warning fw-bold fs-4 text">${counsel[0].ownerName}님</a>의 가맹 문의를 확인해주세요!&nbsp; 창업 문의는 <a href="/head/dashboard.do" class="text-warning fw-bold fs-3 text">${counselCount}</a>건 입니다!
                    </c:if>
                </div>
            </c:when>
            <c:otherwise>
                <!-- 하나라도 데이터가 없을 때의 처리 -->
                <div id="scrolling-text" style="color: #fff; font-size: 16px; font-weight: bold;">
                    데이터가 없습니다.
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

	 

				</div>
			</div>
		</div>
	</div>
</div>
	<!-- 신규주문, 가맹점미납 끝 -->
	
			
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
			
			
		
<script type="text/javascript">
$(function(){
	var frcsManagement = $("#frcsManagement");
	var purchaseList = $("#purchaseList");
	var salesAnalysis = $("#salesAnalysis");
	var headInventory = $("#headInventory");
	
	frcsManagement.on("click", function(){
		location.href = "/head/storeInquiry.do";
	});
	
	purchaseList.on("click", function(){
		location.href = "/head/purchaseList.do";
	});
	
	salesAnalysis.on("click", function(){
		location.href = "/head/salesAnalysis.do";
	});
	
	headInventory.on("click", function(){
		location.href = "/head/headInventoryList.do";
	});
	
});
</script>