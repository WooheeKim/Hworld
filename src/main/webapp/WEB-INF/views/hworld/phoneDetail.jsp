<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <c:import url="../temp/style.jsp"></c:import>
    <title>Product 4 Image</title>
<style>

.ellipsis {
        width: 30%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;  /* 말줄임 적용 */
      }

.rate {
  display: inline-block;
  font-size: 0;
  position: relative;
  vertical-align: middle;
}

.rate input {
  display: none;
}

.rate label {
  float: right;
  color: #ddd;
  font-size: 24px;
  transition: color 0.3s;
  cursor: pointer;
  margin-right: 2px;
}

.rate label:before {
  content: "\f005";
  font-family: "Font Awesome 5 Free";
  font-weight: 900;
  padding: 2px;
}

.rate input:checked ~ label,
.rate input:hover ~ label {
  color: #ffa202;
}

.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
  color: #ffa202;
}

.modalRate {
  display: inline-block;
  font-size: 0;
  position: relative;
  vertical-align: middle;
}

.modalRate input {
  display: none;
}

.modalRate label {
  float: right;
  color: #ddd;
  font-size: 24px;
  transition: color 0.3s;
  cursor: pointer;
  margin-right: 2px;
}

.modalRate label:before {
  content: "\f005";
  font-family: "Font Awesome 5 Free";
  font-weight: 900;
  padding: 2px;
}

.modalRate input:checked ~ label,
.modalRate input:hover ~ label {
  color: #ffa202;
}

.modalRate:not(:checked) > label:hover,
.modalRate:not(:checked) > label:hover ~ label {
  color: #ffa202;
}

.btn-disabled {
        pointer-events: none;
        opacity: 0.3;
        cursor: not-allowed;
    }


     .btn-solid-after {
        background-color: #e22454; 
        color: #fff; 
        border-color: #e22454; 
    }
    .btn-outline-custom {
        background-color: transparent;
        color: gray; 
        border-color: gray; 
    }
    
    .btn-outline-custom:hover {
        background-color: #e22454; 
        color: #fff; 
        border-color: #e22454; 
    }
    
    .btn-outline-custom:focus {
        background-color: #e22454; 
        color: #fff; 
    }
    
.price-opt {
	position: relative; 
	padding-top: 28px; 
	min-width: 113px; 
	height: 38px; 
	line-height: normal; 
	display: inline-block; 
	vertical-align: middle; 
	margin: 0; 
	padding: 0; 
	margin-block-start: 1em; 
	margin-block-end: 1em; 
	margin-inline-start: 0px; 
	margin-inline-end: 0px;
}    
 .price-opt .title{
 	position: absolute; 
 	bottom: 3px; 
 	left: 0; 
 	color: #cdcdcd; 
 	font-size: 14px; 
 	white-space: nowrap;
 }
   
  .price-opt .num{
  	font-family: TgothicBlack, Roboto, sans-serif; 
  	letter-spacing: 0; 
  	font-size: 26px; 
  	letter-spacing: -1px; 
  	color: #fff; 
  	font-weight: 700;
  
  } 
 .price-opt .unit{
 	color: #fff; 
 	font-size: 16px;
 }	

 .ico-plus{
	 font-weight: bolder; 
	 font-size: 20px; 
	 color: white; 
	 width: 20px; 
	 height: 20px; 
	 background-position: -446px -546px; 
	 margin: -10px 28px 0 18px; 
	 display: inline-block; 
	 vertical-align: middle; 
	 overflow: hidden; 
	 display: inline-block; 
	 background-image: url(../img/spr_img_v3.png); 
	 background-repeat: no-repeat;
 }
                              
.ico-equal{
	font-weight: bolder; 
	font-size: 20px; 
	color: white; 
	width: 20px; 
	height: 20px; 
	background-position: -470px -546px; 
	margin: -10px 28px 0 18px; 
	display: inline-block; 
	vertical-align: middle; overflow: hidden;  background-image: url(../img/spr_img_v3.png); 
	background-repeat: no-repeat;"
}   

.btn-text{
	color: #3b98e6; 
	cursor: pointer; 
	-webkit-appearance: button; 
	padding: 0; 
	border: 0; 
	background-color: transparent; 
	text-transform: none; 
	overflow: visible; 
	font: inherit; 
	margin: 0; 
	writing-mode: horizontal-tb !important; 
	letter-spacing: normal; 
	word-spacing: normal; 
	text-indent: 0px; 
	text-shadow: none; 
	display: inline-block; 
	text-align: center; 
	box-sizing: border-box;
}

#orderBtn{
	width: 200px; 
	height: 54px; 
	font-size: 18px; 
	display: inline-block; 
	padding: 0 10px; 
	text-align: center; 
}
   
    
 /* 요금제 변경 모달 버튼 */
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
      width: 130px;
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
</style>

</head>

<body class="theme-color2 light ltr">
<c:import url="../temp/header.jsp"></c:import>
    <!-- Shop Section start -->
