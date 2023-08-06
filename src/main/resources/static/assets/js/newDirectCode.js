$(document).ready(function() {
	

  $('.titlebox:first').show();
  // 나머지 리스트 요소를 숨김
  $('.titlebox:not(:first)').hide();


}); 


//색상옵션을 선택하거나, 용량옵션을 선택한 경우 이벤트
$('.optionArea').on('click', 'li[name="colorCode"], label.capacity', function() {

  //선택한 색상, 용량 옵션 input tag에 넣기
  if ($(this).is('li[name="colorCode"]')) {
    // li[name="colorCode"]를 클릭한 경우 처리 - 여기서 directCode를 만들어서 내보내기
    let colorCode = $(this).attr('value');
    $('#colorCode').val(colorCode);
    $('#saveCapacity').val('');
    $('#directCode').val('');
    $('#directStock').val('');
    $('#out_phonePayPrice').text('');
    $('#out_planPrice').text('');
    $('#totalPrice').text('');
    $('input[name=saveCapacity]').prop('checked', false);
    $('input[name=saveCapacity]').next('label').removeClass('btn-solid-after').addClass('btn-outline-custom');
  } else if ($(this).is('label.capacity')) {
    // label.capacity를 클릭한 경우 처리 - 여기서 directCode를 만들어서 내보내기
    let saveCapacity = $(this).prev('input[name="saveCapacity"]').val();
    $('#saveCapacity').val(saveCapacity);
  }

  //색상, 용량 옵션이 선택 됐는지 체크
  let selColor = $('#colorCode').val();
  if(selColor=='W'){
	  $('#colorName').text('화이트');
  }else if(selColor == 'G'){
	   $('#colorName').text('그레이');
  }else if(selColor == 'B'){
	   $('#colorName').text('블랙');
	}else {
		$('#colorName').text('');
	}
  let selCapacity = $('#saveCapacity').val();

  chkColor = isEmpty(selColor);
  chkCapa = isEmpty(selCapacity);

  //색상이 선택된 경우, 용량의 존재여부를 체크해서 버튼 disabled
  if (selColor != null) {
    updateCapacityOptions(selColor);
  }

  //색상, 용량이 빈값이 아니면 다이렉트 코드 조합.
  if(chkColor && chkCapa){
    let firstDiv = $('div.titlebox:first').attr('id');
    let category = firstDiv.substring(0, 3);
    let brand = firstDiv.substring(3, 5);
    let slicedCode = firstDiv.substring(11);
    let madeCode = category+brand+"C"+selColor+"V"+selCapacity+slicedCode;

    //값 초기화
    $('#directStock').val('');
    $('#directCode').val('');

    //반복문으로 조합된 directCode와 id값이 일치하는 .titlebox 찾기 및 data-selected 값 설정
    $('.titlebox').each(function(){
    let directCode = $(this).attr('id');
      
    //선택한 물건과 다이렉트 코드가 일치하는 것을 찾기, 찾으면 반복 멈춤
    if(directCode === madeCode){
        //재고 체크
        let directStock = $('#item_'+directCode).attr('data-direct-stock');
        chkStock = isEmpty(directStock);

        //일치하는 directCode를 찾았으므로, 여기서 div 태그의 data-selected 속성을 바꿔준다.
        $('.titlebox').attr("data-selected", 0);
        $(this).attr("data-selected", 1);
        //data-selected 속성 값에 따라 hide, show 설정을 해준다
        $('.titlebox[data-selected=0]').hide();
        $('.titlebox[data-selected=1]').show();

        if(directStock != 0){
          //재고 있으면 directCode, directStock 값 넣어주기
          $('#saveCapacity').val(selCapacity);
          $('#directStock').val(directStock);
          $('#directCode').val(directCode); // directCode 값을 설정
          
          $('#colorCode').val(directCode.substring(6,7));
          $('#saveCpapcity').val(directCode.substring(9,12));
          let directName1 = $('#item_'+directCode).attr('data-direct-name');
          $('#selectedDirectName').val(directName1);
			
        }else{
          //재고 없으면 용량선택 옵션 해제 및 인접 label tag의 css 해제 + saveCapaicty 값 해제
          $('input[name=saveCapacity]').prop('checked', false);
          $('input[name=saveCapacity]').next('label').removeClass('btn-solid-after').addClass('btn-outline-custom');
          $('#saveCapacity').val('');
        }

        return false;
      }else{
        //일치하는 코드가 없는 경우
        $('#directStock').val('');
        $('#directCode').val('');
        $('#saveCapacity').val('');
      }

    })
    //titlebox directCode와 madeCode가 일치하는 것 찾는 반복문 종료

	  
    //월 요금계산 이벤트 강제 실행
    $('#directCode').trigger('change');
  }
});
//색상옵션을 선택하거나, 용량옵션을 선택한 경우 이벤트 끝


