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
									<span class="">보유하신 쿠폰이 없습니다.</span>
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
											<a href="/elly/myreview/detail.do?memId=${review.memId }">${review.reviewContent }</a>
										</div>
										<div class="col-2">
											${review.reviewStar }/5
										</div>
										<div class="col-2">
											<fmt:formatDate value="${review.reviewRegdate }" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col-1">
											${review.reviewYn }										
										</div>
										<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>							
					</div>
				</div>
			</div>
			
<script type="text/javascript">
</script>