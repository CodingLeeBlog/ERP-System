<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	                            <li class="breadcrumb-item"><a href="javascript: void(0);">직원관리</a></li>
	                            <li class="breadcrumb-item active">근태관리</li>
	                        </ol>
	                    </div>
	                    <h4 class="page-title">근태관리</h4>
	                </div>
	            </div>
	        </div>
	        <!-- end page title -->
	
	        <div class="row">
	            <div class="col-12">
	
	                <div class="card">
	                    <div class="card-body">
	                        <div class="row">
	                            <div class="col-lg-3">
	                                <div class="d-grid">
	                                    <button class="btn btn-lg font-16 btn-danger" id="btn-new-event">
	                                        <i class="mdi mdi-plus-circle-outline"></i> 근태 입력
	                                    </button>
	                                </div>
	                                <div id="external-events" class="mt-3">
	                                    <p class="text-muted">* 카드를 드래그 하거나 달력을 클릭하여 등록하세요.</p>
	                                    <div class="external-event bg-success-lighten text-success" data-class="bg-success"><i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>지각</div>
	                                    <div class="external-event bg-info-lighten text-info" data-class="bg-info"><i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>휴가</div>
	                                    <div class="external-event bg-warning-lighten text-warning" data-class="bg-warning"><i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>조퇴</div>
	                                    <div class="external-event bg-danger-lighten text-danger" data-class="bg-danger"><i class="mdi mdi-checkbox-blank-circle me-2 vertical-middle"></i>결근</div>
	                                </div>
	
	                            </div> <!-- end col-->
	
	                            <div class="col-lg-9">
	                                <div class="mt-4 mt-lg-0">
	                                    <div id="calendar"></div>
	                                </div>
	                            </div> <!-- end col -->
	
	                        </div> <!-- end row -->
	                    </div> <!-- end card body-->
	                </div> <!-- end card -->
	
	                <!-- Add New Event MODAL -->
	                <div class="modal fade" id="event-modal" tabindex="-1">
	                    <div class="modal-dialog">
	                        <div class="modal-content">
	                            <form class="needs-validation" name="event-form" id="form-event" novalidate>
	                                <div class="modal-header py-3 px-4 border-bottom-0">
	                                    <h5 class="modal-title" id="modal-title">근태 입력</h5>
	                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                                </div>
	                                <div class="modal-body px-4 pb-4 pt-0">
	                                    <div class="row">
	                                        <div class="col-12">
	                                            <div class="mb-3">
	                                                <label class="control-label form-label">제목</label>
	                                                <input class="form-control" placeholder="" type="text" name="title" id="event-title" required />
	                                                <div class="invalid-feedback">제목을 작성해주세요!</div>
	                                            </div>
	                                        </div>
	                                        <div class="col-12">
	                                            <div class="mb-3">
	                                                <label class="control-label form-label">근태 유형</label>
	                                                <select class="form-select" name="category" id="event-category" required>
	                                                    <option value="bg-success" selected>지각</option>
	                                                    <option value="bg-info">휴가</option>
	                                                    <option value="bg-warning">조퇴</option>
	                                                    <option value="bg-danger">결근</option>
	                                                </select>
	                                                <div class="invalid-feedback">근태 유형을 선택해주세요!</div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-6">
	                                            <button type="button" class="btn btn-danger" id="btn-delete-event">삭제</button>
	                                        </div>
	                                        <div class="col-6 text-end">
	                                            <button type="button" class="btn btn-light me-1" data-bs-dismiss="modal">닫기</button>
	                                            <button type="submit" class="btn btn-success" id="btn-save-event">저장</button>
	                                        </div>
	                                    </div>
	                                </div>
	                            </form>
	                        </div> <!-- end modal-content-->
	                    </div> <!-- end modal dialog-->
	                </div>
	                <!-- end modal-->
	            </div>
	            <!-- end col-12 -->
	        </div> <!-- end row -->
	
	    </div> <!-- container -->
	
	</div> <!-- content -->
</div>            
