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
    <title>요금제변경</title>
<style>

.flex-container {
        display: flex;
        align-items: center;
        width: 100%;
        overflow-x: hidden;
        overflow-y: hidden;
    }

    .flex-container > * {
        margin-right: 0px;
        width: 100%;
    }
</style>
</head>

<body class="theme-color2 light ltr">
<c:import url="../temp/header.jsp"></c:import>
  
    <!-- Contact Section Start -->
    <section class="contact-section">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-12">
                    <div class="materialContainer">
                        <div class="material-details">
                            <div class="title title1 title-effect mb-1 title-left">
                                <h2>${planVO.planName}</h2>
                                <div class="cancelFeeIs"><p class="fs-3 w-100 text-center">${memberVO.name}님, 사용중인 상품과 변경하실 상품을 확인하세요.</p>
                            </div>
                            </div>
                        </div>
                 <div class="container-fluid">
                    <div class="row mb-5 justify-content-center">
                        <div class="col-lg-4 text-center">
                            <div class="contact-details rounded-3 mt-3 mb-3 ">
                                <div class="container">
                                    <button class="btn rounded-pill m-1 btn-secondary mb-3"> <h6>사용중인 요금상품</h6></button>
                                    <h2 class="fw-bolder">${bfPlan.planName}</h2>
                                    <div class="container">
                                        <c:set var="phoneNum" value="${bfPlan.phoneNum}" />
											<c:set var="formattedPhoneNum" value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7,11)}" />
											<p class="font-light fs-6" >${formattedPhoneNum} </p>
                                       
                                        </div>
                                     <div class="contact-box justify-content-center" style="border-bottom:2px solid; border-color:#fff; padding-bottom:20px;">
                                            <div class="mx-4">
                                                <img class="mb-2"src="/assets/images/5g.png">
                                                <h4>무제한</h4>
                                            </div>   
                                            <div class="mx-4">
                                                <img class="mb-2"src="/assets/images/phone.png">
                                                <h4>무제한</h4>
                                            </div> 
                                            <div class="mx-4">
                                                <img class="mb-2"src="/assets/images/message.png">
                                                <h4>무제한</h4>
                                            </div> 
                                        </div>
        
                                    <div class="contact-box justify-content-center">
                                        <div class="contact-title text-center">
                                            <div class="flex-container">
                                            <p style="margin-right:-7%; margin-top:1%; font-size:20px;">월</p>
                                            <h2 class="fs-2 mb-0 theme-color"><fmt:formatNumber value="${bfPlan.planPrice}" pattern="#,###"/></h2>
                                            <p style="margin-left:-7%; margin-top:1%; font-size:20px;">원</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-2 d-flex justify-content-center align-items-center" style="padding:%; margin-left:-3%; margin-right:-3%; z-index: 100;">
                            <img class="img-fluid" style="max-width: 60%;" src="/assets/images/simplearrow.png">
                        </div>
                            <div class="col-lg-4 text-center">
                                <div class="contact-details rounded-3 mt-3 mb-3" >
                                    <div class="container">
                                        <button class="btn m-1 rounded-pill default-theme text-light mb-3"> <h6>변경 요금상품</h6></button>
                                        <h2 class="fw-bolder">${planVO.planName}</h2>
                                        <div class="container">
                                        <c:set var="phoneNum" value="${bfPlan.phoneNum}" />
											<c:set var="formattedPhoneNum" value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7,11)}" />
											<p class="font-light fs-6" >${formattedPhoneNum} </p>
                                       
                                        </div>
                                        <div class="contact-box justify-content-center" style="border-bottom:2px solid; border-color:#fff; padding-bottom:20px;">
                                            <div class="mx-4">
                                                <img class="mb-2"src="/assets/images/5g.png">
                                                <h4>무제한</h4>
                                            </div>   
                                            <div class="mx-4">
                                                <img class="mb-2"src="/assets/images/phone.png">
                                                <h4>무제한</h4>
                                            </div> 
                                            <div class="mx-4">
                                                <img class="mb-2"src="/assets/images/message.png">
                                                <h4>무제한</h4>
                                            </div> 
                                        </div>
            
                                        <div class="contact-box justify-content-center">
                                            <div class="contact-title text-center">
                                                <div class="flex-container">
                                                <p style="margin-right:-7%; margin-top:1%; font-size:20px;">월</p>
                                                <h2 class="fs-2 mb-0 theme-color"><fmt:formatNumber value="${planVO.planPrice}" pattern="#,###"/></h2>
                                                <p style="margin-left:-7%; margin-top:1%; font-size:20px;">원</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" id="seNum"name="serialNum" value="${bfPlan.serialNum}">
                    <input type="hidden" id="plNum" name="planNum" value="${planVO.planNum}">
                    <input type="hidden" name="nowDate" id="now" value="">
                    <input type="hidden" name="requestCode" id="requestCode" value="1">
                    <input type="hidden" id="expireDate" value="${bfPlan.expireDate}">
                    
                    <div class="cancelFee row mb-5 justify-content-center">
                                <div class="col-lg-9">
                                    <div class="contact-details rounded-3 mt-3 mb-3">
                                        <div class="container">
                                            
                                            <h2 class="fw-bolder"><img class="mb-1"src="/assets/images/redwarning.png">
                                                위약금 결제 후 요금제 변경이 가능합니다.</h2>
                                            <div class="container">
                                                <div class="font-light fs-6 mt-1 d-flex">	

                                                    □ 위약금 :  <div class="mx-2 fs-6" id="cancelPrice"></div>원</div>
                                                    □ 개통일자 : <fmt:formatDate value="${bfPlan.contractDate}" pattern="yyyy 년 MM 월 dd 일" /><br>
                                                    □ 공시지원금 약정 만료일자 : <fmt:formatDate value="${bfPlan.expireDate}" pattern="yyyy 년 MM 월 dd 일" /><br>
                                                   <div class="d-flex"> □ 남은 약정일자 : <div class="remainDays mx-1"></div>일 </div>
                                                    
                                               
                                            </div>
                                            <div class="form-check ps-0 custome-form-check justify-content-center">
                                                <button class="btn rounded-3 btn-solid-default">일시불 결제하기</button>
                                                
                                               
                                            </div>
					                    </div>
					                </div>
					            </div>
					</div>             
                         <form action="./planChange" method="Post">
                            <div class="row mb-5 justify-content-center">
                                <div class="col-lg-9">
                                    <div class="contact-details rounded-3 mt-3 mb-3">
                                        <div class="container">
                                            
                                            <h2 class="fw-bolder"><img class="mb-1"src="/assets/images/redwarning.png">
                                                이것만은 꼭 확인하세요</h2>
                                            <div class="container">
                                                <p class="font-light fs-6 " >	
                                                    □ 요금제 변경일을 기준으로 1개월 내에는 다른 요금제로 변경이 불가합니다. </p>
                                                <p class="font-light fs-6 " > 	
                                                    □ 요금제의 기본제공 음성/문자/데이터 혜택은 월 중 요금제 변경 시 실제 이용기간을 기준으로 일할 계산하며, 초과 사용량에 대해서는 다음달 청구요금에 반영됩니다.
                                                <br>초과 과금 예시)
                                                <br>band 데이터 1.2G 사용 고객이 총 900MB의 데이터 사용 후 16일에 요금제 변경시(30일 기준)
                                                <br>- 변경 전 사용일 (1~15일) 기준 제공량 : 약 600MB (= 1.2GB X 15일/30일)
                                                <br>- 초과사용량 : 300MB (= 사용량 900MB - 일할 제공량 600MB)
                                                => 초과 사용한 데이터 300MB에 대해 종량 요율(22.528원/MB)로 과금 (단, 최대 19,800원)</p>
                                            </div>
                                            <div class="form-check ps-0 custome-form-check justify-content-center">
                                                <input class="checkbox_animated check-it" type="checkbox" id="flexCheckDefault1">
                                                <label class="form-check-label fw-bolder fs-6" for="flexCheckDefault1">위 안내사항을 확인했습니다.</label>
                                               
                                            </div>
					                    </div>
					                </div>
					            </div>
					        </div>                  
   
    				<div class="container">
    					<div class="col-12 mb-3 container justify-content-center" style="width: 17.66667%">
					    <button type="submit" class="changebtn btn rounded-3 btn-solid-default">변경하기</button>
					    <button onclick="location.href = '#';" type="button" class="btn rounded-3 btn-secondary">취소</button>
				    </div>  
				    </div>
				    </form>
				 </div>
				 </div>
				 </div>
				 </div>   
				    
				    
 </section>
    <!-- Contact Section End -->    
