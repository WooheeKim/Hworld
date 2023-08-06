<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
     <c:import url="adminStyle.jsp"></c:import>
     <style>
    	/* 미납 */
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
    	/* 납부 */
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
                    <h5>미납 목록</h5>
                    <div class="col-lg-6 col-md-8 mx-6 d-flex justify-content-end">
                        <div class="search-bar">
                            <div class="input-group search-bar w-100">
                            	<form action="./unpaidList" method="get">
	                            	<div class="d-inline-flex input-group search-bar" style="width: 750px">
		                                <input type="search" name="search" value="${pager.search}" class="form-control" placeholder="Search : 미납번호, 회원번호">
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
                                            <table class="table table-striped all-package">
                                                <thead>
                                                    <tr>
                                                        <th><b>미납번호</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                        <th><b>회원번호</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                        <th><b>미납 월</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                        <th><b>미납금액</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                        <th><b>납부유무</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <tr>
                                                        <td><b>1</b></td>
                                                        <td>13213</td>
                                                        <td>2023/05</td>
                                                        <td>302,000원</td>
                                                        <td class="td-cross">
                                                            <span class="lnr lnr-cross-circle"></span>
                                                        </td>
                                                    </tr>
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
						                        <a class="page-link" href="unpaidList?page=${pager.startNum-1}&search=${pager.search}" aria-label="Previous">
						                            <span aria-hidden="true">
						                                <i class="fas fa-chevron-left"></i>
						                            </span>
						                        </a>
						                    </li>
						                    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						   	                    <li class="page-item">
						                        	<a class="page-link" href="unpaidList?page=${i}&search=${pager.search}">${i}</a>
						                    	</li>
						                    </c:forEach>
						                    <li class="page-item ${pager.next ? '' : 'disabled' }">
						                        <a class="page-link" href="unpaidList?page=${pager.lastNum+1}&search=${pager.search}" aria-label="Next">
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
            </div>            
            
	<c:import url="adminFooter.jsp"></c:import>  

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