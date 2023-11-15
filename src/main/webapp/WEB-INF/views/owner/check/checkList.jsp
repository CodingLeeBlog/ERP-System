<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">매장점검관리</a></li>
	                            <li class="breadcrumb-item active">매장위생관리</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">매장위생관리</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	
	        <div class="row">
	            <div class="col-12">
	                <div class="card widget-inline">
	                    <div class="card-body p-0">
	                        <div class="row g-0">
	                        
	                        	<c:set value="${pagingVO.dataList }" var="checkList" />
	                            <c:choose>
                               		<c:when test="${empty checkList }">
                               			<div class="col-sm-6 col-lg-6">
			                                <div class="card rounded-0 shadow-none m-0 border-start border-light">
			                                    
			                                    <div class="row align-items-center mx-5">
			                                        <div class="col-4">
			                                            <div class="card-body text-center">
			                                                <i class="ri-award-line text-muted font-24"></i>
			                                                <h3><span>정보없음</span></h3>
			                                                <p class="text-muted font-15 mb-0">위생 총점</p>
			                                            </div>
			                                        </div>
			                                        <div class="col-8">
			                                            <div class="text-end">
			                                                <div id="campaign-sent-chart" data-colors="#727cf5" ></div>
			                                            </div>
			                                        </div>
			                                    </div> <!-- end row-->
			                                    
			                                </div> <!-- end card -->
			                            </div> <!-- end col -->
			                
			                            <div class="col-sm-6 col-lg-3">
			                                <div class="card rounded-0 shadow-none m-0 border-start border-light">
			                                    <div class="card-body text-center">
			                                        <i class="ri-calendar-check-line text-muted font-24"></i>
			                                        <h3><span>정보없음</span></h3>
			                                        <p class="text-muted font-15 mb-0">최근 점검일자</p>
			                                    </div>
			                                </div>
			                            </div>
			
			                            <div class="col-sm-6 col-lg-3">
			                                <div class="card rounded-0 shadow-none m-0 border-start border-light">
			                                    <div class="card-body text-center">
			                                    	<a href="/owner/doc.do">
				                                        <i class="ri-share-forward-line text-muted font-24"></i>
				                                        <h3><span>${frcsHead.frcsName }</span></h3>
				                                        <p class="text-muted font-15 mb-0">공문바로가기</p>
			                                    	</a>
			                                    </div>
			                                </div>
			                            </div>
                               		</c:when>
                               		<c:otherwise>
			                            <div class="col-sm-6 col-lg-6">
			                                <div class="card rounded-0 shadow-none m-0 border-start border-light">
			                                    
			                                    <div class="row align-items-center mx-5">
			                                        <div class="col-4">
			                                            <div class="card-body text-center">
			                                                <i class="ri-award-line text-muted font-24"></i>
			                                                <h3><span>${checkList.get(0).ipStts } / 5</span></h3>
			                                                <p class="text-muted font-15 mb-0">위생 총점</p>
			                                            </div>
			                                        </div>
			                                        <div class="col-8">
			                                            <div class="text-end">
			                                                <div id="campaign-sent-chart" data-colors="#727cf5" ></div>
			                                            </div>
			                                        </div>
			                                    </div> <!-- end row-->
			                                    
			                                </div> <!-- end card -->
			                            </div> <!-- end col -->
			                
			                            <div class="col-sm-6 col-lg-3">
			                                <div class="card rounded-0 shadow-none m-0 border-start border-light">
			                                    <div class="card-body text-center">
			                                        <i class="ri-calendar-check-line text-muted font-24"></i>
			                                        <h3><span><fmt:formatDate value="${checkList.get(0).ipDate }" pattern="yyyy/MM/dd"/></span></h3>
			                                        <p class="text-muted font-15 mb-0">최근 점검일자</p>
			                                    </div>
			                                </div>
			                            </div>
			
			                            <div class="col-sm-6 col-lg-3">
			                                <div class="card rounded-0 shadow-none m-0 border-start border-light">
			                                    <div class="card-body text-center">
			                                    	<a href="/owner/doc.do">
				                                        <i class="ri-share-forward-line text-muted font-24"></i>
				                                        <h3><span>${checkList.get(0).frcsName }</span></h3>
				                                        <p class="text-muted font-15 mb-0">공문바로가기</p>
			                                    	</a>
			                                    </div>
			                                </div>
			                            </div>
                               		</c:otherwise>
                               	</c:choose>
	
	                        </div> <!-- end row -->
	                    </div>
	                </div> <!-- end card-box-->
	            </div> <!-- end col-->
	        </div>
	        <!-- end row-->
	
	        <div class="row">
	            <div class="col-12">
	                <div class="card">
	                    <div class="card-body">
	
	                        <!-- 검색 -->
	                        <div class="row mb-2">
	                        	<div class="col-xl-8"></div>
	                            <div class="col-xl-4">
	                                <form class="row gy-2 gx-2 align-items-center justify-content-xl-end justify-content-between" id="searchForm">
	                                    <div class="col-auto input-group input-group-outline">
	                                        <select class="form-select" id="searchType" name="searchType" aria-label="Example select with button addon">
												
												<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
												<option value="content" <c:if test="${searchType eq 'content' }">selected</c:if>>내용</option>
											</select>
		                                    <label for="inputPassword2" class="visually-hidden">Search</label>
		                                    <input type="search" class="form-control" id="searchWord" name="searchWord" value="${searchWord }" placeholder="Search...">
			                                <button type="submit" class="btn btn-outline-secondary">검색</button>
	                                    </div>
	                                <sec:csrfInput/>
	                                </form>                            
	                            </div>
	                        </div>
	
	                        <div class="table-responsive">
	                            <table class="table nowrap table-centered w-100 table-hover ">
	                                <thead class="table-light">
	                                    <tr>
	                                        <th style="text-align:center">No.</th>
	                                        <th style="text-align:center">점검일자</th>
	                                        <th style="text-align:center">가맹점명</th>
	                                        <th style="text-align:center">위생총점</th>
	                                        <th style="text-align:center">위생내역</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:set value="${pagingVO.dataList }" var="checkList" />
	                                	<c:choose>
	                                		<c:when test="${empty checkList }">
	                                			<tr class="text-center">
													<td colspan="5" class="text-dark font-weight-bolder">위생점검 내역이 존재하지 않습니다.</td>
												</tr>
	                                		</c:when>
	                                		<c:otherwise>
	                                			<c:forEach items="${checkList }" var="check">
				                                    <tr>
				                                        <td style="text-align:center">${check.rnum }</td>
				                                        <td style="text-align:center"><fmt:formatDate value="${check.ipDate }" pattern="yyyy/MM/dd"/></td>
				                                        <td style="text-align:center">${check.frcsName }</td>
				                                        <td style="text-align:center">${check.ipStts }</td>
				                                        <td style="text-align:center">
					                                        <button type="button" class="btn badge bg-light text-dark  fileDownload" data-attach-no="${check.attachNo }" name="attachNo">
																<span class="">내역다운로드 <i class="ri-download-2-line" ></i></span>
															</button>
				                                        </td>
				                                    </tr>
	                                			</c:forEach>
	                                		</c:otherwise>
	                                	</c:choose>
	                                </tbody>
	                            </table>
	                        </div>
	
	                        <!-- 페이징 -->
	                        <nav aria-label="Page navigation example" id="pagingArea">
								${pagingVO.pagingHTML }
							</nav>
	
	                    </div> <!-- end card-body-->
	                </div> <!-- end card-->
	            </div> <!-- end col -->
	        </div>
	        <!-- end row -->   
	        
	    </div> <!-- container -->
	
	</div> <!-- content -->
</div>

<!-- 내역보기 모달 -->
<div id="standard-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="standard-modalLabel">Modal Heading</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">

	//파일 다운로드
	$(".fileDownload").on("click", function() {
		var attachNo = $(this).data("attach-no");
	
		location.href = "/owner/checkDownload.do?attachNo=" + attachNo;
	});

</script>