<section class="section1">
        <div class="container">
            <div class="row gx-4 gy-5">
                <div class="col-lg-12 col-12">
                    <div class="details-items">
                        <div class="row g-4">
                        <!-- 상품 사진 이미지 div 태그 -->
		                            <div class="col-md-6" style="display:block;">
		                            	<div class="ratio_landscape">
		                                <img src="/assets/images/electronics/product/${param.slicedCode}.jpg">
										</div>	  
		                            </div>
                       <!-- 상품 사진 이미지 div 태그 end -->
                            <div class="col-md-6">
                                <div class="cloth-details-size ">
                                <c:if test="${memberVO.adminCheck == 0 }">
                                    <div class="admin-update-delete d-flex justify-content-end">
                                        <a href="./directUpdate?slicedCode=${param.slicedCode}" class="me-3">수정</a>
                                        <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#productdel" id="productDelModal" >삭제</a>
                                    </div>    
                                </c:if>
								<div id="directList">
									
										<c:forEach items="${list}" var="direct" varStatus="status">
											<div class="titlebox" id="${direct.directCode}" data-selected="0">
												<div class="brand" style="font-size: 27px; color: gray;" id="productCode"
												data-direct-code="${direct.directCode}" data-direct-price="${direct.directPrice}" data-brand-code="${direct.brandCode}"
												data-direct-stock="${direct.directStock}" data-sliced-code="${direct.slicedCode}" data-category-code="${direct.categoryCode}" data-brand-Code="${direct.brandCode}">
													${direct.value}
												</div>
													<div class="details-image-concept mt-0" style="font-size: 35px;" id="directName">
														<span class="directNameValue" data-direct-name="${direct.directName}">${direct.directName}</span>
													</div>
													<div>
														<h3 class="mt-3 ">출고가</h3>
													</div>
														<p>
														<span class="price-detail theme-color fw-bold data-comma" id="commaPrice${direct.directCode}" >${direct.directPrice}</span>
														<span class="unit">원</span>
														</p>
													<div class="direct-item" id="item_${direct.directCode}" data-direct-code="${direct.directCode}" data-category-code="${direct.categoryCode}" data-brand-code="${direct.brandCode}" data-sliced-code="${direct.slicedCode}" data-direct-stock="${direct.directStock}" data-direct-price="${direct.directPrice}" data-direct-name="${direct.directName}"></div>
											</div>
										</c:forEach>
										<form action="./phoneOrder" method="get" id="buyForm">
											<input type="hidden" id="colorCode" name="colorCode">
											<input type="hidden" id="saveCapacity" name="saveCapacity">
											<input type="hidden" id="directCode" name="directCode">
											<input type="hidden" id="directStock" name="directStock" readonly>
											<input type="hidden" id="selectedDirectName" name="directName">
											<input type="hidden" id="planNum" name="planNum" value="">
											<input type="hidden" id="planName2" name="planName" >
											<input type="hidden" id="planPrice1" name="planPrice">
											<input type="hidden" id="disKind" name="disKind">
											<input type="hidden" id="joinType" name="joinType" >
											<input type="hidden" id="totalPriceAll" name="totalPrice">
											<input type="hidden" id="outPhonePrice" name="out_phonePayPrice">
											<input type="hidden" id="outplanPrice" name="out_planPrice">
											
											<!-- <input type="text" id="" -->
										
											<!-- <input type="hidden" id="categoryCode" name="categoryCode" value="${direct.categoryCode}">
											<input type="hidden" id="brandCode" name="brandCode" value="${direct.brandCode}">
											<input type="hidden" id="slicedCode" name="slicedCode" value="${direct.slicedCode}"> -->
										</form>
										<div class="optionArea">
											<div class="product-option-item color">
										   		<div class="option-title-area">
										      		<h3 class="option-title mb-2">색상</h3>
										        </div>
												<div class="color-types">
													<ul class="color-variant mb-0">
														<li class="bg-white border border-1" value="W" name="colorCode"></li> 
														<li class="bg-gray1" value="G" name="colorCode"></li>
														<li class="bg-black1" value="B" name="colorCode"></li>
														<span id="colorName"></span>
													</ul>
        										</div>
											</div>
										<div>
												<div>
													<h3 class="option-title mt-3 mb-2">용량</h3>
												</div>
											<div id="capacities">
												<span>
												  <input type="radio" hidden name="saveCapacity" id="caOption1" value="128">
												  <label for="saveCapacity" class="btn btn-outline-custom m-1 capacity">
												    <span>128G</span>
												  </label>
												</span>
												<span>
												  <input type="radio" hidden name="saveCapacity" id="caOption2" value="256">
												  <label for="saveCapacity" class="btn m-1 btn-outline-custom capacity">
												    <span>256G</span>
												  </label>
												</span>
												<span>
												  <input type="radio" hidden name="saveCapacity" id="caOption3" value="512">
												  <label for="saveCapacity" class="btn m-1 btn-outline-custom capacity">
												    <span>512G</span>
												  </label>
												</span>
											</div>
										</div>
										<hr>
										</div>
                         
										<div class="product-option-item join">
											<div class="option-title-area">
												<h3 class="option-title mt-3 mb-2">가입유형</h3>
											</div>
											
											<div class="option-types" id="joinType">
											<c:choose>
											<c:when test="${memberVO.ownCheck == 0}">
												<span class="c-ick-btn">
													<input type="radio" hidden name="joinType" id="joinType1" value="0">
													<label for="joinType1" class="btn m-1 btn-outline-custom joinType btn-disabled">
														<span class="labelin">기기변경</span>
													</label>
												</span>
											</c:when>
											<c:otherwise>
											<span class="c-ick-btn">
													<input type="radio" hidden name="joinType" id="joinType1" value="0">
													<label for="joinType1" class="btn m-1 btn-outline-custom joinType">
														<span class="labelin">기기변경</span>
													</label>
												</span>
											</c:otherwise>
											</c:choose>
											<c:choose>
											<c:when test="${memberVO.ownCheck == 1}">
												<span class="c-ick-btn">
													<input type="radio" hidden name="joinType" id="joinType2" value="1">
													<label for="joinType2" class="btn m-1 btn-outline-custom joinType btn-disabled">
														<span class="labelin">번호이동</span>
													</label>
												</span>
											</c:when>
											<c:otherwise>
											<span class="c-ick-btn">
													<input type="radio" hidden name="joinType" id="joinType2" value="1">
													<label for="joinType2" class="btn m-1 btn-outline-custom joinType">
														<span class="labelin">번호이동</span>
													</label>
												</span>
												</c:otherwise>
											</c:choose>
												<span class="c-ick-btn">
													<input type="radio" hidden name="joinType" id="joinType3" value="2">
													<label for="joinType3" class="btn m-1 btn-outline-custom joinType">
														<span class="labelin">신규가입</span>
													</label>
												</span>
											</div>
											
										</div>                                    
							<!-- 할인유형 선택  -->
									<div class="product-option-item pay installment">
											<div class="option-title-area">
												<h3 class="option-title mt-3 mb-2">이용방법</h3>
											</div>
										<div class="option-types mb-3" id="payType">
											<span class="c-ick-btn lg">
												<input type="radio" hidden name="disKind" id="payType1" value="1">
												<label for="payType1" class="btn m-1 btn-outline-custom payType">
													<span class="labelin">12개월<br>약정할인</span>
												</label>
											</span>
											<span class="c-ick-btn lg checked">
												<input type="radio" hidden name="disKind" id="payType2" value="2">
												<label for="payType2" class="btn m-1 btn-outline-custom payType">
													<span class="labelin">24개월<br>약정할인</span>
												</label>
											</span>
											<span class="c-ick-btn lg">
												<input type="radio" hidden name="disKind" id="payType3" value="0">
												<label for="payType3" class="btn btn-outline-custom m-1 payType">
													<span class="labelin">24개월<br>공시지원금</span>
												</label>
											</span>
										</div>
									</div>
				<!-- 선택한 요금제 정보  -->	
						<div class="product-option-item" style="position: relative; padding: 16px 0 30px 100px; border-top: 1px solid #d3d3d3;">
							<div>
								<div class="option-title-area mt-3" style="position: absolute; top: 42px; left: 0;">
									<span class="option-title" style="display: inline-block; color: #5a5a5a; 
									font-size: 14px; font-weight: 400;">요금제</span>
								</div>
							</div>
							<div class="product-option-item compare mt-3" id="subscriptionInfo">
								<div class="compare-inner" style="display: block; margin-block-start: 1em; margin-block-end: 1em; margin-inline-start: 0px; margin-inline-end: 0px; margin: 0; padding: 0;">
									<div class="compare-title">
										<div class="info">
											<div class="tit">
												<!-- 선택된 요금제 이름 span의 text에 삽입 -->
												<span class="sub-tit" id="selectedPlanName" style="overflow: hidden; font-size: 22px; font-weight: 700; letter-spacing: -0.5px; 
												text-overflow: ellipsis;" data-plan-name="" value=""></span>
												<!-- 체크용 planNum -->
												<br>
												<h2 class="main-tit" id="dataDefaultQty" style="margin: 3px 0 3px; font-size: 16px; font-weight: 400; letter-spacing: -0.56px; 
												padding-right: 100px;"> 데이터 <span id="dataGB"></span> </h2>                                                            
											</div>
											<div class="data" style="position: absolute; top: 35px; right: 0; text-align: right;">
												<!-- 선택된 요금제 금액 h2의 text에 삽입 -->
												<h2 class="price theme-color" id="planPrice" style="letter-spacing: -0.2px; display: block; margin-top: 4px; margin-right:50px; 
												color: #000; font-weight: 700;" data-plan-price2="" data-dp="">${monthlyPay.planNum}</h2> 
												<p style="color:black; font-size:15px; margin-top:-20px;" class="fw-bold" >원/월</p>
											</div> 
											<div class="d-flex justify-content-end">
											    <a href="javascript:void(0)" data-bs-toggle="modal" id="cartEffect" data-bs-target="#quick-view2"
											    class="btn" style="margin-top:-95px; margin-right:-30px;" > 
												<span style="text-decoration: underline; color:black;">요금제 변경하기</span> 
			                                    </a>
			                                </div>
										</div>
									</div>            
								</div>
							</div>
                        </div>
                      <!-- 선택한 요금제 정보 end -->	  
                    	</div> <!-- id = "diretList" div -->
	                </div>
	            </div>
        	</div> 
    	</div><!-- 상품 이미지까지 감싸는 태그 -->	
    </div>

                <div class="col-12">
                    <div class="cloth-review">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab"
                                    data-bs-target="#desc" type="button">상품정보</button>

                                <button class="nav-link" id="nav-question-tab" data-bs-toggle="tab"
                                    data-bs-target="#question" type="button">상품문의</button>

                                <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab"
                                    data-bs-target="#review" type="button">상품리뷰</button>
                            </div>
                        </nav>
			<!-- 상품 상세정보 nav tap -->
	                        <div class="tab-content" id="nav-tabContent">
	                            <div id="desc" class="tab-pane fade show active">
	                                <div class="p_description">
	                                
	                                    ${list[0].directContents}
	                                    
	                                </div>
	                            </div>
	                           
	                        
			<!-- 상품 문의 nav tap -->
							<div class="tab-pane fade" id="question">
							    <div class="accordion-group-header side-type mb-4">
							    <c:set var="qnaCount" value="${fn:length(qnaList)}" />
							        <h2 class="left title m-0">상품 문의 (${qnaCount})</h2>
							        <div class="d-flex justify-content-end">
							        	<button class="btn btn-solid-default btn-sm fw-bold me-4" style="margin-top:-25px;" data-bs-toggle="modal"
                                         data-bs-target="#addQna">문의 작성</button>
                                    </div>
                                </div>
                                	<div class="container mb-5">
                                	<c:forEach items="${qnaList}" var="qna">
                                    	<div class="category-option" data-qna-num="${qna.num}" data-qna-member="${qna.memberNum}" data-qna-state="${qna.state}">
                                        	<div class="accordion category-name" id="accordionExample">
                                            	<div class="accordion-item category-rating">
                                                	<h2 class="accordion-header"  id="headingThree" style="padding:0px;">
                                                    	<button class="accordion-button" style="background-color:#fff; padding:0px;" type="button" data-bs-toggle="collapse"
                                                       	 data-bs-target="#collapseThree">
                                                        	<div class="d-flex col-10">
																
																<c:if test="${qna.state == 0}">
																<div class="col-2 mx-2" style="color:gray;">
                                                           			<span>답변대기</span>
                                                           		</div>	
                                                           		</c:if>	
                                                           		<c:if test="${qna.state == 1}">
                                                           		<div class="col-2 mx-2 theme-color">
                                                           			<span>답변완료</span>
                                                           		</div>
                                                           		</c:if>	
                                                        		
                                                       			<h5 class="col-7 me-5 ellipsis">${qna.contents}</h5> 
                                                       			<c:set var="username" value="${fn:substringBefore(qna.email, '@')}" /> 
                                                       				<span class="user col-1 me-5 fw-bold" >${username}</span>
                                                       				<fmt:formatDate value="${qna.regDate}" pattern="yyyy/MM/dd" var="formattedDate" />
																	<span style="font-weight:400;">${formattedDate}</span>
                                                    		</div>  
                                                    	</button>
                                                	</h2>
                                                	
                                                	<div id="collapseThree" class="accordion-collapse collapse"
                                                    	aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                                    	<div class="accordion-body">
                                                        	<div class="card">
                                                            	<div class="card-body"><!----><!---->                                                            
	                                                                <span class="cate col-1">
	                                                                    <span class="fw-bold text-danger">Q</span> 
	                                                                </span>
	                                                                <c:if test="${empty qna.reply && memberVO.memberNum eq qna.memberNum}">
	                                                                <div class="member-update-delete d-flex justify-content-end">
								                                        <a href="javascript:void(0)" class="me-3 qnaUpdate" data-bs-toggle="modal"
				                                                            data-bs-target="#updateQna" id="qnaUpdate${qna.num}"
				                                                            data-qna-num="${qna.num}">수정</a>
								                                        <a href="javascript:void(0)" data-bs-toggle="modal"
						                                                    data-bs-target="#qnadel" onclick="qnaDelete()" data-qna-num="${qna.num}" id="qnaDel">삭제</a>
	                                    					</div>    
	                                                                </c:if>
                                                                <div id="qnaContentsQ" >
                                                                ${qna.contents} 
                                                                </div>
                                                                <c:if test="${memberVO.adminCheck eq 0 && empty qna.reply}">
                                                                <button type="button" class="btn" style="margin-left:-20px;" id="replyAdd" data-bs-toggle="modal"
                                         							data-bs-target="#addReply" data-qna-num="${qna.num}"> 답변달기</button>
                                                                </c:if>
                                                                <c:if test="${not empty qna.reply}"> 
                                                                <hr>
                                                                <div class="reply-box">
                                                                    <span class="cate col-1">
                                                                        <span class="fw-bold text-danger"> A</span>
                                                                    </span>
                                                                    <div>
                                                                    ${qna.reply}
                                                                    </div>
                                                                    <fmt:formatDate value="${qna.replyDate}" pattern="yyyy/MM/dd" var="formattedDate2" />
																	<span style="font-weight:400; float:right;" >답변작성일 : ${formattedDate2}</span>
                                                                </div>
                                                                </c:if>
                                                            	</div><!----><!---->
                                                        	</div>
                                                    	</div>
                                                	</div>
                                            	</div>
                                        	</div>   
                                    	</div>
                                    	</c:forEach>
                                	</div>  
                             	</div>
                             	
                             	<!-- 상품문의 끝 -->
						<!-- 구매후기 시작 -->
                             <div class="tab-pane fade" id="review">
                                <div class="row g-4 col-12">
                                    <div class="col-md-3" style="margin-top:-20px;">
                                        <div class="customer-rating mt-5 me-5" >
                                           
			                                  		<div hidden>        
								                       <c:set var="totalRating" value="0" />${totalRating}
														<c:forEach items="${review}" var="review">
					    									<c:set var="totalRating" value="${totalRating + review.rate}" /><p> 이거 뭐야  ${totalRating} </p>
														</c:forEach>
													</div>
													<c:set var="averageRating" value="${empty review ? 0 : totalRating / review.size()}" />
														<c:if test="${not empty averageRating && averageRating != null}">
														    <h2>평점 (<fmt:formatNumber value="${averageRating}" pattern="#.#" />)</h2>
														</c:if>

				                                            <ul class="rating my-2 d-inline-block">
																<li><i class="fas fa-star ${averageRating >= 0.5 ? 'theme-color' : ''}"></i></li>
																<li><i class="fas fa-star ${averageRating >= 1.5 ? 'theme-color' : ''}"></i></li>
																<li><i class="fas fa-star ${averageRating >= 2.5 ? 'theme-color' : ''}"></i></li>
																<li><i class="fas fa-star ${averageRating >= 3.5 ? 'theme-color' : ''}"></i></li>
																<li><i class="fas fa-star ${averageRating >= 4.5 ? 'theme-color' : ''}"></i></li>
											        		</ul>  
			                                            <div class="global-rating">
			                                                <h5 class="font-light">${review.size()}건</h5>
			                                            </div>
															<ul class="rating-progess">
																<li>
																    <h5 class="me-3">5 점</h5>
																  <c:set var="fiveStarCount" value="0" />
																	<c:forEach items="${review}" var="r">
																		<c:if test="${r.rate >= 4.5 && r.rate <= 5.0}">
																			<c:set var="fiveStarCount" value="${fiveStarCount + 1}" />
																		</c:if>
																	</c:forEach>
																	<div class="progress">
																	    <c:set var="fiveStarPercentage" value="${(fiveStarCount / fn:length(review)) * 100}" />
																			<div class="progress-bar" role="progressbar" style="width: ${fn:substringBefore(fiveStarPercentage, '.')}%;"
																			aria-valuenow="${fn:substringBefore(fiveStarPercentage, '.')}%" aria-valuemin="0" aria-valuemax="100"></div>
																	</div>
																	<h5 class="ms-3">
																    <c:set var="fiveStarPercentage" value="${(fiveStarCount / fn:length(review)) * 100}" />
																	<c:out value="${fn:substringBefore(fiveStarPercentage, '.')}%" />
																    </h5>
																</li>
																<li>
																    <h5 class="me-3">4 점</h5>
																    <c:set var="fourStarCount" value="0" />
																		<c:forEach items="${review}" var="r">
																			<c:if test="${r.rate >= 3.5 && r.rate < 4.5}">
																				<c:set var="fourStarCount" value="${fourStarCount + 1}" />
																			</c:if>
																		</c:forEach>
																	<div class="progress">
																    	<c:set var="fourStarPercentage" value="${(fourStarCount / fn:length(review)) * 100}" />
																	<div class="progress-bar" role="progressbar" style="width: ${fn:substringBefore(fourStarPercentage, '.')}%;"
																	aria-valuenow="${fn:substringBefore(fourStarPercentage, '.')}%" aria-valuemin="0" aria-valuemax="100"></div>
																	</div>
																	<h5 class="ms-3">
																    <c:set var="fourStarPercentage" value="${(fourStarCount / fn:length(review)) * 100}" />
																	<c:out value="${fn:substringBefore(fourStarPercentage, '.')}%" />
																    </h5>
																</li>
																<li>
																    <h5 class="me-3">3 점</h5>
															    	<c:set var="threeStarCount" value="0" />
																		<c:forEach items="${review}" var="r">
																			<c:if test="${r.rate >= 2.5 && r.rate < 3.5}">
																				<c:set var="threeStarCount" value="${threeStarCount + 1}" />
																			</c:if>
																		</c:forEach>
																	<div class="progress">
																	    <c:set var="threeStarPercentage" value="${(threeStarCount / fn:length(review)) * 100}" />
																	<div class="progress-bar" role="progressbar" style="width: ${fn:substringBefore(threeStarPercentage, '.')}%;"
																	aria-valuenow="${fn:substringBefore(threeStarPercentage, '.')}%" aria-valuemin="0" aria-valuemax="100"></div>
																	</div>
																	<h5 class="ms-3">
																    <c:set var="fourStarPercentage" value="${(threeStarCount / fn:length(review)) * 100}" />
																	<c:out value="${fn:substringBefore(threeStarPercentage, '.')}%" />
																    </h5>
																</li>
																<li>
																    <h5 class="me-3">2 점</h5>
																    <c:set var="twoStarCount" value="0" />
																		<c:forEach items="${review}" var="r">
																			<c:if test="${r.rate >= 1.5 && r.rate < 2.5}">
																				<c:set var="twoStarCount" value="${twoStarCount + 1}" />
																			</c:if>
																		</c:forEach>
																	<div class="progress">
																    	<c:set var="twoStarPercentage" value="${(twoStarCount / fn:length(review)) * 100}" />
																	<div class="progress-bar" role="progressbar" style="width: ${fn:substringBefore(twoStarPercentage, '.')}%;"
																	aria-valuenow="${fn:substringBefore(twoStarPercentage, '.')}%" aria-valuemin="0" aria-valuemax="100"></div>
																	</div>
																	<h5 class="ms-3">
																    <c:set var="twoStarPercentage" value="${(twoStarCount / fn:length(review)) * 100}" />
																	<c:out value="${fn:substringBefore(twoStarPercentage, '.')}%" />
																    </h5>
																</li>
																<li>
																    <h5 class="me-3">1 점</h5>
																    <c:set var="oneStarCount" value="0" />
																		<c:forEach items="${review}" var="r">
																			<c:if test="${r.rate >= 0.5 && r.rate < 1.5}">
																				<c:set var="oneStarCount" value="${oneStarCount + 1}" />
																			</c:if>
																		</c:forEach>
																	<div class="progress">
																	    <c:set var="oneStarPercentage" value="${(oneStarCount / fn:length(review)) * 100}" />
																	<div class="progress-bar" role="progressbar" style="width: ${fn:substringBefore(oneStarPercentage, '.')}%;"
																	aria-valuenow="${fn:substringBefore(oneStarPercentage, '.')}%" aria-valuemin="0" aria-valuemax="100"></div>
																	</div>
																	<h5 class="ms-3">
																	    <c:set var="oneStarPercentage" value="${(oneStarCount / fn:length(review)) * 100}" />
																		<c:out value="${fn:substringBefore(oneStarPercentage, '.')}%" />
																    </h5>
																</li>
															</ul>
								<!-- 왼쪽 총 별점 퍼센테이지 및 평균 평점 -->
                                       	 </div>
                                    </div>

									<div class="customer-review-box col-md-9">
   										<div class="review-box d-flex justify-content-end">
   										<%-- 오더 완성되면 사용할 예정<c:set var="hasPurchase" value="false" />

										<c:forEach var="order" items="${orderList}">
										    <c:if test="${order.directCode eq '해당 제품 코드' && not empty order.orderNum && order.memberNum eq '구매한 멤버 번호'}">
										        <c:set var="hasPurchase" value="true" />
										        <c:break />
										    </c:if>
										</c:forEach>
										
										<c:if test="${hasPurchase eq 'true'}">
										    <button type="button" class="btn btn-primary">버튼</button>
										</c:if> --%>
										
											<div class="box-head">
											    <button class="btn btn-solid-default btn-sm fw-bold writeReview" data-bs-toggle="modal"
											        data-bs-target="#addReview">후기 작성</button>
											</div>
										</div>
                                            <h2 class="col-md-7" style="margin-top:-50px;">구매 후기</h2>
											<c:choose>
											    <c:when test="${empty review}">
											        <p>작성된 리뷰가 없습니다.</p>
											    </c:when>
											    <c:otherwise>
											<c:forEach items="${review}" var="review">
	                                             <div class="customer-section" data-review="${review.num}" data-rate="${review.rate}">
	                                                <div class="customer-details">
	                                                    <c:set var="username" value="${fn:substringBefore(review.email, '@')}" />
															<h5>${username}</h5>
															<c:if test="${memberVO.memberNum eq review.memberNum }">
															<div class="admin-update-delete d-flex justify-content-end">
						                                        <a href="javascript:void(0)" class="me-3 reviewUpdate" data-bs-toggle="modal"
		                                                            data-bs-target="#updateReview" id="reviewUpdate${review.num}"
		                                                            data-review-num="${review.num}">수정</a>
						                                        <a href="javascript:void(0)" data-bs-toggle="modal"
						                                                    data-bs-target="#reviewdel" onclick="reviewDelete()" data-review-num="${review.num}" id="reviewDel">삭제</a>
	                                    					</div>    
	                                    					</c:if>
                                                    <ul class="rating my-2 d-inline-block">
							                          	<li> <i class="fas fa-star ${review.rate >= 0.5 ? 'theme-color' : ''}"></i></li>
													    <li><i class="fas fa-star ${review.rate >= 1.5 ? 'theme-color' : ''}"></i></li>
											            <li><i class="fas fa-star ${review.rate >= 2.5 ? 'theme-color' : ''}"></i></li>
											            <li><i class="fas fa-star ${review.rate >= 3.5 ? 'theme-color' : ''}"></i></li>
											            <li><i class="fas fa-star ${review.rate >= 4.5 ? 'theme-color' : ''}"></i></li>
											        </ul>        
														<input type="hidden" id="reviewNum" value="${review.num}" data-comment-num="${review.num}">
	                                                    	<p class="font-light" name="contents">${review.contents}</p>
	                                                    <input type="hidden" id="orderNum" name="orderNum" value="${review.orderNum}">
														<input type="hidden" id="memberNum" name="memberNum" value="${review.memberNum}">
														<input type="hidden" name="slicedCode" value="${param.slicedCode}">
													<p class="date-custo font-light">
														<fmt:formatDate value="${review.regDate}" pattern="yyyy/MM/dd" /><span></span></p>
                                                	</div>
                                               	</div>
											</c:forEach>
											</c:otherwise>
											</c:choose>
                          <!-- paging --> <nav class="page-section d-flex justify-content-end"
                                                style="position: relative;">
                                                <ul class="pagination mx-auto">
                                                    <li class="page-item">
                                                        <a class="page-link" href="javascript:void(0)"
                                                            aria-label="Previous">
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
                                            </nav> <!-- paging -->
                                        </div>
                                    </div>
                            	</div>
                            	<!-- 구매후기 end -->
                        </div>
                    </div>
		</div>
	</div>
