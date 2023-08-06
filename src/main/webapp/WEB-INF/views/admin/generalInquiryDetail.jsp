<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
    <c:import url="adminStyle.jsp"></c:import>  
</head>

<body>
	<c:import url="adminHeader.jsp"></c:import>  
    <div class="page-body">
        <div class="title-header">
            <h5>일반 문의</h5>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                	<form:form cssClass="theme-form theme-form-2 mega-form radio-section" action="./generalInquiry" id="update_btn" method="post" modelAttribute="qnaVO">											
	                                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
	                                         <li class="nav-item" role="presentation">
	                                             <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button">문의 내용</button>
	                                         </li>
	                                    </ul>
										<c:forEach var="gid" items="${generalInquiryDetail}">	
                                    	<c:forEach var="memberVOs" items="${gid.memberVOs}">
	                                      	<div class="tab-content" id="pills-tabContent">		                                               
	                                            <div class="row">
	                                                <div class="mb-4 row align-items-center">
	                                                    <label class="form-label-title col-lg-2 col-md-3 mb-0">작성자</label>
	                                                    ${memberVOs.email}
	                                                </div>
	                                                <div class="mb-4 row align-items-center">
	                                                    <label class="form-label-title col-lg-2 col-md-3 mb-0">작성날짜</label>
	                                                    ${gid.regDate}
	                                                </div>
	                                                <div class="mb-4 row align-items-center">
	                                                    <label class="form-label-title col-lg-2 col-md-3 mb-0">제목</label>
	                                                    ${gid.title}
	                                                </div>
	
	                                                <div class="mb-4 row align-items-center">
	                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">내용</label>
	                                                    ${gid.contents}
	                                                </div>
	
	                                                <div class="mb-4 row align-items-center">
	                                                    <label class="col-lg-2 col-md-3 col-form-label form-label-title">답변</label>
	                                                    <div class="col-md-9 col-lg-9">
	                                                        <textarea class="row" rows="14" style = "width: 100%;" id="reply" name="reply"></textarea>
	                                                        <input id=num name=num type="hidden" value="${gid.num}">
	                                                    </div>
	                                                </div>                                                        
	                                            </div>
	                                     	</div>
                                     	</c:forEach>
                                     	</c:forEach>
				
	                                    <div class="card-footer text-end border-0 pt-0" style="padding-right: 8%">
	                                        <button class="btn btn-primary me-3 update_btn " type="submit">답변 작성</button>
	                                        <!-- <button class="btn btn-outline-primary" type="button">취소</button> -->
	                                    </div>                              
                                    </form:form>              
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		<c:import url="adminFooter.jsp"></c:import>
    </div>
                                         
	<!-- latest js -->
	<script src="/admin/js/jquery-3.6.0.min.js"></script>
	
	<!-- Bootstrap js -->
	<script src="/admin/js/bootstrap/bootstrap.bundle.min.js"></script>
	
	<!-- feather icon js -->
	<script src="/admin/js/icons/feather-icon/feather.min.js"></script>
	<script src="/admin/js/icons/feather-icon/feather-icon.js"></script>
	
	<!-- scrollbar simplebar js -->
	<script src="/admin/js/scrollbar/simplebar.js"></script>
	<script src="/admin/js/scrollbar/custom.js"></script>
	
	<!-- Sidebar js-->
	<script src="/admin/js/config.js"></script>
	
	<!-- Plugins JS -->
	<script src="/admin/js/sidebar-menu.js"></script>
		
	<!--Dropzon js -->
	<script src="/admin/js/dropzone/dropzone.js"></script>
	<script src="/admin/js/dropzone/dropzone-script.js"></script>
	
	<!-- Theme js -->
	<script src="/admin/js/script.js"></script>
</body>

</html>