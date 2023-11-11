<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
 

 
 <!-- ======= menubar Section ======= -->
<div id="menubar" class="d-flex align-items-center h-75 d-inline-block align-middle">
	<div class="container position-relative text-center text-lg-center"
		data-aos="zoom-in" data-aos-delay="100">
		<div class="row" style="height: 400px">
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/faqlist.do">
					<img src="../resources/img/left.png" style="width: 30px; height: 30px;" alt="살얼음맥주">
				</a>
			</div>
			<div class="col-4">
				<img class="position-absolute top-50 start-50 translate-middle"  src="../resources/img/brand_title2.png" />
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center">
				<a href="/elly/tendilist.do"><img src="../resources/img/right.png" style="width: 30px; height: 30px;" alt="마른안주"></a>
			</div>
		</div>
	</div>
</div>
<!-- menubar Hero -->
 
 
<!-- 메뉴 mini bar -->
<div id="main">
	<div class="container-fluid">
		<div class="row">
			<div class="col-1 bg-white">
			</div>
			<div class="col-10 bg-white">
				<div class="mt-5 mb-5">
					<nav id="navbar" class="navbar order-last order-lg-0">
						<ul>
							<li class="me-5">
								<a class="nav-link scrollto active" style="color: black; font-size: 1rem;" href="#home" id="home">Home</a>
							</li>
							<li class="dropdown me-5">
								<a href="/elly/list.do">
									<span style="color: black; font-size: 1rem;">칭찬게시판</span>
									<i class="bi bi-chevron-down"></i>
								</a>
								<ul>
									<li><a href="/elly/noticelist.do">공지사항</a></li>
									<li><a href="/elly/faqlist.do">FAQ</a></li>
									<li><a href="/elly/list.do">칭찬합니다</a></li>
									<li><a href="/elly/tendilist.do">건의합니다</a></li>
								</ul>
							</li>
						</ul>
						<i class="bi bi-list mobile-nav-toggle"></i>
					</nav>
				</div>
<!-- 메뉴 mini bar 끝-->				
				
<!-- 제목 시작 -->
				<div class="mb-5">
					<p class="d-flex justify-content-center" style="color: black; font-size: 2.5rem;">칭찬합니다</p>
				</div>
<!-- 제목 끝 -->
				
<!-- 게시판 영역 시작 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;"></div>
					<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
						<div class="row text-center">
								<c:forEach items="${proposalList }" var="proposal">
	                       		<div class="modal fade" id="${proposal.tableNo }" tabindex="-1"
									role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" id="myCenterModalLabel">상세보기</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
											</div>
											<div class="modal-body" id="modal">
													<div class="m-3">
														<p>제목 ${proposal.boardTitle }</p>
														<p>작성자 ${proposal.memId }</p>
														<p>작성일 ${proposal.boardRegdate }</p>
														<p>내용 ${proposal.boardContent }</p>
													</div>
													
													<c:if test="${proposal.ansState eq 'N' }">
			                                          	<form class="ps-3 pe-3" action="/head/proposalInsert.do" method="post" id="ansForm">
															<div class="mb-3">
																<label class="form-label">답변</label>
																<textarea class="form-control" cols="10" rows="3" id="ansCn1" name="ansCn">${proposal.ansContent }</textarea>
																<input type="hidden" id="tableNo" name="tableNo" value="${proposal.tableNo }">
																<input type="hidden" id="memId" name="memId" value="${proposal.memId }">
																<input type="hidden" id="ansId" name="ansId" value="${proposal.ansId }">
															</div>
				                  							<sec:csrfInput/>
			                                         	</form>
		                                         	</c:if>
		                                         	
		                                         	<c:if test="${proposal.ansState eq 'Y' }">
		                                         		<form class="ps-3 pe-3" action="/head/proposalUpdate.do" method="post" id="ansUdtForm">
			                                         		<div class="m-3">
																<label class="form-label">답변</label>
																<p>${proposal.ansContent }</p>
																<label class="form-label">수정</label>
																<textarea class="form-control" cols="10" rows="3" id="ansCn2" name="ansCn">${proposal.ansContent }</textarea>
																<input type="hidden" id="tableNo" name="tableNo" value="${proposal.tableNo }">
															</div>
														<sec:csrfInput/>
														</form>
		                                         	</c:if>
		                                         	
												</div>
												
												<div class="modal-footer">
													<button type="button" class="btn btn-light"	data-bs-dismiss="modal">닫기</button>
													<c:if test="${proposal.ansState eq 'N' }">
														<button type="button" class="btn btn-primary" id="subBtn">등록</button>
													</c:if>
													<c:if test="${proposal.ansState eq 'Y' }">
														<button type="button" class="btn btn-light"	id="udtBtn">수정</button>
													</c:if>
												</div>
												
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
									<!-- /.modal -->
								</c:forEach>
	                
                 	 </div>
                  <br><br><br>
				</div>
          		 </div>
				<div class="col-1 bg-white"></div>
             </div>
          </div>
	<sec:csrfInput/>
</div>
<!-- 게시판 영역 끝 -->
 
<section class="content">
         <form action="/elly/delete.do" method="post" id="boardForm">
            <input type="hidden" name="tableNo" value="${board.tableNo }"/>
            <sec:csrfInput/>
         </form>
         <div class="col-md-6"></div>
</section>
<script type="text/javascript">
$(function(){
   var btnList = $("#btnList");
   var btnModify = $("#btnModify");
   var btnDelete = $("#btnDelete");
   var boardForm = $("#boardForm");
   
   btnList.on("click", function(){
      location.href = "/elly/list.do";
   });
   
   btnModify.on("click", function(){
	   boardForm.attr("method", "get");
      boardForm.attr("action", "/elly/update.do");
      boardForm.submit();
   });
   
   btnDelete.on("click", function(){
      if(confirm("정말 삭제하시겠습니까?")){
    	  boardForm.submit();
      }
   });
});
</script>