<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
   	<c:import url="adminStyle.jsp"></c:import>  
</head>

<body>
	<c:import url="adminHeader.jsp"></c:import>  
        <div class="page-body">
			<c:forEach var="orderDetail" items="${orderDetail}">
			<c:forEach var="orderVO" items="${orderDetail.orderVOs}">
	      	<c:forEach var="directVOs" items="${orderDetail.directVOs}">
	            <div class="title-header title-header-block package-card">
	                <div>
	                    <h5>주문번호 # ${orderVO.orderNum}</h5>
	                </div>
	                <div class="card-order-section">
	                    <ul>
	                    	<li>
	                            <fmt:formatDate value="${orderVO.orderDate}" pattern="yyyy/MM/dd" var="formattedDate" />
	                            <span style="font-weight:400;">${formattedDate}</span>
	                        </li>
	                                                                          
	                        <li>
	                        	총 금액 <fmt:formatNumber value="${directVOs.directPrice * orderDetail.orderAmount}" pattern="###,###,###,###원"/>
	                        </li>
	                    </ul>
	                </div>
	            </div>

				<div class="container-fluid">
				    <div class="row">
				        <div class="col-sm-12">
				            <div class="card">
				                <div class="card-body">
				                    <div class="bg-inner cart-section order-details-table">
				                        <div class="row g-4">
				                            <div class="col-xl-8">
				                                <div class="table-responsive table-details">
				                                    <table class="table cart-table table-borderless">
				                                        <thead>
				                                            <tr>
				                                                <th colspan="2">상품</th>
				                                                <th class="text-end" colspan="3"></th>
				                                            </tr>
				                                        </thead>
				
				                                        <tbody>
				                                            <tr class="table-order">
				                                                <!-- <td>
				                                                    <a href="javascript:void(0)">
				                                                        <img src="/admin/images/profile/1.jpg"
				                                                            class="img-fluid blur-up lazyload" alt="">
				                                                    </a>
				                                                </td> -->
				                                                <th></th>
				                                                <th>
				                                                    <p>제품명</p>
				                                                    <input type="hidden" class="individual_productName_input" value="${directVOs.directName}">
				                                                    <h5>${directVOs.directName}</h5>
				                                                </th>
				                                                <th>
				                                                    <p>수량</p>
				                                                    <input type="hidden" class="individual_productName_input2" value="${orderDetail.orderAmount}">
				                                                    <h5>${orderDetail.orderAmount}</h5>
				                                                </th>
				                                                <th>
				                                                    <p>금액</p>
				                                                    <h5><fmt:formatNumber value="${directVOs.directPrice * orderDetail.orderAmount}" pattern="###,###,###,###원"/></h5>
				                                                    <input type="hidden" class="individual_productName_input3" value="${directVOs.directPrice * orderDetail.orderAmount}">                                                                    
				                                                </th>
				                                                <th></th>
				                                            </tr>                                                            
				                                        </tbody>																											
				                                        <tfoot>                                                            
				                                            <tr class="table-order">
				                                                <td colspan="3">
				                                                    <h4 class="theme-color fw-bold">총 금액 :</h4>
				                                                </td>
				                                                <td>                                                                	
				                                                    <h4 class="theme-color fw-bold"><fmt:formatNumber value="${directVOs.directPrice * orderDetail.orderAmount}" pattern="###,###,###,###원"/></h4>
				                                                </td>
				                                            </tr>
				                                        </tfoot>
				                                    </table>
				                                </div>
				                            </div>
				
				                            <div class="col-xl-4">
				                                <div class="order-success">
				                                    <div class="row g-4">
				                                        <h4>주문 내역</h4>
				                                        <ul class="order-details">
				                                            <li>주문 번호 : ${orderVO.orderNum}</li>
				                                            <li>
										                        <fmt:formatDate value="${orderVO.orderDate}" pattern="yyyy/MM/dd" var="formattedDate" />
										                        <span style="font-weight:400;">주문 날짜 : ${formattedDate}</span>
										                    </li>
				                                            <li>주문 금액 : <fmt:formatNumber value="${directVOs.directPrice * orderDetail.orderAmount}" pattern="###,###,###,###원"/></li>
				                                        </ul>
				
				                                        <h4>배송지</h4>
				                                        <ul class="order-details">
				                                            <li>(${orderVO.orderAddress1})</li>
				                                            <li>${orderVO.orderAddress2}</li>
				                                            <li>${orderVO.orderAddress3}</li>
				                                        </ul>
				
				                                        <h4>받는이 정보</h4>
				                                        <ul class="order-details">
				                                        	<li>이름 : ${orderVO.orderReceiver}</li>
				                                        	<li>연락처 : ${orderVO.orderTelNum}</li>
				                                        </ul>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>                
	      	</c:forEach>
	      	</c:forEach>
	      	</c:forEach>
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