
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">
<head>
  <!-- YouTube iframe API 스크립트를 로드합니다. -->
  <script src="https://www.youtube.com/iframe_api"></script>
</head>
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
								<li class="breadcrumb-item"><a href="javascript: void(0);">개점관리</a></li>
								<li class="breadcrumb-item active text-decoration-underline">교육훈련관리</li>
							</ol>
						</div>
						<h4 class="page-title ms-3">개점관리</h4>
					</div>
				</div>
			</div>
		</div>
			<div class="row">
                         <div class="col-xl-14">
                             <div class="card">
                                 <div class="card-body">

                                     <h2 class="header-title mb-3">교육 동영상</h2>

                                     <form>
                                         <div id="progressbarwizard">

                                             <ul class="nav nav-pills nav-justified form-wizard-header mb-3">
                                                 <li class="nav-item">
                                                     <a href="#video1" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 py-2">
                                                         <i class="mdi mdi-account-circle font-18 align-middle me-1"></i>
                                                         <span class="d-none d-sm-inline">위생교육</span>
                                                     </a>
                                                 </li>
                                                 <li class="nav-item">
                                                     <a href="#video2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 py-2">
                                                         <i class="mdi mdi-face-man-profile font-18 align-middle me-1"></i>
                                                         <span class="d-none d-sm-inline">직장내성폭력교육</span>
                                                     </a>
                                                 </li>
                                                 <li class="nav-item">
                                                     <a href="#video3" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 py-2">
                                                         <i class="mdi mdi-face-man-profile font-18 align-middle me-1"></i>
                                                         <span class="d-none d-sm-inline">소방교육</span>
                                                     </a>
                                                 </li>
                                                 <li class="nav-item">
                                                     <a href="#finish" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 py-2">
                                                         <i class="mdi mdi-checkbox-marked-circle-outline font-18 align-middle me-1"></i>
                                                         <span class="d-none d-sm-inline">교육완료</span>
                                                     </a>
                                                 </li>
                                             </ul>
                                         
                                             <div class="tab-content b-0 mb-0">

                                                 <div id="bar" class="progress mb-3" style="height: 7px;">
                                                     <div class="bar progress-bar progress-bar-striped progress-bar-animated bg-success"></div>
                                                 </div>
                                         
                                                 <div class="tab-pane" id="video1">
                                                     <div class="row">
												        <div class="col-12 d-flex justify-content-center align-items-center">
												            <iframe width="800" height="480" src="https://www.youtube.com/embed/WMvR4mVEC3s?autoplay=1&mute=1&controls=0" frameborder="0" allowfullscreen></iframe>
												        </div> <!-- end col -->
                                                     </div> <!-- end row -->

                                                     <ul class="list-inline wizard mb-0">
                                                         <li class="next list-inline-item float-end">
                                                             <a href="javascript:void(0);" id="next1" class="btn btn-info">다음<i class="mdi mdi-arrow-right ms-1"></i></a>
                                                         </li>
                                                     </ul>
                                                 </div>

                                                 <div class="tab-pane" id="video2">
                                                     <div class="row">
                                                         <div class="col-12 d-flex justify-content-center align-items-center">
												            <iframe width="800" height="480" src="https://www.youtube.com/embed/OoO9ZHuaHN4?mute=1&controls=0" frameborder="0" allowfullscreen></iframe>
												        </div> <!-- end col -->
                                                     </div> <!-- end row -->
                                                     <ul class="pager wizard mb-0 list-inline">
                                                         <li class="previous list-inline-item">
                                                             <button type="button" class="btn btn-light"><i class="mdi mdi-arrow-left me-1"></i>이전</button>
                                                         </li>
                                                         <li class="next list-inline-item float-end">
                                                             <button type="button" class="btn btn-info" id="next2">다음<i class="mdi mdi-arrow-right ms-1"></i></button>
                                                         </li>
                                                     </ul>
                                                 </div>
                                                 
                                                 <div class="tab-pane" id="video3">
                                                     <div class="row">
                                                         <div class="col-12 d-flex justify-content-center align-items-center">
												            <iframe width="800" height="480" src="https://www.youtube.com/embed/QrJh5pONAVc?mute=1&controls=0" frameborder="0" allowfullscreen></iframe>
												        </div> <!-- end col -->
                                                     </div> <!-- end row -->
                                                     <ul class="pager wizard mb-0 list-inline">
                                                         <li class="previous list-inline-item">
                                                             <button type="button" class="btn btn-light"><i class="mdi mdi-arrow-left me-1"></i>이전</button>
                                                         </li>
                                                         <li class="next list-inline-item float-end">
                                                             <button type="button" class="btn btn-info" id="next3">다음<i class="mdi mdi-arrow-right ms-1"></i></button>
                                                         </li>
                                                     </ul>
                                                 </div>

                                                 <div class="tab-pane" id="finish">
                                                     <div class="row">
                                                         <div class="col-12">
                                                             <div class="text-center">
                                                                 <h2 class="mt-0"><i class="mdi mdi-check-all"></i></h2>
                                                                 <h3 class="mt-0">교육이 완료되었습니다.</h3>

                                                                 <p class="w-75 mb-2 mx-auto">우측 하단의 제출 버튼을 눌러주시길 바랍니다.</p>

                                                                 <div class="mb-3">
                                                                     <div class="form-check d-inline-block">
                                                                         <input type="checkbox" class="form-check-input" id="customCheck3">
                                                                         <label class="form-check-label" for="customCheck3">교육 이수를 확인합니다.</label>
                                                                     </div>
                                                                 </div>
                                                             </div>
                                                         </div> <!-- end col -->
                                                     </div> <!-- end row -->
                                                     <ul class="pager wizard mb-0 list-inline mt-1">
                                                         <li class="previous list-inline-item">
                                                             <button type="button" class="btn btn-light"><i class="mdi mdi-arrow-left me-1"></i>이전</button>
                                                         </li>
                                                         <li class="next list-inline-item float-end">
                                                             <button type="button" class="btn btn-info">제출</button>
                                                         </li>
                                                     </ul>
                                                 </div>

                                             </div> <!-- tab-content -->
                                         </div> <!-- end #progressbarwizard-->
                                     </form>

                                 </div> <!-- end card-body -->
                             </div> <!-- end card-->
                         </div> <!-- end col -->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>    

<script>
    var progress = 0;

    // 페이지가 로드될 때 '위생교육' 탭으로 이동
    $(document).ready(function() {
        goToNextTab("video1");
    });

    // "다음" 버튼을 클릭할 때 호출되는 함수
    function goToNextTab(tabId) {
        // 해당 탭으로 이동합니다.
        $('a[href="#' + tabId + '"]').tab('show');

        // 프로그레스를 25% 씩 증가시킵니다.
        progress += 25;
        updateProgressBar(progress);
    }

    // 프로그레스 바를 업데이트하는 함수
    function updateProgressBar(percentage) {
        $('#bar .progress-bar').css('width', percentage + '%').attr('aria-valuenow', percentage);
    }

    // "다음" 버튼 클릭 이벤트를 연결합니다.
    $('#next1').click(function() {
        goToNextTab("video2");
    });
    
    $('#next2').click(function() {
        goToNextTab("video3");
    });
    
    $('#next3').click(function() {
        goToNextTab("finish");
    });
    
    
    
</script>
