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
                                            <li class="breadcrumb-item active">교육훈련관리</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">교육훈련관리</h4>
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
<!--                                                      <input type="button" class="btn btn-success" id="manageBtn" value="관리"> -->
                                                     <a href="/head/educationVideo.do" class="btn btn-success">관리</a>
                                                </div>
                                            </div><!-- end col-->
                                        </div>
										<br/>
                
                                        <div class="table-responsive">
                                            <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th class="all">가맹점명</th>
                                                        <th>교육시작일</th>
                                                        <th>교육종료일</th>
                                                        <th>이수여부</th>
                                                        <th>비고</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td >
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            2023/08/11
                                                        </td>
                                                        <td>
                                                            2023/09/11
                                                        </td>
                                                        <td>
                                                            X
                                                        </td>
                                                        <td>
                                                            
                                                        </td>
                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            2023/08/11
                                                        </td>
                                                        <td>
                                                            2023/09/11
                                                        </td>
                                                        <td>
                                                            X
                                                        </td>
                                                        <td>
                                                            
                                                        </td>
                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            	서울신림점
                                                        </td>
                                                        <td>
                                                            2023/08/11
                                                        </td>
                                                        <td>
                                                            2023/09/11
                                                        </td>
                                                        <td>
                                                            X
                                                        </td>
                                                        <td>
                                                          	 결혼식
                                                        </td>
                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            2023/08/11
                                                        </td>
                                                        <td>
                                                            2023/09/11
                                                        </td>
                                                        <td>
                                                            X
                                                        </td>
                                                        <td>
                                                            
                                                        </td>
                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            2023/08/11
                                                        </td>
                                                        <td>
                                                            2023/09/11
                                                        </td>
                                                        <td>
                                                            X
                                                        </td>
                                                        <td>
                                                            
                                                        </td>
                    
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            	서울신사점
                                                        </td>
                                                        <td>
                                                            2023/08/11
                                                        </td>
                                                        <td>
                                                            2023/09/11
                                                        </td>
                                                        <td>
                                                            X
                                                        </td>
                                                        <td>
                                                            
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
<!-- jQuery 및 Bootstrap를 로드합니다. -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // DOM이 준비되면 실행될 함수
    $(document).ready(function() {
        // 가맹점명(td)를 클릭했을 때 모달 창
        $('table tbody').on('click', 'td:first-child', function() {
            var branchName = $(this).text().trim(); // 클릭한 td의 텍스트 가져오기
            openModal(branchName); // 모달을 열고 가맹점명 전달
        });

        // 모달 창 열기 함수
        function openModal(branchName) {
            // 모달 창의 가맹점명 필드에 클릭한 가맹점명을 설정
            $('#recipient-name').val(branchName);
            // 모달 창을 보이게 합니다.
            $('#exampleModal').modal('show');
        }
    });
</script>
             
    