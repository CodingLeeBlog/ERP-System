<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
								<li class="breadcrumb-item active">메뉴관리</li>
							</ol>
						</div>
						<h4 class="page-title">메뉴관리</h4>
					</div>
				</div>
			</div>
			<!-- end page title -->

		</div>

		<!-- 탭 -->
		<ul class="nav nav-tabs nav-bordered mb-3 position-relative">
			<li class="nav-item">
				<a href="#menu1" data-bs-toggle="tab" aria-expanded="true" class="nav-link active"> 
					<i class="mdi mdi-home-variant d-md-none d-block"></i> 
					<span class="d-none d-md-block">마른안주</span>
				</a>
			</li>
			<li class="nav-item">
				<a href="#menu2" data-bs-toggle="tab" aria-expanded="false" class="nav-link"> 
					<i class="mdi mdi-account-circle d-md-none d-block"></i> 
					<span class="d-none d-md-block">튀김안주</span>
				</a>
			</li>
			<li class="nav-item">
				<a href="#menu3" data-bs-toggle="tab" aria-expanded="false" class="nav-link"> 
					<i class="mdi mdi-settings-outline d-md-none d-block"></i> 
					<span class="d-none d-md-block">식사안주</span>
				</a>
			</li>
			<li class="nav-item">
				<a href="#menu4" data-bs-toggle="tab" aria-expanded="false" class="nav-link"> 
					<i class="mdi mdi-settings-outline d-md-none d-block"></i> 
					<span class="d-none d-md-block">주류메뉴</span>
				</a>
			</li>
			<li  class="position-absolute top-0 end-0">
				<div>
					<button type="button" class="btn btn-light me-2 " id="setBtn"><i class="mdi mdi-refresh"></i> 본사메뉴 업데이트</button>                   
					<button type="button" class="btn btn-primary " id="udtBtn">저장</button>                   
				</div>
			</li>
		</ul>

		<!-- container -->
		<div class="tab-content">
			<div class="tab-pane show active" id="menu1">
				<div class="row">
				
					<c:set value="${list }" var="frcsMenuList"/>
					<c:forEach items="${frcsMenuList}" var="frcsMenu">
						<c:if test="${frcsMenu.menuCg eq '마른안주' }">
							<div class="col-md-6 col-xxl-2 ">
								<div class="card" style="height:400px">
									<div class="card-body">
										
										<div class="float-end mb-1">
											<input class="toggle" type="checkbox" id="${frcsMenu.menuCd }" data-id="${frcsMenu.menuCd }" ${frcsMenu.saleYn == 'Y' ? 'checked' : '' } data-switch="primary" /> 
											<label for="${frcsMenu.menuCd }" data-on-label="On" data-off-label="Off"></label>
										</div>
		
										<div class="text-center">
											<img src="${pageContext.request.contextPath}/resources/upload/img/${frcsMenu.attachOrgname }" class="img-fluid rounded">
											<h4 class="mt-3 my-1">
												<a href="#" class="text-reset">${frcsMenu.menuName } 
												</a>
											</h4>
											<p class="mb-0 text-muted"><fmt:formatNumber value="${frcsMenu.menuPrice }" pattern="#,###"/> 원</p>
											<hr class="bg-dark-lighten my-2">
											<h5 class="mt-3 fw-semibold text-muted">${frcsMenu.menuDes }</h5>
										</div>
										
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					
				</div>
			</div>
		</div>
		
		<div class="tab-content">
			<div class="tab-pane show" id="menu2">
				<div class="row">
				
					<c:set value="${list }" var="menuList"/>
					<c:forEach items="${menuList}" var="frcsMenu">
						<c:if test="${frcsMenu.menuCg eq '튀김안주' }">
							<div class="col-md-6 col-xxl-2">
								<div class="card">
									<div class="card-body">
										
										<div class="float-end mb-1">
											<input class="toggle" type="checkbox" id="${frcsMenu.menuCd }" data-id="${frcsMenu.menuCd }" ${frcsMenu.saleYn == 'Y' ? 'checked' : '' }	data-switch="primary" /> 
											<label for="${frcsMenu.menuCd }" data-on-label="On" data-off-label="Off"></label>
										</div>
		
										<div class="text-center">
											<img src="${pageContext.request.contextPath }/resources/upload/img/${frcsMenu.attachOrgname }" class="img-fluid rounded">
											<h4 class="mt-3 my-1">
												<a href="#" class="text-reset">${frcsMenu.menuName }</a>
											</h4>
											<p class="mb-0 text-muted"><fmt:formatNumber value="${frcsMenu.menuPrice }" pattern="#,###"/> 원</p>
											<hr class="bg-dark-lighten my-2">
											<h5 class="mt-3 fw-semibold text-muted">${frcsMenu.menuDes }</h5>
										</div>
										
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					
				</div>
			</div>
		</div>
		
		<div class="tab-content">
			<div class="tab-pane show " id="menu3">
				<div class="row">
				
					<c:set value="${list }" var="menuList"/>
					<c:forEach items="${menuList}" var="frcsMenu">
						<c:if test="${frcsMenu.menuCg eq '식사안주' }">
							<div class="col-md-6 col-xxl-2">
								<div class="card">
									<div class="card-body">
										
										<div class="float-end mb-1">
											<!-- Primary Switch-->
											<input class="toggle" type="checkbox" id="${frcsMenu.menuCd }" data-id="${frcsMenu.menuCd }" ${frcsMenu.saleYn == 'Y' ? 'checked' : '' }	data-switch="primary" />
											<label for="${frcsMenu.menuCd }" data-on-label="On" data-off-label="Off"></label>
										</div>
		
										<div class="text-center">
											<img src="${pageContext.request.contextPath }/resources/upload/img/${frcsMenu.attachOrgname }" class="img-fluid rounded">
											<h4 class="mt-3 my-1">
												<a href="#" class="text-reset">${frcsMenu.menuName }</a>
											</h4>
											<p class="mb-0 text-muted"><fmt:formatNumber value="${frcsMenu.menuPrice }" pattern="#,###"/> 원</p>
											<hr class="bg-dark-lighten my-2">
											<h5 class="mt-3 fw-semibold text-muted">${frcsMenu.menuDes }</h5>
										</div>
										
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					
				</div>
			</div>
		</div>
		
		<div class="tab-content">
			<div class="tab-pane show " id="menu4">
				<div class="row">
				
					<c:set value="${list }" var="menuList"/>
					<c:forEach items="${menuList}" var="frcsMenu">
						<c:if test="${frcsMenu.menuCg eq '주류메뉴' }">
							<div class="col-md-6 col-xxl-2">
								<div class="card">
									<div class="card-body">
										
										<div class="float-end mb-1">
											<!-- Primary Switch-->
											<input class="toggle" type="checkbox" id="${frcsMenu.menuCd }" data-id="${frcsMenu.menuCd }" ${frcsMenu.saleYn == 'Y' ? 'checked' : '' }	data-switch="primary" /> 
											<label for="${frcsMenu.menuCd }" data-on-label="On" data-off-label="Off"></label>
										</div>
		
										<div class="text-center">
											<img src="${pageContext.request.contextPath }/resources/upload/img/${frcsMenu.attachOrgname}" class="img-fluid rounded">
											<h4 class="mt-3 my-1">
												<a href="#" class="text-reset">${frcsMenu.menuName }</a>
											</h4>
											<p class="mb-0 text-muted"><fmt:formatNumber value="${frcsMenu.menuPrice }" pattern="#,###"/> 원</p>
											<hr class="bg-dark-lighten my-2">
											<h5 class="mt-3 fw-semibold text-muted">${frcsMenu.menuDes }</h5>
										</div>
										
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					
				</div>
			</div>
		</div>

	</div>
	<!-- content -->

