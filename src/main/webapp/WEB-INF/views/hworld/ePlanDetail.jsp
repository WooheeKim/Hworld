<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="en">

<head>
	<meta charset="UTF-8">
    <c:import url="../temp/style.jsp"></c:import>    
    <title>부가서비스 상세페이지</title>
 <style>
    .boxone {
    width:50%;
    padding-right: 5%;
    }
    .boxtwo {   
    width:50%;
    padding-left: 5%;
    }

    .login-section {
        background-color: #fff;
    }

    .box{
        border:1px solid black;  
    }
    
    .zcustom-box {
        width: 90%;
        border-radius: 10px;
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        border:1px solid darkgray;
        padding:50px 10px 30px 170px;
        margin:40px;
        background-color: fff;
    }
    .zcustom-box h3 {
        color:black;
        text-align:center;
        margin-right:30px;
        margin-top:20px;
    }
    .zcustom-box li{
        margin-right:10px;
       
    }
    .zcustom-box img {
        width:70%;
        position:al;
    }
    .hbox {
        border-right: 2px lightgray solid;
        margin-left :20px;
        margin-right :20px;   
    }
    .hbox1 {
        border-right: 0px lightgray solid;
        margin-left :20px;  
    }

    .modal-dialog .modal-content{
        width: 70%;
        margin-left:15%;
    }
    
    .modal-dialog.modal-custom {
    max-width: 600px; /* 원하는 가로 크기 설정 */
	}

</style>
</head>

<body class="theme-color2 light ltr">
<c:import url="../temp/header.jsp"></c:import>
    
    <section>
        <div class="container">
            <div class="material-details">
                <div class="title title1 title-effect title-left">
                    <h2>부가서비스</h2>
                    
                </div>
            <div class="row gx-4 gy-5">
                <div class="col-12">
                    <div class="details-items">
                        <div class="row g-4">
                            <div class="col-md-12 ">
                                <div class="justify-content-start" style="margin-top:-20px;">
                                    <a href="./ePlanUpdate" class="me-3">수정</a>
                                    <a href="javascript:void(0)" data-bs-toggle="modal"
                                                    data-bs-target="#extraDel">삭제</a>
                                </div>
                                <input type="hidden" id="extraPlanNum" name="extraPlanNum" value="${eplan.extraPlanNum}">
                                <div class="details-image-concept" >
                                    <span class="text-start" style="font-size:30px; font-weight: 700;">${eplan.extraPlanName}</span>
                                    <input type="hidden" name="extraPlanName" id="extraPlanName" value="${eplan.extraPlanName}">
                                    <span style="font-size:30px; font-weight: 500;"> </span>
                                </div>
                                <h3 class="text-start" style="color:gray;"> ${eplan.extraPlanExplainS} </h3>
                                <div class="container zcustom-box">
                                    <ul>
                                        <li class="">
                                        <div style="width:85%; height:30%; padding-left:30%; padding-right:10%;">
                                        <img src="/assets/images/headphone.png">
                                        </div>
                                            <h3> ${eplan.extraPlanExplainM} </h3>
                                        </li>
                                        <li style="margin-left:15%;position: relative; top: -20px;">  
                                            <div class="container text-center" >
                                            <div  >
                                               <h2 class="theme-color d-flex justify-content-center" >월 <fmt:formatNumber value="${eplan.extraPrice}" pattern="#,###" /> 원</h2> 
                                                    <span class="label-text">(부가세 포함)</span>
                                                <div class="" style="margin-top:10px;">
                                            </div>    
                                                <!-- 신청 모달 버튼  start -->
                                                <c:if test="${empty map.size() }">
                                                <div class="product-buttons justify-content-center" >
                                                <a href="javascript:void(0)" data-bs-toggle="modal" data-bs-target="#extraJoin" >
                                                    <span class="btn btn-solid rounded-3">이 부가서비스 신청하기</span> 
                                                </a>
                                                </div>
                                                </c:if>
                                                
                                                <c:if test="${not empty map.size() }">
                                                <div class="product-buttons justify-content-center">
                                                        <span class="btn btn-solid rounded-3 disabled">이미 사용중인 부가서비스입니다.</span> 
                                                </div> 
                                                </c:if>
                                                </div>
                                            </div> 
                                            
                                        </li> 
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
            <div class="container">
                <ul class="product-count shipping-order">
                    <li>
                        <span class="lang">부가서비스는 청구금액에 포함되어 계산됩니다.</span>
                    </li>
                </ul>
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
                                        <h4 class="inner-title mb-2">
                                    ${eplan.extraPlanExplain}
                                    </h4>
                                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </div>   
    </section>
    <!-- Shop Section end -->

