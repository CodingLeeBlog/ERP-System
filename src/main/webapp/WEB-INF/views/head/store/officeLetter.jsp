<%@page import="kr.or.ddit.vo.head.OfficeLetterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css" rel="stylesheet">
<sec:authentication property="principal.member" var="member"/>
<div class="content-page">
   <div class="content">
      <!-- Start Content-->
      <div class="container-fluid">
         <!-- start page title -->
         <div class="col-sm-12 card widget-inline mt-3" style="height:100px;">
            <div class="row ">
                  <div class="card-body col-4 align-items-center">
                     <div class="col-sm-6 page-title text-primary font-24 ms-3 fw-bold">공문관리</div>
                     <div class="col-sm-12 page-title-sub text-muted font-14 ms-3">본사의 공문을 관리합니다.</div>
                  </div>
                  <div class="card-body col-6 fw-bold font-15 d-flex justify-content-end align-items-center me-5">매장관리 > &nbsp;<span class="text-decoration-underline">공문관리</span>
               </div>
            </div>
         </div>
         <!-- end page title -->

         <div class="row">

            <!-- Right Sidebar -->
            <div class="col-12">
               <div class="card">
                  <div class="card-body">
                     <!-- Left sidebar -->
                     <div class="page-aside-left">
                        <div class="d-grid">
                           <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#standard-modal">작성하기</button>
                           <div id="standard-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
                              <div class="modal-dialog">
                                 <div class="modal-content">
                                    <div class="modal-header">
                                       <h4 class="modal-title" id="standard-modalLabel">공문 작성</h4>
                                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
                                    </div>
                                    <div class="modal-body">
                                       <form action="officeLetterRegister" id="letterForm" enctype="multipart/form-data">
                                          <div class="mb-3">
                                             <label for="sendTitle" class="form-label">공문명</label> 
                                             <input type="text" id="sendTitle" name="hdLttitle" class="form-control">
                                          </div>
                                          <div class="write-mdg-box mb-3">
                                               <label for="simplemde1" class="form-label">내용</label> 
				                               <textarea class="form-control" id="simplemde1" name="hdLtcontent" style="display: block;"></textarea>
				                           </div>
