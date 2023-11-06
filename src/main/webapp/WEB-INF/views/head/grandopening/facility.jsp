<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">개점관리</a></li>
                                            <li class="breadcrumb-item active">시설관리</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">시설관리</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                       <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row mb-2">
                                            <div class="col-sm-5">
                                                 <form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
                                                    <div class="col-auto">
                                                        <div class="d-flex align-items-center">
                                                            <select class="form-select" id="status-select">
                                                                <option selected>선택</option>
                                                                <option value="1">가맹점명</option>
                                                                <option value="2">지역</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <label for="inputPassword2" class="visually-hidden">검색</label>
                                                        <input type="search" class="form-control" id="inputPassword2" placeholder="Search...">
                                                    </div>
                                                </form> 
                                            </div>
                                            <div class="col-sm-7">
                                                <div class="text-sm-end">
                                                     <input type="button" class="btn btn-info" id="registerBtn" value="등록">
                                                </div>
                                            </div><!-- end col-->
                                        </div>
										<br/>
                
                                        <div class="table-responsive">
                                            <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="all">가맹점명</th>
                                                        <th>집기/설비</th>
                                                        <th>초도물품 입고 및 관리</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                        <td>
                                                            <span class="badge bg-success">양호</span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <nav>
											    <ul class="pagination justify-content-center">
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
                                        </div>
                                    </div> <!-- end card-body-->
                                </div> <!-- end card-->
                            </div> <!-- end col -->
                        </div>
                        <!-- end row -->        
                        
                    </div> <!-- container -->

                </div> <!-- content -->
                </div>
    <!-- 모달 창 -->
    
                                                      
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">상세보기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">가맹점명</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">교육내역</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">상태</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">교육시작일</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">교육종료일</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">비고</label>
                            <input type="text" class="form-control" id="recipient-name">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">수정</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">삭제</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">목록</button>
                </div>
            </div>
        </div>
    </div>
              
</body>
