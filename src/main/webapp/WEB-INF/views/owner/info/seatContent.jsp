<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<style>
	    #seatBody {
	      display: flex;
	      flex-direction: column;
	      align-items: center;
	    }
	
	    #infospace { 
	            border:1px solid lightgray; 
	            border-radius: 10px;
	            display: flex;
	            justify-content: center;
	            align-items: center;
	            margin-bottom: 10px;
	    }
	
	    #seatspace2 { 
	            background: #fafafd; 
	            width: 800px; 
	            height: 600px;
	            border:1px solid lightgray; 
	            border-radius: 10px;
	            display: flex;
	            position: relative;
	    }
	
	    .box {
	        position: absolute;
	        user-select: none;
	        transform: translate(-50%, -50%);
	        border-radius: 10px;
	        display: flex;
	        justify-content: center;
	        align-items: center;
	        margin-top: -110px;
	        cursor: pointer;
	    }
	
	    :root {
	        /* id-1 */
	        --width-1: 75px;
	        --height-1: 75px;
	        --bg-1: yellow;
	
	        /* id-2 */
	        --width-2: 150px;
	        --height-2: 75px;
	        --bg-2: pink;
	
	        /* id-3 */
	        --width-3: 300px;
	        --height-3: 75px;
	        --bg-3: skyblue;
	        --zi-3: 3;
	
	        /* id-exit */
	        --width-4: 150px;
	        --height-4: 30px;
	        --bg-4: lightgray;
	    }
	    
	
	  </style>

<div class="content-page">
	<div class="content">

		<div class="container-fluid">

			<!-- start page title -->
			<div class="row">
				<div class="col-12">
					<div class="page-title-box">
						<div class="page-title-right">
							<ol class="breadcrumb m-0">
								<li class="breadcrumb-item"><a href="javascript: void(0);">가맹점페이지</a></li>
								<li class="breadcrumb-item"><a href="javascript: void(0);">가맹점정보관리</a></li>
								<li class="breadcrumb-item active">좌석관리</li>
							</ol>
						</div>
						<h4 class="page-title">좌석관리</h4>
					</div>
				</div>
			</div>
			<!-- end page title -->

		</div>

		<!-- container -->
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row mb-2">
							<div class="col-sm-12">
								
								<button type="button" class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#seatmodal">
									<i class="mdi mdi-plus-circle me-2"></i> 좌석 생성하기
								</button>

								<button type="button" class="btn btn-light me-2"	id="delBtn">
									<i class="mdi mdi-minus-circle me-2"></i> 좌석 삭제하기
								</button>
								
								<button type="button" class="btn btn-primary" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="새로고침" id="reBtn">
									<i class="mdi mdi-reload"></i>
								</button>
								
								<form action="/owner/seatDelete.do" method="post" id="delForm">
									<input type="hidden" name="frcsId" value="${frcsId }"/>
									<sec:csrfInput/>
								</form>
								
																
								<div class="modal fade" id="seatmodal" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" id="myCenterModalLabel">좌석 생성하기</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
											</div>
											<div class="modal-body" id="modal">
												<h5>각 좌석의 개수를 입력해 주세요.</h5><br>
												
	                                          	<form class="ps-3 pe-3" action="/owner/seatArrangement.do" method="post" id="seatForm">
													<div class="mb-3">
														<label class="form-label" name="">2인석</label>
														<input id="t2" data-toggle="touchspin" type="number" min="0" max="20" value="0" class="form-control"> 
													</div>
	
													<div class="mb-3">
														<label class="form-label">4인석</label>
														<input id="t4" data-toggle="touchspin" type="number" min="0" max="20" value="0" class="form-control">
													</div>
	
													<div class="mb-3">
														<label class="form-label">룸(8인석)</label>
														<input id="t8" data-toggle="touchspin" type="number" min="0" max="10" value="0" class="form-control">
													</div>
	                                         	</form>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-light"	data-bs-dismiss="modal">닫기</button>
												<button type="button" class="btn btn-primary" id="subBtn">좌석 배치하기</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
								</div>
								<!-- /.modal -->
							</div>
						</div>
						<div class="card-body" id="seatBody">
							<div id="seatspace2">
								<c:forEach items="${list }" var="seat">
									<div class="box" data-id="${seat.seatCd}" style="${seat.seatStyle}">${seat.seatCd}</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- content -->

</div>

<script type="text/javascript">
$(function(){
	var subBtn = $("#subBtn");
	var delBtn = $("#delBtn");
	var reBtn = $("#reBtn");
	var delForm = $("#delForm");
	
	
	
	subBtn.on("click", function(){
		var popupW = 1000;
		var popupH = 800;
		var left = Math.ceil((window.screen.width - popupW)/2);
		var top = Math.ceil((window.screen.height - popupH)/2);
		
		var t2 = document.getElementById('t2').value;
		var t4 = document.getElementById('t4').value;
		var t8 = document.getElementById('t8').value;

		window.open('${pageContext.request.contextPath }/owner/seatArrangement.do?t2='+ t2 +'&&t4='+ t4 +'&&t8='+ t8, '좌석 배치하기', 'location=no, top='+top+', left='+left+', width='+popupW+', height='+popupH+', status=no, menubar=no, toolbar=no, resizable=no');
// 	    window.location.href = ''
// 		location.href = "";
// 		location :  주소창 표시 유무
// 	    directories :  연결 표시 유무 
// 	    resizable :  크기의 조절 가능 유무 
// 	    status :  아래에 로딩 표시되는 바 유무
// 	    toolbar :  뒤로 앞으로 각종 폴더등 도구상자 유무 
// 	    menubar :  파일 편집.. 등 메뉴 유무
// 	    scrollbars : 스크롤바 유무

	});
	
	/* 삭제버튼은 데이터가 있을때만 나타나도록? */
	delBtn.on("click", function(){
		
		Swal.fire({
		   title: '정말로 삭제하시겠습니까?',
		   text: '되돌릴 수 없으니 다시 한번 생각해주세요.',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: true, // 버튼 순서 거꾸로
		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
		     
		   	  Swal.fire({
			      title: '삭제 완료',
			      icon: 'success',
			      text: '삭제가 완료되었습니다!'
			    }).then((result) => {
		            if (result.isConfirmed) {
		            	delForm.submit();
		                    }
		          });
// 		      location.reload();
		   }
		});
		
	});
	
	reBtn.on("click", function(){
		location.reload('/owner/seat.do');
	});
	
	
});

</script>
