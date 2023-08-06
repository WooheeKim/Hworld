<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
	<meta charset="UTF-8">
   <c:import url="adminStyle.jsp"></c:import>  
</head>

<body>
	<c:import url="adminHeader.jsp"></c:import>  
	<div class="page-body">
    	<div class="title-header title-header-1">
	        <h5>상품 목록</h5>
	        <div class="col-lg-6 col-md-8 mx-6 d-flex justify-content-end">
	            <div class="search-bar">
	                <div class="input-group search-bar w-100">
	                	<form action="./productList" method="get">
		                 	<div class="d-inline-flex input-group search-bar" style="width: 750px">
		                      <input type="search" name="search" value="${pager.search}" class="form-control" placeholder="Search : 상품 코드, 이름, 용량">
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
	                            <div class="table-responsive table-desi table-product">
	                                <table class="table table-1d all-package">
	                                    <thead>
	                                        <tr>
	                                            <th>상품 코드</th>
	                                            <th><b>이름/용량/색상</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
	                                            <th><b>브랜드</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
	                                            <th><b>재고</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
	                                            <th><b>가격</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>	                                            
	                                        </tr>
	                                    </thead>
	
	                                    <tbody>
	                                    	<c:forEach var="directVO" items="${productList}">
	                                         <tr>
	                                             <td>
	                                                  <%-- <a href="/direct/phoneDetail?slicedCode=${direct }"></a> --%><b>${directVO.directCode}</b>
	                                             </td>
	
	                                             <td>
	                                                 ${directVO.directName} / ${directVO.saveCapacity} / 
	                                                 <c:if test="${directVO.colorCode eq 'W'}">
	                                                 	White
	                                                </c:if>
	                                               	<c:if test="${directVO.colorCode eq 'B'}">
	                                                		Black
	                                               	</c:if>
	                                               	<c:if test="${directVO.colorCode eq 'G'}">
	                                                		Gray
	                                               	</c:if>
	                                             </td>
	
	                                             <td class="td-price">
	                                             	<c:if test="${directVO.brandCode eq 'S'}">
	                                                 	<span>삼성</span>                                            
	                                               	</c:if>
	                                               	<c:if test="${directVO.brandCode eq 'A'}">
	                                                		<span>애플</span>
	                                               	</c:if>
	                                               	<c:if test="${directVO.brandCode eq '0'}">
	                                                		<span>기타</span>
	                                               	</c:if>	                                                            
	                                             </td>
	
	                                             <td>	                                                 	                                                 
	                                                 <fmt:formatNumber value="${directVO.directStock}" pattern="###,###,###,###개"/>
	                                             </td>
																				                                             
	                                             <td>	                                                        	
	                                             	<fmt:formatNumber value="${directVO.directPrice}" pattern="###,###,###,###원"/>
	                                             </td>
	                                         </tr>		                                                    
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
					                  <a class="page-link" href="productList?page=${pager.startNum-1}&search=${pager.search}" aria-label="Previous">
					                      <span aria-hidden="true">
					                          <i class="fas fa-chevron-left"></i>
					                      </span>
					                  </a>
					              </li>
					              <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					                  <li class="page-item">
					                  	<a class="page-link" href="productList?page=${i}&search=${pager.search}">${i}</a>
					              	  </li>
					              </c:forEach>
					              <li class="page-item ${pager.next ? '' : 'disabled' }">
					                  <a class="page-link" href="productList?page=${pager.lastNum+1}&search=${pager.search}" aria-label="Next">
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

    <!-- Plugins js -->
    <script src="/admin/js/sidebar-menu.js"></script>

    <!-- Theme js -->
    <script src="/admin/js/script.js"></script>
</body>

</html>