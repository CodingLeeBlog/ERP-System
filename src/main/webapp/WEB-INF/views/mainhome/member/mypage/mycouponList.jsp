<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

		
			<div class="col-md-10 pt-5 pb-5 pe-5 bg-white">
			
				<!-- 쿠폰 -->
				<div class="mb-4" style="color: rgb(0, 0, 0); border-bottom: 3px solid;">
					<h2 class="">쿠폰</h2> 
					<div class="d-flex justify-content-end mb-3">
						<a href="/elly/list.do">
							<span>전체</span>
						</a>
					</div>
				</div>
				<div class="container-fluid ps-0 pe-0" style="color: rgb(0, 0, 0);">
					<div class="row text-center">
							<div class="col-1">쿠폰번호</div>
							<div class="col">쿠폰명</div>
							<div class="col-1">할인율(액)</div>
							<div class="col-2">적용 범위</div>
							<div class="col-2">유효기간</div>
							<div class="col-1"></div>
					</div>
					<div class="mt-4 mb-4" style="color: rgb(0, 0, 0); border-bottom: 1px solid;"></div>
					<div>
						<c:set value="${couponList }" var="couponList"/>
						<c:choose>
							<c:when test="${empty couponList}">
								<div style="color: rgb(0, 0, 0);"></div>
								<p class="d-flex justify-content-center align-items-center n-table-none" style="color:rgb(0, 0, 0); height: 400px">
									<span class="">보유하신 쿠폰이 없습니다.</span>
								</p>
								<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${couponList }" var="coupon">
									<div class="row text-center d-flex justify-content-center align-items-center">
										<div class="col-1">
											${coupon.rownum }
										</div>
										<div class="col">
											${coupon.cpnName }
										</div>
										<div class="col-1">
											${coupon.cpnContent }
										</div>
										<div class="col-2">
											전 품목
										</div>
										<div class="col-2">
											<fmt:formatDate value="${coupon.cpnStdate }" pattern="yyyy. MM. dd"/> -
											<fmt:formatDate value="${coupon.cpnEnddate }" pattern="yyyy. MM. dd"/>
										</div>
										<div class="col-1">
										</div>
										<div class="mt-4 mb-4" style="color: #f5f5f5; border-bottom: 1px solid;"></div>
									</div>
								</c:forEach>
<%-- 								<div class="mt-4 mb-4 pagination justify-content-center text-dark" id="mypagingArea">${pagingVO.pagingHTML }</div> --%>
							</c:otherwise>
						</c:choose>							
					</div>
				</div>
			</div>
			
<script type="text/javascript">
</script>