<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Start Content-->
<div class="content-page">
	<div class="content">
		<!-- Start Content-->
		<div class="container-fluid">

		<!-- start page title -->
		<div class="col-sm-12 card widget-inline mt-3" style="height:110px;">
			<div class="row ">
					<div class="card-body col-4 align-items-center">
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">매입내역관리</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">본사의 매입내역을 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						주문거래관리 / &nbsp;<span class="text-decoration-underline">매입내역관리</span>
					</div>
				</div>
			</div>
            <!-- end page title -->

            <div class="row">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="row mb-2">
		                        <div class="col-xl-10">
		                            <form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
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
		                                        <label for="status-select" class="col-3">거래처</label>
		                                        <select class="form-select" id="status-select">
		                                            <option selected>선택해주세요</option>
		                                            <option value="1">대전대흥점</option>
		                                            <option value="2">대전선화점</option>
		                                        </select>
		                                    </div>
		                                </div>
                                        <div class="col-4">
                                            <div class="input-group">
                                                <label for="inputPassword2" class="visually-hidden">Search</label>
		                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search">
                                                <button type="button" class="btn btn-secondary">검색</button>
                                            </div>
		                                </div>
		                            </form>                            
		                        </div>
		                        
		                        <div class="col-xl-2">
		                            <div class="text-xl-end mt-xl-0 mt-2">
		                                <a href="/head/purchaseListDetails.do"><button type="button" class="btn btn-danger mb-2 fw-bold">발주하기</button></a>
		                            </div>
		                        </div><!-- end col-->
		                    </div>
		
		                    <div class="table-responsive">
		                    
		                        <table class="table table-centered table-nowrap mb-0 table-hover">
		                            <thead class="table-light">
		                                <tr>
		                                    <th style="text-align:center; width:100px;">순번</th>
                                            <th style="text-align:center; width:150px;">발주번호</th>
		                                    <th style="text-align:center; width:100px;">거래처명</th>
                                            <th style="text-align:center; width:150px;">입고일시</th>
		                                    <th style="text-align:center; width:150px;">제품명</th>
                                            <th style="text-align:center; width:150px;">입고단가</th>
		                                    <th style="text-align:center; width:150px;">입고수량(개)</th>
		                                    <th style="text-align:center; width:150px;">총 주문금액</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                <tr>
		                                    <td style="text-align:center">
		                                    	1
		                                    </td>
                                            <td style="text-align:center">
		                                    	B_B000001
		                                    </td>
		                                    <td style="text-align:center">
		                                    	수산팜
		                                    </td>
			                                <td style="text-align:center">
                                                2023/09/18
			                                </td>
                                            <td style="text-align:center">
                                                반건조오징어
                                            </td>
                                            <td style="text-align:center">
                                                15,000
                                            </td>
		                                    <td style="text-align:center">
		                                        150EA
		                                    </td>
		                                    <td style="text-align:center;">
		                                    	20,000,000
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td style="text-align:center">
		                                    	2
		                                    </td>
                                            <td style="text-align:center">
		                                    	B_B000002
		                                    </td>
		                                    <td style="text-align:center">
		                                    	비비마트
		                                    </td>
			                                <td style="text-align:center">
                                                2023/09/25
			                                </td>
                                            <td style="text-align:center">
                                                밀떡
                                            </td>
                                            <td style="text-align:center">
                                                8,000
                                            </td>
		                                    <td style="text-align:center">
		                                        220EA
		                                    </td>
		                                    <td style="text-align:center;">
		                                    	30,000,000
		                                    </td>
		                                </tr>
                                        <tr>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center"></td>
                                            <td style="text-align:center; color: brown; font-weight: bold;">총계 :</td>
                                            <td style="text-align:center; color: brown; font-weight: bold;">42,100,000 (원)</td>
                                        </tr>
		                            </tbody>
		                        </table>
		                    </div>
		                    <br>
								<nav aria-label="Page navigation example">
   									 <ul class="pagination pagination-rounded mb-0 justify-content-center">
								        <li class="page-item">
								            <a class="page-link" href="javascript: void(0);" aria-label="Previous">
								                <span aria-hidden="true">&laquo;</span>
								            </a>
								        </li>
								        <li class="page-item"><a class="page-link" href="javascript: void(0);">1</a></li>
								        <li class="page-item"><a class="page-link" href="javascript: void(0);">2</a></li>
								        <li class="page-item active"><a class="page-link" href="javascript: void(0);">3</a></li>
								        <li class="page-item"><a class="page-link" href="javascript: void(0);">4</a></li>
								        <li class="page-item"><a class="page-link" href="javascript: void(0);">5</a></li>
								        <li class="page-item">
								            <a class="page-link" href="javascript: void(0);" aria-label="Next">
								                <span aria-hidden="true">&raquo;</span>
								            </a>
								        </li>
								    </ul>
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