</section>
    <!-- Shop Section end -->

<!-- 변경하기 모달창 start -->
<div class="modal fade quick-view-modal" id="quick-view2">
    <div class="modal-dialog modal-xl modal-dialog-centered col-12">
        <div class="modal-content">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body">
                 <div>
                         <div class="row gy-4">
                             <div class="col-12">
                                 <div class="product-right">
                                     <div class="size-detail">
                                         <h6 class="mb-3 mx-3 fw-bolder">요금제 선택</h6>
                                         <input type="text" id="age">
                                         <!-- 요금제 유형 영역, 주석처리한거 써도 되기는한데 순서가 안맞을 수 있어서 아래처럼 처리함 -->
                                         <ul class="nav border-0" style="color:black;">
                                         <c:forEach items="${existList}" var="i">
                                         	<c:if test="${i.note eq '5G 요금제'}">
                                         		<li class="nav-item" style="margin-left:1.5%;">
                                          		<a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-1" id="">${i.note}</a>
                                          	</li>
                                         	</c:if>
                                         	<c:if test="${i.note eq '시니어 요금제'}">
                                         		<li class="nav-item ">
                                          		<a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-2" id="tab-s">${i.note}</a>
                                          	</li>
                                         	</c:if>
                                         	<c:if test="${i.note eq '청소년 요금제'}">
                                         		<li class="nav-item">
                                          		<a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-3">${i.note}</a>
                                          	</li>
                                         	</c:if>
                                         	<c:if test="${i.note eq '어린이 요금제'}">
                                         		<li class="nav-item">
                                          		<a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-4">${i.note}</a>
                                          	</li>
                                         	</c:if>
                                         	<c:if test="${i.note eq '복지 요금제'}">
                                         		<li class="nav-item">
                                          		<a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-5">${i.note}</a>
                                          	</li>
                                         	</c:if>
                                         	<c:if test="${i.note eq '군인 요금제'}">
                                         		<li class="nav-item">
                                          		<a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-6">${i.note}</a>
                                          	</li>
                                         	</c:if>
                                         </c:forEach>
                                         <%-- <c:forEach items="${existList}" var="i" varStatus="status">
                                         	<li class="nav-item">
                                         		<a class="nav-link" style="color:black;" data-bs-toggle="tab" href="#tab-${status.count}">${i.note}</a>
                                         	</li>
                                         </c:forEach> --%>
                                         </ul>
                                         
                                         <!-- 요금제 상세 영역 -->
                                         <div class="tab-content" id="planArea">
                                         	<!-- 상세 리스트 -->
                                         	<!-- 5G -->
                                  			<c:if test="${not empty gList}">
                                         	<div class="tab-pane fade show active" id="tab-1">
                                        			<div class="row col-md-12 mt-3 mx-3">
                                          	<c:forEach items="${gList}" var="i" varStatus="status">
                                          	<div class="mt-1" style="border-box:0px; box-shadow:1px 1px 2px 0px gray;  width:97%;">
                                           	<div class="form-check custome-radio-box mt-1">
                                         				<input type="radio" name="planNum" class="form-check-input my-2" id="${i.planNum}" value="${i.planNum}"data-gb-value="${i.dataCapacity}"  data-plan-price="${i.planPrice}" data-dp="${i.disCode}"/>
                                         				<label class="form-check-label fs-5" for="${i.planNum}">${i.planName}</label>
                                                  </div>
                                                  <div class="d-flex justify-content-between mb-1">
                                                  	<label class="form-check-label ellipsis fs-6 mx-3" style="color:gray;">
                                                  		${i.planExplainS}
                                                  	</label>
                                                  	<label class="form-check-label me-3 "> <span class="fs-6">데이터 </span>
                                                  	
                                                  	<span class="fw-bold fs-6">
                                                  	<c:choose>
                                                  		<c:when test="${i.dataCapacity eq '무제한'}">
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}"></c:set>
                                                  		</c:when>
                                                  		<c:otherwise>
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}GB"></c:set>
                                                  		</c:otherwise>
                                                  	</c:choose>
                                                  	
                                                  	${modiCapacity}</span>, <span class="theme-color fs-6 fw-bold" id="commaPrice${i.planNum}">${i.planPrice}</span><span class="fs-6">원</span>/월</label>
                                                  </div>                                       
                                                 </div>
                                                 
                                          	</c:forEach>
                                        			</div>
                                        		</div>
                                         	</c:if>
                                         	<!-- 시니어 -->
											<c:if test="${not empty sList}">
												<div class="tab-pane fade" id="tab-2">
                                        			<div class="row col-md-12 mt-3 mx-3">
                                          	<c:forEach items="${sList}" var="i" varStatus="status">
                                          		<div class="mt-1" style="border-box:0px; box-shadow:1px 1px 2px 0px gray;  width:97%;">
                                           	<div class="form-check custome-radio-box mt-1">
                                         				<input type="radio" name="planNum" class="form-check-input my-2" id="${i.planNum}" value="${i.planNum}"data-gb-value="${i.dataCapacity}" data-plan-price="${i.planPrice}" data-dp="${i.disCode}"/>
                                         				<label class="form-check-label fs-5" for="${i.planNum}">${i.planName}</label>
                                         				<div class="noti" style="margin-top:-10px; margin-left:10px; display:inline-block;"></div>
                                                  </div>
                                                  <div class="d-flex justify-content-between mb-1">
                                                  	<label class="form-check-label ellipsis fs-6 mx-3" style="color:gray;">
                                                  		${i.planExplainS}
                                                  	</label>
                                                  	<label class="form-check-label me-3 "> <span class="fs-6">데이터 </span>
                                                  	
                                                  	<span class="fw-bold fs-6">
                                                  	<c:choose>
                                                  		<c:when test="${i.dataCapacity eq '무제한'}">
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}"></c:set>
                                                  		</c:when>
                                                  		<c:otherwise>
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}GB"></c:set>
                                                  		</c:otherwise>
                                                  	</c:choose>
                                                  	
                                                  	${modiCapacity}</span>, <span class="theme-color fs-6 fw-bold" id="commaPrice${i.planNum}">${i.planPrice}</span><span class="fs-6">원</span>/월</label>
                                                  </div>                                       
                                                 </div>
                                          	</c:forEach>
                                        			</div>
                                        		</div>
											</c:if>
											<!-- 청소년 -->
											<c:if test="${not empty tList}">
											<div class="tab-pane fade" id="tab-3">
                                        			<div class="row col-md-12 mt-3 mx-3">
                                          	<c:forEach items="${tList}" var="i" varStatus="status">
                                           	<div class="mt-1" style="border-box:0px; box-shadow:1px 1px 2px 0px gray;  width:97%;">
                                           	<div class="form-check custome-radio-box mt-1">
                                         				<input type="radio" name="planNum" class="form-check-input my-2" id="${i.planNum}" data-gb-value="${i.dataCapacity}" value="${i.planNum}" data-plan-price="${i.planPrice}" data-dp="${i.disCode}"/>
                                         				
                                         				<label class="form-check-label fs-5 " for="${i.planNum}">${i.planName}</label>
                                         				<div class="noti" style="margin-top:-10px; margin-left:10px; display:inline-block;"></div>
                                                  </div>
                                                  <div class="d-flex justify-content-between mb-1">
                                                  	<label class="form-check-label ellipsis fs-6 mx-3" style="color:gray;">
                                                  		${i.planExplainS}
                                                  	</label>
                                                  	<label class="form-check-label me-3 "> <span class="fs-6">데이터 </span>
                                                  	
                                                  	<span class="fw-bold fs-6"> 
                                                  	<c:choose>
                                                  		<c:when test="${i.dataCapacity eq '무제한'}">
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}"></c:set>
                                                  		</c:when>
                                                  		<c:otherwise>
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}GB"></c:set>
                                                  		</c:otherwise>
                                                  	</c:choose>
                                                  	
                                                  	${modiCapacity}</span>, <span class="theme-color fs-6 fw-bold"id="commaPrice${i.planNum}">${i.planPrice}</span><span class="fs-6">원</span>/월</label>
                                                  </div>                                       
                                                 </div>
                                          	</c:forEach>
                                        			</div>
                                        		</div>
                                         	</c:if>

												<!-- 어린이 -->
												<c:if test="${not empty zList}">
												<div class="tab-pane fade" id="tab-4">
                                        			<div class="row col-md-12 mt-3 mx-3">
                                          	<c:forEach items="${zList}" var="i" varStatus="status">
                                           	<div class="mt-1" style="border-box:0px; box-shadow:1px 1px 2px 0px gray;  width:97%;">
                                           	<div class="form-check custome-radio-box mt-1">
                                         				<input type="radio" name="planNum" class="form-check-input my-2" id="${i.planNum}" value="${i.planNum}" data-gb-value="${i.dataCapacity}" data-plan-price="${i.planPrice}" data-dp="${i.disCode}"/>
                                         				<label class="form-check-label fs-5" for="${i.planNum}">${i.planName}</label>
                                         				<div class="noti" style="margin-top:-10px; margin-left:10px; display:inline-block;"></div>
                                                  </div>
                                                  <div class="d-flex justify-content-between mb-1">
                                                  	<label class="form-check-label ellipsis fs-6 mx-3" style="color:gray;">
                                                  		${i.planExplainS}
                                                  	</label>
                                                  	<label class="form-check-label me-3 "> <span class="fs-6">데이터 </span>
                                                  	
                                                  	<span class="fw-bold fs-6">
                                                  	<c:choose>
                                                  		<c:when test="${i.dataCapacity eq '무제한'}">
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}"></c:set>
                                                  		</c:when>
                                                  		<c:otherwise>
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}GB"></c:set>
                                                  		</c:otherwise>
                                                  	</c:choose>
                                                  	
                                                  	${modiCapacity}</span>, <span class="theme-color fs-6 fw-bold" id="commaPrice${i.planNum}">${i.planPrice}</span><span class="fs-6">원</span>/월</label>
                                                  </div>                                       
                                                 </div>
                                          	</c:forEach>
                                        			</div>
                                        		</div>
                                         	</c:if>
											<!-- 복지 -->
											<c:if test="${not empty wList}">
											<div class="tab-pane fade" id="tab-5">
                                        			<div class="row col-md-12 mt-3 mx-3">
                                          	<c:forEach items="${wList}" var="i" varStatus="status">
                                           	<div class="mt-1" style="border-box:0px; box-shadow:1px 1px 2px 0px gray;  width:97%;">
                                           	<div class="form-check custome-radio-box mt-1">
                                         				<input type="radio" name="planNum" class="form-check-input my-2" id="${i.planNum}" value="${i.planNum}" data-gb-value="${i.dataCapacity}" data-plan-price="${i.planPrice}" data-dp="${i.disCode}"/>
                                         				<label class="form-check-label fs-5" for="${i.planNum}">${i.planName}</label>
                                                  </div>
                                                  <div class="d-flex justify-content-between mb-1">
                                                  	<label class="form-check-label ellipsis fs-6 mx-3" style="color:gray;">
                                                  		${i.planExplainS}
                                                  	</label>
                                                  	<label class="form-check-label me-3 "> <span class="fs-6">데이터 </span>
                                                  	
                                                  	<span class="fw-bold fs-6">
                                                  	<c:choose>
                                                  		<c:when test="${i.dataCapacity eq '무제한'}">
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}"></c:set>
                                                  		</c:when>
                                                  		<c:otherwise>
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}GB"></c:set>
                                                  		</c:otherwise>
                                                  	</c:choose>
                                                  	
                                                  	${modiCapacity}</span>, <span class="theme-color fs-6 fw-bold" id="commaPrice${i.planNum}">${i.planPrice}</span><span class="fs-6">원</span>/월</label>
                                                  </div>                                       
                                                 </div>
                                          	</c:forEach>
                                        			</div>
                                        		</div>
                                         	</c:if>
												<!-- 군인 -->
												<c:if test="${not empty hList}">
												<div class="tab-pane fade" id="tab-6">
                                        			<div class="row col-md-12 mt-3 mx-3">
                                          	<c:forEach items="${hList}" var="i" varStatus="status">
                                           	<div class="mt-1" style="border-box:0px; box-shadow:1px 1px 2px 0px gray;  width:97%;">
                                           	<div class="form-check custome-radio-box mt-1">
                                         				<input type="radio" name="planNum" class="form-check-input my-2" id="${i.planNum}" value="${i.planNum}" data-gb-value="${i.dataCapacity}" data-plan-price="${i.planPrice}" data-dp="${i.disCode}"/>
                                         				<label class="form-check-label fs-5" for="${i.planNum}">${i.planName}</label>
                                                  </div>
                                                  <div class="d-flex justify-content-between mb-1">
                                                  	<label class="form-check-label ellipsis fs-6 mx-3" style="color:gray;">
                                                  		${i.planExplainS}
                                                  	</label>
                                                  	<label class="form-check-label me-3 "> <span class="fs-6">데이터 </span>
                                                  	
                                                  	<span class="fw-bold fs-6">
                                                  	<c:choose>
                                                  		<c:when test="${i.dataCapacity eq '무제한'}">
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}"></c:set>
                                                  		</c:when>
                                                  		<c:otherwise>
                                                  			<c:set var="modiCapacity" value="${i.dataCapacity}GB"></c:set>
                                                  		</c:otherwise>
                                                  	</c:choose>
                                                  	
                                                  	${modiCapacity}</span>, <span class="theme-color fs-6 fw-bold" id="commaPrice${i.planNum}">${i.planPrice}</span><span class="fs-6">원</span>/월</label>
                                                  </div>                                       
                                                 </div>
                                          	</c:forEach>
                                        			</div>
                                        		</div>
                                         	</c:if>
										
	 										<div class="col-12">
                                         	<div class="product-btns">
                                                <button onclick="onSelectConfirm()" type="button"  class=" btn btn-solid-default btn-lg col-md-3 d-block mx-auto"
                                                    data-bs-dismiss="modal">선택하기</button>
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
		</div>
		</div>
