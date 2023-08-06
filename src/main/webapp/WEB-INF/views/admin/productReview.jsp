<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
	<c:import url="adminStyle.jsp"></c:import>  
</head>

<body>
    <c:import url="adminHeader.jsp"></c:import>  

    <!-- product review section start -->
    <div class="page-body">
        <div class="title-header">
            <div>
                <h5>상품 리뷰</h5>
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
                                                <th><b>후기번호</b><!--  <i class="fa fa-fw fa-sort"></i> --></th>
                                                <th><b>작성자</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                <th><b>상품명</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                <th><b>별점</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                <th>내용</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="review" items="${productReview}">
                                        	<c:forEach var="memberVOs" items="${review.memberVOs}">
                                        	<c:forEach var="directVOs" items="${review.directVOs}">
	                                            <tr>
	                                                <td><b>${review.num}</b></td>
	                                                <td>${memberVOs.email}</td>
	                                                <td>${directVOs.directName}</td>
	                                                <td>
	                                                    <ul class="rating">
	                                                        <li>
	                                                        	${review.rate}
	                                                            <!-- <i class="fas fa-star theme-color"></i> -->
	                                                        </li>
	                                                        <li>
	                                                            <!-- <i class="fas fa-star theme-color"></i> -->
	                                                        </li>
	                                                        <li>
	                                                            <!-- <i class="fas fa-star"></i> -->
	                                                        </li>
	                                                        <li>
	                                                            <!-- <i class="fas fa-star"></i> -->
	                                                        </li>
	                                                        <li>
	                                                            <!-- <i class="fas fa-star"></i> -->
	                                                        </li>
	                                                    </ul>
	                                                </td>
	                                                <td>${review.contents}</td>
	                                            </tr>
	                                        </c:forEach>
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
				                      <a class="page-link" href="productReview?page=${pager.startNum-1}&search=${pager.search}" aria-label="Previous">
				                          <span aria-hidden="true">
				                              <i class="fas fa-chevron-left"></i>
				                          </span>
				                      </a>
				                  </li>
				                  <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				 	                  <li class="page-item">
				                      	  <a class="page-link" href="productReview?page=${i}&search=${pager.search}">${i}</a>
					                  </li>
				                  </c:forEach>
				                  <li class="page-item ${pager.next ? '' : 'disabled' }">
				                      <a class="page-link" href="productReview?page=${pager.lastNum+1}&search=${pager.search}" aria-label="Next">
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
	
	<!-- Sidebar js -->
	<script src="/admin/js/config.js"></script>
	
	<!-- Plugins JS -->
	<script src="/admin/js/sidebar-menu.js"></script>
	
	<!-- all checkbox select js -->
	<script src="/admin/js/checkbox-all-check.js"></script>
	
	<!-- Theme js -->
	<script src="/admin/js/script.js"></script>
</body>

</html>