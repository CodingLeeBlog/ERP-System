<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">
                        
                        <!-- start page email-title -->
                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">매장관리</a></li>
                                            <li class="breadcrumb-item active">공문관리</li>
                                        </ol>
                                    </div>
                                    <h4 class="page-title">공문관리</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        <!-- end page email-title --> 

                        <div class="row">

                            <!-- Right Sidebar -->
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <!-- Left sidebar -->
                                        <div class="page-aside-left">

                                            <div class="d-grid">
                                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#compose-modal">Compose</button>
                                            </div>

                                            <div class="email-menu-list mt-3">
                                                <a href="javascript: void(0);" class="text-danger fw-bold"><i class="ri-inbox-line me-2"></i>수신함<span class="badge badge-danger-lighten float-end ms-2">7</span></a>
                                                <a href="javascript: void(0);"><i class="ri-mail-send-line me-2"></i>발신함</a>
                                            </div>

                                        </div>
                                        <!-- End Left sidebar -->

                                        <div class="page-aside-right">

                                            <div class="btn-group">
                                                <button type="button" class="btn btn-secondary"><i class="mdi mdi-archive font-16"></i></button>
                                                <button type="button" class="btn btn-secondary"><i class="mdi mdi-alert-octagon font-16"></i></button>
                                                <button type="button" class="btn btn-secondary"><i class="mdi mdi-delete-variant font-16"></i></button>
                                            </div>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="mdi mdi-folder font-16"></i>
                                                    <i class="mdi mdi-chevron-down"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <span class="dropdown-header">Move to:</span>
                                                    <a class="dropdown-item" href="javascript: void(0);">Social</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                                </div>
                                            </div>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="mdi mdi-label font-16"></i>
                                                    <i class="mdi mdi-chevron-down"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <span class="dropdown-header">Label as:</span>
                                                    <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Social</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                                                </div>
                                            </div>

                                            <div class="btn-group">
                                                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i class="mdi mdi-dots-horizontal font-16"></i> More
                                                    <i class="mdi mdi-chevron-down"></i>
                                                </button>
                                                <div class="dropdown-menu">
                                                    <span class="dropdown-header">More Options :</span>
                                                    <a class="dropdown-item" href="javascript: void(0);">Mark as Unread</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Add to Tasks</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Add Star</a>
                                                    <a class="dropdown-item" href="javascript: void(0);">Mute</a>
                                                </div>
                                            </div>

                                            <div class="mt-3">
                                                <h5 class="font-18">교육 이수 관련입니다.</h5>

                                                <hr/>

                                                <div class="d-flex mb-3 mt-1">
                                                    <div class="w-100 overflow-hidden">
                                                        <small class="float-end">Dec 14, 2017, 5:17 AM</small>
                                                        <h6 class="m-0 font-14">서울신림점</h6>
                                                    </div>
                                                </div>

                                                <p>관련</p>
                                                <ol>
                                                    <li>어쩌고어쩌고</li>
                                                </ol>

                                                <hr/>

                                                <h5 class="mb-3">첨부파일</h5>

                                                <div class="row">
                                                    <div class="col-xl-4">
                                                        <div class="card mb-1 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <div class="avatar-sm">
                                                                            <span class="avatar-title bg-primary-lighten text-primary rounded">
                                                                                .ZIP
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col ps-0">
                                                                        <a href="javascript:void(0);" class="text-muted fw-bold">Hyper-admin-design.zip</a>
                                                                        <p class="mb-0">2.3 MB</p>
                                                                    </div>
                                                                    <div class="col-auto">
                                                                        <!-- Button -->
                                                                        <a href="javascript:void(0);" class="btn btn-link btn-lg text-muted">
                                                                            <i class="ri-download-2-line"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> <!-- end col -->
                                                    <div class="col-xl-4">
                                                        <div class="card mb-1 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <img src="assets/images/projects/project-1.jpg" class="avatar-sm rounded" alt="file-image">
                                                                    </div>
                                                                    <div class="col ps-0">
                                                                        <a href="javascript:void(0);" class="text-muted fw-bold">Dashboard-design.jpg</a>
                                                                        <p class="mb-0">3.25 MB</p>
                                                                    </div>
                                                                    <div class="col-auto">
                                                                        <!-- Button -->
                                                                        <a href="javascript:void(0);" class="btn btn-link btn-lg text-muted">
                                                                            <i class="ri-download-2-line"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> <!-- end col -->
                                                    <div class="col-xl-4">
                                                        <div class="card mb-0 shadow-none border">
                                                            <div class="p-2">
                                                                <div class="row align-items-center">
                                                                    <div class="col-auto">
                                                                        <div class="avatar-sm">
                                                                            <span class="avatar-title text-bg-secondary rounded">
                                                                                .MP4
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col ps-0">
                                                                        <a href="javascript:void(0);" class="text-muted fw-bold">Admin-bug-report.mp4</a>
                                                                        <p class="mb-0">7.05 MB</p>
                                                                    </div>
                                                                    <div class="col-auto">
                                                                        <!-- Button -->
                                                                        <a href="javascript:void(0);" class="btn btn-link btn-lg text-muted">
                                                                            <i class="ri-download-2-line"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> <!-- end col -->
                                                </div>
                                                <!-- end row-->
                                                
                                                <div class="mt-5">
                                                    <a href="" class="btn btn-secondary me-2"><i class="mdi mdi-reply me-1"></i>목록</a>
                                                </div>
     
                                            </div>
                                            <!-- end .mt-4 -->

                                        </div> 
                                        <!-- end inbox-rightbar-->
                                    </div>

                                    <div class="clearfix"></div>
                                </div> <!-- end card-box -->

                            </div> <!-- end Col -->
                        </div><!-- End row -->
                        
						</div>
                    </div> <!-- container -->
                </div> <!-- content -->