<!-- 변경하기 모달창 end -->

	<!-- 리뷰 작성-->
	<div class="modal payment-modal" id="addReview">
		<div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		        <div class="modal-header">
		            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		        </div>
                <form action="./reviewAdd" method="post">
                    <div class="modal-body">
						<ul>
							<li>
                                <label class=""> 상품명</label>
                                <span class="mx-3">|</span>
                                <span class="fw-bold" id="directName2"></span>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <label class="form-label mt-3" style="vertical-align: middle;">평점</label>
                                <div class="rate rating">
                                    <input type="radio" id="star1" name="rate" value="5"><label for="star1"></label>
                                    <input type="radio" id="star2" name="rate" value="4"><label for="star2"></label>
                                    <input type="radio" id="star3" name="rate" value="3"><label for="star3"></label>
                                    <input type="radio" id="star4" name="rate" value="2"><label for="star4"></label>
                                    <input type="radio" id="star5" name="rate" value="1"><label for="star5"></label>
                                </div>
                            </li>		
                        </ul>
                        <div class="mb-4 mt-2">
                            <label for="contents" class="form-label" >구매 후기</label>
                            <textarea class="form-control col-12"  placeholder="간단한 후기를 작성해주세요." id="contents" name="contents" value=""></textarea>
                        </div>
                    </div>
                        
                        <input type="text" id="orderNum" name="orderNum">
                        <input type="text" id="memberNum" name="memberNum">
                        <input type="hidden" name="slicedCode" value="${param.slicedCode}">
                    <div class="modal-footer pt-0 text-end d-block">
                        <button type="button" class="btn btn-solid-default btn-sm" data-bs-dismiss="modal" onclick="form.submit()">작성</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 리뷰 작성 모달 End -->

    <!-- 리뷰 수정 모달 -->
	<div class="modal payment-modal" id="updateReview">
		<div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content" id="modalRevUpdate">
		        <div class="modal-header">
		            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		        </div>
                <!-- <form action="./reviewUpdate" method="post"> -->
                    <div class="modal-body">
						<ul>
                            <li>
                                <label class=""> 상품명</label>
                                <span class="mx-3">|</span>
                                <span id="modalRevName" class="fw-bold" id="modalRevName" name="productName" value="" ></span>
                                
                            </li>
						</ul>
                        <ul>
                            <li>
                                <label class="form-label mt-3" style="vertical-align: middle;" for="rate" value="">평점</label>
                                <div class="modalRate rating">
                                    <input type="radio" id="modalRevStar1" name="rate" value="5"><label for="modalRevStar1"></label>
                                    <input type="radio" id="modalRevStar2" name="rate" value="4"><label for="modalRevStar2"></label>
                                    <input type="radio" id="modalRevStar3" name="rate" value="3"><label for="modalRevStar3"></label>
                                    <input type="radio" id="modalRevStar4" name="rate" value="2"><label for="modalRevStar4"></label>
                                    <input type="radio" id="modalRevStar5" name="rate" value="1"><label for="modalRevStar5"></label>
                                </div>
                            </li>		
                        </ul>
                        <div class="mb-4 mt-2">
                            <label for="modalRevContents" class="form-label" >구매 후기</label>
                            <textarea class="form-control col-12"  placeholder="간단한 후기를 작성해주세요." id="modalRevContents" name="contents">
                            
                            </textarea>
                        </div>   
                    </div>
                    	<input type="hidden" id="modalRevRate" name="rate" value="">
                    	<input type="hidden" id="modalRevNum" name="reviewNum" value="">
                        <input type="hidden" id="modalRevOrderNum" name="orderNum" value="">
                        <input type="hidden" id="modalRevMemberNum" name="memberNum" value="">
                        <input type="hidden" id="modalRevSlicedCode" name="slicedCode" value="${param.slicedCode}">
                    <div class="modal-footer pt-0 text-end d-block">
                        <button type="button" class="btn btn-solid-default btn-sm" data-bs-dismiss="modal" onclick="updateReviewConfirm()" id="updateReviewConfirm">작성</button>
                    </div>
                <!-- </form> -->
            </div>
        </div>
    </div>
    <!-- 리뷰 수정 모달 end -->                 
    
	<!-- 문의 작성 member -->
    				<div class="modal fade payment-modal" id="addQna">
				        <div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>
									<div class="modal-body">
									<form action="./directQnaAdd" method="POST">
										<div class="col-md-12 mt-1 mb-0">
											<div class=""> 상품명
												<span class="mx-3">|</span>
												<span class="fw-bold" id="directName3"></span>
											</div>
											<div class="mt-2 mb-3">
												<label for="contents" class="form-label">상품 문의</label>
												<textarea class="form-control col-12"  placeholder="해당 상품과 관련하여 궁금한 점을 작성해주세요." id="qnaContents" name="contents"></textarea>
											</div>
											
											<input type="text" name="memberNum" id="memberNumQ" value="${memberVO.memberNum}">
											<input type="text" name="slicedCode" id="productNameQ" value="${param.slicedCode}">
											
										</div>
									
										<div class="modal-footer d-flex justify-content-end">
											<button class="btn btn-solid-default btn-sm" data-bs-dismiss="modal" type="button" onclick="form.submit()">작성</button>
										</div>
									</form>
					        		</div>
					    	</div>
						</div>
					</div>
    <!-- 문의작성 모달 End -->
    
    <!-- 문의작성 모달 admin -->
    				<div class="modal fade payment-modal" id="addReply">
				        <div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
								</div>
									<div class="modal-body">
									<form action="./directReplyAdd" method="POST">
										<div class="col-md-12 mt-1 mb-0">
											<div class=""> 상품명
												<span class="mx-3">|</span>
												<span class="fw-bold" id="directName4"></span>
											</div>
											<div class="mt-2 mb-3">
												<label for="contents" class="form-label">문의내용</label>
												<textarea class="form-control col-12" id="modelQnaContents" name="contents" readonly> </textarea>
											</div>
											<div class="mt-2 mb-3">
												<label for="reply" class="form-label">답변작성</label>
												<textarea class="form-control col-12" id="modelQnaReply" name="reply"></textarea>
											</div>
											
											<input type="text" name="num" id="modalQnaNum" >
											<input type="hidden" name="slicedCode" value="${param.slicedCode}">
											
										</div>
									
										<div class="modal-footer d-flex justify-content-end">
											<button class="btn btn-solid-default btn-sm" data-bs-dismiss="modal" type="button" onclick="form.submit()">작성</button>
										</div>
									</form>
					        		</div>
					    	</div>
						</div>
					</div>
    <!-- 문의작성 모달 End -->
    

    <!-- sticky cart -->
    <div class="sticky-bottom-cart" style="background-color: #383838;">
        <div class="container">
            <div class="cart-content">
                <div class="l-grid" style="margin-left: 102px; height: 90px; width: 1180px; margin: 0 auto;">            
                    <div id="paySummary" class="price-area" style="width: 680px; float: left; padding-top: 28px; line-height: normal;">
                        <p class="price-opt">
                            <span class="title" style=" ">휴대폰 월 할부금</span>
                            <em class="price" style="font-style: normal;">		
                                <span class="num" id="out_phonePayPrice"></span>		
                                <span class="unit">원</span>	
                            </em>
                        </p>
                        <span class="ico-plus">+</span>
                        
                        <p class="price-opt">	
                            <span class="title">월 통신요금</span>	
                            <em class="price" style="font-style: normal;">		
                                <span class="num" id="out_planPrice"></span>
                                <span class="unit">원</span>	
                            </em>
                        </p>
                        <span class="ico-equal">=</span>
                        <div class="price-opt">	
                            <span class="title">예상 월 납부 금액</span>	
                            <strong class="price" style="display: inline-block; font-weight: bolder;">		
                                <span class="num" id="totalPrice"></span>		
                                <span class="unit" >원</span>	
                            </strong>	
                            <span class="dsc" style="margin-left: 5px; color: #959595; font-size: 12px;">
                                <button type="button" class="btn-text" id="feeDetail" style="">할부 수수료</button> 
                                5.9%포함
                            </span>
                        </div>
                    </div>
                    <div class="btn-area" style="position: relative; padding-top:17px; float: right;"> 
                        <div class="product-buttons">                      
                        <button type="button" class="btn btn-solid orderBtn" id="orderBtn">주문하기</button>
                    </div> 
                    </div>
                </div>                    
            </div>
        </div>
    </div>    
 <!-- sticky cart end -->
 <!-- 리뷰 삭제 모달창 start -->
 <div class="modal fade payment-modal" id="reviewdel">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                    <div class="mb-4">
                     <h3>정말 삭제하시겠습니까? </h3> <h5>삭제 후에는 복구가 불가합니다.</h5>
                     <input type="hidden" id="modalDelNum" name="num" value="">
                    </div>
            </div>
            <div class="modal-footer pt-0 text-end d-block">
            	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-solid-default rounded-1" id="confirmDelete" onclick="confirmDelete()">삭제</button>
            </div>
        </div>
    </div>
