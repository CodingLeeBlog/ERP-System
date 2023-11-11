<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/vendor/fullcalendar/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fullcalendar/main.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fullcalendar/locales/ko.js">
<style>
.fc-event-time {
    color: black;
}
.fc-event-title {
    color: black;
}
.fc-daygrid-event {
    border: white;
}
</style>
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
						<div id="selectedEmployee"></div>
                            <div class="col-lg-12">
                                <div class="mt-lg-0 mt-5 ms-4 me-4 mb-2">
                                    <div id="calendar"></div>
                                </div>
                            </div> <!-- end col -->
	                </div> <!-- end card -->
	
	                <!-- Add New Event MODAL -->
	                <div class="modal fade" id="register" tabindex="-1">
	                    <div class="modal-dialog">
	                        <div class="modal-content">
	                            <form class="needs-validation" action="/owner/attendanceInsert.do" method="post" name="event-form" id="regForm" novalidate>
	                                <div class="modal-header py-3 px-4 border-bottom-0">
	                                    <h5 class="modal-title" id="modal-title">근태 입력</h5>
	                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                                </div>
	                                <div class="modal-body px-4 pb-4 pt-0">
	                                    <div class="row">
	                                           <c:set var="employeeList" value="${memFrcsList}" />
	                                       <div class="col-12">
	                                            <div class="mb-3">
	                                                <label class="control-label form-label">직원 선택</label>
	                                                <select class="form-select frcsList" name="frcsEmpCd" id="event-category">
	                                                	<option selected disabled value="">선택하세요</option>
	                                           <c:forEach items="${employeeList}" var="employee" >
	                                                    <option class="frcsEmpCd" value="${employee.frcsEmpCd}">${employee.frcsEmpNm}
	                                                    </option>
	                                            </c:forEach>
	                                                </select>
	                                                <div class="invalid-feedback">직원을 선택해주세요!</div>
	                                            </div>
	                                        </div>
	                                        <div class="col-12">
	                                            <div class="mb-3">
	                                                <label class="control-label form-label">근태 유형</label>
	                                                <select class="form-select frcsList2" name="atndTtl" id="event-category" required>
	                                                    <option selected disabled value="">선택하세요</option>
	                                                    <option>지각</option>
	                                                    <option>휴가</option>
	                                                    <option>조퇴</option>
	                                                    <option>결근</option>
	                                                </select>
	                                                <div class="invalid-feedback">근태 유형을 선택해주세요!</div>
	                                            </div>
	                                        </div>
	                                        <div class="col-12">
	                                            <div class="mb-3">
	                                                <label class="control-label form-label">색상 선택</label>
	                                                <select class="form-select frcsList3" name="atndColor" id="event-category" required>
	                                                   <option selected disabled value="">선택하세요</option>
	                                                    <option value="#0ACF97" style="color: #0ACF97;">초록색</option>
	                                                    <option value="#39AFD1" style="color: #39AFD1;">파란색</option>
	                                                    <option value="#FFC35A" style="color: #FFC35A;">노란색</option>
	                                                    <option value="#FA5C7C" style="color: #FA5C7C;">빨간색</option>
	                                                </select>
	                                                <div class="invalid-feedback">근태 유형을 선택해주세요!</div>
	                                            </div>
	                                        </div>
	                                          <div class="col-12">
	                                            <div class="mb-3">
	                                                <label class="control-label form-label frcsList4">시작 날짜</label>
	                                                <input class="form-control" placeholder="" name="atndStymd" id="start-date" required readonly/>
	                                                <div class="invalid-feedback">날짜를 입력해주세요!</div>
	                                            </div>
	                                        </div>
	                                          <div class="col-12">
	                                            <div class="mb-3">
	                                                <label class="control-label form-label frcsList5">끝 날짜</label>
	                                                <input class="form-control" placeholder="" name="atndEnymd" id="end-date" required readonly/>
	                                                <div class="invalid-feedback">날짜를 입력해주세요!</div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="row">
	                                        <div class="col-6 text-end">
	                                            <button type="button" class="btn btn-light me-1" data-bs-dismiss="modal">닫기</button>
	                                            <button type="button" id="subBtn" class="btn btn-success">저장</button>
		                                        </div>
		                                    </div>
		                                  </div>
		                               <sec:csrfInput/>
		                            </form>
		                        </div> <!-- end modal-content-->
		                    </div> <!-- end modal dialog-->
		                </div><!-- end modal-->
		            </div><!-- end col-12 -->
		        </div> <!-- end row -->
		    </div> <!-- container -->
		</div> <!-- content -->
	</div>            
</div>            

