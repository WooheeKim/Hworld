<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="en">

<head>


	<meta charset="UTF-8">
    <c:import url="../temp/style.jsp"></c:import>  

    <title>요금 상세페이지</title>
 <style>
.zcustom-box {
    width: 100%;
    max-width: 80%;
    border-radius: 10px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    border: 1px solid darkgray;
    padding: 5% 3%;
    margin: 5% auto;
    background-color: fff;
    position: relative;
    display: flex;
    flex-wrap: wrap; /* 수정 */
    justify-content: space-between; /* 추가 */
    align-items: center; /* 추가 */
}

.boxone {
    width: 70%;
    height: 50%;
    padding-right: 5%;
}

.boxtwo {
    width: 30%;
}

@media (max-width: 900px) {
  .zcustom-box {
    flex-direction: column;
    align-items: flex-start;
  }

  .boxone,
  .boxtwo {
    width: 100%;
    margin-bottom: 10px;
  }
}

    

    .box{
        border:1px solid black;  
    }
    
    .zcustom-box h3 {
        color:black;
        text-align:center;
        padding-right:30%;
        margin-top:15%;
        display:block;
    }
    .zcustom-box li{
        margin-right:-1%;
  
    }
    .zcustom-box img {
    	width:90%;
        max-width:70%;
        position:relative;   
    }
    
    .zbox{
	    width:100%;
	    max-width:90%;
	    white-space: nowrap;
	    margin-left:-15%;
	    margin-top:5%;
	   	box-sizing: border-box;
    }
    
    .hbox {
        border-right: 2px lightgray solid;
        margin-left :5%; 
        margin-right :5%;  
       
        white-space: nowrap;
        display:inline-block; 
    }
    .hbox1 {
        border-right: 0px lightgray solid;
        margin-left :5%;
        display:inline-block;
        white-space: nowrap;
    }

    .modal-dialog .modal-content{
        width: 60%;
        margin-left:15%;
       	
    }
    .login-section {
        background-color: #fff;

    }

    .btn-disabled {
        pointer-events: none;
        opacity: 0.6;
        cursor: not-allowed;
    }
    
    .card-fixed-height {
	  height: 185px; /* 원하는 높이로 조정 */
	}
	.card-body {
	  display: flex;
	  flex-direction: column;
	  height: 100%;
	}
	
	.card-title,
	.masonary-name {
	  margin: 0;
	}
	
	.line-clamp {
	  display: -webkit-box;
	  -webkit-line-clamp: 2;
	  -webkit-box-orient: vertical;
	  margin-top: 0; /* 시작 위치 조정 */
	  
	}
	
	.line-clamp::before {
	  content: "";
	  display: block;
	  height: 0.1em; /* 시작 위치 조정 */
	  
	  
	}
    
    
     /* 통신사 선택 페이지 버튼 */
    .quick-view-modal .product-right .size-detail {
	    padding: 20px 0;
	    border-top: 1px dashed #ced4da; }
    @media (max-width: 575px) {
    .quick-view-modal .product-right .size-detail {
      	padding: 15px 0; } }
    .quick-view-modal .product-right .size-detail ul {
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex; }
    .quick-view-modal .product-right .size-detail ul li {
      	width: 100px;
      	height: 40px;
      	text-align: center;
      	border: 1px solid #ced4da;
      	cursor: pointer;
      	display: -webkit-box;
      	display: -ms-flexbox;
      	display: flex;
      	-webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
      	-webkit-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center; }
    .quick-view-modal .product-right .size-detail ul li.selected {
        -webkit-box-shadow: 0 2px 7px rgba(0, 0, 0, 0.2);
        box-shadow: 0 2px 7px rgba(0, 0, 0, 0.2); }
    .quick-view-modal .product-right .size-detail ul li + li {
        margin-left: 10px; }
    .form-control {
        border : 0px;
        border-bottom : 1px solid lightgray;
        border-radius: 0;
        margin: -1px 0px 3px 0px;
    }
    
    .radio-select {
    list-style: none;
    padding: 0;
}

.radio-select li {
    position: relative;
    padding-left: 30px;
    cursor: pointer;
}

.radio-select li label {
    position: absolute;
    left: 0;
    margin-top:15px;
    display: inline-block;
    width: 100%;
    height: 100%;
}

.radio-select li input[type="radio"] {
    position: absolute;
    opacity: 0;
    pointer-events: none;
}

/* 선택된 라벨에 대한 스타일링 */
.radio-select li input[type="radio"]:checked + label {
    font-weight: bold;
    color: #e22454; /* 선택된 라벨의 색상 설정 */
}

</style>
</head>

<body class="theme-color2 light ltr">
<c:import url="../temp/header.jsp"></c:import>
   
    <!-- Shop Section start -->
    <section>
        <div class="container">
        <input type="hidden" value="${param.planNum}" id="planNum1" name="planNum">
        <input type="hidden" value="${plan.planNum}" id="planNum2" name="planNum">
        <input type="hidden" id="minAge">
        <input type="hidden" id="maxAge">
            <div class="material-details">
                <div class="title title1 title-effect title-left">
                    <h2>${planNote.note}</h2>
                </div>
            </div>
                <div class="row gx-4 gy-5">
                    <div class="col-12">
                        <div class="details-items">
                            <div class="row g-4">
                                <div class="col-md-12 ">
                                <c:if test="${memberVO.adminCheck == 0 }">
                                    <div class="justify-content-start" style="margin-top:-20px;">
                                        <a href="./planUpdate" class="me-3">수정</a>
                                        <a href="javascript:void(0)" data-bs-toggle="modal"
                                                        data-bs-target="#disabledBtn" id="xBtn">비활성화</a>
                                    </div>
                                </c:if>    
                                    <div class="details-image-concept" >
                                        <span class="text-start fs-3" style="font-weight: 700;">${planVO.planName}  </span>
                                        <c:if test="${planVO.dataCapacity eq '무제한'}">
                                        <span class="fs-3" style="font-weight: 500;"> (데이터 + 통화 + 문자 무제한)</span>
                                        </c:if>
                                        <c:if test="${planVO.dataCapacity ne '무제한'}">
                                        <span class="fs-3" style="font-weight: 500;"> (데이터 ${planVO.dataCapacity}GB + 통화 & 문자 무제한)</span>
                                        </c:if>
                                    </div>
                                    <h3 class="text-start" style="color:gray;"> ${planVO.planExplainS} </h3>
                                        <div class="container ">
                                        	<div class="zcustom-box">
											    <div class="boxone">
											        <ul>
											            <li class="hbox">
											                <img src="/assets/images/cloud.png">
											                <c:if test="${planVO.dataCapacity eq '무제한'}">
											                    <h3>무제한</h3>
											                </c:if>
											                <c:if test="${planVO.dataCapacity ne '무제한'}">
											                    <h3 style="font-weight:400;">${planVO.dataCapacity} GB</h3>
											                </c:if>
											            </li>
											            <li class="hbox">
											                <img src="/assets/images/phone-call.png">
											                <h3>기본제공</h3>
											            </li>
											            <li class="hbox1">
											                <img src="/assets/images/sms.png">
											                <h3>기본제공</h3>
											            </li>
											        </ul>
											    </div>
											    <div class="boxtwo">
											        <div class="container text-center zbox">
											            <div class="col">
											                <span class="theme-color fs-4 fw-bold">월 </span>
											                <span class="theme-color fs-3 fw-bold data-comma" style="margin:0px 3%;">
											                    <fmt:formatNumber value="${planVO.planPrice}" pattern="#,###" />
											                    <input type="hidden" value="${planVO.planPrice}" id="planPrice">
											                </span>
											                <span class="theme-color fs-5 fw-bold">원 </span>
											                <span class="label-text">(부가세 포함)</span>
											            </div>
											            <div style="margin-top:5%;">
											                    <div id="notiAge"></div>
											                <div class="product-buttons justify-content-center">
											                    <!-- 가입자 본인인증 모달 버튼 요금제변경 start -->
											                    <c:choose>
											                        <c:when test="${bfPlan.planNum eq planVO.planNum}">
											                            <a type="button" class="btn btn-solid hover-solid btn-animation rounded-3 btn-disabled">
											                                <span>이미 사용중인 요금제입니다.</span>
											                            </a>
											                        </c:when>
											                        <c:otherwise>
											                            <c:choose>
											                                <c:when test="${memberVO.ownCheck == 0}">
																                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#quick-view"
																                    class="btn btn-solid hover-solid btn-animation rounded-3 btn-disabled">
																                    <span>요금제 변경</span>
																                </a>
																                <a href="javascript:void(0)" data-bs-toggle="modal" id="changeTelecoms"
																                    data-bs-target="#changeTelecom"
																                    class="btn btn-solid hover-solid btn-animation rounded-3">
																                    <span>번호이동</span>
																                </a>
																            </c:when>
											                                <c:otherwise>
											                                	<c:if test="${ok == 0}">
											                                	<a class="btn btn-outline-danger rounded-3 theme-color btn-disabled">
																                    <span >요금제 변경일 1개월 이내에는 요금제 변경이 불가합니다.</span></a>
																                </c:if>
																                <c:if test="${ok == 1}">
											                                    <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#quick-view"
											                                        class="btn btn-solid hover-solid btn-animation rounded-3">
											                                        <span>요금제 변경</span>
											                                    </a>
											                                    <a href="javascript:void(0)" data-bs-toggle="modal" id="changeTelecoms"
											                                        data-bs-target="#changeTelecom"
											                                        class="btn btn-solid hover-solid btn-animation rounded-3 btn-disabled">
											                                        <span>번호이동</span>
											                                    </a>
											                                    </c:if>
											                                </c:otherwise>
											                               
											                            </c:choose>
											                        </c:otherwise>
											                    </c:choose>
											                </div>
											            </div>
											        </div>
											    </div>
											</div>

                                               	</div>  
                                        	</div>
                                		</div>
	                                <div>
		                                <ul class="product-count shipping-order">
		                                    <li>
		                                        <span class="lang">기존 이용고객분들은 위약금 발생에 유의해주세요.</span>
		                                    </li>
		                                </ul>
	                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                        <div class="container">
                            <div class="col-12">
                                <div class="cloth-review">
                                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                        <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                            data-bs-target="#desc" type="button">상세정보</button>
                                    </div>
                                    <div class="tab-content" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="desc">
                                    <div class="shipping-chart">
                                    <div class="part">
                                        
                                        <p class="font-light fs-6">${planVO.planExplain}</p>
                                	</div>
                             		</div>
                        			</div>
                    				</div>
                				</div>
            				</div>
        				</div>
       
    </section>
    <!-- Shop Section end -->

<!-- 가입자 본인인증 모달창 start -->
     <div class="modal fade quick-view-modal" id="quick-view">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="modal-body">
                    <div class="row "> 
                            <!-- 가입자본인인증 Start -->
                            <form  action="./identify" method="POST">
                            <div class="login-section" style="height:70vh; padding-top:0px; padding-bottom:0px;">
                                <div class="materialContainer">
                                            <div class="login-title">
                                                <h2>가입자 본인인증</h2>
                                            </div>
                                            <div class="input">
                                                <label class="fs-6" for="name">이름</label>
                                                <input type="text" name="name" id="name">
                                                <span class="spin"></span>
                                            </div>
                                        <div class="row">
										    <div class="col-md-6 d-flex">
										        <div class="input col-md-3">
										            <input style="font-size:15px;" type="text" name="rrnf" id="rrnf" placeholder= "주민등록번호 앞 6자리">
										            <span class="spin"></span>
										        </div>
										        <p style="margin:40% 6% 0% 6%; ">-</p>
										        <div class="input col-md-3">
										            <input style="font-size:15px;" type="password" name="rrnl" id="rrnl" placeholder= "주민등록번호 뒤 7자리">
										            <span class="spin"></span>
										        </div>
										    </div>
										</div>
										 
                                           <input type="hidden" value="${param.planNum}" name="planNum">
                                        <!-- 약관동의 드랍다운 start -->   
                                             <section style="width:120%; margin:-10% 0 0 -10%;">
                                                    <div class="text-center">
                                                        <div class="container">
                                                            <div class="row ">
                                                                <div class="category-option">
                                                                    <div class="accordion category-name" id="accordionExample">
                                                                        <div class="accordion-item category-rating">
                                                                            <h2 class="accordion-header" id="headingThree">
                                                                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                                                    data-bs-target="#collapseThree">
                                                                                    유의사항
                                                                                </button>
                                                                            </h2>
                                                                            <div id="collapseThree" class="accordion-collapse collapse "
                                                                                aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                                                                <div class="accordion-body category-scroll">
                                                                                    <ul class="category-list">
                                                                                    <li>
                                                                                        <p class="mb-3">요금제 변경일을 기준으로 1개월 내에는 <br>다른 요금제로 변경이 불가합니다.</p>
                                                                                    </li>                                              
                                                                                    </ul>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>     
                                                    </section>
                                               
                                        <!-- 약관동의 드랍다운 end -->
                                                        <div class="container">
                                                            <ul class="checkbox-details">
                                                                <li class="checkbox-list">
                                                                    <div class="form-check user-checkbox ps-0 mx-4">
                                                                        <input class="checkbox_animated check-it" type="checkbox" value=""
                                                                            id="flexCheckDefault3">
                                                                        <label class="form-check-label mt-4 " for="flexCheckDefault3">개인정보 취급 동의 <span
                                                                                class="fw-bolder">[필수]</span>
                                                                        </label>
                                                                    </div>
                                                                </li>
                                                            </ul>  
                                                            <ul>
                                                                <li class="checkbox-list mt-3">
                                                                    <div class="form-check user-checkbox ps-0 mx-4">
                                                                        <input class="checkbox_animated check-it" type="checkbox" value=""
                                                                            id="flexCheckDefault1">
                                                                        <label class="form-check-label fw-bolder" for="flexCheckDefault1">위 안내사항을 확인하였습니다.</label>
                                                                    </div>
                                                                </li>     
                                                            </ul>
                                                        </div>
                                                        <div class="col-md-5 mx-auto">   
                                                            <div class="button login">
                                                                <button type="submit">
                                                                    <span>확인</span>
                                                                </button>
                                                            </div>     
                                                        </div>
                                                </div>     
                                            </div>
                                            </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
<!-- 가입자 본인인증 모달창 start end -->

 <!-- 번호이동 모달창 start -->
    <div class="modal fade quick-view-modal" id="changeTelecom">
        <div class="modal-dialog modal-lg modal-dialog-centered col-12">
            <div class="modal-content">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="modal-body">
                    <div class="row gy-4">
                        <div class="col-12">
                            <div class="product-right">
                                <div class="size-detail">
                                <h2 class="mb-3 fw-bolder">이전 통신사 정보</h2>
										<ul class="radio-select">
										  <li>
										    <input type="radio" id="skt" name="telecomName" value="0" hidden> 
										    <label for="skt">SKT</label>
										  </li>
										  <li>
										    <input type="radio" id="kt" name="telecomName" value="1" hidden>
										    <label for="kt">KT</label>
										  </li>
										  <li>
										    <input type="radio" id="lgu" name="telecomName" value="2" hidden>
										    <label for="lgu">LGU+</label>
										  </li>
										  <li>
										    <input type="radio" id="etc" name="telecomName" value="3" hidden>
										    <label for="etc">알뜰폰</label>
										  </li>
										</ul>
                                </div>
                                <div class="d-flex">
                                <div class="col-md-10">
                                    <input type="text" class="form-control mb-3" id="taPhoneNum" name="taPhoneNum" placeholder="휴대폰 번호 '-'없이 숫자만 입력" value="">
                                   
                                </div>
                                <button type="button" class="btn btn-solid-default btn-sm mt-1" id="btnQuery" style="height:50%; width:100%;"> 조회 </button>
                                </div>
                                <div class="size-detail">
                                    <h2 class="mb-3 fw-bolder">가입자 정보</h2>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control mb-3" id="name" name="name" placeholder="이름" value="${memberVO.name}" >
                                    </div>
                                     <div class="row">
									    <div class="col-md-12">
									      <div class="d-flex align-items-center justify-content-center">
									        <input type="text" class="form-control me-3" id="rrnf2" name="rrnf" placeholder="주민번호 앞자리" value="${memberVO.rrnf}">
									        <p class="me-3 fs-6 mt-2">-</p>
									        <input type="password" class="form-control" id="rrnl2" name="rrnl" placeholder="주민번호 뒷자리" value="${memberVO.rrnl}">
									      </div>
									    </div>
									  </div>
									
                                    <div class="col-md-12">
                                        <div class=" d-flex">
                                        <input type="text" class="form-control mt-2 " id="address1" name="address1" value="${memberVO.address1}" placeholder="주소입력" > 
                                        <button type="button" class="btn btn-solid-default btn-sm mt-2 " onclick="execution_daum_address()" id="findAddress"style="height:50%; text-align:center;">주소찾기</button>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control mt-2" id="address2" name="address2" value="${memberVO.address2}" placeholder="도로명주소">
                                    </div>
                                    <div class="col-md-12">
                                    	<input type="text" class="form-control mt-2" id="address3" name="address3" value="${memberVO.address3}" placeholder="상세주소">
                                    </div>
                                </div>
                            <div class="col-12">
                                <div class="product-right">
                                    <div class="size-detail">
                                        <h2 class="mb-3 fw-bolder">할인 정보</h2>
                                         <!-- 0: 공시지원금X 1: 선택약정 12개월, 2: 선택약정 24개월 -->
                                     	<div class="mx-auto" style="height: 100%; width: 100%; border-radius: 5px; border:1px solid lightgray">
                                            <div class="nav-link" style="color:black; white-space: nowrap;">
                                                <h6 class="text-start mb-2">선택약정할인 (통신요금 25% 할인)</h6>
                                                    <div class="row" >
                                                        <div class="form-check custome-radio-box">
                                                            <input class="form-check-input mx-2" type="radio" name="disKind" id="discount2" value="2">
                                                            <label class="form-check-label d-flex" for="discount2">24개월 할인  
                                                                <span class="justify-content-end" style="margin-left:150px;">총</span>- <span class="fs-4" id="dis2" style="margin-top:-10px;"></span> <span>원</span> </label>
                                                        </div> 
                                                        <div class="form-check custome-radio-box">
                                                            <input class="form-check-input mx-2" type="radio" name="disKind" id="discount1" value="1">
                                                            <label class="form-check-label d-flex" for="discount1">12개월 할인 
                                                                <span class="justify-content-end " style="margin-left:153px;">총</span>- <span class="fs-4" id="dis1" style="margin-top:-10px; "></span> <span>원</span> </label> 
                                                        </div> 
                                                    </div>   
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    
                                    <div class="category-option mt-3">
                                    <div class="accordion category-name" id="accordionExample"> 
                                        <div class="accordion-item category-rating">
                                            <h2 class="accordion-header" id="headingThree">
                                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                                                    유의사항
                                                </button>
                                            </h2>
                                            <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                                <div class="accordion-body category-scroll">
                                                    <ul class="category-list">
                                                        <li>
                                                            <p>요금제 변경일을 기준으로 1개월 내에는 <br>다른 요금제로 변경이 불가합니다.</p>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="checkbox-list mt-3 ">
                                            <div class="form-check user-checkbox ps-0 ">
                                                <input class="checkbox_animated check-it" type="checkbox" value="" id="flexCheckDefault1">
                                                <label class="form-check-label fw-bolder" for="flexCheckDefault1">위 안내사항을 확인하였습니다.</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-btns ">
                                        <button onclick="location.href='zsuccess_bunhoedong.html';" type="button" class="btn btn-solid-default btn-lg col-md-12"
                                            data-bs-dismiss="modal">가입하기</button>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!-- 번호이동 모달창 end -->
 <!-- 요금 삭제 모달창 start -->
 <div class="modal fade payment-modal" id="disabledBtn">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form action = "./planDisabled" method="POST" id="disabledPlan">
                    <div class="mb-4">
                     <h3 class="theme-color fw-bold">해당 요금제를 비활성화 하시겠습니까? </h3> <br> <h5>비활성화 이후에는 활성화가 불가합니다.</h5>
                     <h5>해당요금제로는 더이상 신규가입이 불가하게 됩니다.</h5>
                     <input type="text" name="planNum" id="modalPlanNum">
                    </div>
                </form>
            </div>
            <div class="modal-footer pt-0 text-end d-block">
                <button type="button" id="confirmDisabled" class="btn btn-solid-default rounded-1">확인</button></a>
            </div>
        </div>
    </div>
</div>
<!-- Add number Modal End -->


<!-- Recommend product 1 -->
<section class="left-sidebar-section masonary-blog-section mb-5">
    <div class="container">
            <div class="title title1 title-effect mb-4 title-left">
                <h2 class="fs-4">추천상품</h2>
            </div>
                <div class="col-lg-12 col-md-12 order-md-1 ratio_square">
                    <div class="row mb-3 justify-content-center">
                    <c:forEach items="${recommend}" var="reco">
                        <div class="col-2">
						  <div class="masonary-blog box-shadow card-fixed-height">
						    <div class="card-body card-body-width">
						      <a href="./planDetail?planNum=${reco.planNum}">
						        <h2 class="card-title">${reco.planName}</h2>
						      </a>
							<h3 class="masonary-name">월 <fmt:formatNumber value="${reco.planPrice}" pattern="#,###" />원</h3>
						      <p class="ex font-light line-clamp">${reco.planExplainS}</p>
						    </div>
						  </div>
						</div>
                        </c:forEach>
                   </div>
               </div>
           </div>
</section>
<!-- recommend product 1 end -->
<c:import url="../temp/footer.jsp"></c:import>
	<!-- 다음 주소 찾기 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	/* 다음 주소 연동 */
	function execution_daum_address(){
		
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            
	            	console.log(addr);
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 주소변수 문자열과 참고항목 문자열 합치기
	      			addr += extraAddr;
	            
	            } else {
	                addr += ' ';
	            }
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $('#address1').val(data.zonecode);
	            //$("[name=memberAddr1]").val(data.zonecode);	// 대체가능
	            $('#address2').val(addr);
	            //$("[name=memberAddr2]").val(addr);			// 대체가능
	            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
	            $('#address3').attr("readonly",false);
	            $('#address3').focus(); 
	        }
	    }).open();   
	}
	</script>