</div>
<!-- 리뷰 삭제 모달창 End -->

<!-- 상품 삭제 모달창 start -->
 <div class="modal fade payment-modal" id="productdel">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
               
                    <div class="mb-4">
                     <h3>정말 삭제하시겠습니까? </h3> <h5>삭제 후에는 복구가 불가합니다.</h5>
                     <input type="hidden" id="modalDelId" name="directCode" value="">
                     <input type="hidden" id="modalDelSC" value="${param.slicedCode}">
                    </div>
            </div>
            <div class="modal-footer pt-0 text-end d-block">
            	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-solid-default rounded-1" id="productDelete">삭제</button>
            </div>
        </div>
    </div>
</div>
<!-- 상품 삭제 모달창 End -->

<c:import url="../temp/footer.jsp"></c:import>

<script src="/assets/js/newDirectCode.js"></script>
<script src="/assets/js/updateReview.js"></script>
    <!-- 버튼 select js -->
        
<!--  하단 금액 바 고정하는 JS -->
<script>
   window.addEventListener('scroll', function() {
    const stickyCart = document.querySelector('.sticky-bottom-cart');
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

  if (scrollTop > 0) {
    stickyCart.style.bottom = '0%';
  } else {
    stickyCart.style.bottom = '0%';
  }
});
</script>
<script>
  // 후기 작성 버튼 클릭 시 모달 창이 열릴 때 실행되는 함수
  $('#addReview').on('show.bs.modal', function (event) {
    const directName = $('.directNameValue').data('direct-name'); // 해당 후기 작성 버튼에 연결된 제품의 directName 값을 가져옴
    $('#directName2').text(directName); // 모달 창 내에서 제품명을 표시하는 곳에 directName 값을 설정
  });
  //문의 작성 버튼 클릭 시 모달 창이 열릴 때 실행되는 함수
  $('#addQna').on('show.bs.modal', function (event) {
	    const directName = $('.directNameValue').data('direct-name'); // 해당 후기 작성 버튼에 연결된 제품의 directName 값을 가져옴
	    $('#directName3').text(directName); // 모달 창 내에서 제품명을 표시하는 곳에 directName 값을 설정
	  });
  
  $('#addReply').on('show.bs.modal', function(event) {
	  const button = $(event.relatedTarget); // 클릭한 버튼 요소
	  const qnaNum = button.data('qna-num'); // data-qna-num 속성 값 가져오기
	  const qnaContents = button.closest('.accordion-item').find('#qnaContentsQ').text().trim(); // 문의 내용 가져오기
	  const directName = $('.directNameValue').data('direct-name'); // 해당 후기 작성 버튼에 연결된 제품의 directName 값을 가져옴
	    $('#directName4').text(directName); // 모달 창 내에서 제품명을 표시하는 곳에 directName 값을 설정

	  // 모달 내부 요소에 값 설정
	  $(this).find('#modalQnaNum').val(qnaNum);
	  $(this).find('#modelQnaContents').val(qnaContents);
	});
