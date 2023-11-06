<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">게시판</a></li>
	                            <li class="breadcrumb-item active">공문조회</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">공문조회</h4>
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
	                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#compose-modal">공문 보내기</button>
	                            </div>
	
	                            <div class="email-menu-list mt-3">
	                                <a href="javascript: void(0);"><i class=" ri-mail-line me-2"></i>전체 공문</a>
	                                <a href="javascript: void(0);" class="text-danger fw-bold"><i class="ri-inbox-line me-2"></i>받은 공문<span class="badge badge-danger-lighten float-end ms-2">7</span></a>
	                                <a href="javascript: void(0);"><i class="ri-mail-send-line me-2"></i>보낸 공문</a>
	                                <a href="javascript: void(0);"><i class="ri-star-line me-2"></i>즐겨찾기</a>
	                                <a href="javascript: void(0);"><i class="ri-delete-bin-line me-2"></i>휴지통</a>
	                            </div> 
	
	                        </div>
	                        <!-- End Left sidebar -->
	
	                        <div class="page-aside-right">
	
	                            <div class="btn-group">
	                                <button type="button" class="btn btn-secondary"><i class="mdi mdi-archive font-16"></i>수정</button>
	                                <button type="button" class="btn btn-secondary"><i class="mdi mdi-alert-octagon font-16"></i>삭제</button>
	                                <button type="button" class="btn btn-secondary"><i class="mdi mdi-delete-variant font-16"></i>영구삭제</button>
	                            </div>
<!-- 	                            <div class="btn-group"> -->
<!-- 	                                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!-- 	                                    <i class="mdi mdi-folder font-16"></i> -->
<!-- 	                                    <i class="mdi mdi-chevron-down"></i> -->
<!-- 	                                </button> -->
<!-- 	                                <div class="dropdown-menu"> -->
<!-- 	                                    <span class="dropdown-header">Move to:</span> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Social</a> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Promotions</a> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Updates</a> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Forums</a> -->
<!-- 	                                </div> -->
<!-- 	                            </div> -->
<!-- 	                            <div class="btn-group"> -->
<!-- 	                                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!-- 	                                    <i class="mdi mdi-label font-16"></i> -->
<!-- 	                                    <i class="mdi mdi-chevron-down"></i> -->
<!-- 	                                </button> -->
<!-- 	                                <div class="dropdown-menu"> -->
<!-- 	                                    <span class="dropdown-header">Label as:</span> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Updates</a> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Social</a> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Promotions</a> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Forums</a> -->
<!-- 	                                </div> -->
<!-- 	                            </div> -->
	
<!-- 	                            <div class="btn-group"> -->
<!-- 	                                <button type="button" class="btn btn-secondary dropdown-toggle arrow-none" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!-- 	                                    <i class="mdi mdi-dots-horizontal font-16"></i> More -->
<!-- 	                                    <i class="mdi mdi-chevron-down"></i> -->
<!-- 	                                </button> -->
<!-- 	                                <div class="dropdown-menu"> -->
<!-- 	                                    <span class="dropdown-header">More Options :</span> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Mark as Unread</a> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Add to Tasks</a> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Add Star</a> -->
<!-- 	                                    <a class="dropdown-item" href="javascript: void(0);">Mute</a> -->
<!-- 	                                </div> -->
<!-- 	                            </div> -->
	
	                            <div class="mt-3">
	                                <ul class="email-list">
	                                    <li class="unread">
	                                        <div class="email-sender-info">
	                                            <div class="checkbox-wrapper-mail">
	                                                <div class="form-check">
	                                                    <input type="checkbox" class="form-check-input" id="mail1">
	                                                    <label class="form-check-label" for="mail1"></label>
	                                                </div>
	                                            </div>
	                                            <span class="star-toggle mdi mdi-star-outline text-warning"></span>
	                                            <a href="javascript: void(0);" class="email-title">본사</a>
	                                        </div>
	                                        <div class="email-content">
	                                            <a href="javascript: void(0);" class="email-subject">
	                                                [엘리할머니맥주 대전오류점] 이번달 위생 점검 결과표입니다.
	                                            </a>
	                                            <div class="email-date">11:49 am</div>
	                                        </div>
	                                        <div class="email-action-icons">
	                                            <ul class="list-inline">
	                                                <li class="list-inline-item">
	                                                    <a href="javascript: void(0);"><i class="mdi mdi-archive email-action-icons-item"></i></a>
	                                                </li>
	                                                <li class="list-inline-item">
	                                                    <a href="javascript: void(0);"><i class="mdi mdi-delete email-action-icons-item"></i></a>
	                                                </li>
	                                                <li class="list-inline-item">
	                                                    <a href="javascript: void(0);"><i class="mdi mdi-email-open email-action-icons-item"></i></a>
	                                                </li>
	                                                <li class="list-inline-item">
	                                                    <a href="javascript: void(0);"><i class="mdi mdi-clock email-action-icons-item"></i></a>
	                                                </li>
	                                            </ul>
	                                        </div>
	                                    </li>
	                                </ul>
	                            </div>
	                            <!-- end .mt-4 -->
	
	                            <div class="row">
	                                <div class="col-7 mt-1">
	                                    Showing 1 - 12 of 92
	                                </div> <!-- end col-->
	                                <div class="col-5">
	                                    <div class="btn-group float-end">
	                                        <button type="button" class="btn btn-light btn-sm"><i class="mdi mdi-chevron-left"></i></button>
	                                        <button type="button" class="btn btn-info btn-sm"><i class="mdi mdi-chevron-right"></i></button>
	                                    </div>
	                                </div> <!-- end col-->
	                            </div>
	                            <!-- end row-->
	                        </div> 
	                        <!-- end inbox-rightbar-->
	                    </div>
	                    <!-- end card-body -->
	                    <div class="clearfix"></div>
	                </div> <!-- end card-box -->
	
	            </div> <!-- end Col -->
	        </div><!-- End row -->
	        
	    </div> <!-- container -->
	
	</div> <!-- content -->
	
	
	<!-- Compose Modal -->
	<div id="compose-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header modal-colored-header bg-primary">
	                <h4 class="modal-title" id="compose-header-modalLabel">New Message</h4>
	                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="p-1">
	                <div class="modal-body px-3 pt-3 pb-0">
	                    <form>
	                        <div class="mb-2">
	                            <label for="msgto" class="form-label">To</label>
	                            <input type="text" id="msgto" class="form-control" placeholder="Example@email.com">
	                        </div>
	                        <div class="mb-2">
	                            <label for="mailsubject" class="form-label">제목</label>
	                            <input type="text" id="mailsubject" class="form-control" placeholder="제목">
	                        </div>
	                        <div class="write-mdg-box mb-3">
	                            <label class="form-label">내용</label>
	                            <textarea id="simplemde1"></textarea>
	                        </div>
	                    </form>
	                </div>
	                <div class="px-3 pb-3">
	                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal"><i class="mdi mdi-send me-1"></i></button>
	                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
	                </div>
	            </div>
	        </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</div>