<!--                                           <div class="mb-3"> -->
<!--                                              <label for="sendContent" class="form-label">공문 내용</label> -->
<!--                                              <textarea class="form-control" name="hdLtcontent" rows="5" id="sendContent"></textarea> -->
<!--                                           </div> -->
                                          <div class="mb-3">
                                             <label for="sendFile" class="form-label">파일</label> 
                                             <input type="file" id="sendFile" class="form-control">
                                          </div>
                                       </form>
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-light"
                                          data-bs-dismiss="modal">취소</button>
                                       <button type="button" class="btn btn-primary" class="saveBtn" id="saveBtn">저장</button>
                                       <button type="button" class="btn btn-success" id="autoBtn">자동완성</button>
                                    </div>
                                 </div>
                                 <!-- /.modal-content -->
                              </div>
                              <!-- /.modal-dialog -->
                           </div>
                           <!-- /.modal -->
                        </div>
                        <div class="email-menu-list mt-3">
                           <a href="/head/officeLetterRead.do"><i class="ri-star-line me-2"></i>수신함</a>
                           <a href="/head/officeLetter.do" class="text-danger fw-bold"><i
                              class="ri-inbox-line me-2"></i>발신함<span
                              class="badge badge-danger-lighten float-end ms-2">${totalRecord }</span></a>
                        </div>

                     </div>
                     <!-- End Left sidebar -->

                     <div class="page-aside-right">
                        <div class="col-sm-5">
                           <form
                              class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between"
                              id="searchForm">
                              <input type="hidden" id="page" name="page">
                              <div class="col-auto">
                                 <div class="d-flex align-items-center">
                                    <select class="form-select" name="searchType"
                                       id="searchType">
                                       <option value="menuName"<c:if test="${searchType eq 'title' }">selected</c:if>>공문명</option>
                                    </select>
                                 </div>
                              </div>
                              <div class="col-auto">
                                 <label for="inputPassword2" class="visually-hidden">검색</label>
                                 <input type="text" class="form-control" id="searchWord"
                                    name="searchWord" placeholder="제목을 입력하세요."
                                    value="${searchWord }">
                              </div>
                           </form>
                        </div>
                        <br />
                        <div class="btn-group">
                           <button type="button" class="btn btn-secondary">
                              <i class="mdi mdi-archive font-16"></i>
                           </button>
                           <button type="button" class="btn btn-secondary">
                              <i class="mdi mdi-alert-octagon font-16"></i>
                           </button>
                           <button type="button" class="btn btn-secondary">
                              <i class="mdi mdi-delete-variant font-16"></i>
                           </button>
                        </div>
                        <div class="btn-group">
                           <button type="button"
                              class="btn btn-secondary dropdown-toggle arrow-none"
                              data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="mdi mdi-folder font-16"></i> <i
                                 class="mdi mdi-chevron-down"></i>
                           </button>
                           <div class="dropdown-menu">
                              <span class="dropdown-header">Move to:</span> <a
                                 class="dropdown-item" href="javascript: void(0);">Social</a>
                              <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                              <a class="dropdown-item" href="javascript: void(0);">Updates</a>
                              <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                           </div>
                        </div>
                        <div class="btn-group">
                           <button type="button"
                              class="btn btn-secondary dropdown-toggle arrow-none"
                              data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="mdi mdi-label font-16"></i> <i
                                 class="mdi mdi-chevron-down"></i>
                           </button>
                           <div class="dropdown-menu">
                              <span class="dropdown-header">Label as:</span> <a
                                 class="dropdown-item" href="javascript: void(0);">Updates</a>
                              <a class="dropdown-item" href="javascript: void(0);">Social</a>
                              <a class="dropdown-item" href="javascript: void(0);">Promotions</a>
                              <a class="dropdown-item" href="javascript: void(0);">Forums</a>
                           </div>
                        </div>

                        <div class="btn-group">
                           <button type="button"
                              class="btn btn-secondary dropdown-toggle arrow-none"
                              data-bs-toggle="dropdown" aria-expanded="false">
                              <i class="mdi mdi-dots-horizontal font-16"></i> More <i
                                 class="mdi mdi-chevron-down"></i>
                           </button>
                           <div class="dropdown-menu">
                              <span class="dropdown-header">More Options :</span> <a
                                 class="dropdown-item" href="javascript: void(0);">Mark as
                                 Unread</a> <a class="dropdown-item" href="javascript: void(0);">Add
                                 to Tasks</a> <a class="dropdown-item" href="javascript: void(0);">Add
                                 Star</a> <a class="dropdown-item" href="javascript: void(0);">Mute</a>
                           </div>
                        </div>

                        <div class="mt-3">
                           <table class="table table-centered w-100 dt-responsive nowrap"
                              id="products-datatable">
                              <thead class="table-light">
                                 <tr>
                                    <th></th>
                                    <th class="all">문서번호</th>
                                    <th>제목</th>
                                    <th>발송일</th>
                                    <th>상태</th>
                                    <th></th>
                                 </tr>
                              </thead>
                              <tbody id="tBody">
                                 <c:set value="${pagingVO.dataList }" var="officeLetterList" />
                                 <c:choose>
                                    <c:when test="${empty officeLetterList }">
                                       <tr class="text-center">
                                          <td colspan="5" class="text-dark font-weight-bolder">문서가
                                             존재하지 않습니다.</td>
                                       </tr>
                                    </c:when>
                                    <c:otherwise>
                                       <c:forEach items="${officeLetterList }" var="officeLetter">
                                          <tr class="text-left">
                                             <td><input type="checkbox" class="form-check-input" id="mail1"></td>
                                             <td id="hdLtno">${officeLetter.hdLtno }</td>
                                             <td><a href="#" class="viewDetails" data-toggle="modal" data-target="#exampleModal" data-hdLtno="${officeLetter.hdLtno}">${officeLetter.hdLttitle }</a></td>
                                             <td><fmt:formatDate
                                                   value="${officeLetter.hdLtsdate }" pattern="yyyy-MM-dd" /></td>
                                             <td><span class="badge bg-success">${officeLetter.hdLtstate }</span></td>
                                             <td>
                                                <button type="button"
                                                   class="btn btn-info btn-sm sendBtn"
                                                   data-hdltno="${officeLetter.hdLtno}"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#dark-header-modal">발송</button>
                                                <button type="button"
                                                   class="btn btn-danger btn-sm delBtn"
                                                   data-hdltno="${officeLetter.hdLtno}">삭제</button>
                                             </td>
                                          </tr>
                                       </c:forEach>
                                    </c:otherwise>
                                 </c:choose>
                              </tbody>
                           </table>
                        </div>
                        <!-- end .mt-4 -->
                        <div class="modal fade" id="exampleModal" tabindex="-1"
                           aria-labelledby="exampleModalLabel" aria-hidden="true">
                           <div class="modal-dialog">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">상세보기</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                 </div>
                                 <div class="modal-body">
                                    <form>
                                       <div class="mb-3">
                                          <label for="recipient-name" class="col-form-label">문서번호</label> <input
                                             type="text" class="form-control" name="hdLtno" id="ltNo" readonly>
                                       </div>
                                       <div class="mb-3">
                                          <label for="recipient-name" class="col-form-label">제목</label> <input
                                             type="text" class="form-control" name="hdLttitle" id="ltTitle" readonly>
                                       </div>
                                       <div class="mb-3">
                                          <label for="recipient-name" class="col-form-label">내용</label> 
                                          <textarea rows="5" class="form-control" name="hdLtcontent" id="ltContent" readonly></textarea>
                                       </div>
                                       <div class="mb-3">
                                          <label for="recipient-name" class="col-form-label">상태</label> <input
                                             type="text" class="form-control" name="hdLtstate" id="ltState" readonly>
                                       </div>
                                       <div class="mb-3">
                                          <label for="recipient-name" class="col-form-label">저장일시</label> <input
                                             type="text" class="form-control" name="hdLtsdate" id="sDate" readonly>
                                       </div>
                                       <div class="card-body p-3"></div>
                                                <c:set value="${officeLetter.officeLetterFileList}" var="officeLetterFileList"/>
                                             <div class="row g-2" id="divRow">
                                             </div>
                                    </form>
                                 </div>
                                 <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" id="updateBtn">수정</button>
                                    <button type="button" class="btn btn-secondary"
                                       data-bs-dismiss="modal">목록</button>
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                        <div id="dark-header-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="dark-header-modalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header bg-dark">
                                        <h4 class="modal-title" id="dark-header-modalLabel">공문 발송</h4>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-hidden="true"></button>
                                    </div>
                                 <div class="modal-body">
                                    <div class="row">
                                       <div class="col">
                                          <form
                                             class="row gy-2 gx-2 align-items-center justify-content-xl-start justify-content-between"
                                             id="searchForm">
                                             <input type="hidden" id="page" name="page">
                                             <div class="col-auto">
                                                <h5>지점명</h5>
                                             </div>
                                             <div class="col-auto">
                                                <label for="inputPassword2" class="visually-hidden">검색</label>
                                                <input type="text" class="form-control" id="searchWord"
                                                   name="searchWord" placeholder="지점명을 입력해주세요."
                                                   value="${searchWord }">
                                             </div>
                                             <div class="col">
                                                <button type="button" class="btn btn-success btn-sm">조회</button>
                                             </div>
                                          </form>
                                          <hr />
                                          <div>
                                          <div>
                                             <input type="checkbox" id="allCheck" class="form-check-input"/>
                                             <label for="allCheck">전체 선택</label>
                                             </div>
                                             <br>

                                             <!-- 전체-->
