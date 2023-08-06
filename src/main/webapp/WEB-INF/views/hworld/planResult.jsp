<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
    <c:import url="../temp/style.jsp"></c:import>
    <title>번호이동</title>
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
                                    <p class="fs-3 w-100 text-center">${memberVO.name} 님, <!-- <strong class="fs-2 theme-color">H world</strong>에 오신것을 환영합니다! <br> --> 선택하신 <strong class="fs-2 theme-color">요금상품</strong>으로 <strong class="fs-2 theme-color">요금제 변경</strong>이 완료되었습니다.</p>
                                </div>
                            </div>
                            
                            <div class="">
                                <div class="row mb-5 justify-content-center">
                                    <div class="col-lg-5 text-center">
                                        <div class="contact-details rounded-3 mt-3 mb-3 ">
                                            <div class="container">
                                                <button class="btn rounded-pill m-1 default-theme mb-3"> <h6>선택한 요금상품</h6></button>
                                                <h2 class="fw-bolder">${phoneNum.planName}</h2>
                                                
                                                <div class="container">
                                                 <c:set var="phoneNum" value="${phoneNum.phoneNum}" />
											<c:set var="formattedPhoneNum" value="${fn:substring(phoneNum, 0, 3)}-${fn:substring(phoneNum, 3, 7)}-${fn:substring(phoneNum, 7,11)}" />
                                                    <h2 class="font-light" >${formattedPhoneNum}</h2>
                                                </div>
                                                <div class="contact-box justify-content-center" style="border-bottom:2px solid; border-color:#fff; padding-bottom:20px;">
                                                    <div class="mx-6 ">
                                                        <img class="mb-4"src="/assets/images/mobile-phone.png">
                                                        <h3>요금제 변경 신청일 : <span id="nowDate"></span></h3>
                                                        <h3>요금제 시작일 : <span id="startDate"></span></h3>
                                                    </div>   
                                                </div>
                                                <div class="contact-box justify-content-center">
                                                    <div class="contact-title">
                                                        <span class="fs-6 mb-0">신청하신 다음날 부터<br> 변경된 요금제로 사용 가능합니다.</span>
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
    </section>

    <div class="container mb-4">
        <div class="col-12 col-md-3 mb-3 container justify-content-center">
        <button onclick="location.href = './planList';" type="button" class="btn rounded-3 btn-solid-default">부가서비스 보러가기</button>
        <button onclick="location.href = '../myPage/home';" type="button" class="btn rounded-3 btn-secondary">마이페이지</button>
        </div>
    </div>
<!-- Contact Section End -->    
<c:import url="../temp/footer.jsp"></c:import>

<script>
const currentDate = new Date();

const year = currentDate.getFullYear();
const month = currentDate.getMonth() + 1;
const day = currentDate.getDate();
const days = currentDate.getDate() + 1;

const formattedDate = new Date(year, month - 1, day);
const formattedDates = new Date(year, month - 1, days);

const options = { year: "numeric", month: "long", day: "numeric" };
const formattedDateString = formattedDate.toLocaleDateString("ko-KR", options);
const formattedDateStrings = formattedDates.toLocaleDateString("ko-KR", options);

document.getElementById("nowDate").textContent = formattedDateString;
document.getElementById("startDate").textContent = formattedDateStrings;


</script>



</body>

</html>