<!-- 부가서비스 신청 모달창 start -->
    <div class="modal fade payment-modal" id="extraJoin">
        <div class="modal-dialog modal-dialog-centered modal-custom">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form action="./ePlanApply" method="POST" id="extraApplyForm">
                        <div class="mb-4">
                            <p class="fs-5"> 
                            <div class="category-option">
                                <div class="accordion category-name" id="accordionExample"> 
                                    <div class="accordion-item category-rating">
                                        <h4 class="accordion-header" id="headingThree">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                                                유의사항
                                            </button>
                                        </h4>
                                        <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                            <div class="accordion-body category-scroll">
                                                <ul class="category-list ">
                                                    <li class="text-start">
                                                    <p>해당 부가서비스는 <br> 월 ${eplan.extraPrice} 원의 유료서비스로,<br> 신청일부터 서비스가 시작되며 요금이 부과됩니다.</p>
                                                        <p>부가서비스 신청 후 해지시 <br>요금은 일괄계산되어 청구금액에 포함됩니다.</p>
                                                        <input type="hidden" id="modalPlanNum" name="extraPlanNum">
                                                        <input type="hidden" id="modalPlanName" name="extraPlanName">
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="col-12 ">
                                    <li class="checkbox-list mt-3 ">
                                        <div class="form-check user-checkbox ps-0 ">
                                            <input class="checkbox_animated check-it" type="checkbox" value="1" id="extraApplyCheck">
                                            <label class="form-check-label fw-bolder" for="flexCheckDefault1">위 안내사항을 확인하였습니다.</label>
                                        </div>
                                    </li>
                                </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer pt-0 text-end d-block">
                    <!-- <a href="./extraResult"> --><button type="button" class="btn btn-solid-default rounded-1" id="extraConfirm">확인</button></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Add number Modal End -->

    <!-- 부가서비스 삭제 모달창 start -->
    <div class="modal fade payment-modal" id="extraDel">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-4">
                         <h3>정말 삭제하시겠습니까? </h3> <h5>삭제 후에는 복구가 불가합니다.</h5>
                        </div>
                    </form>
                </div>
                <div class="modal-footer pt-0 text-end d-block">
                    <a href="#" ><button class="btn btn-solid-default rounded-1">확인</button></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Add number Modal End -->

<!-- Recommend product 1 -->
<section class="left-sidebar-section masonary-blog-section">
    <div class="container">
        <div class="title title1 title-effect mb-4 title-left">
            <h2>추천상품</h3>
        </div>
            <div class="col-lg-12 col-md-12 order-md-1 ratio_square">
                    <div class="row mb-3 justify-content-center">
                    <div class="col-2">
                        <div class="masonary-blog box-shadow">
                            <div class="card-body card-body-width">
                                <a href="blog-details.html">
                                    <h2 class="card-title">5G 슬림</h2>
                                </a>
                                <h3 class="masonary-name">월 55,000원</h3>
                                <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                </p>    
                            </div>
                        </div>
                    </div>
                    <div class="col-2">
                        <div class="masonary-blog box-shadow">
                            <div class="card-body card-body-width">
                                <a href="blog-details.html">
                                    <h2 class="card-title">5G 슬림</h2>
                                </a>
                                <h3 class="masonary-name">월 55,000원</h3>
                                <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                </p>    
                            </div>
                        </div>
                    </div>
                         
                            <div class="col-2">
                                <div class="masonary-blog box-shadow">
                                    <div class="card-body card-body-width">
                                        <a href="blog-details.html">
                                            <h2 class="card-title">5G 슬림</h2>
                                        </a>
                                        <h3 class="masonary-name">월 55,000원</h3>
                                        <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                        </p>    
                                    </div>
                                </div>
                            </div>

                    <div class="col-2">
                        <div class="masonary-blog box-shadow">
                            <div class="card-body card-body-width">
                                <a href="blog-details.html">
                                    <h2 class="card-title">5G 슬림</h2>
                                </a>
                                <h3 class="masonary-name">월 55,000원</h3>
                                <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                </p>    
                            </div>
                        </div>
                    </div>


                    <div class="col-2">
                        <div class="masonary-blog box-shadow">
                            <div class="card-body card-body-width">
                                <a href="blog-details.html">
                                    <h2 class="card-title">5G 슬림</h2>
                                </a>
                                <h3 class="masonary-name">월 55,000원</h3>
                                <p class="font-light">데이터 8GB 가성비로 이용하는 5G
                                </p>    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         
  
</section>
<!-- recommend product 1 end -->
<c:import url="../temp/footer.jsp"></c:import>

<script>
// 부가서비스 신청 버튼 클릭 이벤트 처리
$('#extraApplyCheck').click(function() {
    const ep = $('#extraPlanNum').val();
    const en = $('#extraPlanName').val();
    $('#modalPlanNum').val(ep);
    $('#modalPlanName').val(en);
});

$('#extraConfirm').click(function() {
    let check = $('#extraApplyCheck:checked').val();
   chk = isEmpty(check);
   
   if(chk== true){
	   $('#extraApplyForm').submit();
	   console.log("확인")
   }
});


function isEmpty(value){
    if(typeof value == "undefined" || value == null || value == '')
        return false;
    else
        return true;
}



</script>



</body>

</html>