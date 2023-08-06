<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
    <c:import url="../temp/style.jsp"></c:import>
    <title>Checkout</title>
    <style>
        .addeffect-section .size-box ul li.active {
            background: var(--theme-color); 
        }
    </style>   
</head>

<body class="theme-color2 light ltr">
<c:import url="../temp/header.jsp"></c:import>
    <!-- mobile fix menu start -->
    <div class="mobile-menu d-sm-none">
        <ul>
            <li>
                <a href="index.html">
                    <i data-feather="home"></i>
                    <span>Home</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)" class="toggle-category">
                    <i data-feather="align-justify"></i>
                    <span>Category</span>
                </a>
            </li>
            <li>
                <a href="cart.html">
                    <i data-feather="shopping-bag"></i>
                    <span>Cart</span>
                </a>
            </li>
            <li>
                <a href="wishlist.html">
                    <i data-feather="heart"></i>
                    <span>Wishlist</span>
                </a>
            </li>
            <li>
                <a href="user-dashboard.html">
                    <i data-feather="user"></i>
                    <span>Account</span>
                </a>
            </li>
        </ul>
    </div>
    <!-- mobile fix menu end -->

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
                    <h3>주문서 작성</h3>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="index.html">
                                    <i class="fas fa-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">상품 > 휴대폰</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb section end -->

    <!-- Cart Section Start -->
    <section class="section-b-space">
                        <form action="./formAdd" method="post" id="appForm">
        <div class="container" style="padding: 0px 130px;">
            <div class="row g-4">
                <div class="col-lg-7">
                        <div class="row g-4">
                            <!-- 가입자 정보 -->
                            <div class="col-md-12">
                                <label for="name" class="form-label">가입자 이름</label>
                                <input type="text" class="form-control" id="name" value="${memberVO.name}" name="name">
                                <input type="hidden" name="memberNum" value="${memberVO.memberNum}">
                            </div>
                            <!-- 주민등록번호 -->
                            <div class="d-flex col-10">
                            <div class="col-md-7">
                                <label for="rrnf" class="form-label">주민등록번호</label>
                                <input type="text" class="form-control" id="rrnf" value="${memberVO.rrnf}" name="rrnf">
                            </div>
                            <div class="mx-1 float-bottom pt-2">
                                <label for="lname" class="form-label">&nbsp;</label>
                                <h2 class="text-center font-light">-</h2>
                            </div>
                            <div class="col-md-7 float-bottom">
                                <label for="rrnl" class="form-label">&nbsp;</label>
                                <input type="password" class="form-control" id="rrnl" name="rrnl">
                            </div>
							</div>
                            <!-- 기기변경 폰 번호 -->
                            <div class="col-md-12">
                            <c:if test="${map.joinType == 2 || map.joinType == 1}" > <!-- 회선이 없는 경우 : 번호이동 / 신규가입 -->
                                <label for="phoneNum" class="form-label">휴대폰 번호</label>
                                <input type="text" class="form-control" id="phoneNum" placeholder="사용할 휴대폰 번호 입력" name="phoneNum">
                                <div id="checkPhoneNum"></div>
                            </c:if>
                            <c:if test="${map.joinType == 0}" > <!-- 회선이 있는경우 : 기기변경 -->
                                <label for="phoneNum" class="form-label">휴대폰 번호</label>
                                <input type="text" class="form-control" id="phoneNum" value="${phoneNum.phoneNum}" name="phoneNum">
                                <div id="checkPhoneNum"></div>
                            </c:if>
                            </div>

                           
                            <div class="col-md-10">
                                <div id="selectSize" class=" product-description border-product row">
                                    <label for="valid1" class="form-label">수령 방법</label>
                                    <button type="button" class="btn btn-solid-default col-md-3" style="margin-left: 10px;"disabled>택배</button>
                                </div>
                            </div>

                            <!-- 가입자 주소  -->
                            <!-- 1. 우편번호  -->
                            <div class="col-md-9">
                                <label for="address1" class="form-label">가입자 주소</label>
                                <input type="text" class="form-control" id="address1" value="${memberVO.address1}">
                            </div>
                            <div class="col-md-3" style="padding-left: 0px;">
                                <label for="btn2" class="form-label">&nbsp;&nbsp;&nbsp;</label>
                                <button class="btn btn-solid-default btn-full" id="btn2" style="padding-left: 4px; padding-right: 4px; height: 61%; font-size: calc(12px + (13 - 12) * ((100vw - 320px) / (1920 - 320)));">주소 찾기</button>
                            </div>
                            <!-- 2. 도로명주소/지번  -->
                            <div class="col-md-12 mt-3">
                                <input type="text" class="form-control" id="address2" name="address2" value="${memberVO.address2}">
                            </div>
                            <!-- 3. 상세주소   -->
                            <div class="col-md-12 mt-3">
                                <input type="text" class="form-control" id="address3" name="address3" value="${memberVO.address3}">
                            </div>
                            <!-- 절차 끝 구분선 -->
                            <hr class="my-lg-5">
                            <!-- 약관동의 및 가입버튼 -->
                            <div class="col-md-12">

                                <div class="jutify-content-center ">
                                    <textarea class="form-control col-md-12" name="" id="" cols="100" rows="10" readonly>
                                        &lt;H World 본인확인서비스 이용약관 >