// 체크박스 변경 이벤트 리스너 추가
    let radioButtons = document.getElementsByName('disKind');
    for (var i = 0; i < radioButtons.length; i++) {
      radioButtons[i].addEventListener('change', disKindChange);
    }
    let radioButtons1 = document.getElementsByName('joinType');
    for (var i = 0; i < radioButtons.length; i++) {
      radioButtons1[i].addEventListener('change', joinTypeChange);
    }

    // 체크박스 변경 이벤트 핸들러
    function disKindChange(event) {
      var selectedValue = event.target.value;
      
      // 선택한 값에 따라 동작 수행
      if (selectedValue === '1') {
        // 12개월 할인 선택 시 수행할 동작
        console.log('12개월 할인 선택');
        $('#disKind').val(selectedValue);
        
      } else if (selectedValue === '2') {
        // 24개월 할인 선택 시 수행할 동작
        console.log('24개월 할인 선택');
        $('#disKind').val(selectedValue);
      } else if (selectedValue === '0') {
		  console.log('공시지원금 선택')
		  $('#disKind').val(selectedValue);
	  } else {
		  
		 alert("할인유형을 선택하세요");
	  }
    }
    
    // 체크박스 변경 이벤트 핸들러
    function joinTypeChange(event) {
      var selectedValue1 = event.target.value;
      
      // 선택한 값에 따라 동작 수행
      if (selectedValue1 === '1') {
        // 12개월 할인 선택 시 수행할 동작
        console.log('번호이동');
        $('#joinType').val(selectedValue1, "번호이동");
        
      } else if (selectedValue1 === '2') {
        // 24개월 할인 선택 시 수행할 동작
        console.log('신규가입');
        $('#joinType').val(selectedValue1);
      } else if (selectedValue1 === '0') {
		  console.log('기기변경')
		  $('#joinType').val(selectedValue1);
	  } else {
		  
		 alert("가입유형을 선택하세요");
	  }
    }
    
    
    
    

//월 요금계산 준비
$('#directCode, input[name="disKind"], input[name="planNum"]').on('change', function() {
  
  //영수증 가격 출력
  let directCode = $('#directCode').val(); // 기기코드
  let planNum = $('input[name=planNum]:checked').val(); // 요금제번호
  let disKind = $('input[name=disKind]:checked').val(); // 할인유형

  directCheck = isEmpty(directCode);
  planCheck = isEmpty(planNum);
  disKindCheck = isEmpty(disKind);
  
  $('#out_phonePayPrice').text('');
  $('#out_planPrice').text('');
  $('#totalPrice').text('');

  if(directCheck == true && planCheck == true && disKindCheck == true){
      //모든 값이 다 들어왔을 때 ajax 요청
      //responseBody에 담겨져 응답 돌아옴
      $.ajax({
          type: 'GET',
          url: './calMonthlyPay',
          dataType: 'JSON',
          data: {
              directCode: directCode,
              disKind: disKind,
              planNum: planNum
          },
          success: function(response) {
  			let out_phonePayPrice = response.out_phonePayPrice;
          	let out_planPrice = response.out_planPrice;
          	let totalPrice = (response.out_phonePayPrice*1 + response.out_planPrice*1);
              $('#out_phonePayPrice').text('');
              $('#out_planPrice').text('');
              $('#totalPrice').text('');
              $('#out_phonePayPrice').text(out_phonePayPrice.toLocaleString());
              $('#out_planPrice').text(out_planPrice.toLocaleString());
              $('#totalPrice').text(totalPrice.toLocaleString());
              var totalPriceAll= $('#totalPrice').text();
              $('#totalPriceAll').val(totalPriceAll);
              var outPhonePrice = $('#out_phonePayPrice').text();
              $('#outPhonePrice').val(outPhonePrice);
              var outplanPrice = $('#out_planPrice').text();
              $('#outplanPrice').val(outplanPrice);
              
          },
          error: function(error) {
              // 에러 처리 로직 작성
              console.log(error);
          }
      });
      
  }
});




  
//가입하기 버튼 눌렀을 때
$('#orderBtn').click(function(){
  console.log('주문하기 버튼');
  //let $frm = $('#appForm').serialize();
  //alert($frm);

  //가입폼 전송
  $('#buyForm').submit();
})


//계산에 필요한 값이 빈값인지 확인하는 함수
function isEmpty(value){
  if(typeof value == "undefined" || value == null || value == '')
      return false;
  else
      return true;
}


//색상별 용량 옵션 존재 여부 체크
function updateCapacityOptions(colorCode) {
  const capacityOptions = $('.optionArea input[name="saveCapacity"]');
  capacityOptions.prop('disabled', false); // 용량 옵션을 모두 활성화 상태로 초기화

  const directListItems = $('#directList').find('.direct-item');
  const matchingCapacities = []; // 매칭되는 용량 옵션을 담을 배열

  directListItems.each(function() {
    const listItem = $(this);
    const listItemDirectCode = listItem.attr('data-direct-code');
    const listItemColorCode = listItemDirectCode.substring(6, 7); // 컬러 코드 추출

    if (listItemColorCode === colorCode) {
      const listItemCapacityCode = listItemDirectCode.substring(8, 11); // 용량 코드 추출
      matchingCapacities.push(listItemCapacityCode);
      const listItemStock = parseInt(listItem.attr('data-direct-stock')); // 재고 정보 추출

      if (listItemStock === 0) {
        capacityOptions.filter(`[value="${listItemCapacityCode}"]`).next('label.capacity').addClass('btn-disabled');
      } else {
        capacityOptions.filter(`[value="${listItemCapacityCode}"]`).next('label.capacity').removeClass('btn-disabled');
      }
    }
  });

  capacityOptions.each(function() {
    const capacityOption = $(this);
    const capacityCode = capacityOption.val();

    if (!matchingCapacities.includes(capacityCode)) {
      capacityOption.next('label.capacity').addClass('btn-disabled');
    }
  });
}
//색상별 용량 옵션 존재 여부 체크 끝


//선택 옵션 체크
function getSelectedOptions() {
  const options = {
    colorCode: null,
    saveCapacity: null
  };

  const colorCode = $('.optionArea li[name="colorCode"].selected').attr('value');
  const saveCapacity = $('.optionArea input[name="saveCapacity"]:checked').val();

  if (colorCode) {
    options.colorCode = colorCode;
  }

  if (saveCapacity) {
    options.saveCapacity = saveCapacity;
  }

  return options;
}
//선택 옵션 체크 끝