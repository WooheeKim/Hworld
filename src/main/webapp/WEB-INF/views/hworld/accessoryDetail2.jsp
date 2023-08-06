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
    <title>액세서리 상세 페이지</title>
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
                             <div class="col-md-6" style="display:block;">
		                            	<div class="ratio_landscape">
		                                <img src="/assets/images/electronics/product/${param.slicedCode}.jpg">
										</div>	  
		                            </div>
                            <div class="col-md-6">
                                <div class="cloth-details-size">
                                <c:if test="${memberVO.adminCheck == 0}">
                                    <div class="admin-update-delete d-flex justify-content-end">
                                        <a href="./accessoryUpdate?slicedCode=${directVO.slicedCode}" class="me-3">수정</a>
                                        <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#productdel2" id="productDelModal2" >삭제</a>
                                    </div>  
                                    </c:if>  
									<div id="directList">
										
										<c:forEach items="${list}" var="direct" varStatus="status">
										<div class="titlebox" id="${direct.directCode}" data-selected="0">
												<div class="brand" style="font-size: 27px; color: gray;" id="productCode${status.index}"
												data-direct-code="${direct.directCode}" data-direct-price="${direct.directPrice}"
												data-direct-stock="${direct.directStock}">
													${direct.value} <%-- ${direct.slicedCode} ${direct.directCode} --%>
												</div>
													<div class="details-image-concept mt-0" style="font-size: 35px;" id="directName">
														<span class="directNameValue" data-direct-name="${direct.directName}">${direct.directName}</span>
													</div>
													<div>
														<h3 class="mt-3 ">출고가</h3>
													</div>
													<p>
													
														<span class="price-detail theme-color fw-bold" id="renewPrice"><fmt:formatNumber value="${direct.directPrice}" pattern="#,###"/></span>
														<span class="unit theme-color fw-bold fs-5">원</span>
													</p>
												<div class="direct-item" id="item_${direct.directCode}" data-direct-code="${direct.directCode}" data-category-code="${direct.categoryCode}" data-brand-code="${direct.brandCode}" data-sliced-code="${direct.slicedCode}" data-direct-stock="${direct.directStock}" data-direct-price="${direct.directPrice}">
												</div>
												<!-- 원래 orderInfos가 있던 위치 -->
											</div>
										</c:forEach>
										<div class="optionArea">
											<div class="product-option-item color">
												<div class="option-title-area">
													<h3 class="option-title mb-2">색상</h3>
												</div>
												<div class="color-types" id="colorTypes">
													<ul class="color-variant mb-0">
														<li class="bg-white border boder-1 selected" value="W" name="colorCode"></li>
														<li class="bg-gray1" value="G" name="colorCode"></li>
														<li class="bg-black1" value="B" name="colorCode"></li>
														<li class="bg-blue border border-1 text-center align-center" value="0" name="colorCode">없음</li>
													</ul>
												</div>
												<!-- 계산용 -->
												<input type="hidden" id="optionPrice">
												<input type="hidden" id="optionStock">
											</div>
										</div>
										
										<hr>
										
										<!-- 옵션 1개 영역 -->
										<div class="createOptionArea">
											<div class="d-flex justify-content-between cart-content-wrap mb-2">
												<div class="col-4 my-auto d-flex justify-content-between">
													<span class="option-one" style="color: #7e7e7e;">옵션</span>
												</div>
												<div class="col-3 my-auto d-flex justify-content-end">
													<input type="text" id="colorName" style="border:0px; font-size:15px;" readonly>
													<input type="hidden" id="optionStock2" style="border:0px; font-size:15px;" readonly>
												</div>
												<!-- 수량 버튼 -->
												<div class="d-flex quantity-wrapper my-auto">
													<button type="button" id="minusBtn" class="btn quantity-left-minus" style="height: 5px; width: 5px; padding: 10px; margin-top: -6px;">-</button>
													<span class="input-wrapper">
														<input type="text" id="optionQuantity" class="input-number text-center" style="width: 35px; padding: 5px 5px; border: 1px solid #c7c7c5; border-radius: 3px;" value="0">
													</span>
													<button type="button" id="plusBtn" class="btn quantity-right-plus" style="height: 5px; margin-top: -6px; padding: 10px 5px;">+</button>
													<span id="totalQty" style="margin-left: 10px;"></span>
												</div>
												<div class="btn-area">
													<div class="product-buttons d-flex justify-content-end my-auto">
														<button type="button" class="btn btn-solid" id="optionAdd" style="width: 50px; height: 30px; text-align: center; font-size: 14px;">추가</button>
													</div>
												</div>
											</div>
										</div>
										<hr>
											
											<!-- 선택된 옵션 영역 -->
									<form action="" method="Post" id="orderForm"> 
											<div id="selectedOptionList">
											</div>

										<!-- 총 결제금액 표시 영역 -->
										<div class="product-option-item" style="position: relative; padding: 16px 0 30px 100px; border-top: 1px solid #d3d3d3;">
											<div class="option-title-area mt-3" style="position: absolute; top:15px; left: 0;">
												<div class="option-title" style="display: inline-block; color: #5a5a5a; font-size: 20px; font-weight: 400; ">
													총 결제금액
												</div>
											</div>
											<div class="product-option-item compare mt-3" id="subscriptionInfo">
												<div class="compare-inner" style="display: block;">
													<div class="compare-title">
														<div class="inner">
															<div class="data" style="position: absolute; top: 35px; right: 0; text-align: right;">
																<h2 class="price theme-color" id="subscriptionPrice" style="display: block; font-weight: 700;">
																	<span id="totalPriceSpan"></span>
																	<span style="color:black; font-size:20px;">원</span>
																</h2>
															</div>
														</div>
													</div>            
												</div>  
												<div class="btn-area" style="display:block; position: relative; padding-top:70px; float: center;"> 
													<div class="product-buttons"> 
														<a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#cartinto">
														<button type="button" class="btn btn-outline-custom me-1 cart-icon" id="cartBtn" style="margin-left:-105px; display:inline-block;">
															<svg xmlns="http://www.w3.org/2000/svg" width="34" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart pe-1"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
														</button> </a>
														<button type="button" class="btn btn-solid" id="orderBtn" style= "width: 700px; height: 52px; font-size: 18px; display: inline-block; padding: 0 10px; text-align: center;">주문하기</button>
													</div>
												</div>
												<!-- order Informations -->
												<input type="hidden" id="totalPrice" name="totalPrice">
											</div>
										</div>
									</form>
								</div>
							</div>
                        </div>
                    </div>
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
                                                            	</div>
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
					    									<c:set var="totalRating" value="${totalRating + review.rate}" /><p> ${totalRating} </p>
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
														<input type="hidden" name="slicedCode" id="slicedCode" value="${param.slicedCode}">
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
                        </div></div>
                        </div>
                    </div>
		</div>
	</div>
