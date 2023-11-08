<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!-- jquery 데이터테이블 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

		<!-- start page title -->
		<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">가맹점 매출분석</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">전체 가맹점의 매출을 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						매장관리 / &nbsp;<span class="text-decoration-underline">가맹점매출분석</span>
					</div>
				</div>
			</div>
            <!-- end page title -->

            <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
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
                                            <select class="form-select" id="status-select" name="searchArea">
                                                <option value="">지역선택</option>
	                                                <option value="서울" <c:if test="${searchArea eq '서울특별시' }">selected</c:if>>서울특별시</option>
	                                                <option value="경기도" <c:if test="${searchArea eq '경기도' }">selected</c:if>>경기도</option>
	                                                <option value="전라북도" <c:if test="${searchArea eq '전라북도' }">selected</c:if>>전라북도</option>
	                                                <option value="전라남도" <c:if test="${searchArea eq '전라남도' }">selected</c:if>>전라남도</option>
	                                                <option value="경상북도" <c:if test="${searchArea eq '경상북도' }">selected</c:if>>경상북도</option>
	                                                <option value="경상남도" <c:if test="${searchArea eq '경상남도' }">selected</c:if>>경상남도</option>
	                                                <option value="충청북도" <c:if test="${searchArea eq '충청북도' }">selected</c:if>>충청북도</option>
	                                                <option value="충청남도" <c:if test="${searchArea eq '충청남도' }">selected</c:if>>충청남도</option>
	                                                <option value="부산" <c:if test="${searchArea eq '부산광역시' }">selected</c:if>>부산광역시</option>
	                                                <option value="대전" <c:if test="${searchArea eq '대전광역시' }">selected</c:if>>대전광역시</option>
	                                                <option value="대구" <c:if test="${searchArea eq '대구광역시' }">selected</c:if>>대구광역시</option>
	                                                <option value="인천" <c:if test="${searchArea eq '인천광역시' }">selected</c:if>>인천광역시</option>
	                                                <option value="광주" <c:if test="${searchArea eq '광주광역시' }">selected</c:if>>광주광역시</option>
	                                                <option value="울산" <c:if test="${searchArea eq '울산광역시' }">selected</c:if>>울산광역시</option>
	                                                <option value="강원도" <c:if test="${searchArea eq '강원도' }">selected</c:if>>강원도</option>
	                                                <option value="제주도" <c:if test="${searchArea eq '제주도' }">selected</c:if>>제주도</option>
	                                                <option value="세종" <c:if test="${searchArea eq '세종시' }">selected</c:if>>세종시</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label for="inputPassword2" class="visually-hidden">Search</label>
                                            <input type="search" class="form-control" name="searchFranchise" id="inputPassword2" placeholder="가맹점명 검색..">
                                            <button type="button" class="btn btn-secondary">검색</button>
                                        </div>
                                    </div>
                                    <sec:csrfInput/>
                                </form>                            
                            </div>
		                    </div>
		
		                    <div class="table-responsive">
		                    
		                        <table class="table table-centered table-nowrap mt-2">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:100px;">순번</th>
		                                    <th style="text-align:center; width:150px;">가맹점명</th>
		                                    <th style="text-align:center; width:150px;">가맹점주명</th>
		                                    <th style="text-align:center; width:150px;">운영상태</th>
		                                    <th style="text-align:center; width:150px;">주소</th>
		                                    <th style="text-align:center; width:150px;">연락처</th>
		                                    <th style="text-align:center; width:150px;">오픈일자</th>
		                                </tr>
		                            </thead>
		                            <c:set value="${pagingVO.dataList }" var="list"/>
		                            <c:choose>
		                            	<c:when test="${empty list }">
		                            		<tbody>
		                            			<tr>
		                            				<td colspan="7">조회하신 가맹점이 존재하지 않습니다.</td>
		                            			</tr>
		                            		</tbody>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<c:forEach items="${list }" var="list" varStatus="status">
					                            <tbody>
					                                <tr>
					                                    <td style="text-align:center">
					                                    	${status.count }
					                                    </td>
					                                    <td style="text-align:center" data-frcsId="${list.frcsId }" data-frcsName="${list.frcsName }">
					                                    	<span style="color: blue; cursor: pointer;">${list.frcsName }</span>
					                                    </td>
						                                <td style="text-align:center">
						                                   	${list.memName }
						                                </td>
						                                <td style="text-align:center">
						                                   	${list.frcsState }
						                                </td>
					                                    <td style="text-align:center">
					                                        ${list.frcsAdd1 }&nbsp;${list.frcsAdd2 }
					                                    </td>
					                                    <td style="text-align:center">
					                                    	${list.frcsTel }
					                                    </td>
					                                    <td style="text-align:center">
					                                    	${list.frcsOpdate }
					                                    </td>
					                                </tr>
					                            </tbody>
		                            		</c:forEach>
		                            	</c:otherwise>
		                            </c:choose>
		                        </table>
		                    </div>
                        </div>
		                    <br>
								<nav aria-label="Page navigation example" id="pagingArea">
									${pagingVO.pagingHTML }
								</nav>
		                </div> <!-- end card-body-->
		            </div> <!-- end card-->
		        </div> <!-- end col -->
		    </div>

            <div class="row">
                <div class="col-lg-6">
                        <div class="card">
                             <div class="card-header d-flex justify-content-center align-items-center">
                             <i class="me-3 ri-arrow-left-s-line" id="leftYear" style="font-size: 30px"></i>
                                <h1 class="header-title font-24">손익계산서</h1>
                             <i class="ms-3 ri-arrow-right-s-line" id="rightYear" style="font-size: 30px"></i>
                            </div>

                        <div class="card-body" style="height:800px;">
                             <div class="col-lg-12 d-flex justify-content-between">
                                    <div class="col-lg-10">
                                        <table class="table table-bordered table-centered ms-5">
                                            <thead class="table-dark" style="text-align: center;">
                                                <tr>
                                                    <th style="width: 500px;">과목</th>
                                                    <th style="width: 500px;">금액(원)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td style="text-align: center;">Ⅰ.총매출액</td>
                                                    <td style="text-align: center;">(가맹점 총 매출액)</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">Ⅱ. 변동비</td>
                                                    <td style="text-align: center;">(로얄티 + 인건비)<br>공과금(수도세+전기세+가스비)</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">가맹비</td>
                                                    <td style="text-align: center;">500000</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">로얄티</td>
                                                    <td style="text-align: center;">총매출액 * 0.03</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">인건비</td>
                                                    <td style="text-align: center;">5200000</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">공과금</td>
                                                    <td style="text-align: center;">(수도세/전기세/가스비) + (월세)</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">Ⅲ. 매출원가</td>
                                                    <td style="text-align: center;">총매출액 - 매입가</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">매입가</td>
                                                    <td style="text-align: center;">본사발주금액</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">Ⅳ. 영업이익</td>
                                                    <td style="text-align: center;">매출원가 - 판매비와관리비</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">Ⅴ. 당기순이익</td>
                                                    <td style="text-align: center;">영업이익 - 세금(10%)</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 
                        </div>
                        </div> <!-- end card -->
                    </div><!-- end col-->

                    <div class="col-lg-6">
                        <div class="card">
                            <div style="height:30px;"class="card-header d-flex justify-content-between align-items-center">
                                <h1 class="header-title font-24 mt-2">00점 영업매출</h1>
                            </div>
                            <div class="card-body">