</script>

<script>
const capacity = document.getElementsByClassName('capacity');
for(let capacity2 of capacity){
    capacity2.addEventListener('click', function(){
        if(capacity2.classList.contains('btn-outline-custom')){
            for(let capacity3 of capacity){
                if(capacity3.classList.contains('btn-solid-after')){
                    capacity3.classList.remove('btn-solid-after');
                    capacity3.classList.add('btn-outline-custom');
                }
            }
            capacity2.classList.remove('btn-outline-custom');
            capacity2.classList.add('btn-solid-after');
        }
        else{
            capacity2.classList.remove('btn-solid-after');
            capacity2.classList.add('btn-outline-custom');
        }
    })
}

const joinType = document.getElementsByClassName('joinType');
for(let joinType2 of joinType){
    joinType2.addEventListener('click', function(){
        if(joinType2.classList.contains('btn-outline-custom')){
            for(let joinType3 of joinType){
                if(joinType3.classList.contains('btn-solid-after')){
                    joinType3.classList.remove('btn-solid-after');
                    joinType3.classList.add('btn-outline-custom');
                }
            }

            joinType2.classList.remove('btn-outline-custom');
            joinType2.classList.add('btn-solid-after');
        }
        else{
            joinType2.classList.remove('btn-solid-after');
            joinType2.classList.add('btn-outline-custom');
        }
    })
}