제 1 조 (목적)
본 약관은 주민번호 대체 본인인증서비스(이하 ‘서비스’)를 제공하는 주식회사 H World(이하 ‘회사’)와 이용 고객(이하 ‘이용자’)간에 서비스 제공에 관한 이용조건 및 절차 등 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (용어의 정의)
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① ‘본인확인서비스’라 함은 이용자가 인터넷상에서 본인명의의 휴대폰(이용자 개인 명의 휴대폰 또는 법인 명의 휴대폰으로서 이용자가 본인확인서비스에 가입한 휴대폰)을 이용하여, 주민등록번호 입력 없이도 본인임을 안전하게 식별 및 확인해 주는 서비스를 말합니다.
② ‘이용자’라 함은 회사 또는 대행기관에서 제공하는 본인확인서비스의 이용을 위해 자신의 본인확인정보를 회사, 대행기관, 본인확인기관 등에게 제공하고, 본인임을 확인 받고자 하는 자로서 다음 각호의 자를 말합니다.
1. 회사의 개인 명의 이동전화서비스 가입자
2. 회사의 이동전화망을 이용하여 자체적으로 이동전화서비스를 제공하는 별정통신사업자의 가입자 중 개인 명의 가입자
3. 회사의 법인 명의 이동전화서비스 가입자의 휴대폰을 실제 사용하는 자로서 명의인의 법인으로부터 필요한 서류를 발급 받아 이를 회사에 제출하고 본인확인서비스에 가입한 자
③ ‘본인확인정보’라 함은 이용자가 입력한 생년월일, 성별, 성명, 내/외국인, 휴대폰번호, 통신사 등 본인 식별에 필요한 이용자의 정보를 말합니다.
④ ‘중복가입확인정보’라 함은 웹사이트에 가입하고자 하는 이용자의 중복확인을 위해 제공되는 정보를 말 합니다.
⑤ ‘연계정보’라 함은 인터넷사업자의 온ㆍ오프라인 서비스 연계 등의 목적으로 이용자를 식별하기 위해 제공되는 정보를 말합니다.
⑥ ‘본인확인기관’이라 함은 주민등록번호를 사용하지 아니하고 본인을 확인하는 방법 또는 본인확인서비스를 제공 하는 자로 방송통신위원회로부터 본인확인기관으로 지정을 받은 자를 의미합니다.
⑦ ‘대행기관’이라 함은 회사를 대신하여 본인확인서비스의 제공 및 지원 등의 중계 업무를 담당하는 곳으로 회사와 업무지원에 대한 계약이 완료되어 인터넷사업자에 본인확인서비스를 제공하는 사업체를 말합니다.
⑧ ‘인터넷사업자’라 함은 인터넷을 이용하여 정보를 제공하거나, 정보의 제공을 매개하는 일을 업으로 하는 자로 회사 또는 대행기관과의 서비스 계약을 통해, 인터넷 웹사이트에서 이용자에 대한 본인확인정보를 제공받는 사업체를 말합니다.
⑨ ‘접근매체’라 함은 본인확인을 함에 있어 이용자 본인확인의 진실성과 정확성을 확보하기 위하여 사용 되는 수단 또는 정보로서 회사에 등록된 이용자의 전화번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등을 말합니다.