<script>

// 모달이 열릴 때 실행되는 함수
 function handleModalShown() {
  const planPrice = $('#planPrice').val();
  const dis1 = planPrice * 12 * 0.25;
  const dis2 = planPrice * 24 * 0.25;
  const dis1Element = document.getElementById('dis1');
  const dis2Element = document.getElementById('dis2');
  dis1Element.textContent = dis1.toLocaleString();
  dis2Element.textContent = dis2.toLocaleString();

}

  // 모달의 "shown.bs.modal" 이벤트에 이벤트 리스너 추가
  const changeTelecomModal = document.getElementById('changeTelecom');
  changeTelecomModal.addEventListener('shown.bs.modal', handleModalShown);

  // changeTelecom 버튼에 이벤트 리스너 추가
  //const changeTelecomBtn = document.getElementById('changeTelecomBtn');
  //changeTelecomBtn.addEventListener('click', () => {
    // 모달을 열기 전에 필요한 동작을 수행할 수 있습니다
  //});
  
  const memberBirth = '${memberVO.rrnf}';
  let age = calculateAge(memberBirth);
  console.log(age);
  
//나이 계산 함수
  function calculateAge(memberBirth) {
      let birthYear = parseInt(memberBirth.substring(0, 2), 10);
      let birthMonth = parseInt(memberBirth.substring(2, 4), 10);
      let birthDay = parseInt(memberBirth.substring(4, 6), 10);

      let currentDate = new Date();
      let currentYear = currentDate.getFullYear();
      let currentMonth = currentDate.getMonth() + 1;
      let currentDay = currentDate.getDate();

      let century = (birthYear >= 0 && birthYear <= 21) ? 2000 : 1900;
      let age = currentYear - (century + birthYear);
      
      if (currentMonth < birthMonth || (currentMonth === birthMonth && currentDay < birthDay)) {
          age--;
      }

      return age;
  }
  
   const checkPlanNum = $('#planNum1').val();
   let maxAge = '';
   let minAge = '';
   if(checkPlanNum.includes('Z')){
	   maxAge = 12;
	   $('#maxAge').val(maxAge);
   }
   
   if(checkPlanNum.includes('T')){
	   maxAge = 18;
	   $('#maxAge').val(maxAge);
   }
   
   if(checkPlanNum.includes('S01')){
	   minAge = 65;
	   $('#minAge').val(minAge);
   } else if(checkPlanNum.includes('S02')){
	   minAge = 70;
	   $('#minAge').val(minAge);
   } else if(checkPlanNum.includes('S03')){
	   minAge = 80;
	   $('#minAge').val(minAge);
   }
    
    
   if (age < minAge && minAge != 0) {
       const ageLow = $('#minAge').val();
       const ageButton1 = 
       '<div class="btn btn-outline-danger rounded-3 theme-color btn-disabled" style="margin-left:-10%;"><span>'+ageLow+'세 이하는 해당 요금제를 사용할 수 없습니다.</span></div>';
       $('#notiAge').html(ageButton1);
       $('.product-buttons').hide();
       }
   if (age > maxAge && maxAge != 0) {
	   const ageHigh = $('#maxAge').val();
       const ageButton2 = 
       '<div class="btn btn-outline-danger rounded-3 theme-color btn-disabled" style="margin-left:-10%;"><span>'+ageHigh+'세 이상은 해당 요금제를 사용할 수 없습니다.</span></div>';
       $('#notiAge').html(ageButton2);
       $('.product-buttons').hide();
       }