const payType = document.getElementsByClassName('payType');
for(let payType2 of payType){
    payType2.addEventListener('click', function(){
        if(payType2.classList.contains('btn-outline-custom')){
            for(let payType3 of payType){
                if(payType3.classList.contains('btn-solid-after')){
                    payType3.classList.remove('btn-solid-after');
                    payType3.classList.add('btn-outline-custom');
                }
            }

            payType2.classList.remove('btn-outline-custom');
            payType2.classList.add('btn-solid-after');
        }
        else{
            payType2.classList.remove('btn-solid-after');
            payType2.classList.add('btn-outline-custom');
        }
    })
}
</script>
<script>



$(document).ready(function() {
    const prices = document.querySelectorAll('[id^="commaPrice"]');
    for (var i = 0; i < prices.length; i++) {
        const price = parseInt(prices[i].innerHTML);
        const commaPrice = price.toLocaleString();
        prices[i].innerHTML =commaPrice ;
       	
    }
 
// 세션에서 리스트에서 선택한 planNum 값 가져오기 ------------->
 	  const splanNum = '${monthlyPay.planNum}';

 	  // 해당 planNum에 해당하는 라디오 버튼을 선택 상태로 변경
 	  $('input[name="planNum"][value="' + splanNum + '"]').prop('checked', true);

 	  // 초기값에 해당하는 요금제 정보를 보여주기
 	  const selectedValue = document.querySelector('input[name="planNum"]:checked');
 	  setSelectedPlan(selectedValue);
 });