<!--                                 <h4 class="header-title mb-4">Spline Area</h4> -->
                                <div class="row" style="height:50px;">
			                		<div class="col-4" id="test"></div>
				               			<div class="col mt-4 mb-4 d-flex justify-content-center align-items-center">
				                			<i class="me-3 ri-arrow-left-s-line" id="leftYear" style="font-size: 30px"></i>
				                				<span>2023</span>
				                 				<div id="calYear" class="" style="font-size: 30px; font-family: 'GmarketSansMedium';"></div>
				                			<i class="ms-3 ri-arrow-right-s-line" id="rightYear" style="font-size: 30px"></i>
				               			</div>
				                 	<div class="col-4"></div>
			                	</div>
									<div class="card-body">
                                        <div class="chart-body" dir="ltr">
                                            <div>
                                                <canvas id="mixed-chart" width="800" height="450"></canvas>
                                            </div>
                                        </div>

                                    </div> <!-- end card body-->
                            </div>
                            <!-- end card body-->
                        </div> <!-- end card -->
                    </div><!-- end col-->
                    
                </div>
                <!-- end row-->

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

var searchForm = $("#searchForm");
var pagingArea = $("#pagingArea");


//a 태그를 클릭하면 이벤트 실행
pagingArea.on("click","a", function(event){
	event.preventDefault();
	var pageNo = $(this).data("page");
	searchForm.find("#page").val(pageNo);
	searchForm.submit();
});

new Chart(document.getElementById("mixed-chart"), {
    type: 'bar',
    data: {
      labels: ["1900", "1950", "1999", "2050"],
      datasets: [ {
          label: "Africa",
          type: "line",
          borderColor: "#FFA8A5",
          data: [450,75,480,299],
          fill: false
        }, {
          label: "Africa",
          type: "bar",
          backgroundColor: "rgba(0,143,226,0.2)",
          backgroundColorHover: "#96FFFF",
          data: [650,150,500,300]
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Population growth (millions): Europe & Africa'
      },
      legend: { display: false }
    }
});

</script>