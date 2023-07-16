<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <!-- tap on top start -->
    <div class="tap-top">
        <span class="lnr lnr-chevron-up"></span>
    </div>
    <!-- tap on tap end -->

    <!-- page-wrapper Start-->
    <div class="page-wrapper compact-wrapper dark-sidebar" id="pageWrapper">
        <!-- Page Header Start-->
        <div class="page-header">
            <div class="header-wrapper row m-0">
                <div class="header-logo-wrapper col-auto p-0">
                    <div class="logo-wrapper">
                        <a href="index.html">
                            <img class="img-fluid main-logo" src="/admin/images/logo/logo.png" alt="logo">
                            <img class="img-fluid white-logo" src="/admin/images/logo/logo-white.png" alt="logo">
                        </a>
                    </div>
                    <div class="toggle-sidebar">
                        <i class="status_toggle middle sidebar-toggle" data-feather="align-center"></i>
                    </div>
                </div>

                <form class="form-inline search-full col" action="javascript:void(0)" method="get">
                    <!-- <div class="form-group w-100">
                        <div class="Typeahead Typeahead--twitterUsers">
                            <div class="u-posRelative">
                                <input class="demo-input Typeahead-input form-control-plaintext w-100" type="text"
                                    placeholder="Search Voxo .." name="q" title="" autofocus>
                                <i class="close-search" data-feather="x"></i>
                                <div class="spinner-border Typeahead-spinner" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>
                            <div class="Typeahead-menu"></div>
                        </div>
                    </div> -->
                </form>
                <div class="nav-right col-4 pull-right right-header p-0">
                    <ul class="nav-menus">
                        <li>
                            <span class="header-search">
                                <span class="lnr lnr-magnifier"></span>
                            </span>
                        </li>


                        <li>
                            <div class="mode">
                                <span class="lnr lnr-moon"></span>
                            </div>
                        </li>

                        <li class="maximize">
                            <a class="text-dark" href="javascript:void(0)!" onclick="javascript:toggleFullScreen()">
                                <span class="lnr lnr-frame-expand"></span>
                            </a>
                        </li>
                        <li class="profile-nav onhover-dropdown pe-0 me-0">
                            <div class="media profile-media">                                
                                <div class="user-name-hide media-body">
                                    <span>${memberVO.name}</span>님
                                    <p class="mb-0 font-roboto">관리자<i class="middle fa fa-angle-down"></i></p>
                                </div>
                            </div>
                            <ul class="profile-dropdown onhover-show-div">
                                <li>
                                    <a href="memberList">
                                        <i data-feather="users"></i>
                                        <span>회원 관리</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="orderList">
                                        <i data-feather="archive"></i>
                                        <span>주문 관리</span>
                                    </a>
                                </li>                                
                                <li>
                                    <a  data-bs-target="#staticBackdrop"
                                        href="/member/logout" class="d-block">
                                        <i data-feather="log-out"></i>
                                        <span>로그아웃</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Page Header Ends-->

        <!-- Page Body Start-->
        <div class="page-body-wrapper">
            <!-- Page Sidebar Start-->
            <div class="sidebar-wrapper">
                <div>
                    <div class="logo-wrapper logo-wrapper-center">
                        <a href="/" data-bs-original-title="" title="">
                            <h3>Hworld Home</h3>
                        </a>
                        <div class="back-btn">
                            <i class="fa fa-angle-left"></i>
                        </div>
                       
                    </div>
                    <div class="logo-icon-wrapper">
                        <a href="index.html">
                            <img class="img-fluid main-logo" src="/admin/images/logo/logo.png" alt="logo">
                        </a>
                    </div>
                    <nav class="sidebar-main">
                        <div class="left-arrow" id="left-arrow">
                            <i data-feather="arrow-left"></i>
                        </div>

                        <div id="sidebar-menu">
                            <ul class="sidebar-links" id="simple-bar">
                                <li class="back-btn"></li>


                                <li class="sidebar-list">
                                    <a class="sidebar-link sidebar-title link-nav" href="home">
                                        <i data-feather="home"></i>
                                        <span>홈</span>
                                    </a>
                                </li>

                                <li class="sidebar-list">
                                    <a class="sidebar-link sidebar-title" href="javascript:void(0)">
                                        <i data-feather="users"></i>
                                        <span>회원</span>
                                    </a>
                                    <ul class="sidebar-submenu">
                                        <li>
                                            <a href="memberList">회원 목록</a>
                                        </li>
                                        <li>
                                            <a href="phoneList">회선 목록</a>
                                        </li>                                        
                                    </ul>
                                </li>


                                <li class="sidebar-list">
                                    <a class="sidebar-link sidebar-title link-nav" href="orderList">
                                        <i data-feather="archive"></i>
                                        <span>주문</span>
                                    </a>
                                    <!-- <ul class="sidebar-submenu">
                                        <li>
                                            <a href="">Order List</a>
                                        </li>
                                        <li>
                                            <a href="order-detail.html">Order Detail</a>
                                        </li>
                                        <li>
                                            <a href="order-tracking.html">Order Tracking</a>
                                        </li>
                                    </ul> -->
                                </li>

                                <li class="sidebar-list">
                                    <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                        <i data-feather="box"></i>
                                        <span>상품</span>
                                    </a>
                                    <ul class="sidebar-submenu">
                                        <li>
                                            <a href="productList">상품 목록</a>
                                        </li>

                                        <li>
                                            <a href="productReview">상품 리뷰</a>
                                        </li>
                                    </ul>
                                </li>

                                <li class="sidebar-list">
                                    <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                        <i data-feather="phone"></i>
                                        <span>문의</span>
                                    </a>
                                    <ul class="sidebar-submenu">
                                        <li>
                                            <a href="productInquiry">상품 문의</a>
                                        </li>
                                        <li>
                                            <a href="generalInquiry">일반 문의</a>
                                        </li>
                                    </ul>
                                </li>
                        
                                <li class="sidebar-list">
                                    <a class="linear-icon-link sidebar-link sidebar-title" href="javascript:void(0)">
                                        <i data-feather="archive"></i>
                                        <span>납부</span>
                                    </a>
                                    <ul class="sidebar-submenu">
                                        <li>
                                            <a href="paymentList">납부 목록</a>
                                        </li>
                                        <li>
                                            <a href="unpaidList">미납 목록</a>
                                        </li>
                                    </ul>
                                </li>                                
                            </ul>
                        </div>
                        <div class="right-arrow" id="right-arrow">
                            <i data-feather="arrow-right"></i>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- Page Sidebar Ends-->
            
</html>    