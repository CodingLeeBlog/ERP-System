<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- jquery 데이터테이블 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>

<style>
	.blinking{
  -webkit-animation: blink 0.5s ease-in-out infinite alternate;
  -moz-animation: blink 0.5s ease-in-out infinite alternate;
  animation: blink 0.5s ease-in-out infinite alternate;
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

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

		<!-- start page title -->
		<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">관리비관리</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">관리비 미납 가맹점을 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						매장관리 / &nbsp;<span class="text-decoration-underline">관리비관리</span>
					</div>
				</div>
			</div>
            <!-- end page title -->

            <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="col-xl-12">
                                <form id="searchForm" method="post" class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between">
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
                                            <label for="status-select" class="col-3">분류</label>
                                            <select class="form-select" id="status-select">
                                                <option selected>선택해주세요</option>
                                                <option value="1">잡화</option>
                                                <option value="2">수산</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label for="inputPassword2" class="visually-hidden">Search</label>
                                            <input type="search" class="form-control" id="inputPassword2" placeholder="Search">
                                            <button type="button" class="btn btn-secondary">검색</button>
                                        </div>
                                    </div>
                                    <sec:csrfInput/>
                                </form>                            
                            </div>
		
		                    <div class="table-responsive mt-3">
		                    
		                    <c:set value="${pagingVO.dataList }" var="dataList" />
		                        <table class="table table-centered table-nowrap mb-0">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:70px;">순번</th>
		                                    <th style="text-align:center; width:150px;">가맹점코드</th>
		                                    <th style="text-align:center; width:150px;">가맹점명</th>
		                                    <th style="text-align:center; width:150px;">가맹점주</th>
		                                    <th style="text-align:center; width:150px;">연락처</th>
		                                    <th style="text-align:center; width:150px;">미납횟수</th>
		                                    <th style="text-align:center; width:150px;">미납입금</th>
		                                    <th style="text-align:center; width:150px;">상세</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach items="${dataList }" var="list" varStatus="status">
		                                <tr>
		                                    <td style="text-align:center">
		                                    	${status.count }
		                                    </td>
		                                    <td style="text-align:center">
		                                    	${list.frcsId }
		                                    </td>
			                                <td style="text-align:center">
                                                ${list.frcsName }
			                                </td>
                                            <td style="text-align:center">
                                                ${list.memName }
                                            </td>
		                                    <td style="text-align:center">
		                                        ${list.memTel }
		                                    </td>
		                                    <td style="text-align:center">
		                                    <span style="color:red; font-weight: bold;">
<!-- 		                                    <span class="blinking" style="color:red; font-weight: bold;"> -->
		                                    	${list.nonpaymentCount }
		                                    	</span>
		                                    </td>
		                                    <td style="text-align:center">
		                                    	<fmt:formatNumber value="${list.feeTotalpay }" type="number" ></fmt:formatNumber>(원)
		                                    </td>
		                                    <td style="text-align:center">
		                                    	<a href="/head/maintenanceCostDetail.do?frcsId=${list.frcsId }"><button type="button" class="btn btn-primary fw-bold">상세보기</button></a>
		                                    </td>
		                                </tr>
		                               </c:forEach>
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