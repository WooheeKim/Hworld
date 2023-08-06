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
    	.state-pause {
    		background-color:#F6CECE;
    		color:#e22454;
    		padding:5px;
    		border-radius:5px;
    		font-size:12px;
    		font-weight:700;
    		position:relative;
    		width:80px;
    	}
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
    	.state-withdrawal {
    		background-color:#BDBDBD;
    		color:#2E2E2E;
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
    <section class="section-b-space">
     <div class="page-body">
         <div class="title-header title-header-1">	                
             <h5>회선 목록</h5>
             <div class="col-lg-6 col-md-8 mx-6 d-flex justify-content-end">
	             <div class="search-bar">
	                 <div class="input-group search-bar w-100">                            	
	                     <form action="./phoneList" method="get">
	                 		<div class="d-inline-flex input-group search-bar" style="width: 750px">
		                       <input type="search" name="search" value="${pager.search}" class="form-control" placeholder="Search : 회원번호, 이메일, 회선번호">
		                       <button class="input-group-text" id="basic-addon3" type="submit">
		                           <i class="fas fa-search"></i>
		                       </button>
		                    </div>
	                     </form>
	                 </div>
	             </div>
             </div>
       	 </div>                               
            
   		 <!-- Container-fluid starts-->
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
                                                 <th><b>이메일</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                 <th><b>회선번호</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                 <th><b>요금제</b></th>
                                                 <th><b>기기명</b></th>
                                                 <!-- <th><b>통신사</b> <i class="fa fa-fw fa-sort"></i></th> -->
                                                 <th><b>개통날짜</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                 <th><b>해지날짜</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                                 <th><b>상태</b> <!-- <i class="fa fa-fw fa-sort"></i> --></th>
                                             </tr>
                                         </thead>
                                         <tbody>                                                	
                                         	<c:forEach var="phoneList" items="${phoneList}">
											<c:forEach var="planVOs" items="${phoneList.planVOs}">
											<c:forEach var="memberVOs" items="${phoneList.memberVOs}">
                                              <tr>
                                              	  <td><b>${memberVOs.memberNum}</b></td>
                                              	
                                                  <td>${memberVOs.email}</td>	                                                    	                                                
                                                  
                                                  <td>${phoneList.phoneNum}</td>

                                                  <td>${planVOs.planName}</td>
							
                                                  <td>${phoneList.directName}</td>

                                                  <!-- <td>타회사</td> -->

                                                  <td>
                                                  	<fmt:formatDate value="${phoneList.startDate}" pattern="yyyy/MM/dd" var="formattedDate" />
                                                    <span style="font-weight:400;">${formattedDate}</span>	                                                        
                                                  </td>
									
                                                  <td class="font-primary">
                                                  	<fmt:formatDate value="${phoneList.endDate}" pattern="yyyy/MM/dd" var="formattedDate" />
                                                    <span style="font-weight:400;">${formattedDate}</span>
                                                  </td>

                                                  <td>
                                                  	<c:if test="${memberVOs.memberState eq '-1'}">
                                                      	<span class="state-dormancy">휴면</span>	                                                            	
                                                    </c:if>
                                                    <c:if test="${memberVOs.memberState eq '0'}">	                                                            
                                                      	<span class="state-pause">일시정지</span>
                                                   	</c:if>
                                                   	<c:if test="${memberVOs.memberState eq '1'}">
                                                      	<span class="state-normal">정상</span>	                                                            	
                                                   	</c:if>
                                                   	<c:if test="${memberVOs.memberState eq '2'}">
                                                      	<span class="state-withdrawal">탈퇴</span>	                                                            	
                                                    </c:if>
                                                  </td>
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
				                       <a class="page-link" href="phoneList?page=${pager.startNum-1}&search=${pager.search}" aria-label="Previous">
				                           <span aria-hidden="true">
				                               <i class="fas fa-chevron-left"></i>
				                           </span>
				                       </a>
				                   </li>
				                   <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				  	                    <li class="page-item">
				                       		<a class="page-link" href="phoneList?page=${i}&search=${pager.search}">${i}</a>
				                   		</li>
				                   </c:forEach>
				                   <li class="page-item ${pager.next ? '' : 'disabled' }">
				                       <a class="page-link" href="phoneList?page=${pager.lastNum+1}&search=${pager.search}" aria-label="Next">
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
    	 <!-- Container-fluid end -->
		 <c:import url="adminFooter.jsp"></c:import>
        </div>
    </section>
        
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