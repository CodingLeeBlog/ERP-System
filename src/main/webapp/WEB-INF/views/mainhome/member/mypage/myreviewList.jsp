<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

		
			<div class="col-md-10 pt-5 pb-5 pe-5 bg-white">
			
				<!-- 리뷰 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;">
					<h2 class="">리뷰</h2> 
					<div class="d-flex justify-content-end mb-3">
						<a href="/elly/mypage/review.do?memId=${memId }">
							<span>전체</span>
						</a>
					</div>
				</div>
				<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
					<div class="row text-center">
							<div class="col-1">리뷰 번호</div>
							<div class="col-1">예약 번호</div>
							<div class="col">리뷰 내용</div>
							<div class="col-2">별점</div>
							<div class="col-2">등록날짜</div>
							<div class="col-1">답변여부</div>
					</div>
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
					<div>
						<c:set value="${reviewList }" var="reviewList"/>
						<c:choose>
							<c:when test="${empty reviewList}">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">작성하신 리뷰 내용이 없습니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${reviewList }" var="review">
									<div class="row text-center d-flex justify-content-center align-items-center">
										<div class="col-1">
											${review.reviewNo }
										</div>
										<div class="col-1">
											${review.resvNo }
										</div>
										<div class="col">
											<a href="/owner/reviewAns.do?reviewNo=${review.reviewNo }" class="text-body" data-bs-toggle="modal" data-bs-target="#${review.reviewNo }">${review.reviewContent }</a>
										</div>
										<div class="col-2">
											${review.reviewStar }/5
										</div>
										<div class="col-2">
											<fmt:formatDate value="${review.reviewRegdate }" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col-1">
											<c:if test="${review.reviewYn eq 'Y' }">
												<div>상세보기</div>
											</c:if>
											<c:if test="${review.reviewYn ne 'Y' }">
												<div>대기중</div>
											</c:if>
										</div>
										<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>							
					</div>
				</div>
			</div>
			
			<c:forEach items="${reviewList }" var="review">
			<div class="modal fade" id="${review.reviewNo }" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title text-dark" id="myCenterModalLabel">리뷰 상세보기</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
						</div>
						<div class="modal-body" id="modal">
								
								<div class="m-3 text-dark">
									<p class="m-0 d-inline-block align-middle font-16">
										별점 :
										<c:if test="${review.reviewStar eq '5' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              <c:if test="${review.reviewStar eq '4' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              <c:if test="${review.reviewStar eq '3' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              <c:if test="${review.reviewStar eq '2' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              <c:if test="${review.reviewStar eq '1' }">
                                               <span class="text-warning mdi mdi-star"></span>
                                              </c:if>
                                              ${review.reviewStar } 점
                                          </p>
									<p class="m-0 inline-block">작성자  : ${review.memId }</p>
									<p class="m-0 inline-block">작성일  : <fmt:formatDate value="${review.reviewRegdate }" pattern="yyyy. MM. dd"/></p>
									<hr>
									<label class="inline-block form-label text-dark">내용 : </label>
									<p class="mt-1 inline-block">${review.reviewContent }</p>
								</div>
								
								<c:if test="${review.reviewYn eq 'N' }">
										<div class="m-3 text-dark">
										<hr>
											<label class="form-label text-dark">리뷰 답변 : </label>
											<p class="text-dark">답변이 아직 없습니다.</p>
										</div>
                 							<sec:csrfInput/>
                                      	</c:if>
                                      	
                                      	<c:if test="${review.reviewYn eq 'Y' }">
                                       		<div class="m-3 text-dark">
                                       		<hr>
											<label class="form-label text-dark">리뷰 답변 : </label>
											<input type="hidden" id="ansNo" name="ansNo" value="${review.ansNo }">
											<p class="text-dark">${review.ansCn }</p>
										</div>
									<sec:csrfInput/>
                                      	</c:if>
                                      	
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-dark"	data-bs-dismiss="modal">닫기</button>
							</div>
							
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			</c:forEach>
			
<script type="text/javascript">
</script>