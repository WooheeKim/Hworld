<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../temp/style.jsp"></c:import>
	<style>
	 /* 요금제 변경 모달 버튼 */
	.product-right .size-detail {
	  padding: 10px 0;
	  border-top: 1px dashed #ced4da; }
	  @media (max-width: 575px) {
	    .product-right .size-detail {
	      padding: 5px 0; } }
	  .product-right .size-detail ul {
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex; }
	    .product-right .size-detail ul li {
	      width: 115px;
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
	      .product-right .size-detail ul li .selected {
	        -webkit-box-shadow: 0 2px 7px rgba(0, 0, 0, 0.2);
	                box-shadow: 0 2px 7px rgba(0, 0, 0, 0.2); }
	      .product-right .size-detail ul li + li {
	        margin-left: 10px; }
	        
	    
	  .zcustom-box {
	    width: 100%;
	    border-radius: 5px;
	    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	    border-bottom:0px solid lightgray;
	    padding:20px;
	    background-color: fff;
	    }
	
	    .zcustom-box2 {
	    margin:auto;    
	    width: 95%;
	    border-radius: 5px;
	    box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	    border-bottom:0px solid lightgray;
	    padding:20px;
	    background-color: #eff2f7;
	    }
	    
	</style>
</head>

<body class="theme-color2 light ltr">

    <!-- Cart Section Start -->
    <section class="section-b-space">
        <div class="container" style="padding: 0px 130px;">
            <div class="row g-4">
                <div class="col-lg-7">
                    <h3 class="mb-3 fw-bold text-center">가입 신청서</h3>
                    <form class="needs-validation">
                        <div class="row g-4">
                            <!-- 가입자 정보 -->
                            <div class="zcustom-box">
                            <h5 class="mb-3 fw-bold">가입자 정보 입력</h5>
                            <div class="col-md-12">
                                <label for="fname" class="form-label">가입자 이름</label>
                                <input type="text" class="form-control" id="fname" placeholder="Enter Your Name">
                            </div>

                            <!-- 주민등록번호 -->
                            <div class="row mt-2">
                            <div class="col">
                                <label for="fnum" class="form-label">주민등록번호</label>
                                <input type="text" class="form-control" id="fnum" >
                            </div>
                            <div class="col-md-1 mt-4 pt-3">
                                <h2 class="text-center">-</h2>
                            </div>
                            <div class="col">
                                <label for="lnum" class="form-label">&nbsp;</label>
                                <input type="text" class="form-control" id="fnum" >
                            </div>
                            </div>
                            <!-- 가입자 주소  -->
                            <div class="row mt-2">
                            <!-- 1. 우편번호  -->
                            <div class="col-md-9">
                                <label for="address1" class="form-label">가입자 주소</label>
                                <input type="text" class="form-control" id="address1">
                            </div>

                            <div class="col-md-3" style="padding-left: 0px;">
                                <label for="btn2" class="form-label">&nbsp;&nbsp;&nbsp;</label>
                                <button class="btn btn-solid-default btn-full" id="btn2" style="padding-left: 4px; padding-right: 4px; height: 61%; font-size: calc(12px + (13 - 12) * ((100vw - 320px) / (1920 - 320)));">주소 찾기</button>
                            </div>

                            <!-- 2. 도로명주소/지번  -->
                            <div class="col-md-12 mt-3">
                                <input type="text" class="form-control" id="address2">
                            </div>

                            <!-- 3. 상세주소   -->
                            <div class="col-md-12 mt-3">
                                <input type="text" class="form-control" id="address3">
                            </div>
                        </div>
                        </div>

                        <div class="zcustom-box">
                            <h5 class="mb-3 fw-bold">회선 정보 입력</h5>
                            <div class="product-right">
                                <div class="size-detail">
                                    <h6 class="mb-3 fw-bolder">가입유형</h6>
                                    <ul class="nav border-0" style="color:black;">
                                        <li class="nav-item">
                                        <a class="nav-link active" style="color:black;">신규가입</a>
                                        </li>
                                        <li class="nav-item">
                                        <a class="nav-link" style="color:black;" >번호이동</a>
                                        </li>
                                        <li class="nav-item">
                                        <a class="nav-link" style="color:black;" >기기변경</a>
                                        </li>
                                    </ul>
                                </div>  
                            <!-- 신규가입 폰 번호 -->
                                <div class="col-md-12 mt-3 mb-3">
                                    <label for="fname" class="form-label">휴대폰 번호</label>
                                    <input type="text" class="form-control" id="fname" placeholder="숫자만입력" value="">
                                </div>
                                <div class="d-flex col-md-12">
                                    <div class="col-md-6 mt-3 mb-3 me-1">
                                        <label for="fname" class="form-label">제품명</label>
                                        <input type="text" class="form-control" id="fname" placeholder="ex)갤럭시 23" value="">
                                    </div> 
                                    <div class="col-md-6 mt-3 mb-3">
                                        <label for="fname" class="form-label">제품코드</label>
                                        <input type="text" class="form-control" id="fname" placeholder="ex)P01BSCB128G2301" value="">
                                    </div> 
                                </div>   
                            </div>    
                            
                       

                            <!-- 요금제 선택  -->
                           <div>
                            <div class="row gy-4">
                                <div class="col-12">
                                    <div class="product-right">
                                        <div class="size-detail">
                                            <h6 class="mb-3 fw-bolder">요금제 선택</h6>
                                            <ul class="nav border-0" style="color:black;">
                                                <li class="nav-item" >
                                                <a class="nav-link active" style="color:black;" data-bs-toggle="tab" href="#tab-1">5G 요금제</a>
                                                </li>
                                                <li class="nav-item">
                                                <a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-2">시니어 요금제</a>
                                                </li>
                                                <li class="nav-item">
                                                <a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-3">청소년 요금제</a>
                                                </li>
                                                <li class="nav-item">
                                                <a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-4">ZEM 요금제</a>
                                                </li>
                                                <li class="nav-item">
                                                <a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-5">군인 요금제</a>
                                                </li>
                                            </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane fade show active" id="tab-1">
                                                        <div class="row col-md-12 mt-3 mx-3">
                                                            <div class="form-check custome-radio-box">
                                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="credit">
                                                                <label class="form-check-label" for="credit">5G 프리미어</label>
                                                            </div>
                                                            <div class="form-check custome-radio-box">
                                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="debit">
                                                                <label class="form-check-label" for="debit">5G 베이직</label>
                                                            </div>
                                                            <div class="form-check custome-radio-box">
                                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="paypal">
                                                                <label class="form-check-label" for="paypal">5G 심플</label>
                                                            </div>
                                                            <div class="form-check custome-radio-box">
                                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="paypal">
                                                                <label class="form-check-label" for="paypal">5G 슬림</label>
                                                            </div> 
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="tab-2">
                                                        <div class="row col-md-12 mt-3 mx-3">
                                                            <div class="form-check custome-radio-box">
                                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="credit">
                                                                <label class="form-check-label" for="credit">시니어 A형</label>
                                                            </div>
                                                            <div class="form-check custome-radio-box">
                                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="debit">
                                                                <label class="form-check-label" for="debit">시니어 B형</label>
                                                            </div>
                                                            <div class="form-check custome-radio-box">
                                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="paypal">
                                                                <label class="form-check-label" for="paypal">시니어 C형</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="tab-3">청소년 요금제의 내용입니다.</div>
                                                    <div class="tab-pane fade" id="tab-4">ZEM 요금제의 내용입니다.</div>
                                                    <div class="tab-pane fade" id="tab-5">군인 요금제의 내용입니다.</div>
                                                </div>
                                                <div class="size-detail">
                                                    <h6 class="mb-3 fw-bolder">할인유형</h6>
                                                        <div class="zcustom-box2">
                                                                <h6>선택하신 요금제는 무약정 요금제로 공시지원금(휴대폰 가격 할인),
                                                                    선택약정할인(통신료 25% 할인)이 제공되지 않습니다.</h6>
                                                        </div>
                                                </div>        
                                                        <ul class="nav border-0 d-flex" >
                                                            <li class="nav-item mx-auto" style="height: 140px; width: 40%; border-radius: 5px; ">
                                                            <div class="nav-link active" style="color:black;">
                                                                <h6 class="text-start mb-3" style="margin-top:-0px;">공시지원금</h6>
                                                                <h3 class="mb-2" style="margin-left:60px;">휴대폰 가격 1회 할인</h3>
                                                                <div style="margin-left:95px; margin-top:30px;"><span>총</span><span class="fs-4">-579,000</span><span>원</span></div>
                                                            </div>
                                                            </li>
                                                            <div class="mx-auto" style="height: 100%; width: 55%; border-radius: 5px; border:1px solid lightgray">
                                                                <div class="nav-link" style="color:black; ">
                                                                    <h6 class="text-start mb-2">선택약정할인</h6>
                                                                    <h3 class="text-end mb-3">통신요금 25% 할인</h3>
                                                                </div>    
                                                                    <div class="row" >
                                                                        <div class="form-check custome-radio-box">
                                                                            <input class="form-check-input mx-2" type="radio" name="flexRadioDefault" id="discount">
                                                                            <label class="form-check-label d-flex" for="paypal">24개월 할인  
                                                                                <span class="justify-content-end" style="margin-left:100px;">총</span> <span class="fs-4" style="margin-top:-10px;">-620,000</span> <span>원</span> </label>
                                                                        </div> 
                                                                        <div class="form-check custome-radio-box">
                                                                            <input class="form-check-input mx-2" type="radio" name="flexRadioDefault" id="discount2">
                                                                            <label class="form-check-label d-flex" for="paypal">12개월 할인 
                                                                                <span class="justify-content-end " style="margin-left:103px;">총</span> <span class="fs-4" style="margin-top:-10px; ">-520,000</span> <span>원</span> </label>
                                                                                
                                                                        </div> 
                                                                    </div>   
                                                                </div>
                                                            </div>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>            
                                             
                                        

                              
                            <!-- 절차 끝 구분선 -->
                            <hr class="mb-4">

                            <!-- 약관동의 및 가입버튼 -->
                            <div class="col-md-12 m-0" >
                                <div>
                                    <jsp:include page="./applicationTextArea.jsp"></jsp:include>
                                </div>

                                <div class="mt-3 mb-4 d-flex justify-content-center">
                                        <input class="checkbox_animated check-it mt-1" type="checkbox" id="flexCheckDefault11">
                                        <label class="form-check-label checkout-label" for="flexCheckDefault11" style="font-weight: bolder;">약관에 동의했습니다.</label>
                                </div>
                                <div class="mx-auto col-6 row">
                                    <button class="btn btn-solid-default w-75 mx-auto" id="btn2" style="padding-left: 4px; padding-right: 4px; height: 61%; font-size: calc(12px + (13 - 12) * ((100vw - 320px) / (1920 - 320)));">            
                                        가입하기
                                    </button>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="your-cart-box">
                        <ul class="list-group mb-3">
                            <li class="list-group-item lh-condensed active " style="background-color: #4f4f4f;">
                                <h3 class="mt-3 mb-1 text-capitalize">iPhone 14 Plus</h3>
                                <h4 class="my-1" style="color: #fff;">옐로 l 128G</h6>
        
                                <h6 class="mt-4" style="color: #fff;">기기변경</h6>
                                <h6 class="my-1" style="color: #fff;">24개월 할부</h6>
                                <h6 class="my-1" style="color: #fff;">시니어 요금제</h6>
                                <h6 class="mt-1 mb-4" style="color: #fff;">요금할인</h6>
                            </li>
                            <li class="list-group-item lh-condensed active">
                                <div class="row">
                                    <div class="d-flex justify-content-between">
                                        <span class="fw-bold" >월 기기값</span>
                                        <span class="d-flex">
                                            <h3 class="fw-bold" style="color: #7e7e7e;">153,123</h4>
                                            <span class="fw-bold col-5">원</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mt-2 d-flex justify-content-between">
                                        <span class="fw-bold" >월 통신요금</span>
                                        <span class="d-flex">
                                            <h3 class="fw-bold" style="color: #7e7e7e;">153,123</h4>
                                            <span class="fw-bold col-5">원</span>
                                        </span>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item d-flex lh-condensed justify-content-between active" style="padding: 20px 20px 15px;">
                                <span class="fw-bold">예상 월 납부금액</span>
                                <h2 class="title title1" style="color: var(--theme-color); margin-bottom: 0;">153,123원</h2>
                            </li>
        
                        </ul>
                    </div>
                </div>
    </section>
    <!-- Cart Section End -->

  
<div class="modal fade quick-view-modal" id="quick-view1">
    <div class="modal-dialog modal-lg modal-dialog-centered col-12">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body">
                <div class="row gy-4">
                                    <div class="col-12">
                                        <div class="product-right">
                                            <div class="size-detail">
                                                <h2 class="mb-3 fw-bolder">요금제 선택</h2>
                                                <ul class="nav border-0" style="color:black;">
                                                    <li class="nav-item" >
                                                    <a class="nav-link active" style="color:black;" data-bs-toggle="tab" href="#tab-1">5G 요금제</a>
                                                    </li>
                                                    <li class="nav-item">
                                                    <a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-2">시니어 요금제</a>
                                                    </li>
                                                    <li class="nav-item">
                                                    <a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-3">청소년 요금제</a>
                                                    </li>
                                                    <li class="nav-item">
                                                    <a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-4">ZEM 요금제</a>
                                                    </li>
                                                    <li class="nav-item">
                                                    <a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-5">군인 요금제</a>
                                                    </li>
                                                </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane fade show active" id="tab-1">
                                                            <div class="row col-md-12 my-3 mx-3">
                                                                <div class="form-check custome-radio-box">
                                                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="credit">
                                                                    <label class="form-check-label" for="credit">5G 프리미어</label>
                                                                </div>
                                                                <div class="form-check custome-radio-box">
                                                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="debit">
                                                                    <label class="form-check-label" for="debit">5G 베이직</label>
                                                                </div>
                                                                <div class="form-check custome-radio-box">
                                                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="paypal">
                                                                    <label class="form-check-label" for="paypal">5G 심플</label>
                                                                </div>
                                                                <div class="form-check custome-radio-box">
                                                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="paypal">
                                                                    <label class="form-check-label" for="paypal">5G 슬림</label>
                                                                </div> 
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="tab-2">
                                                            <div class="row col-md-12 my-3 mx-3">
                                                                <div class="form-check custome-radio-box">
                                                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="credit">
                                                                    <label class="form-check-label" for="credit">시니어 A형</label>
                                                                </div>
                                                                <div class="form-check custome-radio-box">
                                                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="debit">
                                                                    <label class="form-check-label" for="debit">시니어 B형</label>
                                                                </div>
                                                                <div class="form-check custome-radio-box">
                                                                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="paypal">
                                                                    <label class="form-check-label" for="paypal">시니어 C형</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="tab-3">청소년 요금제의 내용입니다.</div>
                                                        <div class="tab-pane fade" id="tab-4">ZEM 요금제의 내용입니다.</div>
                                                        <div class="tab-pane fade" id="tab-5">군인 요금제의 내용입니다.</div>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-3 ">    
                                            <div class="product-btns">
                                                <button onclick="location.href='상품상세페이지.html';" type="button" class="btn btn-solid-default btn-lg col-md-12"
                                                    data-bs-dismiss="modal">선택하기</button>
                                            </div>
                                        </div>

                                        <div class="support-agreed-msg">
                                            <strong>※ 공시지원금, 선택약정할인 중 1개만 신청할 수 있습니다.</strong>
                                            
                                            <span class="font-s cl-gray1">
                                              ※ 월 33,000원 이하 요금제를 이용 하거나 해당 요금제로 변경하면 7% 추가
                                              요금 할인을 받을 수 없습니다.
                                            </span>
                                          </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
				</div>
				<!-- 유의사항 end -->
 

	<c:import url="../temp/footer.jsp"></c:import>          
</body>
</html>