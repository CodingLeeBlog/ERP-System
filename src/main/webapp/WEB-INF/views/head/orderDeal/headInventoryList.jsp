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
		<div class="col-sm-12 card widget-inline mt-3 " style="height:90px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">본사재고관리</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">본사의 매입내역을 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						주문거래관리 / &nbsp;<span class="text-decoration-underline">재고관리</span>
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
		                        <table class="table table-centered table-nowrap mb-0 table-hover" id="myTable">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:70px;">순번</th>
                                            <th style="text-align:center; width:150px;">거래처명</th>
                                            <th style="text-align:center; width:150px;">제품코드</th>
		                                    <th style="text-align:center; width:100px;">제품명</th>
		                                    <th style="text-align:center; width:100px;">한계재고량</th>
		                                    <th style="text-align:center; width:100px;">잔여재고량</th>
                                            <th style="text-align:center; width:150px;">입고단가</th>
		                                    <th style="text-align:center; width:150px;">유통기한시작일</th>
                                            <th style="text-align:center; width:150px;">유통기한종료일</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach items="${dataList }" var="list" varStatus="status">
		                                <tr>
		                                    <td style="text-align:center">${list.rnum }</td>
		                                    <td style="text-align:center">${list.vdName }</td>
                                            <td style="text-align:center">
		                                    	${list.vdprodCd }
		                                    </td>
		                                    <td style="text-align:center">
		                                    	${list.vdprodName }
		                                    </td>
			                                <td style="text-align:center">
			                                <fmt:formatNumber value="${list.hdmaxQy }" type="number"/>
			                                </td>
                                            <td style="text-align:center">
	                                            <c:if test="${list.hdremainQy le 1500}">
		                                            <span class="blinking" style="color:red; font-weight: bold;">
		                                            <fmt:formatNumber value="${list.hdremainQy}" type="number"/>	
		                                            </span>	
	                                            </c:if>
	                                            <c:if test="${list.hdremainQy gt 1500}">
		                                            <fmt:formatNumber value="${list.hdremainQy}" type="number"/>	
	                                            </c:if>
                                            </td>
                                            <td style="text-align:center">
                                            	<fmt:formatNumber value="${list.hdrtrcvPrice }" type="number"/>(원)
                                            </td>
		                                    <td style="text-align:center">
		                                        ${list.hdprodLifestartday }
		                                    </td>
		                                    <td style="text-align:center">
		                                        ${list.hdprodLifeendday }
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
	 
	// a 태그를 클릭하면 이벤트 실행
    $("#pagingArea").on("click","a", function(event){
       event.preventDefault();
       var pageNo = $(this).data("page");
       searchForm.find("#page").val(pageNo);
       searchForm.submit();
    });
});
</script>