</script>

<script>

$(document).ready(function() {
    // 통신사 버튼 변경 시 이벤트 처리
    
   $('.radio-select label').click(function() {
        // 클릭한 라벨의 연결된 라디오 버튼 선택
        $(this).prev('input[type="radio"]').prop('checked', true);
   
    $('input[name="telecomName"]').change(function() {
        // 선택된 통신사
        let telecomName = $('input[name="telecomName"]:checked').val();
    	});
    });
    // 조회 버튼 클릭 시 AJAX 요청 전송
    $('#btnQuery').click(function() {
        // 선택된 통신사
        let telecomName = $('input[name="telecomName"]:checked').val();

        
        if (telecomName == 0) {
            telecomName="SKT";
        } else if (telecomName == 1) {
        	telecomName="KT";
        } else if (telecomName == 2) {
        	telecomName="LGU+";
        } else {
        	telecomName="알뜰폰";
        }

        // 입력한 휴대폰 번호
        let phoneNum = $('#taPhoneNum').val();
        console.log(phoneNum);

        // AJAX 요청 설정
        $.ajax({
            url: '/plan/otherTelecom',
            type: 'POST',
            dataType: 'json',
            data: {
                telecomName: telecomName,
                taPhoneNum: phoneNum
            },
            success: function(response) {
                // 응답 값에 따라 로직 처리
                if (response==true) {
                    // 성공적인 처리 로직
                    alert("조회 성공! 가입자 정보 확인 및 할인유형을 선택해주세요");
                    $('#taPhoneNum').prop('readonly', true);
                } else {
                    // 실패한 처리 로직
                    console.log('조회 실패');
                    alert("일치하는 정보가 없습니다. 통신사 및 휴대폰번호 확인 후 다시 시도해주세요.");
                }
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.log('AJAX 오류:', error);
            }
        });
    });
    
    
 // 체크박스 변경 이벤트 리스너 추가
    var radioButtons = document.getElementsByName('disKind');
    for (var i = 0; i < radioButtons.length; i++) {
      radioButtons[i].addEventListener('change', disKindChange);
    }

    // 체크박스 변경 이벤트 핸들러
    function disKindChange(event) {
      var selectedValue = event.target.value;
      
      // 선택한 값에 따라 동작 수행
      if (selectedValue === '1') {
        // 12개월 할인 선택 시 수행할 동작
        console.log('12개월 할인 선택');
      } else if (selectedValue === '2') {
        // 24개월 할인 선택 시 수행할 동작
        console.log('24개월 할인 선택');
      }
    }
    
 // 비활성화 버튼 클릭 이벤트 처리
    $('#xBtn').click(function() {
    	console.log('eventOn');
        const planNum = $('#planNum1').val();
       console.log(planNum);
        $('#modalPlanNum').val(planNum); 
        
    });

    $('#confirmDisabled').click(function() {
        let confirm = $('#modalPlanNum').val();
      console.log(confirm);
    	   $('#disabledPlan').submit();
    	   console.log("확인")
    });

  
});

</script>

</body>

</html>