<!--                                              <h5 class="m-0 pb-2"> -->
<%--                                                 <a class="text-dark" data-bs-toggle="collapse" href="#seoulTasks" role="button" aria-expanded="true" aria-controls="seoulTasks"> <i class="uil uil-angle-down font-18"></i>전체<span class="text-muted">(${fn:length(allFrcsList) })</span> --%>
<!--                                                 </a> -->
<!--                                              </h5> -->
<!--                                              <div class="collapse" id="seoulTasks" style=""> -->
<!--                                                 <div class="card mb-0"> -->
<!--                                                    <div class="card-body"> -->
<!--                                                       task -->
<!--                                                       <div class="row justify-content-sm-between"> -->
<!--                                                          <div class="col-sm-6 mb-2 mb-sm-0"> -->
<!--                                                             <div class="form-check"> -->
<%--                                                                <c:choose> --%>
<%--                                                                   <c:when test="${empty allFrcsList }"> --%>
<!--                                                                      <div class="text-center"> -->
<!--                                                                         <p class="text-dark font-weight-bolder">지점이 -->
<!--                                                                            존재하지 않습니다.</p> -->
<!--                                                                      </div> -->
<%--                                                                   </c:when> --%>
<%--                                                                   <c:otherwise> --%>
<!--                                                                      <div class="text-left"> -->
<!--                                                                            <input type="checkbox" class="form-check-input" id="task1"> -->
<!--                                                                            <label for="task1">전체 선택</label> -->
<!--                                                                      </div> -->
<%--                                                                      <c:forEach items="${allFrcsList}" var="all"> --%>
<!--                                                                         <div class="text-left"> -->
<!--                                                                            <input type="checkbox" class="form-check-input" id="task1"> -->
<%--                                                                            <label for="task1">${all.frcsName }</label> --%>
<!--                                                                         </div> -->
<%--                                                                      </c:forEach> --%>
<%--                                                                   </c:otherwise> --%>
<%--                                                                </c:choose> --%>
<!--                                                             </div> -->
<!--                                                          </div> -->
<!--                                                       </div> -->
<!--                                                       end task -->
<!--                                                    </div> -->
<!--                                                 </div> -->
<!--                                              </div> -->
                                             <div class="region">
                                             <!-- 서울특별시 -->
                                             <c:set value="${sefrcsList }" var="sefrcsList"/>
                                             <h5 class="m-0 pb-2">
                                                <a class="text-dark" data-bs-toggle="collapse" href="#seoulTasks" role="button" aria-expanded="true" aria-controls="seoulTasks"> <i class="uil uil-angle-down font-18"></i>서울·경기<span class="text-muted">(${fn:length(sefrcsList) })</span>
                                                </a>
                                             </h5>
                                             <div class="collapse" id="seoulTasks" style="">
                                                <div class="card mb-0">
                                                   <div class="card-body">
                                                      <!-- task -->
                                                      <div class="row justify-content-sm-between">
                                                         <div class="col-sm-6 mb-2 mb-sm-0">
                                                            <div class="form-check">
                                                               <c:choose>
                                                                  <c:when test="${empty sefrcsList }">
                                                                     <div class="text-center">
                                                                        <p class="text-dark font-weight-bolder">지점이
                                                                           존재하지 않습니다.</p>
                                                                     </div>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                     <c:forEach items="${sefrcsList}" var="sefrcsList">
                                                                        <div class="text-left">
                                                                           <input type="hidden" class="memId" value="${sefrcsList.memId }">
                                                                           <input type="checkbox" class="form-check-input" id="task1">
                                                                           <label for="task1">${sefrcsList.frcsName }</label>
                                                                        </div>
                                                                     </c:forEach>
                                                                  </c:otherwise>
                                                               </c:choose>
                                                            </div>
                                                         </div>
                                                      </div>
                                                      <!-- end task -->
                                                   </div>
                                                </div>
                                             </div>
                                             
                                             <!-- 대전광역시 -->
                                             <c:set value="${djfrcsList }" var="djfrcsList"/>
                                             <h5 class="m-0 pb-2">
                                                <a class="text-dark" data-bs-toggle="collapse" href="#daejeonTasks" role="button" aria-expanded="true" aria-controls="daejeonTasks"> <i class="uil uil-angle-down font-18"></i>대전광역시 <span class="text-muted">(${fn:length(djfrcsList) })</span>
                                                </a>
                                             </h5>
                                             <div class="collapse" id="daejeonTasks" style="">
                                                <div class="card mb-0">
                                                   <div class="card-body">
                                                      <!-- task -->
                                                      <div class="row justify-content-sm-between">
                                                         <div class="col-sm-6 mb-2 mb-sm-0">
                                                            <div class="form-check">
                                                               <c:choose>
                                                                  <c:when test="${empty djfrcsList }">
                                                                     <div class="text-center">
                                                                        <p class="text-dark font-weight-bolder">지점이
                                                                           존재하지 않습니다.</p>
                                                                     </div>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                     <c:forEach items="${djfrcsList}" var="djfrcsList">
                                                                        <div class="text-left">
                                                                           <input type="hidden" class="memId" value="${djfrcsList.memId }">
                                                                           <input type="checkbox" class="form-check-input" id="task1">
                                                                           <label for="task1">${djfrcsList.frcsName }</label>
                                                                        </div>
                                                                     </c:forEach>
                                                                  </c:otherwise>
                                                               </c:choose>
                                                            </div>
                                                         </div>
                                                      </div>
                                                      <!-- end task -->
                                                   </div>
                                                </div>
                                             </div>
                                             
                                             <!-- 부산광역시 -->
                                             <c:set value="${bsrcsList }" var="bsrcsList"/>
                                             <h5 class="m-0 pb-2">
                                                <a class="text-dark" data-bs-toggle="collapse" href="#busanTasks" role="button" aria-expanded="true" aria-controls="busanTasks"> <i class="uil uil-angle-down font-18"></i>부산광역시 <span class="text-muted">(${fn:length(bsrcsList) })</span>
                                                </a>
                                             </h5>
                                             <div class="collapse" id="busanTasks" style="">
                                                <div class="card mb-0">
                                                   <div class="card-body">
                                                      <!-- task -->
                                                      <div class="row justify-content-sm-between">
                                                         <div class="col-sm-6 mb-2 mb-sm-0">
                                                            <div class="form-check">
                                                               <c:choose>
                                                                  <c:when test="${empty bsfrcsList }">
                                                                     <div class="text-center">
                                                                        <p class="text-dark font-weight-bolder">지점이
                                                                           존재하지 않습니다.</p>
                                                                     </div>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                     <c:forEach items="${bsfrcsList}" var="bsfrcsList">
                                                                        <div class="text-left">
                                                                           <input type="hidden" class="memId" value="${bsfrcsList.memId }">
                                                                           <input type="checkbox" class="form-check-input" id="task1">
                                                                           <label for="task1">${bsfrcsList.frcsName }</label>
                                                                        </div>
                                                                     </c:forEach>
                                                                  </c:otherwise>
                                                               </c:choose>
                                                            </div>
                                                         </div>
                                                      </div>
                                                      <!-- end task -->
                                                   </div>
                                                </div>
                                             </div>
                                             
                                             <!-- 대구광역시 -->
                                             <c:set value="${dgfrcsList }" var="dgfrcsList"/>
                                             <h5 class="m-0 pb-2">
                                                <a class="text-dark" data-bs-toggle="collapse" href="#daeguTasks" role="button" aria-expanded="true" aria-controls="daeguTasks"> <i class="uil uil-angle-down font-18"></i>대구광역시 <span class="text-muted">(${fn:length(dgfrcsList) })</span>
                                                </a>
                                             </h5>
                                             <div class="collapse" id="daeguTasks" style="">
                                                <div class="card mb-0">
                                                   <div class="card-body">
                                                      <!-- task -->
                                                      <div class="row justify-content-sm-between">
                                                         <div class="col-sm-6 mb-2 mb-sm-0">
                                                            <div class="form-check">
                                                               <c:choose>
                                                                  <c:when test="${empty dgfrcsList }">
                                                                     <div class="text-center">
                                                                        <p class="text-dark font-weight-bolder">지점이
                                                                           존재하지 않습니다.</p>
                                                                     </div>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                     <c:forEach items="${dgfrcsList}" var="dgfrcsList">
                                                                        <div class="text-left">
                                                                           <input type="hidden" class="memId" value="${dgfrcsList.memId }">
                                                                           <input type="checkbox" class="form-check-input" id="task1">
                                                                           <label for="task1">${dgfrcsList.frcsName }</label>
                                                                        </div>
                                                                     </c:forEach>
                                                                  </c:otherwise>
                                                               </c:choose>
                                                            </div>
                                                         </div>
                                                      </div>
                                                      <!-- end task -->
                                                   </div>
                                                </div>
                                             </div>
                                             
                                             <!-- 광주광역시 -->
                                             <c:set value="${gjfrcsList }" var="gjfrcsList"/>
                                             <h5 class="m-0 pb-2">
                                                <a class="text-dark" data-bs-toggle="collapse" href="#gwangjuTasks" role="button" aria-expanded="true" aria-controls="gwangjuTasks"> <i class="uil uil-angle-down font-18"></i>광주광역시 <span class="text-muted">(${fn:length(gjfrcsList) })</span>
                                                </a>
                                             </h5>
                                             <div class="collapse" id="gwangjuTasks" style="">
                                                <div class="card mb-0">
                                                   <div class="card-body">
                                                      <!-- task -->
                                                      <div class="row justify-content-sm-between">
                                                         <div class="col-sm-6 mb-2 mb-sm-0">
                                                            <div class="form-check">
                                                               <c:choose>
                                                                  <c:when test="${empty gjfrcsList }">
                                                                     <div class="text-center">
                                                                        <p class="text-dark font-weight-bolder">지점이
                                                                           존재하지 않습니다.</p>
                                                                     </div>
                                                                  </c:when>
                                                                  <c:otherwise>
                                                                     <c:forEach items="${gjfrcsList}" var="gjfrcsList">
                                                                        <div class="text-left">
                                                                           <input type="hidden" class="memId" value="${gjfrcsList.memId }">
                                                                           <input type="checkbox" class="form-check-input" id="task1">
                                                                           <label for="task1">${gjfrcsList.frcsName }</label>
                                                                        </div>
                                                                     </c:forEach>
                                                                  </c:otherwise>
                                                               </c:choose>
                                                            </div>
                                                         </div>
                                                      </div>
                                                      <!-- end task -->
                                                   </div>
                                                </div>
                                             </div>
                                             </div>
                                             <div id="receiverList">
                                                <h5>수신자 목록</h5>
                                                <div class="container" id="receiverDiv">
                                                   <div class="mt-2" id="sendReceiver"></div>
                                                </div>
                                             </div>
                                             <div class="modal-footer">
                                                <a href="javascript:void(0);" class="btn btn-light" data-bs-dismiss="modal">취소</a>
                                                <button type="button" class="btn btn-dark" id="insertBtn">전송</button>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                    <!-- end row-->
                                 </div>
                                 <!-- end inbox-rightbar-->
                              </div>
                              <!-- end card-body -->
                              <div class="clearfix"></div>
                           </div>
                           <!-- end card-box -->
                        </div>
                        <!-- end Col -->
                     </div>
                     <!-- End row -->
                     <div class="row">
                        <div class="col-20">
                           <nav aria-label="Page navigation example" id="pagingArea">${pagingVO.pagingHTML }</nav>
                        </div>
                     </div>
                     <!-- end col-->
                  </div>
                  <!-- container -->
               </div>
               <!-- content -->
            </div>
         </div>
      </div>
   </div>