<c:import url="../temp/footer.jsp"></c:import>

<script>


const currentDate = new Date();

const year = currentDate.getFullYear();
const month = currentDate.getMonth() + 1;
const day = currentDate.getDate();

const formattedDate = new Date(year, month - 1, day);

const formattedDateString = formattedDate.toISOString().slice(0, 10);

document.getElementById('now').value = formattedDateString;
</script>
<script>

$(document).ready(function() {

const serialNum = $('#seNum').val();
console.log(serialNum);
const requestCode=$('#requestCode').val();
const nowDate = $('#now').val();
//const nowDate = new Date().toISOString();
const planNum = $('#plNum').val();

 $.ajax({
type: 'GET',
url: './checkCancelFee',
dataType: 'JSON',
data: {
    serialNum: serialNum,
    nowDate: nowDate,
    requestCode: requestCode,
    planNum: planNum,
   	
},
success: function(response) {
	let cancelPrice = response.cancelPrice;
	
	$('#cancelPrice').text(cancelPrice.toLocaleString());
	$('.cancelFeeIs').html('<p class="fs-3 w-100 text-center">${memberVO.name}님, 요금제 변경시 위약금이 발생합니다.</p>');
	$('.changebtn').prop('disabled', true);
	
	if(cancelPrice<0 || cancelPrice==0){
		$('.cancelFee').hide();
		$('.changebtn').prop('disabled', false);
		
	}

},
error: function(error) {
    // 에러 처리 로직 작성
    console.log(error);
}
});


 
});


const endDate = $('#expireDate').val();
const now = $('#now').val();
//남은 약정일자 계산 (endDate - nowDate)

const expireDate = new Date(endDate);
const nowDate = new Date(now);

const remain = expireDate.getTime() - nowDate.getTime();
const days = Math.floor(remain / (1000 * 60 * 60 * 24)); // 밀리초(ms)를 일수로 변환


$('.remainDays').text(days);


</script>

</body>

</html>