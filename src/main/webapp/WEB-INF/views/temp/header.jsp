<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <script src="https://code.jquery.com/jquery-latest.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

    <!-- header start - 절대경로 사용 -->
    <header class="header-style-2" id="home">
        <div class="main-header navbar-searchbar">
            <div class="container-fluid-lg" style="padding-top:2%;">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-menu">
                            <div class="menu-left">
                                <div class="brand-logo">
                                    <a href="/">
                                        <svg class="svg-icon">
                                            <use class="fill-color" xlink:href="/assets/svg/icons.svg#logo"></use>
                                        </svg>
                                        <img src="/assets/images/logo.png" class="img-fluid lazyload" alt="logo">
                                    </a>
                                </div>
                            </div>
                                <nav>
                                    <div class="main-navbar">
                                        <div id="mainnav">
                                            <div class="toggle-nav">
                                                <i class="fa fa-bars sidebar-bar"></i>
                                            </div>
                                            <ul class="nav-menu">
                                                <li class="back-btn d-xl-none">
                                                    <div class="close-btn">
                                                        Menu
                                                        <span class="mobile-back"><i class="fa fa-angle-left"></i>
                                                        </span>
                                                    </div>
                                                </li>
                                                
                                                <li class="">
                                                    <a href="/plan/planList" class="nav-link menu-title fw-bold fs-6">요금제/부가서비스</a>
                                                </li>

                                                <li class="dropdown">
                                                    <a href="#" class="nav-link menu-title">
                                                        <div class="gradient-title fw-bold fs-6">Direct shop</div>
                                                    </a>
                                                    <ul class="nav-submenu menu-content fw-bold">
                                                        <li>
                                                            <a href="/direct/phoneList">휴대폰</a>
                                                        </li>
                                                        <li>
                                                            <a href="/direct/accessoryList">음향기기/악세사리</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown">
                                                    <a href="/cs/home" class="nav-link menu-title fw-bold fs-6">고객지원</a>
                                                    <ul class="nav-submenu menu-content fw-bold">
                                                        <li>
                                                            <a href="/cs/notice">공지사항</a>
                                                        </li>
                                                        <li>
                                                            <a href="/cs/qna">1:1 문의</a>
                                                        </li>
                                                        <li>
                                                            <a href="/cs/archive">자료실</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="dropdown">
                                                    <a href="#" class="nav-link menu-title fw-bold fs-6">이벤트</a>
                                                    <ul class="nav-submenu menu-content fw-bold">
                                                        <li>
                                                            <a href="/event/present">진행중인 이벤트</a>
                                                        </li>
                                                        <li>
                                                            <a href="/event/past">지난 이벤트</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <li class="">
                                                    <a href="/etc/findShop" class="nav-link menu-title fw-bold fs-6">매장찾기</a>
                                                </li>
                                                 <li class="">
                                                    <a href="/form/application" class="nav-link menu-title fw-bold fs-6">가입신청서</a>
                                                </li>
                <!-- 관리자/회원 테스트용 로그인 버튼 시작, 테스트 후 필요없으면 삭제 -->
                  <li class="dropdown">
				    <a class="nav-link menu-title fw-bold fs-6">빠른로그인</a>
				    <ul class="nav-submenu menu-content fw-bold">
				        <li>
				            <a href="javascript:void(0)" class="d-block fw-bold fs-6 me-3" id="testAdmin">관리자</a>
				        </li>
				        <li>
				            <a href="javascript:void(0)" class="d-block fw-bold fs-6 me-3" id="testMember">일반회원</a>
				        </li>
                <!-- 관리자/회원 테스트용 로그인 버튼 끝, 테스트 후 필요없으면 삭제 -->
                                            </ul>
                                        </div>
                                    </div>
                                </nav>
                                
                                    <div class="menu-right">
                                        <ul>
                                            <c:if test="${empty memberVO}">
                                            <ul>
                                                <li>
                                                    <a href="/member/login" class="d-block fw-bold fs-6 me-3">로그인</a>
                                                </li>
                                                <li>
                                                    <a href="/member/precheck" class="d-block fw-bold fs-6">회원 가입</a>
                                                </li>
                                            </ul>
											</c:if>
											<c:if test="${not empty memberVO}">
                                            <!-- 로그인 후 로그인 글씨가 user icon으로 변경되고 마이페이지로 이동할 수 있게 끔 -->
                                            <li class="onhover-dropdown">
                                                <div class="cart-media">
                                                   <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                                </div>
                                                <div class="onhover-div profile-dropdown">
                                                    <ul>
	                                                    <c:if test="${memberVO.adminCheck == 0}">
			                                            	<li>												
																<a href="/admin/home" class="d-block">관리자 페이지</a>
															</li>												
														</c:if>
                                                        <li>
                                                            <a href="/myPage/home" class="d-block">마이페이지</a>
                                                        </li>
                                                        <li>
                                                            <a href="/member/logout" class="d-block">로그아웃</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <!-- 로그인 후 회원가입 글씨가 shopping-bag으로 변경되고 장바구니로 이동할 수 있게 끔 -->
                                            <li class="onhover-dropdown cart-dropdown">
                                                <div class="cart-menu" >
                                                    <div class="cart-title" style="background-color:#fff; padding:0px;">
                                                        <h6 >
                                                           <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-bag"><path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path><line x1="3" y1="6" x2="21" y2="6"></line><path d="M16 10a4 4 0 0 1-8 0"></path></svg>
                                                            <span class="label label-theme rounded-pill">${cartCount.cartCount}</span>
                                                        </h6>
                                                    </div>
                                                    <div class="onhover-div">
                                                        <ul class="custom-scroll">
                                                            <c:forEach items="${cartInfo}" var="ci">
                                                            <li>
                                                                <div class="media">
                                                                
                                                                    <div class="media-body">
                                                                        <h6>${ci.directName}
						                                                                        
                                                                        
                                                                        </h6>
                                                                        <div class="qty-with-price">
                                                                            <span>
                                                                        <c:choose>
																	        <c:when test="${ci.colorCode == 'G'}">
																	            그레이 
																	        </c:when>
																	        <c:when test="${ci.colorCode == 'B'}">
																	            블랙
																	        </c:when>
																	        <c:when test="${ci.colorCode == 'W'}">
																	           	화이트
																	        </c:when>
																	        <c:otherwise>
																	            기타
																	        </c:otherwise>
																	    </c:choose>
                                                                            	<fmt:formatNumber value="${ci.directPrice}" pattern=" / #,### 원" />
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                </div>
                                                            </li>
                                                            </c:forEach>
                                                            <div class="cart-btn">
                                                                <button onclick="location.href = '/cart/cartInfo';" type="button"
                                                                    class="btn btn-solid-default btn-block">
                                                                    구매하기
                                                                </button>
                                                            </div>
                                                        </ul>    
                                                    </div>
                                                </div>
                                            </li>
                                            </c:if>                                            
                                        <!-- 장바구니 아이콘 드랍다운 end -->
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
    <!-- header end -->

<script>
    //테스트용 자동로그인 스크립트. 테스트 끝나면 삭제하기
    $('#testAdmin').click(function(){
        console.log("admin");
        const email = "xbigbang5@gmail.com";
        const pw = "ayxyhSiL4U";

        $.ajax({
            type: 'POST',
            url: '/member/testAdmin',
            data: {
                email: email,
                pw: pw
            },
            success: function(response) {
            // 응답 처리 로직 작성
                console.log("성공", response);
                location.reload();
            },
            error: function(error) {
            // 에러 처리 로직 작성
            console.log("실패", error);
            location.reload();
            }
        });
    })

    $('#testMember').click(function(){
        console.log("member");
        const email = "zinny@gmail.com";
        const pw = "12345";

        $.ajax({
            type: 'POST',
            url: '/member/testMember',
            data: {
                email: email,
                pw: pw
            },
            success: function(response) {
            // 응답 처리 로직 작성
                console.log("성공", response);
                location.reload();
            },
            error: function(error) {
            // 에러 처리 로직 작성
            console.log("실패", error);
            location.reload();
            }
        });
    })
</script>
</html>