</div>
<script type="text/javascript">
$(function() {
   var infoHeaderModal = $("#info-header-modal"); // 상세보기 모달 id
   var allCheck = $("#allCheck");
   
   // 자동완성
    $("#autoBtn").on("click", function(){
    	
// 		var spanElement = document.querySelector('.CodeMirror-lines')
// 		spanElement.innerText = "1. (주)역전 엘리할머니 맥주의 발전에 힘써주시는 귀사에 감사드리며 무궁한 발전을 기원합니다."

		$('.CodeMirror-lines').text("1. (주)역전 엘리할머니 맥주의 발전에 힘써주시는 귀사에 감사드리며 무궁한 발전을 기원합니다.")
	    
		$("#sendTitle").val("11월 신메뉴 출시 관련 건");
// 	    $("#simplemde1").value("완전 스윗 그자체");
	});

   // 페이징
   $("#pagingArea").on("click", "a", function(event) {
      event.preventDefault();
      var pageNo = $(this).data("page");
      searchForm.find("#page").val(pageNo);
      searchForm.submit();
   });
   
   // 공문 저장
	var saveBtn = $("#saveBtn");

	saveBtn.on("click", function() {
		
// 		var spanElement = document.querySelector('.CodeMirror-line span')
// 	    var sendContent = spanElement.textContent; // simpleMDE의의 내용을 가져오도록 수정
	    
	    var sendContent = $('.CodeMirror-lines').text();
		
	    var sendFile = $("#sendFile")[0];
	    var sendTitle = $("#sendTitle").val();

	    var data = {
	        hdLttitle: sendTitle,
	        hdLtcontent: sendContent
	    }

	    var formData = new FormData();

	    if (sendFile.files.length > 0) {
	        formData.append("boFile", sendFile.files[0]);
	    }

	    formData.append("hdLttitle", sendTitle);
	    formData.append("hdLtcontent", sendContent); // 변수명 수정: sendContent

	    $.ajax({
	        url: "/head/officeLetterRegister.do",
	        type: "post",
	        data: formData,
	        processData: false,
	        contentType: false,
	        dataType: "json",
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        },
	        success: function(res) {
	            Swal.fire({
	                title: '알림창',
	                text: '저장이 완료되었습니다.',
	                icon: 'success',
	            }).then((result) => {
	                if (result.isConfirmed) {
	                    location.href = "/head/officeLetter.do";
	                }
	            });
	            console.log(res.result);
	        },
	        error: function(err) {
	            alert("데이터 저장 중 오류가 발생했습니다.", err);
	            console.log(data);
	        }
	    });
	});

   
   // 업데이트 클릭 이벤트
    var titleInput = $("#ltTitle");
    var contentTextarea = $("#ltContent");
    var updateBtn = $("#updateBtn");

    updateBtn.on("click", function(){
        if (updateBtn.text() === "수정") {
            // "수정" 버튼을 클릭하면 수정 가능하도록 설정
            titleInput.removeAttr("readonly");
            contentTextarea.removeAttr("readonly");

            // 버튼 텍스트를 "저장"으로 변경
            updateBtn.text("저장");
        } else if (updateBtn.text() === "저장") {
            // "저장" 버튼을 클릭하면 데이터를 서버로 보냅니다.
            var newTitle = titleInput.val();
            var newContent = contentTextarea.val();

            var data = {
                hdLttitle: newTitle,
                hdLtcontent: newContent,
                hdLtno: $("#ltNo").val()
            }

            $.ajax({
                url: "/head/officeLetterUpdate.do",
                type: "POST",
                data: JSON.stringify(data), // 데이터를 JSON 문자열로 직렬화
                contentType: "application/json; charset=utf-8",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function(data) {
                    Swal.fire({
                        title: '알림창',
                        text: '수정이 완료되었습니다.',
                        icon: 'success',
                    }).then((result) => {
                        if (result.isConfirmed) {
                            location.href = "/head/officeLetter.do"; 
                        }
                    });
                    // 수정 가능한 필드를 다시 읽기 전용으로 설정
                    titleInput.attr("readonly", "readonly");
                    contentTextarea.attr("readonly", "readonly");

                    // 버튼 텍스트를 "수정"으로 다시 변경
                    updateBtn.text("수정");
                },
                error: function(err) {
                    alert("수정 저장 중 오류가 발생했습니다.");
                }
            });
        }
    })
    
   // 클릭 이벤트 리스너를 추가
    $('.viewDetails').on("click", function() {
        var hdLtno = $(this).data('hdltno');
        var detailModal = $('#exampleModal');

        var data = {
            hdLtno: hdLtno,
        };

        $.ajax({
            url: "/head/officeLetterDetail.do",
            type: "post",
            data: JSON.stringify(data),
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); // csrf 토큰 보내기 위함
            },
            success: function(res) {
                console.log("res : " + JSON.stringify(res));
                var sDate = new Date(res.hdLtsdate);
                var formattedSdate = sDate.getFullYear() + "년 " + (sDate.getMonth() + 1) + "월 " + sDate.getDate() + "일";

                // 모달 내용 초기화
                detailModal.find("#ltNo").val(res.hdLtno);
                detailModal.find("#ltTitle").val(res.hdLttitle);
                detailModal.find("#ltContent").val(res.hdLtcontent);
                detailModal.find("#ltState").val(res.hdLtstate);
                detailModal.find("#sDate").val(formattedSdate);

                let tmp = "";
                $.each(res.counselFileList, function(idx, attachVO) {
                    console.log(attachVO.attachOrgname);

                    tmp += "<div class='col-md-2'><div><div class='card-header mt-n4 mx-3 p-0'><a href='" + attachVO.attachSavename + "' target='_blank'><img src='/resources/assets/icons/PDF-icon.png' style='width:70px;' /></a></div>";
                    tmp += "<div class='card-body text-center bg-white border-radius-lg p-3 pt-0'><h6 class='mt-3 mb-1 d-md-block d-none'>" + attachVO.attachOrgname + "<br/>" + "(" + attachVO.attachSize + "bytes)</h6>";
                    tmp += "<p class='mb-0 text-xs font-weight-bolder text-info text-uppercase'></p>";
                    tmp += "</div></div></div>";
                });

                detailModal.find("#divRow").empty().append(tmp);

                detailModal.modal("show");
            }
        });
    });
    
    // 삭제 버튼 클릭 이벤트
    $('#products-datatable').on('click', '.delBtn', function() {
        var hdLtno = $(this).data('hdltno');

        $.ajax({
            type: 'POST',
            url: '/head/officeLetterDelete.do',
            data: { hdLtno: hdLtno },
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(res) {
                Swal.fire({
                    title: '알림창',
                    text: '삭제가 완료되었습니다.',
                    icon: 'success',
                }).then((result) => {
                    if (result.isConfirmed) {
                        location.href = "/head/officeLetter.do"; 
                    }
                });
                console.log(res.result);
            },
            error: function(err) {
                alert("데이터 저장 중 오류가 발생했습니다.", err);
                console.log(data);
            }
        });
    });

    // 발송 클릭 이벤트
    var sendBtn = $(".sendBtn")
    
   sendBtn.on("click", function() {
       
      var hdLtno = $(this).data("hdltno");
      
      
//        var checkboxes = document.querySelectorAll('input[type="checkbox"]');
       var displayContainer = document.querySelector('.container');
       var selectedItems = [];

//        checkboxes.forEach(function(checkbox) {
//            checkbox.addEventListener('change', function() {
//                var selectedItemText = checkbox.nextElementSibling.textContent;
//                var selectedItemIndex = selectedItems.findIndex(item => item.hdLtreciever === selectedItemText);

//                if (checkbox.checked) {
//                    if (selectedItemIndex === -1) {
//                        selectedItems.push({ hdLtreciever: selectedItemText, hdLtno: hdLtno });
//                        updateDisplay();
//                    }
//                } else {
//                    if (selectedItemIndex !== -1) {
//                        selectedItems.splice(selectedItemIndex, 1);
//                        updateDisplay();
//                    }
//                }
//            });
//        });
      var admin = '${member.memId}'
      $('.region').on('change', 'input[type="checkbox"]', function () {
         var selectedItemText = $(this).next('label').text();
         var memId = $(this).closest('.text-left').find('.memId').val();
         console.log(memId)
         var selectedItemIndex = selectedItems.findIndex(function (item) {
            return item.hdLtreciever === selectedItemText;
         });
      
         if (this.checked) {
            if (selectedItemIndex === -1) {
               selectedItems.push({ hdLtreciever: selectedItemText, hdLtno: hdLtno, memId : memId, admin : admin });
               updateDisplay();
            }
         } else {
            if (selectedItemIndex !== -1) {
               selectedItems.splice(selectedItemIndex, 1);
               updateDisplay();
            }
         }
         console.log(selectedItems)
      });

       function updateDisplay() {
           displayContainer.innerHTML = '';

           selectedItems.forEach(function(item) {
               var selectedItem = document.createElement('div');
               selectedItem.textContent = item.hdLtreciever;
               displayContainer.appendChild(selectedItem);
           });
       }
       
       $("#insertBtn").on("click", function(){          
          $.ajax({
              type: 'POST',
              url: '/head/officeLtDetailRegister.do',
              data: JSON.stringify(selectedItems),
              contentType: "application/json; charset=utf-8",
              beforeSend: function(xhr) {
                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
              },
              success: function(res) {
                  Swal.fire({
                      title: '알림창',
                      text: '발송이 완료되었습니다.',
                      icon: 'success',
                  }).then((result) => {
                      if (result.isConfirmed) {
                          location.href = "/head/officeLetter.do";
                      }
                  });
                  console.log(res.result);
              },
              error: function(err) {
                  alert("데이터 저장 중 오류가 발생했습니다.", err);
                  console.log(data);
              }
          });
       });
       
       $("#allCheck").on("click",function(){
          if($(this).is(":checked")) {
             $.ajax({
                type: "post",
                url : "/head/officeAllList.do",
                beforeSend: function(xhr) {
                     xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                 },
                 success: function(res) {
                    var officeAll = [];
                    var officeId = [];
                    var officeMemId = [];
                    
                    console.log(res);
                    for(var i=0; i<res.length; i++){
                  
                       officeAll.push(res[i].frcsName);
                       officeId.push(res[i].frcsId);
                       officeMemId.push(res[i].memId);
                       var selectedItemText = res[i].frcsName;
                       var memId = res[i].memId;
                       selectedItems.push({ hdLtreciever: selectedItemText, hdLtno: hdLtno, memId : memId, admin : admin });
                    }
                    console.log(officeId);
                    console.log(officeMemId);
                    $("#receiverDiv").text(officeAll);
                 }
             });
          }else{
             $("#receiverDiv").text('');
          }
       });
   });
});
</script>