<script>
$(function(){
	
			var request = $.ajax({
				url : "/owner/attendanceSelect.do", // 값 불러오기
				method : "GET",
				dataType : "json",
				beforeSend: function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
				},
			});
			request.done(function(data){
				console.log("data : "+JSON.stringify(data)); // log로 데이터 찍어주기
				var calendarEl = document.getElementById('calendar');
				calendar = new FullCalendar.Calendar(calendarEl,{
					height : '700px',
					slotMinTime : '08:00', // Day 캘린더에서 시작 시간
					slotMaxTime : '20:00',  // Day 캘린더에서 종료 시간
					// 헤더에 표시할 툴바
					headerToolbar :{
						left : 'prev next today',
						center : 'title',
						right : 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
					},
					initialView : 'dayGridMonth', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
					navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
					editable : true, // 수정 가능?
					selectable : true, // 달력 일자 드래그 설정 가능
					droppable : true, // 드래그 앤 드롭 
					events : data,
					locale : 'ko', // 한국어 설정
					
				
					// 드래그로 이벤트 수정하기
					eventDrop : function(info){
						
						if(confirm("'"+info.event.title+"'을 수정하시겠습니까?")){
							
							var events = new Array(); // Json 데이터를 받기 위한 배열 선언
							var obj = new Object();
							
							obj.title = info.event._def.title;
							obj.start = info.event._instance.range.start;
							obj.end = info.event._instance.range.end;
							
							obj.oldTitle = info.oldEvent._def.title;
							obj.oldStart = info.oldEvent._instance.range.start;
							obj.oldEnd = info.oldEvent._instance.range.end;
							
							events.push(obj);
							
							console.log(events);
						}else{
							location.reload(); // 새로 고침
						}
						$(function modifyData(){
							$.ajax({
								url : "/owner/attendanceUpdate.do",
								method : "PATCH",
								dataType : "json",
								beforeSend: function(xhr){
									xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
								},
								data : JSON.stringify(events),
								contentType : 'application/json',
							})
						})
					},
			
			
					eventResize: function(info){
						console.log(info);
						if(confirm("'"+info.event.title+"'을 변경하시겠습니까?'")){
						
						var events = new Array(); // JSON 데이터를 받기 위한 배열
						var obj = new Object();
						
						obj.title = info.event._def.title;
						obj.start = info.event._instance.range.start;
						obj.end = info.event._instance.range.end;
						
						obj.oldTitle = info.oldEvent._def.title;
						obj.oldStart = info.oldEvent._instance.range.start;
						obj.oldEnd = info.oldEvent._instance.range.end;
						
						events.push(obj);
						
						console.log(events);
					   }else{
						 location.reload(); // 새로고침  
					   }
						$(function modifyData(){
							
							$.ajax({
							url : "/owner/attendanceUpdate.do",
							method : "PATCH",
							dataType : "json",
							beforeSend: function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
							},
							data : JSON.stringify(events),
							contentType : 'application/json',
						})
					  })
					},
			
					select: function(arg){ // 캘린더에서 드래그로 이벤트를 생성할 수 있다
						
						console.log("arg.getDate()-1 : " + arg.end.getDate()-1)
						var originalDateStr  = arg.endStr
						
						var originalDate = new Date(originalDateStr)
						
						originalDate.setDate(originalDate.getDate() - 1);
						
						var endStr = originalDate.toISOString().split('T')[0];
					    
						console.log("select...!");
					
					
						$('#register').find("#start-date").val(arg.startStr);
						$('#register').find("#end-date").val(endStr);
						$('#register').modal('show'); // 모달을 표시
				    	
				   	 	// 전역 변수로 선택된 값을 보관
				        var selectedOption = '';
				        var selectedOption2 = '';
				        var selectedOption3 = '';
				        
				        
				        // 직원 선택 시 selectedOption 
				        $(".frcsList").on("change", function() {
				            selectedOption = $(".frcsList option:selected").val();
				        });

				        // 근태 유형 선택 시 selectedOption2 
				        $(".frcsList2").on("change", function() {
				            selectedOption2 = $(".frcsList2 option:selected").val();
				        });

				        // 색상 선택 시 selectedOption3 
				        $(".frcsList3").on("change", function() {
				            selectedOption3 = $(".frcsList3 option:selected").val();
				        });
						

						$("#subBtn").on("click", function(){
							var data = {
									title : selectedOption2,
									start : arg.start,
									end : arg.end,
									frcsEmpCd : selectedOption,
									atndColor : selectedOption3
							}	

							//추가
						 if (selectedOption2 === "" || selectedOption === "" || selectedOption3 === "") {
						        Swal.fire({
						            title: '경고',
						            text: '모든 값을 선택해주세요',
						            icon: 'warning'
						        });
						    }
						 else {
					    	$.ajax({
					    		url : "/owner/attendanceInsert.do",
					    		method : "POST",
					    		dataType : "text",
								beforeSend: function(xhr){
									xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
								},
					    		data : JSON.stringify(data),
					    		contentType : 'application/json;charset:utf-8',
					    		success : function(res){
					    			
					    			//추가
// 				                      Swal.fire({
// 				                          title: '저장',
// 				                          text: '저장하시겠습니까?',
// 				                          icon: 'question',
// 				                          showCancelButton: true,
// 				                          confirmButtonText: '예',
// 				                          cancelButtonText: '아니오'
// 				                      })
					    			
				    			console.log("res : " + res);
				    			location.href = "/owner/attendance.do";
				    			
					    		}
					    	})
			    		calendar.unselect();
			    	}
			    });
			},
		
				// 이벤트 선택해서 삭제하기
				eventClick : function(info){
					if(confirm("'"+info.event.title+"'을 삭제하시겠습니까?")){
						// 확인 클릭 시
						info.event.remove();
					}
					
					console.log(info.event);
					var events = new Array(); // JSON 데이터를 받기 위한 배열 선언
					var obj = new Object();
					    obj.title = info.event._def.title;
					    obj.start = info.event._instance.range.start;
					    events.push(obj);
					    
				    console.log(events);
				    $(function deleteData(){
				    	$.ajax({
				    		url : "/owner/attendanceDelete.do",
				    		method : "DELETE",
				    		dataType : "json",
				    		beforeSend: function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
							},
				    		data : JSON.stringify(events),
				    		contentType : 'application/json;charset=utf-8',
				    	})
				    })
				},
		   });
		calendar.render();
     });
   });
</script>