<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
	<c:import url="adminStyle.jsp"></c:import>
	<style>
    	/* 답변대기중 */
    	.state-withdrawal {
    		background-color:#F6CECE;
    		color:#e22454;
    		padding:5px;
    		border-radius:5px;
    		font-size:12px;
    		font-weight:700;
    		position:relative;
    		width:80px;
    	}
    	/* 삭제 */
    	.state-dormancy {
    		background-color:#F5F6CE;
    		color:#868A08;
    		padding:5px;
    		border-radius:5px;
    		font-size:12px;
    		font-weight:700;
    		position:relative;
    		width:80px;
    	}
    	/* 답변완료 */
    	.state-normal {
    		background-color:#E0F8E6;
    		color:#088A08;
    		padding:5px;
    		border-radius:5px;
    		font-size:12px;
    		font-weight:700;
    		position:relative;
    		width:80px;
    	}    	
    </style>    
</head>

<body>
	<c:import url="adminHeader.jsp"></c:import>               
    <div class="page-body">
        <div class="title-header title-header-1">                    
            <h5>일반 문의</h5>
            <div class="col-lg-6 col-md-8 mx-6 d-flex justify-content-end">
                <div class="search-bar">
                    <div class="input-group search-bar w-100">
                    	<form action="./generalInquiry" method="get">
                    		<div class="d-inline-flex input-group search-bar" style="width: 750px">
	                          <input type="search" name="search" value="${pager.search}" class="form-control" placeholder="Search : 제목, 작성자">
	                          <button class="input-group-text" id="basic-addon3">
	                              <i class="fas fa-search"></i>
	                          </button>
                      		</div>
                  		</form>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">                        
                        <div class="card-body">
                            <div>
                                <div class="table-responsive table-desi">
                                    <table class="user-table ticket-table review-table table table-striped">
                                        <thead>
                                            <tr>
                                                <th><b>문의번호</b> <!-- <i class="fa fa-fw fa-sort"></i>--></th>
                                                <th><b>문의종류</b> <!-- <i class="fa fa-fw fa-sort"></i>--></th>
                                                <th><b>제목</b></th>
                                                <th><b>작성자</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                <th><b>작성날짜</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                <th><b>답변</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="gi" items="${generalInquiry}">
											<c:forEach var="memberVOs" items="${gi.memberVOs}">
	                                            <tr>
	                                                 <td><b>${gi.num}</b></td>	                                                 
	                                                 <td>	                                                 
	                                                 	<c:if test="${gi.categoryCode eq '02'}">
	                                                     	계정문의
                                                    	</c:if>	                                                           	
                                                    	<c:if test="${gi.categoryCode eq '03'}">
                                                     		요금(청구/납부/조회/요금제문의)
                                                    	</c:if>
                                                    	<c:if test="${gi.categoryCode eq '04'}">
                                                     		상품(배송/환불/취소/기타)
                                                    	</c:if>
                                                    	<c:if test="${gi.categoryCode eq '05'}">
                                                     		기타(서류/기타/불만접수)
                                                    	</c:if>	                                                    		                                                 
	                                                 </td>
	                                                 <td>	                                                        
	                                                     <a href="generalInquiryDetail?num=${gi.num}">${gi.contents}</a>
	                                                 </td>
	                                                 <td>${memberVOs.email}</td>
	                                                 <td>
	                                                 	<fmt:formatDate value="${gi.regDate}" pattern="yyyy/MM/dd" var="formattedDate" />
	                                                  	<span style="font-weight:400;">${formattedDate}</span>
	                                                 </td>
	                                                 <td>
	                                                 	<c:if test="${gi.state eq '-1'}">
	                                                     	<span class="state-dormancy">삭제</span>	                                                            	
                                                    	</c:if>	                                                           	
                                                    	<c:if test="${gi.state eq '0'}">
	                                                     	<span class="state-withdrawal">답변대기중</span>	                                                            
                                                    	</c:if>
                                                    	<c:if test="${gi.state eq '1'}">
	                                                     	<span class="state-normal">답변완료</span>	                                                            	
                                                    	</c:if>
	                                                 </td>
	                                            </tr>	                                                    
											</c:forEach>
											</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>                        

                        <!-- Pagination Box Start -->
                        <div class="pagination-box">
                            <nav class="ms-auto me-auto " aria-label="...">
				              <ul class="pagination pagination-primary">
				                  <li class="page-item ${pager.pre ? '' : 'disabled' }">
				                      <a class="page-link" href="generalInquiry?page=${pager.startNum-1}&search=${pager.search}" aria-label="Previous">
				                          <span aria-hidden="true">
				                              <i class="fas fa-chevron-left"></i>
				                          </span>
				                      </a>
				                  </li>
				                  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				 	                    <li class="page-item">
				                      	<a class="page-link" href="generalInquiry?page=${i}&search=${pager.search}">${i}</a>
				                  	</li>
				                  </c:forEach>
				                  <li class="page-item ${pager.next ? '' : 'disabled' }">
				                      <a class="page-link" href="generalInquiry?page=${pager.lastNum+1}&search=${pager.search}" aria-label="Next">
				                          <span aria-hidden="true">
				                              <i class="fas fa-chevron-right"></i>
				                          </span>
				                      </a>
				                  </li>
				              </ul>                
				         	</nav>
				        </div>
				        <!-- Pagination Box End -->
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