<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

			<div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card widget-inline mt-3">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">관리자</a></li>
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">창업상담관리</a></li>
                                            <li class="breadcrumb-item active text-decoration-underline">영업지역관리</li>
                                        </ol>
                                    </div>
                                        <h4 class="page-title ms-3">영업지역관리</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

					<div class="col-12">
                        <div class="row">
                            <div class="col-3">
                               <div class="card rounded-0">
                                     <div class="card-body text-left">
                                         <!-- <div class="spinner-grow text-success" role="status"></div> -->
                                         <h2><span>전체가맹점수</span></h2>
                                         <h3><span style="color:aquamarine">TOTAL : </span>${totalRecord }</h3>
                                         <p class="text-muted font-15">최신 오픈매장 : ${latestInfoVO.frcsName }</p>
                                     </div>
                                 </div>
                   		</div> <!-- end col-->

                            <div class="col-9">
                                <div class="card rounded-0 ribbon-box">
                                 <div class="card-body">
                                        <div class="ribbon-two ribbon-two-success"><span>지점 매출</span></div>
                                        <p class="m-2 mb-sm-2 font-20 text-primary fw-bold"> 안녕하세요 예비 가맹점주님!! </p>
                                        <p class="m-2 mb-0 font-15 text">엘리 할머니 맥주에서는 예비 가맹점주님들께서 결정을 더 손쉽게 하실 수 있도록, 현재 가맹점들의 지역별 / 지점별 매출분석표를 제공하고있습니다. </p>
                                        <p class="m-2 mb-0 font-15 text">검색버튼 옆 원하시는 지역의 가맹점을 조회하실 수 있습니다. 추가로 궁금하신사항 문의주신다면 친절히 안내해드리겠습니다.</p>
                                        <p></p>
                                </div> <!-- end card-->
                           		 </div>
                            </div>
                        </div><!-- end row-->
					</div>

                        <div class="row">
                        <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <div class="header-title col-2">
                                            <h4 class="font-15">가맹점수 : ${selectFrcsCount }</h4>
                                        </div>
                                        
                                        <div class="header-title col-4">
	                                       	<form id="searchForm" method="post">
	                                       		<input type="hidden" name="page" id="page"/>
	                                       		<div class="input-group">
		                                       		<div class="col-8">
			                                            <select class="form-select" id="example-select" name="searchArea">
			                                                <option value="">전체</option>
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
		                                            <div class="col-auto">
					                                    <div class="d-flex align-items-center d-flex align-items-baseline">
					                                		<button type="submit" class="btn btn-secondary">
													    		<i class="mdi mdi-magnify search-icon"></i>검색                            			
					                                		</button>
					                                	</div>
					                                </div>
				                                </div>
				                                <sec:csrfInput/>
                                            </form>
                                        </div>
                                        
                                    </div>
                                    <div class="card-body pt-2">
                                        <div class="table-responsive">
                                            <table class="table table-centered table-nowrap table-hover mb-0">
                                                <thead>
                                                    <tr>
                                                        <td>
                                                            <h5 class="font-14 my-1" ><a href="javascript:void(0);" class="text-body">가맹점명</a></h5>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-14 my-1" style="font-weight: bold;"><a href="javascript:void(0);" class="text-body">가맹점주명</a></h5>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-14 my-1"><a href="javascript:void(0);" class="text-body">주소</a></h5>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-14 my-1"><a href="javascript:void(0);" class="text-body">오픈일자</a></h5>
                                                        </td>
                                                        <td>
                                                            <h5 class="font-14 my-1"><a href="javascript:void(0);" class="text-body">전화번호</a></h5>
                                                        </td>
                                                    </tr>
                                                </thead>
                                                <c:set value="${pagingVO.dataList }" var="infoVO" />
                                                <c:choose>
                                                	<c:when test="${empty infoVO }">
                                                		<tbody>
	                                                		<tr>
																<td colspan="5">조회하신 가맹점이 존재하지 않습니다.</td>
															</tr>
														</tbody>
                                                	</c:when>
                                                	<c:otherwise>
                                                		<c:forEach items="${infoVO }" var="totalinfoVo">
                                                			<tbody>
			                                                    <tr>
			                                                        <td class="frcsName">
			                                                        	<input type="hidden" class="frcsId" value="${totalinfoVo.frcsId }">
			                                                            <h5 class="font-14 my-1"><span class="text-body" style="cursor: pointer;}">${totalinfoVo.frcsName }</span></h5>
			                                                        </td>
			                                                        <td>
			                                                            <span class="font-13" style="text-align:center; font-weight: bold;">${totalinfoVo.memName }</span> <br/>
			                                                        </td>
			                                                        <td>
			                                                            <span class="text-muted font-13" style="text-align: center; font-weight: bold;">${totalinfoVo.frcsAdd1 }&nbsp;${totalinfoVo.frcsAdd2 }</span>
			                                                        </td>
			                                                        <td>
			                                                            <span class="text-muted font-13" style="text-align: center; font-weight: bold;"> <fmt:formatDate value="${totalinfoVo.frcsOpdate }" pattern="yyyy/MM/dd"/> </span>
			                                                        </td>
			                                                        <td >
			                                                            <span class="text-muted font-13" style="text-align: center; font-weight: bold;">${totalinfoVo.frcsTel }</span>
			                                                        </td>
			                                                    </tr>
		                                                	</tbody>
                                                		</c:forEach>
                                                	</c:otherwise>
                                                </c:choose>
                                            </table>
                                        </div> <!-- end table-responsive-->
										<nav aria-label="Page navigation example" id="pagingArea">
											${pagingVO.pagingHTML }
										</nav>
                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->

                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h2 class="header-title">영업매출</h2>
                                        <div class="chartBtnGrp">
                                            <button id="allMonth" data-type="all" type="button" class="btn btn-soft-primary btn-sm">ALL</button>
                                            <button id="oneMonth" data-type="one" type="button" class="btn btn-soft-secondary btn-sm">1개월</button>
                                            <button id="thrirdMonth" data-type="three" type="button" class="btn btn-soft-secondary btn-sm">3개월</button>
                                            <button id="sixMonth" data-type="six" type="button" class="btn btn-soft-secondary btn-sm">6개월</button>
                                        </div>
                                    </div>

                                    <div class="card-body">
                                        <div class="chart-body" dir="ltr">
                                            <div>
                                                <canvas id="myChart"></canvas>
                                            </div>
                                        </div>

                                    </div> <!-- end card body-->
                                </div> <!-- end card -->
                            </div><!-- end col-->
                        </div>
                        <!-- end row-->

					<!-- Footer Start -->
				      <footer class="footer">
				          <div class="container-fluid">
				              <div class="row">
				                  <div class="col-md-6">
				                      <script>document.write(new Date().getFullYear())</script> © 1982Elly - Beer.com
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
                    </div> <!-- end container_fluid-->
                </div> <!-- end content -->
            </div><!-- end contentPage-->
            
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
    // 일일매출데이터는 재가공해서 가져와야한다.
    /*
    	서비스로직에서 1개월 데이터를 미리가져와서 뿌리고 1개월,3개월,6개월 클릭할대마다 재가공해서 데이터를 뿌려준다. 
    	하나의 ajax를 만들고 그안에서 1개월이냐 3개월이냐 6개월이냐를 판단해서 
    	
    	최초에는 All이 나온다 가지고있는 데이터를 그 해의 달마다 보여준다
    	1개월을 눌렀을때 해당 월이 마무리되지않았다면 전달 매출이 뜨게한다 (기준달 - 1)
    	3개월을 눌렀을때 해당 월이 마무리되지않았다면 전달부터 3개월이 뜨게한다 (기준달 - 3)
    	6개월을 눌렀을때 해당 월이 마무리되지않았다면 전달부터 3개월이 뜨게한다 (기준달 - 6)
    */
	$(function(){
		var searchForm = $("#searchForm");
		var pagingArea = $("#pagingArea");
		var allMonth = $("#allMonth");
		var oneMonth = $("#oneMonth");
		var thrirdMonth = $("#thrirdMonth");
		var sixMonth = $("#sixMonth");
		var frcsId = "";
		
		// a 태그를 클릭하면 이벤트 실행
		pagingArea.on("click","a", function(event){
			event.preventDefault();
			var pageNo = $(this).data("page");
			searchForm.find("#page").val(pageNo);
			searchForm.submit();
		});
		
		// 가맹점명을 클릭했을때
		$(".frcsName").on("click", function(){
			frcsId = $(this).find(".frcsId").val();
			var clickValue = $(this).text();
			var sales = [];
			
			console.log("클릭요소 값 : ", clickValue);
			console.log("frcsId : ", frcsId);
			
			var frcsObject = {
				frcsId : frcsId,
				type:'all'
			}
				
			$.ajax({
				type : "post",
				url : "/head/salesChart.do",
				beforeSend : function(xhr){	// csrf토큰 보내기 위함
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
				},
				data : JSON.stringify(frcsObject),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					sales = []; // 배열 초기화
					$.each(res,function(idx,headSalesChartVO){ // idx = 인덱스
						sales.push(headSalesChartVO.sales);
					});
					console.log(sales);
					chartSetting('all', sales);
				}
			});
		});
		
		$(".chartBtnGrp").on("click", "button", function(){
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth()+1;
			var day = date.getDate();
			
			var days = new Date(year, month, 0).getDate();
			var type = $(this).data("type");
			
			console.log(type);
			
			var frcsObject = {
				frcsId : frcsId,
				month : month,
				type: type 
			}
			
			$.ajax({
				type : "post",
				url : "/head/salesChart.do",	// 모든 차트데이터를 요청할때 사용
				beforeSend : function(xhr){	// csrf토큰 보내기 위함
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");	//key value로 보낸다.
				},
				data : JSON.stringify(frcsObject),
				contentType : "application/json; charset=utf-8",
				success : function(res){
					sales = []; // 배열 초기화
					$.each(res,function(idx,headSalesChartVO){ // idx = 인덱스
						sales.push(headSalesChartVO.sales);
					});
					chartSetting(type, sales);
				}
			});
		});
		
		function chartSetting(type, sales){
			removeChart();
			var canvas = $("<div><canvas id='myChart'></canvas></div>");
			
			var chart = $(".chart-body");
			chart.append(canvas);
			
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();

			var days = new Date(year, month, 0).getDate();

			const ctx = document.getElementById('myChart');

			// 차트별 라벨을 얻기
			var labels = getLabel(type, sales);
			var text = getText(type);
			
			new Chart(ctx, {
				type : 'bar',
				data : {
					labels : labels,
					datasets : [ {
						label : '# 영업이익',
						data : sales,
						backgroundColor: 'rgba(182, 225, 233, 1)'
					} ]
				},
				options : {
					plugins : {
						title : {
							display : true,
							text : text,
							padding : {
								top : 10,
								bottom : 30
							}
						}
					},
					scales : {
						y : {
							beginAtZero : true
						}
					}
				}
			});
		}
		
		function getLabel(type, sales){
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();

			var days = new Date(year, month, 0).getDate();
			
			var labels = [];
			if(type == 'six'){
				for (var i = (month - 6); i <= (month - 1); i++) {
					labels.push(i + "월");
				}
			}else if(type == 'all'){
// 				for(var i = (month-sales.length); i < month; i++){
// 					labels.push(i+"월");
// 				}
				for(var i = 1; i <= 12; i++){
					labels.push(i+"월");
				}
			}else if(type == 'one'){
				for(var i = 0; i < days; i++){
					labels.push((month-1) + "." + (i+1));
				}
			}else if(type == 'three'){
				for(var i = (month-3); i <= (month-1); i++){
					labels.push(i + "월");
				}
			}
			return labels;
		}
		
		function getText(type){
			var text = "";
			
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var day = date.getDate();

			var days = new Date(year, month, 0).getDate();
			
			if(type == 'all'){
				text = year+"년"
			}else if(type == 'one'){
				text = year+"년"+(month-1)+"월"
			}else if(type == 'three'){
				text = year + "년" + (month-3) + "월" + " ~ " + year + "년" + (month-1) + "월"
			}else if(type == 'six'){
				text = year + "년" + (month - 6) + "월" + " ~ "
				+ year + "년" + (month - 1) + "월"
			}
			return text;
		}
		
		function removeChart(){
			var oldCanvas = $("#myChart");
			if(oldCanvas){
				oldCanvas.remove();
			}
		}
	});
</script>