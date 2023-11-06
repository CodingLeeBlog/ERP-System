<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
						<div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">가맹점 상세</div>
						<div class="col-sm-12 page-title-sub text-muted font-14 ms-3">가맹점의 상세정보를 조회합니다.</div>
					</div>
					<div class="card-body col-6 fw-bold font-22 d-flex justify-content-end align-items-center me-5">
						가맹점주 / &nbsp;<span class="text-decoration-underline">상세</span>
					</div>
				</div>
			</div>
            <!-- end page title -->

		<c:set value="${memberTotal }" var="member" />
		<c:set value="${frcsTotal }" var="frcs" />

        <div class="row">
                        <div class="col-lg-4">
                                <div class="card">
                                     <div class="card-header d-flex justify-content-between align-items-center">
                                        <h1 class="header-title font-24">가맹점주 정보</h1>
                                    </div>

                                <div class="card-body" style="height:500px;">
                                     <div class="col-lg-12 d-flex justify-content-between">
                                            <div class="col-lg-10">
                                                <h2><span class="badge bg-primary">성함</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${member.memName }</div>
                                                <h2><span class="badge bg-primary">생년월일</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1"><fmt:formatDate value="${member.memBir }" pattern="yy/MM/dd"/></div>
                                                <h2><span class="badge bg-primary">주소</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${member.memAdd1 }&nbsp;${member.memAdd2 }</div>
                                                <h2><span class="badge bg-primary">연락처</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${member.memTel }</div>
                                                <h2><span class="badge bg-primary">이메일</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${member.memEmail }</div>
                                            </div>
                                        </div> 
                                </div>
                                </div> <!-- end card -->
                            </div><!-- end col-->

                            <div class="col-lg-8">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h1 class="header-title font-24">가맹점 정보</h1>
                                    </div>
                                    <div class="card-body" style="height:500px;">
                                        <div class="col-lg-12 d-flex justify-content-between">
                                            <div class="col-lg-6">
                                                <h2><span class="badge bg-primary">가맹점명</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${frcs.frcsName }</div>
                                                <h2><span class="badge bg-primary">가맹점 전화번호</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${frcs.frcsTel }</div>
                                                <h2><span class="badge bg-primary">가맹점 운영상태</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${frcs.frcsState }</div>
                                                <h2><span class="badge bg-primary">우편번호</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${frcs.frcsPost }</div>
                                                <h2><span class="badge bg-primary">가맹점주소</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${frcs.frcsAdd1 }&nbsp;${frcs.frcsAdd2 }</div>
                                            </div>
                                            <div class="col-lg-6">
                                            	<h2><span class="badge bg-primary">영업시작시간</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${frcs.frcsSttime }</div>
                                                <h2><span class="badge bg-primary">영업종료시간</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1">${frcs.frcsEndtime }</div>
                                                <h2><span class="badge bg-primary">계약체결일자</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1"><fmt:formatDate value="${frcs.frcsCdate }" pattern="yy/MM/dd"/></div>
                                                <h2><span class="badge bg-primary">그랜드오픈일자</span></h2>
                                                <div class="col-sm-10 text-muted font-14 ms-1"><fmt:formatDate value="${frcs.frcsOpdate }" pattern="yy/MM/dd"/></div>
                                                
                                            </div>
                                        </div>  
                                    </div>

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