</div>


<script>
$(function(){
	var udtBtn = $("#udtBtn");
	var setBtn = $("#setBtn");
	
	setBtn.on("click", function() {
		
		$.ajax({
            type: "POST",
            url: "/owner/menuSet.do",
            beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
            contentType: "application/json;charset=UTF-8",
            success: function(response) {
                
                Swal.fire({
				      title: '세팅 완료',
				      icon: 'success',
				      text: '메뉴 세팅이 완료되었습니다!',
				    }).then((result) => {
			            if (result.isConfirmed) {
			            	location.reload();
			                    }
			          });
            },
            error: function(error) {
            	
            	Swal.fire({
					title: '세팅 에러',
				    icon: 'error',
				    text: '다시 시도해주세요!'
				}).then((result) => {
		            if (result.isConfirmed) {
		            	location.reload();
		                    }
		          });
            }
        });
	});
	
	udtBtn.on("click", function() {
// 	    // 모든 스위치의 상태를 서버에 저장
		var menuData = [];
	    $(".toggle").each(function() {
	    	menuData.push({
	    		menuCd: $(this).data('id'),
	    		saleYn: $(this).prop("checked") ? "Y" : "N"
	    	});
	    });
	    
// 	    console.log("Data : " + JSON.stringify(menuData));
	
        // AJAX 요청을 보내서 서버에 'Y' 또는 'N' 값을 전송하여 저장
        $.ajax({
            type: "POST",
            url: "/owner/menuUpdate.do", // 실제 업데이트를 처리할 서버 엔드포인트로 수정
            beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}")
			},
            data: JSON.stringify(menuData),
            contentType: "application/json;charset=UTF-8",
            success: function(response) {
                Swal.fire({
				      title: '저장 완료',
				      icon: 'success',
				      text: '메뉴 상태가 성공적으로 저장되었습니다!',
				    }).then((result) => {
			            if (result.isConfirmed) {
			            	location.reload();
			                    }
			          });
            },
            error: function(error) {
                Swal.fire({
					title: '저장 에러',
				    icon: 'error',
				    text: '메뉴 상태 저장 중 오류가 발생하였습니다.'
				}).then((result) => {
		            if (result.isConfirmed) {
		            	location.reload();
		                    }
		          });
            }
        });
	});
	
});
</script>