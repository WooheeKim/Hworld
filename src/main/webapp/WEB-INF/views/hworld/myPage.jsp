<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <c:import url="../temp/style.jsp"></c:import>
</head>

<body class="theme-color2 light ltr">
<c:import url="../temp/header.jsp"></c:import>
    <!-- Breadcrumb section start -->
    <section class="breadcrumb-section section-b-space">
        <ul class="circles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h3>마이페이지</h3>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">
                                    <i class="fas fa-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">마이페이지</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb section end -->

    <!-- user dashboard section start -->
    <section class="section-b-space">
        <div class="container">
            <div class="row">
                <!-- 좌측 탭 영역 시작 -->
                <div class="col-lg-3">
                    <!-- 좌측 탭 시작 -->
                    <ul class="nav nav-tabs custome-nav-tabs flex-column category-option" id="myTab">
                        <li class="nav-item mb-2">
                            <button class="nav-link font-light active" id="tab" data-bs-toggle="tab"
                                data-bs-target="#dash" type="button"><i
                                    class="fas fa-angle-right"></i>요금 청구/납부</button>
                        </li>

                        <li class="nav-item mb-2">
                            <button class="nav-link font-light" id="5-tab" data-bs-toggle="tab"
                                data-bs-target="#profile" type="button"><i
                                    class="fas fa-angle-right"></i>가입 정보</button>
                        </li>

                        <li class="nav-item mb-2">
                            <button class="nav-link font-light" id="3-tab" data-bs-toggle="tab" data-bs-target="#save"
                                type="button"><i class="fas fa-angle-right"></i>회선 관리</button>
                        </li>

                        <li class="nav-item mb-2">
                            <button class="nav-link font-light" id="1-tab" data-bs-toggle="tab" data-bs-target="#order"
                                type="button"><i class="fas fa-angle-right"></i>주문 내역</button>
                        </li>

                        
                        <li class="nav-item mb-2">
                            <button class="nav-link font-light" id="2-tab" data-bs-toggle="tab"
                                data-bs-target="#wishlist" type="button"><i
                                    class="fas fa-angle-right"></i>문의 내역</button>
                        </li>
                        

                        <li class="nav-item mb-2">
                            <button class="nav-link font-light" id="4-tab" data-bs-toggle="tab" data-bs-target="#pay"
                                type="button"><i class="fas fa-angle-right"></i>구매 후기</button>
                        </li>

                        
                        <li class="nav-item">
                            <button class="nav-link font-light" id="6-tab" data-bs-toggle="tab"
                                data-bs-target="#security" type="button"><i
                                    class="fas fa-angle-right"></i>회원 탈퇴</button>
                        </li>
                    </ul>
                    <!-- 좌측 탭 끝 -->
                </div>
                <!-- 좌측 탭 영역 끝 -->

                <!-- 우측 내용 영역 시작 -->
                <div class="col-lg-9">
                    <div class="filter-button dash-filter dashboard">
                        <button class="btn btn-solid-default btn-sm fw-bold filter-btn">Show Menu</button>
                    </div>
                    <!-- 우측 내용 시작 -->
                    <div class="tab-content" id="myTabContent">
                        <!-- 청구요금 페이지 start -->
                            <div class="tab-pane fade show active" id="dash">
                                <div class="dashboard-right">
                                    <div class="dashboard">
                                        <div class="page-title title title1 title-effect">
                                            <h2>요금 청구/납부</h2>
                                        </div>
                                        <div class="box-account box-info mb-5 ">
                                            <h3>회선 정보</h3>
                                            <div class="box-head">
                                            </div>
                                            <div class="row">
                                                <div class="col-md-10">
                                                    <div class="box">
                                                        <div class="box-title d-flex">
                                                            <h5 class="me-1">대표회선</h5>
                                                            <c:forEach items="${TPList}" var="telephoneVO">
                                                            	<c:if test="${telephoneVO.kingCheck eq 1}">
                                                            		<c:set var="phoneNum" value="${telephoneVO.phoneNum}" />
	                                                                <c:set var="formattedPhoneNum" value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7,11)}" />
	                                                                <h6 class="font-light me-3">${formattedPhoneNum}</h6>
	                                                                <h5 class="me-1">요금제</h5>
		                                                            <h6 class="font-light me-3">
		                                                                ${telephoneVO.planVO.planName}
		                                                            </h6>
		                                                            <h5 class="me-1">납부 예정 금액</h5>
		                                                            <h6 class="font-light me-3" id="totalUnpaid">
		                                                                
		                                                            </h6>
                                                            	</c:if>
                                                            </c:forEach>
                                                            <%-- <c:if test="${not empty kingTP}">
                                                                <c:set var="phoneNum" value="${kingTP.PHONENUM}" />
                                                                <c:set var="formattedPhoneNum" value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7,11)}" />
                                                                <h6 class="font-light me-3">${formattedPhoneNum}</h6>
                                                            </c:if>
                                                            <h5 class="me-1">요금제</h5>
                                                            <h6 class="font-light me-3">
                                                                ${kingTP.PLANNAME}
                                                            </h6>
                                                            <h5 class="me-1">납부 예정 금액</h5>
                                                            <h6 class="font-light me-3" id="totalUnpaid">
                                                                
                                                            </h6> --%>
                                                        </div>                                    
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                        <div class="d-flex justify-content-end">
                                                        <button type="button" id="insPayment" class="btn btn-solid-default btn-sm fw-bold ms-auto" onclick="location.href = './instantPay';">즉시 납부</button>
                                                        <!-- onclick="location.href = '../invoice/invoice-3-baro.html';" -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
 
                                        <div class="cloth-review mb-3">
                                            <nav>
                                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                                        data-bs-target="#napboo" type="button">납부 내역</button>
                                                    <button class="nav-link" id="nav-speci-tab" data-bs-toggle="tab" data-bs-target="#minap"
                                                        type="button">미납 내역</button>
                                                </div>
                                            </nav>
                                        </div>
                                        <!-- 대표회선의 내용 출력 -->
                                        <!-- 납부/미납 tab start -->
                                        <div class="tab-content" id="nav-tabContent">
                                        <!-- 납부내역 tab start -->   
                                            <div class="tab-pane fade show active" id="napboo">
                                                <div class="table-responsive">
                                                    <table class="table cart-table">
                                                        <thead>
                                                            <tr class="table-head">
                                                                <th scope="col">청구번호</th>
                                                                <th scope="col">청구 월</th>
                                                                <th scope="col">납부일</th>
                                                                <th scope="col">납부금액</th>
                                                                <th scope="col">납부내역</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <!-- 납부금액 출력부 -->
                                                            <!-- list안의 list 값 꺼내기 -->
                                                            <c:forEach items="${TPList}" var="telephoneVO">
                                                            	<c:if test="${telephoneVO.kingCheck eq 1}">
                                                            	<c:forEach items="${telephoneVO.billVOs}" var="billVO">
                                                            		<c:if test="${billVO.billCheck eq 1 && billVO.paidCheck eq 1}">
	                                                        		<tr>
	                                                                    <td>
	                                                                        <p class="m-0" style="color: black;">${billVO.billNum}</p>
	                                                                    </td>
	                                                                    <td>
	                                                                        <p class="m-0" style="color: black;">20${billVO.payMonth}</p>
	                                                                    </td>
	                                                                    <td>
	                                                                        <p class="m-0" style="color: black;">${billVO.paidDate}</p>
	                                                                    </td>
	                                                                    <td>
	                                                                        <p class="m-0" style="color: #e22454;"><fmt:formatNumber value="${billVO.totalPrice}" pattern="#,### 원"/></p>
	                                                                    </td>
	                                                                    <td>
	                                                                    	<!-- 영수증 발급이 가능하면 보여주기 -->
	                                                                        <!-- <a href="#" class="btn btn-light btn-sm">발급</a> -->
	                                                                    </td>
	                                                                </tr>
                                                            		</c:if>
                                                            	</c:forEach>
                                                            	</c:if>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <!-- Pagination Box Start -->
                                                    <!-- <nav class="page-section">
                                                        <ul class="pagination">
                                                            <li class="page-item">
                                                                <a class="page-link" href="javascript:void(0)" aria-label="Previous">
                                                                    <span aria-hidden="true">
                                                                        <i class="fas fa-chevron-left"></i>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                            <li class="page-item active">
                                                                <a class="page-link" href="javascript:void(0)">1</a>
                                                            </li>
                                                            <li class="page-item">
                                                                <a class="page-link" href="javascript:void(0)">2</a>
                                                            </li>
                                                            <li class="page-item">
                                                                <a class="page-link" href="javascript:void(0)">3</a>
                                                            </li>
                                                            <li class="page-item">
                                                                <a class="page-link" aria-label="Next">
                                                                    <span aria-hidden="true">
                                                                        <i class="fas fa-chevron-right"></i>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </nav> -->
                                                    <!-- Pagination Box End -->
                                                </div>
                                            </div> 
                                            <!-- 납부내역 end -->
                                            <!-- 미납내역 tab start -->
                                            <div class="tab-pane fade" id="minap">
                                                <div class="table-responsive">
                                                    <table class="table cart-table">
                                                        <thead>
                                                            <tr class="table-head">
                                                                <th scope="col">미납월</th>
                                                                <th scope="col">미납금액</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <!-- 미납 금액 출력부 -->
                                                            <c:forEach items="${TPList}" var="telephoneVO">
                                                            	<c:if test="${telephoneVO.kingCheck eq 1}">
                                                            	<c:forEach items="${telephoneVO.billVOs}" var="billVO">
                                                            		<c:if test="${billVO.billCheck eq 1 && billVO.paidCheck eq 0}">
	                                                        		<tr>
	                                                                    <td>
	                                                                        <p class="m-0" style="color: black;">20${billVO.payMonth}</p>
	                                                                    </td>
	                                                                    <td>
	                                                                        <p class="m-0 unpaid" style="color: #e22454;"><fmt:formatNumber value="${billVO.totalPrice}" pattern="#,### 원"/></p>
	                                                                    </td>
	                                                                </tr>
                                                            		</c:if>
                                                            	</c:forEach>
                                                            	</c:if>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <!-- Pagination Box Start -->
                                                    <!-- <nav class="page-section">
                                                        <ul class="pagination">
                                                            <li class="page-item">
                                                                <a class="page-link" href="javascript:void(0)" aria-label="Previous">
                                                                    <span aria-hidden="true">
                                                                        <i class="fas fa-chevron-left"></i>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                            <li class="page-item active">
                                                                <a class="page-link" href="javascript:void(0)">1</a>
                                                            </li>
                                                            <li class="page-item">
                                                                <a class="page-link" href="javascript:void(0)">2</a>
                                                            </li>
                                                            <li class="page-item">
                                                                <a class="page-link" href="javascript:void(0)">3</a>
                                                            </li>
                                                            <li class="page-item">
                                                                <a class="page-link" aria-label="Next">
                                                                    <span aria-hidden="true">
                                                                        <i class="fas fa-chevron-right"></i>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </nav> -->
                                                    <!-- Pagination Box End -->
                                                </div>
                                            </div>
                                            <!-- 미납내역 tab end -->
                                        </div>
                                        <!-- 납부 미납내역 tab 부모 div end -->
                                    </div>
                                </div>
                            </div>
                            <!-- 청구요금 end -->

                            <!-- 주문내역 start -->
                            <div class="tab-pane fade table-dashboard dashboard wish-list-section" id="order">
                                <div class="page-title title title1 title-effect">
                                    <h2>주문 내역</h2>
                                </div>
                                <div class="table-responsive">
                                    <table class="table cart-table">
                                        <thead>
                                            <tr class="table-head">
                                                <th scope="col">주문번호</th>
                                                <th scope="col">상품명</th>
                                                <th scope="col">주문 날짜</th>
                                                <th scope="col">결제액</th>
                                                <th scope="col">상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <a href="../invoice/invoice-3-order.html" class="theme-color fs-6">#125</a>
                                                </td>
                                                <td>
                                                    <p class="fs-6 ">Outwear & Coats 외 1개</p>
                                                </td>
                                                <td>
                                                    <p class="fs-6">2023/05/23</p>
                                                </td>
                                                <td>
                                                    <p class="fs-6">$49.54</p>
                                                </td>
                                                <td>
                                                    <p class="success-button btn btn-sm">배송 완료</p>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <a href="../invoice/invoice-3-order.html" class="theme-color fs-6">#126</a>
                                                </td>
                                                <td>
                                                    <p class="fs-6 ">Outwear & Coats 외 3개</p>
                                                </td>
                                                <td>
                                                    <p class="fs-6">2023/05/23</p>
                                                </td>
                                                <td>
                                                    <p class="fs-6">$53.54</p>
                                                </td>
                                                <td>
                                                    <p class="danger-button btn btn-sm">환불</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- Pagination Box Start -->
                                    <nav class="page-section">
                                        <ul class="pagination">
                                            <li class="page-item">
                                                <a class="page-link" href="javascript:void(0)" aria-label="Previous">
                                                    <span aria-hidden="true">
                                                        <i class="fas fa-chevron-left"></i>
                                                    </span>
                                                </a>
                                            </li>
                                            <li class="page-item active">
                                                <a class="page-link" href="javascript:void(0)">1</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="javascript:void(0)">2</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="javascript:void(0)">3</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" aria-label="Next">
                                                    <span aria-hidden="true">
                                                        <i class="fas fa-chevron-right"></i>
                                                    </span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                    <!-- Pagination Box End -->
                                </div>
                            </div>
                            <!-- 주문내역 end -->

                        <!-- 문의내역 start -->
                        <div class="tab-pane fade table-dashboard" id="wishlist">
                            <div class="dashboard-right">
                                <div class="dashboard">
                                        <div class="page-title title title1 title-effect">
                                            <h2>문의 내역</h2>
                                        </div>
                                        <!-- 일반문의 / 상품문의 내역 tab nav start -->
                                        <div class="cloth-review mb-3">
                                            <nav>
                                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                                        data-bs-target="#desc" type="button">일반 문의 내역</button>
                    
                                                    <button class="nav-link" id="nav-speci-tab" data-bs-toggle="tab" data-bs-target="#speci"
                                                        type="button">상품 문의 내역</button> 
                                                </div>
                                            </nav>
                                        </div>     
                                        <!-- 일반문의 / 상품문의 내역 tab nav end -->   

                                    <!-- *** start -->
                                    <div class="tab-content" id="nav-tabContent">
                                        <!--  일반 문의 내역 start-->
                                        <div class="tab-pane fade show active" id="desc">
                                            <div class="table-responsive">
                                                <table class="table cart-table">
                                                    <thead>
                                                        <tr class="table-head">
                                                            <th scope="col">구분</th>
                                                            <th scope="col">제목</th>
                                                            <th scope="col">작성 날짜</th>
                                                            <th scope="col">상태</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <p class="m-0" style="color: black;">서류</p>
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0)" data-bs-toggle="modal"
                                                                data-bs-target="#qnaModal" class="m-0">입영 통지서 서류 제출하면 군인 요금제 사용할수 있나요?</a>
                                                            </td>
                                                            <td>
                                                                <p class="m-0">2023/05/23</p>
                                                            </td>
                                                            <td>
                                                                <p class="m-0" style="color: #e22454;">답변 대기</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <p class="m-0" style="color: black;">계정</p>
                                                            </td>
                                                            <td>
                                                                <a href="#" class="m-0">계정 문의 합니다.</a>
                                                            </td>
                                                            <td>
                                                                <p class="m-0">2023/05/20</p>
                                                            </td>
                                                            <td>
                                                                <p class="m-0" style="color: #e22454;">답변 완료</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <p class="m-0" style="color: black;">청구/납부</p>
                                                            </td>
                                                            <td>
                                                                <a href="#" class="m-0">금액이 왜 이렇게 나오죠?</a>
                                                            </td>
                                                            <td>
                                                                <p class="m-0">2023/05/19</p>
                                                            </td>
                                                            <td>
                                                                <p class="m-0" style="color: #e22454;">답변 완료</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <p class="m-0" style="color: black;">요금제</p>
                                                            </td>
                                                            <td>
                                                                <a href="#" class="m-0">이 요금제 쓰는게 지금것보다 낫나요?</a>
                                                            </td>
                                                            <td>
                                                                <p class="m-0">2023/05/18</p>
                                                            </td>
                                                            <td>
                                                                <p class="m-0" style="color: #e22454;">답변 완료</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <p class="m-0" style="color: black;">불만</p>
                                                            </td>
                                                            <td>
                                                                <a href="#" class="m-0">왜 그따구로 일하세요?</a>
                                                            </td>
                                                            <td>
                                                                <p class="m-0">2023/05/17</p>
                                                            </td>
                                                            <td>
                                                                <p class="m-0" style="color: #e22454;">답변 완료</a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <nav class="page-section">
                                                    <ul class="pagination">
                                                        <li class="page-item">
                                                            <a class="page-link" href="javascript:void(0)" aria-label="Previous">
                                                                <span aria-hidden="true">
                                                                    <i class="fas fa-chevron-left"></i>
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li class="page-item active">
                                                            <a class="page-link" href="javascript:void(0)">1</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="javascript:void(0)">2</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="javascript:void(0)">3</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" aria-label="Next">
                                                                <span aria-hidden="true">
                                                                    <i class="fas fa-chevron-right"></i>
                                                                </span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                        <!-- 일반문의내역 tab end -->

                                        <!-- 상품문의내역 tab start -->
                                        <div class="tab-pane fade" id="speci">
                                            <div class="table-responsive">
                                                <table class="table cart-table">
                                                    <thead>
                                                        <tr class="table-head">
                                                            <th scope="col">상품명</th>
                                                            <th scope="col">제목</th>
                                                            <th scope="col">작성 날짜</th>
                                                            <th scope="col">상태</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <a href="#" class="m-0" style="color: black;">아이폰14</a>
                                                            </td>                                                 
                                                            <td>
                                                                <a href="#" class="m-0">이거 재고 언제들어와요?</a>
                                                            </td>
                                                            <td>
                                                                <p class="m-0" style="color: black;">2023/05/23</p>
                                                            </td>
                                                            <td>
                                                                <p class="m-0" style="color: #e22454;">답변 대기</p>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <a href="#" class="m-0" style="color: black;">아이폰14</a>
                                                            </td>                                                 
                                                            <td>
                                                                <a href="#" class="m-0">이거 재고 언제들어와요?</a>
                                                            </td>
                                                            <td>
                                                                <p class="m-0" style="color: black;">2023/05/23</p>
                                                            </td>
                                                            <td>
                                                                <p class="m-0" style="color: #e22454;">답변 완료</p>
                                                            </td>
                                                        </tr>
                                                        
                                                    </tbody>
                                                </table>
                                                <nav class="page-section">
                                                    <ul class="pagination">
                                                        <li class="page-item">
                                                            <a class="page-link" href="javascript:void(0)" aria-label="Previous">
                                                                <span aria-hidden="true">
                                                                    <i class="fas fa-chevron-left"></i>
                                                                </span>
                                                            </a>
                                                        </li>
                                                        <li class="page-item active">
                                                            <a class="page-link" href="javascript:void(0)">1</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="javascript:void(0)">2</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="javascript:void(0)">3</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a class="page-link" aria-label="Next">
                                                                <span aria-hidden="true">
                                                                    <i class="fas fa-chevron-right"></i>
                                                                </span>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                        <!-- 상품문의내역 tab end -->
                                    </div>
                                    <!-- *** end -->
                                </div>
                            </div>
                        </div>
                        <!-- 문의내역 end -->
                        
                        <!-- 회선관리 start -->
                        <div class="tab-pane fade dashboard" id="save">
                            <div class="box-head">
                                <div class="page-title title title1 title-effect">
                                    <h2>회선 관리</h2>
                                </div>                                
                                <!-- <button class="btn btn-solid-default btn-sm fw-bold ms-auto" data-bs-toggle="modal"
                                    data-bs-target="#addNumber">
                                    회선 등록</button> -->
                            </div>
                            <!-- 회선 리스트 start -->
                            <div class="save-details-box">
                                <div class="row g-3">
                                
                                <c:forEach items="${TPList}" var="telephoneVO" varStatus="i">
                                <c:choose>
                                	<c:when test="${telephoneVO.kingCheck eq 1}">
                                		<div class="col-xl-4 col-md-6">
                                            <div class="save-details">
                                                <div class="save-name">
                                                	<c:set var="phoneNum" value="${telephoneVO.phoneNum}" />
                                                    <c:set var="formattedPhoneNum" value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7,11)}" />
                                                    <h5>${formattedPhoneNum}</h5>
                                                    <div class="save-position">
                                                        <h6>대표회선</h6>
                                                    </div>
                                                </div>
                                                <div class="save-address">
                                                    <p class="font-light">요금제 : ${telephoneVO.planVO.planName}</p>
                                                    <p class="font-light">기기명 : ${telephoneVO.directName}</p>
                                                    <p class="font-light">개통일 : ${telephoneVO.startDate}</p>
                                                </div>

                                                <div class="page-view-filter">
                                                    <div class="button">
                                                        <a href="javascript:void(0)" class="btn btn-sm" 
                                                        id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">설정</a>
                                                    
                                                        <ul class="dropdown-menu col-md-6" aria-labelledby="dropdownMenuButton1">
                                                            <li>
                                                                <a class="dropdown-item numChange" href="javascript:void(0)" data-bs-toggle="modal"
                                                                data-bs-target="#changeNumber">번호 변경</a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="javascript:void(0)" data-bs-toggle="modal"
                                                                data-bs-target="#stopModal">일시정지</a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="javascript:void(0)" data-bs-toggle="modal"
                                                                data-bs-target="#cancelModal">해지</a>
                                                            </li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                	</c:when>
                                </c:choose>
                                	<c:if test="${telephoneVO.kingCheck eq 0}">
                                	<div class="col-xl-4 col-md-6">
                                            <div class="save-details">
                                                <div class="save-name">
                                                    <c:set var="phoneNum" value="${telephoneVO.phoneNum}" />
                                                    <c:set var="formattedPhoneNum" value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7,11)}" />
                                                    <h5>${formattedPhoneNum}</h5>
                                                </div>

                                                <div class="save-address">
                                                    <p class="font-light">요금제 : ${telephoneVO.planVO.planName}</p>
                                                    <p class="font-light">기기명 : ${telephoneVO.directName}</p>
                                                    <p class="font-light">개통일 : ${telephoneVO.startDate}</p>
                                                </div>

                                                <div class="page-view-filter">
                                                    <div class="button">
                                                        <a href="javascript:void(0)" class="btn btn-sm" 
                                                        id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">설정</a>
                                                    
                                                        <ul class="dropdown-menu col-md-6" aria-labelledby="dropdownMenuButton1">
                                                            <li>
                                                                <a class="dropdown-item" href="javascript:void(0)"  data-bs-toggle="modal"
                                                                data-bs-target="#kingModal">대표회선 설정</a>
                                                            </li>
                                                            <!-- <li>
                                                                <a class="dropdown-item" href="javascript:void(0)">번호 변경</a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="javascript:void(0)">일시정지</a>
                                                            </li>
                                                            <li>
                                                                <a class="dropdown-item" href="javascript:void(0)">해지</a>
                                                            </li> -->

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                	</c:if>
                                </c:forEach>
                                
                                    <!-- 대표회선 card start -->
                                        
                                    <!-- 대표회선 card end -->
                                    <!-- 일반회선1 card start -->
                                        
                                        <!-- 일반회선1 card end -->
                                        <!-- 일반회선2 card start -->
                                        <!-- 일반회선2 card end -->
                                    </div>
                                </div>
                                <!-- 회선 리스트 end -->
                            </div>
                            <!-- 회선 관리 end -->

                            <!-- 구매후기 start  -->
                            <div class="tab-pane fade dashboard" id="pay">
                                <div class="box-head">
                                    <div class="page-title title title1 title-effect">
                                        <h2>구매 후기</h2>
                                    </div>                                
                                </div>
                                <div class="save-details-box">
                                    <div class="row g-3">
                                        <div class="col-xl-4 col-md-6">
                                            <div class="save-details">
                                                <div class="save-name">
                                                    <h5>2023/05/23</h5>
                                                </div>
                                                <div class="save-address mb-2">
                                                    <p class="font-light">
                                                        <ul class="rating p-0 mb-2">
                                                        <li>
                                                            <i class="fas fa-star theme-color"></i>
                                                        </li>
                                                        <li>
                                                            <i class="fas fa-star theme-color"></i>
                                                        </li>
                                                        <li>
                                                            <i class="fas fa-star theme-color"></i>
                                                        </li>
                                                        <li>
                                                            <i class="fas fa-star"></i>
                                                        </li>
                                                        <li>
                                                            <i class="fas fa-star"></i>
                                                        </li>
                                                    </ul></p>
                                                    <p class="font-light">아이폰14</p>
                                                    <p class="font-light">배송도 빠르고 핸드폰도 좋아용</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-4 col-md-6">
                                            <div class="save-details">
                                                <div class="save-name">
                                                    <h5>2023/05/23</h5>
                                                </div>
                                                <div class="save-address mb-2">
                                                    <p class="font-light">
                                                        <ul class="rating p-0 mb-2">
                                                        <li>
                                                            <i class="fas fa-star theme-color"></i>
                                                        </li>
                                                        <li>
                                                            <i class="fas fa-star theme-color"></i>
                                                        </li>
                                                        <li>
                                                            <i class="fas fa-star theme-color"></i>
                                                        </li>
                                                        <li>
                                                            <i class="fas fa-star"></i>
                                                        </li>
                                                        <li>
                                                            <i class="fas fa-star"></i>
                                                        </li>
                                                    </ul></p>
                                                    <p class="font-light">아이폰14</p>
                                                    <p class="font-light">배송도 빠르고 핸드폰도 좋아용 배송도 빠르고 핸드폰도 좋아용 배송도 빠르고 핸드폰도 좋아용 배송도 빠르고 핸드폰도 좋아용</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <!-- 구매후기 end -->

                        <!-- 가입정보 start -->
                        <div class="tab-pane fade dashboard-profile dashboard" id="profile">
                                <div class="page-title title title1 title-effect">
                                    <h2>가입 정보</h2>
                                </div>
                                <ul class="dash-profile">
                                    <li>
                                        <div class="left">
                                            <h6 class="font-light">이름</h6>
                                        </div>
                                        <div class="right">
                                            <h6>${memberVO.name}</h6>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="left">
                                            <h6 class="font-light">이메일 (ID)</h6>
                                        </div>
                                        <div class="right">
                                            <h6>${memberVO.email}</h6>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="left">
                                            <h6 class="font-light">연락처</h6>
                                        </div>
                                        <div class="right">
                                            <h6>${memberVO.tel}</h6>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="left">
                                            <h6 class="font-light">생년월일</h6>
                                        </div>
                                        <div class="right">
                                            <c:if test="${not empty memberVO}">
                                                <c:set var="birth" value="${memberVO.rrnf}"/>
                                                <c:set var="formattedbirth" value="${fn:substring(birth, 0, 2)}/${fn:substring(birth, 2, 4)}/${fn:substring(birth, 4, 6)}" />
                                                <h6 class="font-light">${formattedbirth}</h6>
                                            </c:if>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="left">
                                            <h6 class="font-light">주소</h6>
                                        </div>
                                        <div class="right">
                                        
                                            <h6>(${memberVO.address1}) ${memberVO.address2}, ${memberVO.address3}</h6>
                                        </div>
                                    </li>
                                    
                                    <li class="justify-content-center mt-5">                                    
                                        <button class="btn btn-solid-default btn-sm fw-bold ms-auto" data-bs-toggle="modal" data-bs-target="#resetPassword" style="margin-right: 5px">비밀번호 변경</button>
                                        <button class="btn btn-solid-default btn-sm fw-bold" data-bs-toggle="modal" data-bs-target="#resetInfo">정보 변경</button>
                                    </li>
                                </ul>
                            </div>
                        <!-- 가입정보 end -->

                        <!-- 회원탈퇴 start -->
                        <div class="tab-pane fade dashboard-security dashboard" id="security">
                            <div class="box-head">
                                <h3>회원 탈퇴</h3>
                            </div>
                            <div class="security-details">
                                <h5 class="font-light mt-3">안녕하세요 <span> ${memberVO.name}님 </span>
                                </h5>
                                <p class="font-light mt-1">회원 탈퇴를 원하신다면 아래 항목을 확인 해주세요.
                                </p>
                            </div>
                            <div class="security-details-1 mb-0">
                                <div class="page-title">
                                    <h4 class="fw-bold">주의 사항</h4>
                                </div>
                                <p class="font-light">회원을 탈퇴하면 회원 관련 정보가 영구적으로 제거됩니다. 회원 탈퇴를 하게 되면 로그아웃되며 다시 로그인할 수 없습니다.</p>

                                <p class="font-light mb-4">위의 내용을 이해하고 동의하며 여전히 회원 탈퇴를 원하시면 아래를 클릭하십시오.

                                </p>

                                <button class="btn btn-solid-default btn-sm fw-bold rounded" data-bs-toggle="modal"
                                    data-bs-target="#deleteModal">회원 탈퇴</button>
                            </div>
                        </div>
                        <!-- 회원탈퇴 end -->
                    </div>
                    <!-- 우측 내용 끝 -->
                </div>
                <!-- 우측 내용 영역 끝 -->

            </div>
        </div>
    </section>
    <!-- user dashboard section end -->

    <!-- 비밀번호 수정 Modal Start -->
    <div class="modal fade add-address-modal" id="resetPassword">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form:form action="./updatePw" id="updatePwForm" method="post" modelAttribute="memberVO">
                        <div class="mb-3">
                            <label for="pw" class="form-label font-light">변경할 비밀번호</label>
                            <input type="password" class="form-control" id="pw" name="pw">
                        </div>
                        <div>
                            <label for="pwCheck" class="form-label font-light">변경할 비밀번호 확인</label>
                            <input type="password" class="form-control" id="pwCheck">
                        </div>
                        <div class="modal-footer pt-0 text-end d-block">		                    
                            <button id="updatePwBtn" class="update_pw btn btn-solid-default rounded-1" type="button">수정</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
    <!-- 비밀번호 수정 Modal End -->
    
    
    <!-- 가입 정보 수정 Modal Start -->
    <div class="modal fade add-info-modal" id="resetInfo">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="submit" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                	<form:form action="./updateInfo" id="updateInfoForm" method="post" modelAttribute="memberVO">                    
                        <!-- <div class="mb-3">
                            <label for="name" class="form-label font-light">이름</label>
                            <input type="text" class="form-control" id="name" name="name" readonly="readonly" value="${memberVO.name}">
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label font-light">이메일(아이디)</label>
                            <input type="email" class="form-control" id="email" name="email" readonly="readonly" value="${memberVO.email}">
                        </div>
                        <div class="mb-3">
                            <label for="rrnf" class="form-label font-light">생년월일</label>
                            <input type="text" class="form-control" id="rrnf" name="rrnf" readonly="readonly" value="${memberVO.rrnf}">
                        </div> -->
                        <div class="mb-3">
                            <label for="tel" class="form-label font-light">연락처</label>
                            <input type="text" class="form-control" id="tel" name="tel" placeholder="연락가능한 연락처를 입력해주세요" value="${memberVO.tel}">
                        </div>
                        <div id="telResult">
                        </div>
                        <div class="mb-3 row">
                            <label for="address1" class="form-label font-light">우편번호</label>
                            <div class="col-9">
                                <input type="text" class="form-control address_input_1" id="address1" name="address1" readonly="readonly" value="${memberVO.address1}">
                            </div>
                            <button class="col-3 row btn btn-solid-default btn-sm fw-bold" type="button" onclick="execution_daum_address()">
								<span>주소 찾기</span>
							</button>
						</div>
						
                        <div class="mb-3">
                            <label for="address2" class="form-label font-light">도로명주소</label>
                            <input type="text" class="form-control address_input_2" id="address2" name="address2" readonly="readonly" value="${memberVO.address2}">
                        </div>
                        <div class="mb-3">
                            <label for="address3" class="form-label font-light">상세주소</label>
                            <input type="text" class="form-control address_input_3" id="address3" name="address3" value="${memberVO.address3}">
                        </div>
                        <div class="modal-footer pt-0 text-end d-block">
                            <button id="updateInfoBtn" class="update_info btn btn-solid-default rounded-1" type="button">수정</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
    <!-- 비밀번호 수정 Modal End -->

    <!-- Add Number Modal Start -->
    <div class="modal fade payment-modal" id="addNumber">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-4">
                            <label for="card" class="form-label">추가 회선 번호</label>
                            <input type="text" class="form-control" id="card" placeholder="번호만 입력하세요">
                        </div>
                    </form>
                </div>
                <div class="modal-footer pt-0 text-end d-block">
                    <button class="btn btn-solid-default rounded-1" data-bs-dismiss="modal">추가</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Add number Modal End -->

    <!-- qna Modal Start -->
    <div class="modal fade payment-modal" id="qnaModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                        <div class="mb-4">
                            <h5>
                                제목 : 입영 하게 됐는데 
                                <div class="mt-2">
                                내용 : 군대 가게되었는데 되나요????  군대 가게되었는데 되나요???? 군대 가게되었는데 되나요????
                                군대 가게되었는데 되나요???? 군대 가게되었는데 되나요???? 군대 가게되었는데 되나요???? 군대 가게되었는데 되나요????
                                군대 가게되었는데 되나요???? 군대 가게되었는데 되나요???? 군대 가게되었는데 되나요????
                                </div> 
                            </h5>
                        </div>
                    <div class="my-3" style="color: #e22454;">
                        답변입니다.
                        <br>
                        안녕하세요 고객님. 서류 제출해주시면 확인하겠습니다. 감사합니다.
                    </div>
                </div>
                <div class="modal-footer pt-0 text-end d-block">
                    <button class="btn btn-solid-default rounded-1" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- qna Modal End -->

     <!-- 설정 - 번호변경 Start -->
     <div class="modal fade payment-modal" id="changeNumber">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="./changeNumber" method="post">
                        <div class="mb-4">
                            <label for="numChangeValue" class="form-label">번호 변경</label>
                            <input type="text" class="form-control" id="numChangeValue" name="phoneNum" placeholder="번호만 입력하세요">
                            <input type="hidden" id="checkAllowed">
                            <div class="my-2" id="searchResult">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer pt-0 text-end d-block">
                    <button class="btn btn-solid-default rounded-1" id="executiveChangeNumber" data-bs-toggle="modal" data-bs-dismiss="modal">변경</button>
                    <!-- data-bs-target="#changeDoneModal"  -->
                </div>
            </div>
        </div>
    </div>
    <!-- 번호 변경 확인 -->
    <div class="modal delete-account-modal fade" id="changeDoneModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body pb-3 text-center mt-4">
                    <h4>번호가 변경되었습니다.</h4>
                </div>
                <div class="modal-footer d-block text-center mb-4">
                    <button class="btn btn-solid-default btn-sm fw-bold rounded" data-bs-target="#exampleModalToggle"
                        data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 설정 - 번호변경 End -->

     <!-- change king Number Modal Start -->
     <div class="modal fade payment-modal" id="kingModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                대표회선 설정
                <c:forEach items="${TPList}" var="telephoneVO">
                	<c:if test="${telephoneVO.kingCheck eq 0}">
	                    <div class="form-check mt-2">
	                    <input class="form-check-input" type="radio" name="phoneNum" id="flexRadioDefault1">
	                        <label class="form-check-label" for="flexRadioDefault1">
	                            <c:set var="phoneNum" value="${telephoneVO.phoneNum}" />
                                <c:set var="formattedPhoneNum" value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7,11)}" />
                                ${formattedPhoneNum}
	                        </label>
	                    </div>
                    </c:if>
                </c:forEach>
                </div>
                <div class="modal-footer pt-0 text-end d-block">
                    <button class="btn btn-solid-default rounded-1" data-bs-target="#kingchangeDoneModal" data-bs-toggle="modal" data-bs-dismiss="modal">변경</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal delete-account-modal fade" id="kingchangeDoneModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body pb-3 text-center mt-4">
                    <h4>대표 회선이 변경되었습니다.</h4>
                </div>
                <div class="modal-footer d-block text-center mb-4">
                    <button class="btn btn-solid-default btn-sm fw-bold rounded" data-bs-target="#exampleModalToggle"
                        data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- change king number Modal End -->

    <!-- Comfirm Delete Modal Start -->
    <div class="modal delete-account-modal fade" id="deleteModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body pb-3 text-center mt-4">
                    <h4>정말로 회원을 탈퇴하시겠습니까?</h4>
                </div>
                <div class="modal-footer d-block text-center mb-4">
                    <button class="btn btn-solid-default btn-sm fw-bold rounded" data-bs-target="#doneModal"
                        data-bs-toggle="modal" data-bs-dismiss="modal">탈퇴</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal delete-account-modal fade" id="doneModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body pb-3 text-center mt-4">
                    <h4>계정이 삭제되었습니다.</h4>
                </div>
                <div class="modal-footer d-block text-center mb-4">
                    <button class="btn btn-solid-default btn-sm fw-bold rounded" data-bs-target="#exampleModalToggle"
                        data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Comfirm Delete Modal End -->


    <!-- Comfirm stop Modal Start -->
    <div class="modal delete-account-modal fade" id="stopModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body pb-3 text-center mt-4">
                    <h4>일시정지 신청 다음날부터 일시정지 됩니다. <br>회선을 일시정지 하시겠습니까?</h4>
                    <h6 class="mt-4">일시정지 요금 : 3650원/달</h6>
                </div>
                <div class="modal-footer d-block text-center mb-4">
                    <button class="btn btn-solid-default btn-sm fw-bold rounded" data-bs-target="#stopDoneModal"
                    data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal delete-account-modal fade" id="stopDoneModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body pb-3 text-center mt-4">
                    <h4>회선이 일시정지 되었습니다.</h4>
                </div>
                <div class="modal-footer d-block text-center mb-4">
                    <button class="btn btn-solid-default btn-sm fw-bold rounded" data-bs-target="#exampleModalToggle"
                        data-bs-toggle="modal" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Comfirm stop Modal End -->

    <!-- Comfirm cancel Modal Start -->
    <div class="modal delete-account-modal fade" id="cancelModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body pb-3 text-center mt-4">
                    <h4>해지 전 잔여 요금 결제 페이지로 이동됩니다.</h4>
                </div>
                <div class="modal-footer d-block text-center mb-4">
                    <button class="btn btn-solid-default btn-sm fw-bold rounded" data-bs-dismiss="modal" onclick="location.href = '../invoice/invoice-3-pay.html';" >확인</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Comfirm stop Modal End -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/assets/js/myPage.js"></script>
<script>
let path = "${pageContext.request.contextPath}";
$(document).ready(function(){
    //메시지 출력 - 이거 필요없으면 document.ready 여긴 없애고 js에 넣기
    let msg = "${msg}";
	if(msg != ""){
        alert(msg);    
	}
})
</script>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>