제 3 조 (약관의 효력 및 변경)
① 회사는 본 약관을 회사가 운영하는 사이트에 게시하거나 본인확인서비스 이용시 이용자가 내용을 확인할 수 있도록 공개합니다.
② 회사는 약관의 규제에 관한 법률 및 기타 관련 법령에 위배되지 않는 범위에서 본 약관의 내용을 개정 할 수 있으며, 변경된 경우에는 회사가 운영하는 사이트에서 공지합니다. 다만 ‘이용자’의 권리와 의무에 관한 중요한 사항은 변경된 내용의 시행 15일 이전에 공지합니다.
③ 이용자는 개정된 약관 사항에 동의하지 않을 권리가 있으며, 개정된 약관에 동의하지 않는 경우, 본 서비스의 이용을 중단하고 이용 계약을 해지할 수 있습니다. 이용자가 회사의 전항 단서에 따른 약관의 불리한 변경에 대하여 적용예정일까지 회사에게 부동의 의사를 표시하지 않거나 이용계약을 해지하지 않은 경우 변경된 약관을 승인한 것으로 봅니다.
④ 이용자가 변경된 약관에 대한 내용을 알지 못하여 발생하는 손해 및 피해에 대해서는 회사가 책임을 지지 않습니다.

제 4 조 (접근매체의 관리 등)
⑤ 회사는 서비스 제공 시 접근매체를 이용하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인 할 수 있습니다.
⑥ 이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
⑦ 이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용 이나 위조 또는 변조를 방지하기 위해 충분한 주의를 기울여야 합니다.
⑧ 회사가 접근매체의 발급주체가 아닌 경우에는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 없습니다.

제 5 조 (본인확인서비스 안내)
① 본인확인서비스는 이용자가 주민등록번호의 입력 없이, 본인명의로 된 개통된 휴대폰정보(이용자 개인 명의로 개통된 휴대폰 정보 또는 법인 명의로 개통된 휴대폰으로서 이용자가 본인확인서비스에 가입한 정보)를 이용하여 본인 식별 또는 본인 확인이 가능한 생년월일 기반의 주민등록번호 대체 휴대폰인증 서비스 입니다.
② 회사는 대행기관을 통해 인터넷사업자에게 본인확인서비스를 제공하며, 인터넷사업자는 회원가입, ID/PW 찾기, 성인인증, 기타 본인확인이 필요한 경우 이용자에게 본인확인서비스를 제공 합니다.
③ 이용자는 자신의 생년월일, 성명, 성별, 내/외국인, 휴대폰번호, 통신사 등의 정보를 입력하며(법인 명의로 개통된 휴대폰으로서 이용자가 본인확인서비스에 가입한 경우에는 본인확인서비스 가입 시 등록한 비밀번호를 추가로 입력하며), 입력한 정보가 일치한 경우에는 해당 휴대폰번호로 수신된 1회성 비밀번호(승인번호)를 정확하게 입력하는 것으로 본인 식별 또는 본인 확인이 이루어집니다.
④ 본인확인서비스는 본인 명의로 개통된 휴대폰 정보(이용자 개인 명의로 개통된 휴대폰 정보 또는 법인 명의로 개통된 휴대폰으로서 이용자가 본인확인서비스에 가입한 정보)로 본인확인이 이루어집니다. 단, 휴대폰 일시정지 또는 이용정지 시 해당 정지기간 동안에는 본인확인서비스도 정지됩니다.
⑤ 본인 확인이 완료 된 이용자에 대해서는 본인확인정보와 중복가입확인정보 및 연계정보가 인터넷사업 자에게 제공되며, 인터넷사업자는 중복가입확인정보 또는 연계정보 등을 이용하여 이용자 관리 및 컨텐츠를 제공ㆍ운영 합니다.