</section>
    <!-- Shop Section end -->
    

<!-- 장바구니 버튼 모달창 start -->
 <div class="modal fade payment-modal" id="cartinto">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-4">
                     <h3>장바구니에 담으시겠습니까? </h3>
                    </div>
                </form>
            </div>
            <div class="modal-footer pt-0 text-end d-block">
                <button class="btn btn-solid-default rounded-1 btn_cart">확인</button>
            </div>
        </div>
    </div>
</div>
<!-- 장바구니 버튼 모달창 End -->

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
                        
                        <input type="hidden" id="orderNum" name="orderNum">
                        <input type="hidden" id="memberNum" name="memberNum">
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
 <!-- 상품 삭제 모달창 start -->
 <div class="modal fade payment-modal" id="productdel2">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-4">
                     <h3>정말 삭제하시겠습니까? </h3> <h5>삭제 후에는 복구가 불가합니다.</h5>
                     <input type="hidden" id="modalDelId2" name="directCode" value="">
                      <input type="hidden" id="modalDelSC2" value="${param.slicedCode}">
                    </div>
                </form>
            </div>
            <div class="modal-footer pt-0 text-end d-block">
            	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-solid-default rounded-1" id="productDelete2" >삭제</button>
            </div>
        </div>
    </div>
</div>
<!-- 상품 삭제 모달창 End -->   

    <div class="bg-overlay"></div>
<script src="/assets/js/updateReview.js"></script>
<script src="/assets/js/accessoryDetail2.js"></script>


<c:import url="../temp/footer.jsp"></c:import>    


</body>

</html>
