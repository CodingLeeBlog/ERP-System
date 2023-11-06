<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">매장관리</a></li>
                                            <li class="breadcrumb-item active">점검(위생)관리</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">점검(위생)관리</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
						<div class="row">
                            <div class="col-12">
                            	<div class="card">
                                    <div class="card-body">
                                        <div class="row mb-2">
                           					 <div class="col-xl-8">
                                                <form class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between">
                                                    <div class="col-auto">
                                                        <div class="d-flex align-items-center">
                                                            <select class="form-select" id="searchType" name="searchType">
                                                                <option selected>선택</option>
                                                                <option value="frcsName"<c:if test="${searchType eq 'frcsName' }">selected</c:if>>가맹점명</option>
                                                                <option value="2">지역</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-auto">
                                                        <label for="inputPassword2" class="visually-hidden">검색</label>
                                                        <input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="Search..." value="${searchWord }">
                                                    </div>
                                                </form> 
                                                <br/>
                                                <!-- Date Range -->
												<div class="mb-3 col-md-6">
												    <label class="form-label">날짜로 검색</label>
												    <input type="date" class="form-control date" id="singledaterange" data-toggle="date-picker" data-cancel-class="btn-warning">
												</div>                            
                                            </div>
                               		 	</div>
                           		   </div>
                       		 </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="modal fade" id="exampleModalFullscreenSm" tabindex="-1" aria-labelledby="exampleModalFullscreenSmLabel" aria-hidden="true">
										    <div class="modal-dialog modal-fullscreen-sm-down">
										        <div class="modal-content">
										            <div class="modal-header">
										                <h5 class="modal-title" id="exampleModalFullscreenSmLabel">등록화면</h5>
										                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										            </div>
										            <div class="modal-body">
										            	<form enctype="multipart/form-data">
<!-- 										            		<div class="mb-3 col-md-6"> -->
<!-- 										            			<label for="" class="col-form-label">지점명</label> -->
<!-- 																<input type="text" class="form-control" id="inspName" name="searchWord"> -->
<!-- 										            		</div> -->
										            		<div class="mb-3 col-md-6">
										            			<label for="ownerFile8" class="col-form-label">점검일자</label>
										            			<input class="form-control" id="inspDate" type="date" name="date">
										            		</div>
										            		<div class="mb-3 col-md-6">
									                            <label for="ownerConst1" class="col-form-label">위생총점</label>
									                            <select class="form-select form-select-sm mb-3" id="inspScore" name="score">
																	<option selected>선택</option>
																	<option value="0">0</option>
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																</select>
									                        </div>
										            		<div class="mb-3 col-md-6">
										            			<label for="ownerFile8" class="col-form-label">점검표</label>
										            			<input type="file" class="form-control" id="inspFile">
										            		</div>
										            	</form>
										            </div>
										            <div class="modal-footer">
										                <a href="javascript:void(0);" class="btn btn-light" data-bs-dismiss="modal">취소</a>
										                <button type="button" class="btn btn-primary">저장</button>
										            </div>
										        </div>
										    </div>
										</div>
                						<br/>
                                        <div class="table-responsive">
                                            <table class="table table-centered w-100 dt-responsive nowrap" id="products-datatable">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th>가맹점명</th>
                                                        <th>위생총점</th>
                                                        <th>점검표</th>
                                                        <th>점검일자</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody id="tBody">
                                                	<c:set value="${pagingVO.dataList }" var="inspectionList" />
                                                	<c:choose>
                                                		<c:when test="${empty inspectionList }">
                                                			<tr class="text-center">
																<td colspan="5" class="text-dark font-weight-bolder">자료가
																	존재하지 않습니다.</td>
															</tr>
                                                		</c:when>
                                                		<c:otherwise>
															<c:forEach items="${inspectionList }" var="inspection">
																<tr class="text-left">
<%-- 																	<td>${inspection.frcsId }</td> --%>
																	<td>${inspection.frcsName }</td>
																	<td>${inspection.ipStts }</td>
																	<td>
																	    <div id="fileArea"></div>
																		<button type="button" class="btn btn-success btn-sm fileDownload"
																			data-attach-no="${inspection.attachNo }">보기</button>
																	</td>
																	<td><fmt:formatDate value="${inspection.ipDate }"
																			pattern="yyyy-MM-dd" /></td>
																	<td>
					                                        			<button type="button" id="insertBtn" class="btn btn-info btn" data-bs-toggle="modal" data-bs-target="#exampleModalFullscreenSm">등록</button>
					                                        		</td>
																</tr>
															</c:forEach>
													</c:otherwise>
                                                	</c:choose>
                                                </tbody>
                                            </table>
                                            <nav aria-label="Page navigation example" id="pagingArea">
								               ${pagingVO.pagingHTML }
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
	</div>
</div>    
            
<script type="text/javascript">
$(function() {
	var pagingArea = $("#pagingArea");
	var insertBtn = $("#insertBtn");

	// 페이징
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	// 등록
	insertBtn.on("click", function(){
		var inspName = $("#inspName");
		var inspDate = $("#inspDate");
		var inspScore = $("#inspScore");
	});
	
	var data = {
		frcsId: inspName,	
		ipDate: inspDate,
		ipStts: inspScore	
	}
	
	var formData = new FormDate();
		formData.append("boFile", inspFile.files[0]);
		formData.append("frcsId", $("#inspName").val());
		formData.append("ipDate", $("#inspDate").val());
		formData.append("ipStts", $("#inspScore").val());
		
		$.ajax({
	        type: "post",
	        url: "/head/inspectionRegister.do",
	        data: formData, // 이미지 파일과 다른 데이터 포함한 FormData 전달
	        processData: false, // 데이터를 직렬화하지 말고 FormData 그대로 전송
	        contentType: false,
	        dataType: "json",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); // csrf 토큰 보내기 위함
	        },
	        success: function(res) {
	            console.log(res.result);
	            alert("등록 되었습니다.");
	            location.href = "/head/inspection.do";
	        },
	        error: function(err) {
	            alert("데이터 저장 중 오류가 발생했습니다.", err);
	        }
	    });
	
	// 파일 다운로드
    $(".fileDownload").on("click", function() {
        var attachNo = $(this).data("attach-no");
        
        location.href = "/head/inspectionDownload.do?attachNo=" + attachNo;
    });
});
</script>