제 6 조 (본인확인서비스 제공시간)
① 본인확인서비스의 이용은 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기 점검 및 기타 기술상의 이유로 본인확인서비스가 일시 중지될 수 있고 또한, 운영상의 목적으로 회사가 정한 기간에도 일시 중지될 수 있습니다.
② 회사는 효율적인 업무 수행을 위하여 필요하다고 판단하는 경우 본인확인서비스를 일정 범위로 분할하여 각 범위 별로 이용가능 시간을 달리 정할 수 있으며, 이 경우 그 내용을 공지 합니다.

제 7 조 (회사의 권리와 의무)
① 회사는 이용자가 본인확인서비스 이용시 본 이용약관이나 안내사항 등을 확인하지 않아 발생한 손해, 또는 접근매체를 통해 알 수 있었음에도 불구하고, 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 손해 등 이용자의 부주의에 기인한 손해에 대하여 배상책임이 없습니다.
② 회사는 본인확인서비스 제공과 관련하여 인지한 이용자의 본인확인정보를 본인의 승낙 없이 제3자에게 누설하거나 배포하지 않습니다. 단, 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있는 경우 등 기타 관계 법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.
③ 회사는 이용자에게 안정적인 본인확인서비스 제공을 위하여 지속적으로 본인확인서비스의 예방점검, 유지보수 등을 이행하며, 본인확인서비스의 장애가 발생하는 경우, 이를 지체 없이 수리 및 복구합니다.
④ 회사는 아래와 같은 사유가 발생하는 경우 이용자에 대하여 본인확인서비스를 제한할 수 있습니다.
1. 다른 사람의 명의사용 등 이용자 등록 시 허위로 신청하는 경우
2. 이용자 등록 사항을 누락하거나 오기하여 신청하는 경우
3. 대포폰(이동전화 서비스 본래의 목적과는 달리 불법대출 등 부정사용을 목적으로 타인 명의 무단 개통 또는 명의자를 교사하여 개통하는 휴대전화)을 이용하는 경우
4. 타인의 명의를 도용한 사실이 있거나 명의 도용을 이유로 처벌받은 경우
5. 불법 복제와 관련된 사실이 있거나 처벌 받은 경우
6. 기타 시장질서를 교란시키는 불법행위에 해당하는 경우
⑤ 회사는 다음 각 호에 해당하는 경우 서비스의 전부 또는 일부를 중지할 수 있습니다. 회사는 회사의 고의 또는 과실이 없는 한 이로 인하여 발생한 손해에 대하여 배상책임이 없습니다.
1. 컴퓨터 등 정보통신설비의 보수점검 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우
2. 서비스를 위한 설비의 보수 등 공사로 인해 부득이한 경우
3. 서비스 업그레이드 및 시스템 유지보수 등을 위해 필요한 경우
4. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우
5. 이용자가 회사의 본인확인서비스 운영을 방해하는 경우
6. 기타 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우
7. 규제기관이 마련한 본인확인서비스 가이드를 준수하지 않고 임의로 변형 적용한 사이트에서 본인확인서비스를 요청하는 경우
⑥ 전 항에 의하여 본인확인서비스를 중지하는 경우에는 회사가 이를 공지합니다. 다만, 회사가 통제할 수 없는 사유로 인한 본 서비스의 중단(회사 또는 운영자의 고의 및 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 공지가 불가능한 경우에는 그러하지 아니합니다.
⑦ 이용자 중 회사의 이동전화망을 이용하여 자체적으로 이동전화서비스를 제공하는 별정통신사업자의 개인 명의 가입자에 대하여는 해당 별정통신사업자의 본인확인절차 미비, 명의도용, 관련 서류 위?변조, 본인확인정보의 오류 등에 대해 회사는 일체 책임을 부담하지 않고 해당 별정통신사업자가 일체의 책임을 부담합니다.

제 8 조 (이용자의 의무)
① 이용자는 본인확인서비스를 이용함에 있어서 다음 각호에 해당하는 행위를 하여서는 안되며, 회사는 위반 행위에 따르는 일체의 법적 책임을 지지 않습니다.
1. 타 이용자의 본인확인정보를 부정하게 사용 및 도용하는 행위
2. 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위
3. 범죄 행위
4. 기타 관련 법령에 위배되는 행위
② 이용자는 본 약관에서 규정하는 사항과 본인확인서비스에 대한 이용안내 또는 주의사항 등을 준수하여야 합니다.

제 9 조 (본인인증 정보의 제공금지)
회사는 서비스를 제공함에 있어 취득한 이용자의 정보 또는 자료를 이용자의 동의 없이 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 않습니다.

제 10 조 (서비스의 안정성 확보)
① 회사는 본인확인서비스의 안전성과 신뢰성을 확보하기 위하여 업무처리지침의 제정 및 시행, 정보 처리시스템 및 전산자료의 관리 등의 관리적 조치와 모니터링 체계 및 해킹방지시스템 구축 및 운영 등의 기술적 조치를 취해야 합니다.
② 회사는 서버 및 통신기기의 정상작동여부 확인을 위하여 정보처리시스템 자원 상태의 감시, 경고 및 제어가 가능한 모니터링 체계를 갖추어야 합니다.
③ ‘회사’는 해킹 침해 방지를 위하여 정보보호시스템 및 프로그램을 설치하여 운영합니다.
④ ‘회사’는 컴퓨터바이러스 감염을 방지하기 위하여 다음 각 호를 포함한 대책을 수립, 운영하고 있습니다.
1. 출처, 유통경로 및 제작자가 명확하지 아니한 응용프로그램은 사용을 자제하고 불가피할 경우에는 컴퓨터바이러스 검색프로그램으로 진단 및 치료 후 사용할 것
2. 컴퓨터바이러스 검색, 치료 프로그램을 설치하고 최신 버전을 유지할 것
3. 컴퓨터바이러스 감염에 대비하여 방어, 탐색 및 복구 절차를 마련할 것

제 11 조 (이용자의 개인정보보호)
회사는 관련법령이 정하는 방에 따라서 이용자의 개인정보를 보호하기 위하여 노력하며, 이용자의 개인정보에 관한 사항은 관련 법령 및 회사가 정하는 개인정보취급방침에 정한 바에 따릅니다.

제 12 조 (개인정보의 처리)
① 회사는 수집된 개인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 필요한 경우 업무의 일부 또는 전부를 회사가 선정한 사업자에게 위탁할 수 있습니다.
② 본인확인서비스 이용 시 이용자의 개인정보 수집 및 이용 동의에 따라 인터넷사업자가 필요로 하는 이용자 식별정보(중복가입확인정보, 연계정보)의 생성 및 제공을 위하여 관련 정보를 타 본인확인기관에게 제공할 수 있으며, 수집된 식별정보(중복가입확인정보, 연계정보)는 본인 식별 및 확인 위한 목적으로 회사 또는 대행기관을 통해 인터넷사업자에게 제공할 수 있습니다.
③ 개인정보 처리 및 위탁 등에 관한 사항은 관련법령 및 회사가 정하는 개인정보취급방침에 정한 바에 따릅니다.

제 13 조 (약관 외 준칙)
본 약관에 명시되지 아니한 사항에 대해서는 정보통신망 이용 촉진 및 정보보호 등에 관한 법률, 개인정 보보호법 등 기타 관련법령 또는 상관례에 따릅니다.
                                    </textarea>
                                </div>

                                <div class="mt-3 mb-5 d-flex justify-content-center">
                                        <input class="checkbox_animated check-it" type="checkbox" id="flexCheckDefault11">
                                        <label class="form-check-label checkout-label" for="flexCheckDefault11" style="font-weight: bolder;">약관에 동의했습니다.</label>
                                </div>
                                <div class="my-3 mx-auto col-6 row">
                                    <button class="btn btn-solid-default w-75 mx-auto" id="completeForm" style="padding-left: 4px; padding-right: 4px; height: 61%; font-size: calc(12px + (13 - 12) * ((100vw - 320px) / (1920 - 320)));">                                        
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
                                <h3 class="mt-3 mb-1 text-capitalize">${map.directName}</h3>
                                <input type="hidden" name="directName" value="${map.directName}">
                                <c:if test="${map.colorCode == 'G'}">
                                <h4 class="my-1" style="color: #fff;"> 그레이 l ${map.saveCapacity}GB</h4>
        						</c:if>
        						<c:if test="${map.colorCode == 'W'}">
                                <h4 class="my-1" style="color: #fff;"> 화이트 l ${map.saveCapacity}GB</h4>
        						</c:if>
        						<c:if test="${map.colorCode == 'B'}">
                                <h4 class="my-1" style="color: #fff;"> 블랙 l ${map.saveCapacity}GB</h4>
        						</c:if>
        						
        						<c:if test="${map.joinType == 0}">
                                <h6 class="mt-4" style="color: #fff;">기기변경</h6>
        						</c:if>
        						<c:if test="${map.joinType == 1}">
                                <h6 class="mt-4" style="color: #fff;">번호이동</h6>
        						</c:if>
        						<c:if test="${map.joinType == 2}">
                                <h6 class="mt-4" style="color: #fff;">신규가입</h6>
        						</c:if>
                                <c:if test="${map.disKind == 0 }">
                                <h6 class="my-1" style="color: #fff;">24개월약정</h6>
                                <h6 class="mt-1 mb-4" style="color: #fff;">공시지원금</h6>
                                <input type="hidden" name="disKind" value="${map.disKind}">
        						</c:if>
        						
        						<c:if test="${map.disKind == 1}">
                                <h6 class="my-1" style="color: #fff;">12개월</h6>
                                <h6 class="mt-1 mb-4" style="color: #fff;">선택약정할인</h6>
                                <input type="hidden" name="disKind" value="${map.disKind}">
        						</c:if>
                                
                                <c:if test="${map.disKind == 2 }">
                                <h6 class="my-1" style="color: #fff;">24개월</h6>
                                <h6 class="mt-1 mb-4" style="color: #fff;">선택약정할인</h6>
                                <input type="hidden" name="disKind" value="${map.disKind}">
                                </c:if>
                                
                               
                                <h6 class="my-1" style="color: #fff;">${map.planName}</h6>
                                <input type="hidden" name="planNum" value="${map.planNum}">
                                <input type="hidden" name="directCode" value="${map.directCode}">
                                
                            </li>
                            <li class="list-group-item lh-condensed active">
                                <div class="row">
                                    <div class="d-flex justify-content-between">
                                        <span class="fw-bold" >월 기기값</span>
                                        <span class="d-flex">
                                            <h3 class="fw-bold" style="color: #7e7e7e;" id="out_phonePayPrice"> ${map.out_phonePayPrice }</h3>
                                            <span class="fw-bold col-5">원</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="mt-2 d-flex justify-content-between">
                                        <span class="fw-bold" >월 통신요금</span>
                                        <span class="d-flex">
                                            <h3 class="fw-bold" style="color: #7e7e7e;" id="out_planPrice">${map.out_planPrice }</h3>
                                            <span class="fw-bold col-5">원</span>
                                        </span>
                                    </div>
                                </div>
                            </li>
                            <li class="list-group-item d-flex lh-condensed justify-content-between active" style="padding: 20px 20px 15px;">
                                <span class="fw-bold">예상 월 납부금액</span>
                                <h2 class="title title1" style="color: var(--theme-color); margin-bottom: 0;" id="totalPrice">${map.totalPrice}원</h2>
                            </li>
                        </ul>
                    </div>
                </div>
                </div>
                </div>
        </form>
    </section>
    <!-- Cart Section End -->

    
    
<c:import url="../temp/footer.jsp"></c:import>
<script>
//가입하기 버튼 눌렀을 때
$('#completeForm').click(function(){
    console.log('가입하기 버튼');
    
    //가입폼 전송
    $('#appForm').submit();
    location.href="./orderSuccess";
})

//유효성 검사
//전화번호 11자리, 숫자만 입력 + 중복검사까지 ajax로 실행
$('#phoneNum').on("blur", function() {
    //숫자만 입력되게 하는 정규식
    
    let checkValue = $(this).val().replace(/[^\d]/g, "");
  
    $(this).val(checkValue);
    
    let length = checkValue.length;

    if(length != 11) {
        //this.setCustomValidity("전화번호는 11자리여야 합니다.");
        //alert("전화번호는 11자리여야 합니다.");
        $('#phoneNum').val("");
        $('#checkPhoneNum').empty();
        $('#checkPhoneNum').append('<p class="theme-color mt-1">전화번호는 11자리여야 합니다.</p>');
    }else{
	
        // 주민등록번호 뒷자리 암호화
        let rrnf = $('#rrnf').val(); 
        console.log(rrnf);
        let rrnl = $('#rrnl').val();// 클라이언트에서 입력한 주민등록번호 뒷자리
        console.log(rrnl);
        let name = $('#name').val(); 
        
        $.ajax({
            type: 'GET',
            url: './checkPhoneNum',
            dataType: 'json',
            data: {
                phoneNum: checkValue,
                rrnf : rrnf,
                rrnl : rrnl,
                name : name
            },
            success: function(response) {
                console.log('요청 성공');
                console.log(response);
                
                if (${map.joinType == 2}) {
                    if (response.result === 'own' || response.result === 'other') {
                        $('#checkPhoneNum').empty();
                        $('#checkPhoneNum').append('<p class="theme-color mt-1">해당 번호로는 신규가입이 불가합니다</p>');
                    } else if (response.result === 'able') {
                        $('#checkPhoneNum').empty();
                        $('#checkPhoneNum').append('<p class="theme-color mt-1">사용 가능한 번호입니다</p>');
                    } else {
                        $('#checkPhoneNum').empty();
                    }
                } else if (${map.joinType == 1}) {
                    if (response.result === 'own' || response.result ==='able') {
                        $('#checkPhoneNum').empty();
                        $('#checkPhoneNum').append('<p class="theme-color mt-1">해당 번호로는 번호이동이 불가합니다</p>');
                    } else if (response.result === 'other') {
                        $('#checkPhoneNum').empty();
                        $('#checkPhoneNum').append('<p class="theme-color mt-1">번호이동이 가능한 번호입니다</p>');
                    } else {
                        $('#checkPhoneNum').empty();
                    }
                } else {
                	if (response.result === 'own') {
                        $('#checkPhoneNum').empty();
                        $('#checkPhoneNum').append('<p class="theme-color mt-1">기기변경이 가능한 번호입니다 </p>');
                    } else if (response.result === 'other' || response.result ==='able') {
                        $('#checkPhoneNum').empty();
                        $('#checkPhoneNum').append('<p class="theme-color mt-1">해당 번호로는 기기변경이 불가합니다</p>');
                    } else {
                        $('#checkPhoneNum').empty();
                    }
                }
            },
            error: function(error) {
                console.log('요청 실패');
            }
        });
    }
});



</script>

</body>

</html>