// 요금제 변경 모달창에서 값을 선택하고 확인 버튼을 클릭했을 때 호출되는 함수
 	function onSelectConfirm() {
 	  // 선택한 값을 가져오기
 	  const selectedValue = document.querySelector('input[name="planNum"]:checked');
 	  setSelectedPlan(selectedValue);
 	}

 	// 선택한 요금제 정보를 보여주는 함수
 	function setSelectedPlan(selectedValue) {
 	  const planNameLabel = document.querySelector('label[for="' + selectedValue.id + '"]');
 	  const planName = planNameLabel.innerText;
 	  const planPrice = selectedValue.getAttribute('data-plan-price');
 	  const dataGB = selectedValue.getAttribute('data-gb-value');
 	  const planNum = selectedValue.getAttribute('value');

 	  // 가져온 값을 입력하기
 	  document.getElementById('selectedPlanName').textContent = planName;
 	  // 가져온 값을 입력하기
 	  document.getElementById('selectedPlanName').textContent = planName;

 	  // `,`를 추가하여 표시
 	  const formattedPlanPrice = parseInt(planPrice).toLocaleString();
 	  document.getElementById('planPrice').setAttribute('data-plan-price2', formattedPlanPrice);
 	  document.getElementById('planPrice').textContent = formattedPlanPrice;

 	  document.getElementById('planNum').value = planNum;

 	  // 데이터 정보 처리
 	  const dataGBElement = document.getElementById('dataGB');
 	  if (dataGB === '무제한') {
 	    dataGBElement.innerText = dataGB + '& 음성통화/문자 기본제공';
 	  } else {
 	    dataGBElement.innerText = dataGB + 'GB & 음성통화/문자 기본제공';
 	  }
 	}
 // 요금제 변경창에서 선택한 값으로 end<-------------

var priceElement = document.getElementById("planPrice");
var price = parseInt(priceElement.textContent);
var formattedPrice = price.toLocaleString(); // 쉼표를 추가한 형식으로 변환
priceElement.textContent = formattedPrice; 


const memberBirth = '${memberVO.rrnf}';
let age = calculateAge(memberBirth);
console.log(age);


$('#age').val(age);
const radios = document.getElementsByName('planNum');
for (let i = 0; i < radios.length; i++) {
    const radio = radios[i];
    const planNumAge = radio.value;
    
    let maxAge = "";
    let minAge = "";
    if(planNumAge.includes('T')){
 	   maxAge = 18;
 	   
    }
    if(planNumAge.includes('Z')){
    	maxAge = 12;
    }
    
    if(planNumAge.includes('S01')){
    	minAge= 65;
    } else if(planNumAge.includes('S02')){
	   minAge = 70;
   } else if(planNumAge.includes('S03')){
	   minAge = 80;
   }
    
    if (age > maxAge && maxAge != 0) {
        radio.disabled = true;
        $(radio).siblings('.noti').text("나이제한으로 선택이 불가합니다.");
    }
    if (age < minAge && minAge != 0) { 
        radio.disabled = true;
        $(radio).siblings('.noti').text("나이제한으로 선택이 불가합니다.");
    }
}
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






</script>


<!--<script>
    // JavaScript를 사용하여 orderNum과 memberNum 값을 설정
    const orderNumInput = document.getElementById('orderNum');
    const memberNumInput = document.getElementById('memberNum');

    // 로그인한 사용자의 구매내역에서 orderNum과 memberNum 값을 가져와서 설정
    const orderNum = '구매 내역에서 가져온 값';
    const memberNum = '구매 내역에서 가져온 값';

    orderNumInput.value = orderNum;
    memberNumInput.value = memberNum;
</script> -->


<c:import url="../temp/commonJS.jsp"></c:import>
</body>

</html>
