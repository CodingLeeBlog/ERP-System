<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

		<!-- start page title -->
		<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">가맹점 주문내역</div>
                        <div class="row">
                            <div class="col-sm-2 spinner-grow spinner-grow-sm text-success ms-4" role="status"></div>
                            <div class="col-sm-8 page-title-sub text-dark font-15">관리자님! 새로운 주문이 ${orderCount }건 있습니다.</div>
                        </div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						주문거래관리 / &nbsp;<span class="text-decoration-underline">가맹점 주문내역</span>
				    </div>
			</div>
		</div>
            <!-- end page title -->
			<c:set value="${pagingVO.dataList }" var="frcsOrder"/>
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
                                                <input class="form-control" id="searchBeforeDate" type="date" name="searchBeforeDate">
                                        </div>
                                        <div class="col-auto">
                                            <span>~</span>
                                        </div>
                                        <div class="col-2">
                                                <input class="form-control" id="searchAfterDate" type="date" name="searchAfterDate">
                                        </div>
                                        
		                                <div class="col-2">
		                                    <div class="d-flex align-items-center">
		                                        <label for="status-select" class="col-3">거래처</label>
		                                        <select class="form-select" id="status-select" name="searchFrcsName" >
		                                            <option value="">선택해주세요</option>
		                                            <c:forEach items="${frcsList }" var="fr">
		                                            	<option value="${fr.frcsName }" <c:if test="${searchFrcsName eq fr.frcsName }">selected</c:if>>${fr.frcsName }</option>
		                                            </c:forEach>
		                                        </select>
		                                    </div>
		                                </div>
                                        <div class="col-4">
                                            <div class="input-group">
                                                <label for="inputPassword2" class="visually-hidden">Search</label>
<%-- 		                                        <input type="search" class="form-control" id="inputPassword2" name="searchFrcsId" placeholder="${param.searchFrcsId }"> --%>
		                                        <input type="search" class="form-control" id="inputPassword2" name="searchFrcsId" placeholder="가맹점코드로 검색...">
                                                <button type="submit" class="btn btn-secondary">검색</button>
                                            </div>
		                                </div>
		                                <sec:csrfInput/>
		                            </form>                            
		                        </div>
		                    </div>
							
							
							
		                    <div class="table-responsive mt-3">
		                    
		                        <table class="table table-centered table-nowrap mb-0 table-hover">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:100px;">순번</th>
		                                    <th style="text-align:center; width:100px;">가맹점코드</th>
		                                    <th style="text-align:center; width:150px;">가맹점명</th>
		                                    <th style="text-align:center; width:150px;">가맹점주소</th>
		                                    <th style="text-align:center; width:150px;">주문일시</th>
		                                    <th style="text-align:center; width:150px;">총주문금액</th>
		                                    <th style="text-align:center; width:150px;">상세</th>
		                                </tr>
		                            </thead>
		                            <tbody>
			                            <c:forEach items="${frcsOrder }" var="focus"  varStatus="status">
			                                <tr>
			                                    <td style="text-align:center">${focus.rnum }</td>
			                                    <td style="text-align:center">${focus.frcsId }</td>
				                                <td style="text-align:center">${focus.frcsName }</td>
	                                            <td style="text-align:center">${focus.frcsAdd1 }&nbsp;${focus.frcsAdd2 }</td>
			                                    <td style="text-align:center">${focus.frcsorderDate }</td>
			                                    <td style="text-align:center"><fmt:formatNumber value="${focus.frcsorderAmt }" type="number" ></fmt:formatNumber> (원)</td>
			                                    <td style="text-align:center">
			                                        <a href="/head/storeOrderHistoryDetails.do?frcsId=${focus.frcsId }&frcsorderDate=${focus.frcsorderDate }"><button type="button" class="btn btn-danger fw-bold">상세보기</button></a>
			                                    </td>
			                                </tr>
			                            </c:forEach>
                                        <tr>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center; color: brown; font-weight: bold;">총계 :</td>
                                            <td style="text-align:center; color: brown; font-weight: bold;"><fmt:formatNumber value="${pagingVO.totalPrice }" type="number"></fmt:formatNumber> (원)</td>
                                            <td style="text-align:center"></td>
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
	
	// a 태그를 클릭하면 이벤트 실행
	$("#pagingArea").on("click","a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});
</script>