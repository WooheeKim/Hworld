<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">

<head>
	<meta charset="UTF-8">
    <c:import url="adminStyle.jsp"></c:import>
    <style>
    	/* 탈퇴 */
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
    	/* 휴면 */
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
    	/* 정상 */
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
        <!-- Container-fluid starts-->
        <section class="section-b-space">            
            <div class="page-body">
                <div class="title-header title-header-1">
                    
                    <h5>회원 목록</h5>
                    <div class="col-lg-6 col-md-8 mx-6 d-flex justify-content-end">
                        <div class="search-bar">
                            <div class="input-group search-bar w-100">                            	
       	                        <form action="./memberList" method="get">
	                           		<div class="d-inline-flex input-group search-bar" style="width: 750px">
		                                <input type="search" name="search" value="${pager.search}" class="form-control" placeholder="Search : 고객번호, 이름, 대표회선, 이메일">
		                                <button class="input-group-text" id="basic-addon3" type="submit">
		                                    <i class="fas fa-search"></i>
		                                </button>
	                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- All User Table Start -->
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
                                                        <th><b>회원번호</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                        <th><b>이름</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                        <th><b>대표회선</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                        <th><b>이메일</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                        <th><b>생년월일</b></th>
                                                        <th><b>주소</b></th>
                                                        <th><b>가입날짜</b> <!-- <i class="fa fa-fw fa-sort"> --></i></th>
                                                        <th><b>로그인날짜</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                        <th><b>상태</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
	                                                <c:forEach var="memberVO" items="${memberList}">
	                                                    <tr>
	                                                        <td><b>${memberVO.memberNum}</b></td>
	
	                                                        <td>${memberVO.name}</td>

	                                                        <td>${memberVO.tel}</td>
	
	                                                        <td>${memberVO.email}</td>
	
	                                                        <td>${memberVO.rrnf}</td>
	
	                                                        <td>(${memberVO.address1}) ${memberVO.address2} ${memberVO.address3}</td>
	
	                                                        <td>
		                                                        <fmt:formatDate value="${memberVO.joinDate}" pattern="yyyy/MM/dd" var="formattedDate" />
		                                                        <span style="font-weight:400;">${formattedDate}</span>
	                                                        </td>
	
	                                                        <td class="font-primary">1일 전</td>
	
	                                                        <td>
	                                                           	<c:if test="${memberVO.memberState eq '-1'}">
	                                                            	<span class="state-withdrawal">탈퇴</span>	                                                            
	                                                           	</c:if>
	                                                        	<c:if test="${memberVO.memberState eq '0'}">
	                                                            	<span class="state-dormancy">휴면</span>	                                                            	
	                                                           	</c:if>	                                                           	
	                                                           	<c:if test="${memberVO.memberState eq '1'}">
	                                                            	<span class="state-normal">정상</span>	                                                            	
	                                                           	</c:if>
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
						                        <a class="page-link" href="memberList?page=${pager.startNum-1}&search=${pager.search}" aria-label="Previous">
						                            <span aria-hidden="true">
						                                <i class="fas fa-chevron-left"></i>
						                            </span>
						                        </a>
						                    </li>
						                    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						   	                    <li class="page-item">
						                        	<a class="page-link" href="memberList?page=${i}&search=${pager.search}">${i}</a>
						                    	</li>
						                    </c:forEach>
						                    <li class="page-item ${pager.next ? '' : 'disabled' }">
						                        <a class="page-link" href="memberList?page=${pager.lastNum+1}&search=${pager.search}" aria-label="Next">
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
                <!-- All User Table Ends-->
            </div>
        </section>
        <!-- Container-fluid end -->

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