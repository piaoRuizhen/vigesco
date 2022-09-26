// 확대 축소 안되게 하기
window.addEventListener("wheel", function(e){
    e.preventDefault();
  },{passive : false});
  
  
  var mHtml = $("html");
  var page = 1;
  
  mHtml.animate({scrollTop : 0},10);
  
  $('.myList, .gnbSub').hide();
  
  
  // 페이지 한 섹션 넘기기
  $(window).on("wheel", function(e){
    if(mHtml.is(":animated")) return;
    if(e.originalEvent.deltaY > 0){
        if(page == 6) return;
        page++;
    } else if(e.originalEvent.deltaY < 0){
        if(page == 1) return;
        page--;
    }
    var posTop =(page-1) * $(window).height();
    mHtml.animate({scrollTop : posTop}, 800);
  })
  
  
  // 스크롤 다운 시 위로 가기 버튼 생성
$(function() {

    $("#top_btn").on("click", function() {

        $("html, body").animate({scrollTop:0}, '500');

        return false;

    });

});

$( window ).scroll( function() {

  if ( $( this ).scrollTop() > 200 ) {

    $( '#top_btn' ).fadeIn();

  } else {

    $( '#top_btn' ).fadeOut();

  }

} );


// 회원가입 유효성 검사


function validate() {
    let checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;  //Email 유효성 검사 정규식
    let checkPw = /^[a-zA-z0-9]{4,12}$/; // 비밀번호
    let checkId = /^[a-zA-z0-9]{4,12}$/; // 아이디
    let checkName = /^[가-힣]{2,4}$/; //이름
    let checkBirth = /^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/;; // 생년월일
  
    let userID = document.getElementById("user-id");  //ID
    let userPass = document.getElementById("user-pass");  //PASSWORD
    let userPassC = document.getElementById("user-pass2");  //PASSWORD CHECKING
    let userName = document.getElementById("user-name");  //NAME
    let birthDay = document.getElementById("birth");

  
    //ID 유효성검사
    if(userID.value==''){
       alert("아이디를 입력하세요");
       userID.focus();
       return false;
    }
    if(!checkId.test(userID.value)) {
      alert("4~12자의 영문 대소문자와 숫자 4~12자리로로만 입력하세요");
      return false;
    }

    $.getJSON("/member/idchk/"+userID.value+".json",function(data){
      	console.log(data);
      	if(data==1){ // 아이디가 중복
      		alert("중복된 ID가 존재합니다.")
      		return false;
      	}else{// 아이디 중복x
      		alert("사용가능합니다.")
      	}
      	
      })
    
    //PASSWORD 유효성검사
    if(userPass.value==''){
       alert("비밀번호를 입력하세요");
       userPass.focus();
       return false;
    }
    if(!checkPw.test(userPass.value)){
      alert("비밀번호는 영문 대소문자와 숫자 4~12자리로만 입력하세요");
      userPass.focus();
      return false;
    }
    if(userPassC.value==''){
        alert("비밀번호 확인을 입력하세요");
        userPassC.focus();
        return false;
    }
    if(userPass.value!=userPassC.value){
      alert("비밀번호가 맞지 않습니다");
      userPassC.focus();
      return false;
    }
  
  
     //name 유효성검사
     if(userName.value==''){
       alert("이름을 입력하세요");
       userName.focus();
       return false;
     }
  
     if (!checkName.test(userName.value)) {
      console.log(userName.value)
      alert("이름이 올바르지 않습니다.");
      userName.focus();
      return false;
  }     
    // 생년월일 유효성검사

    // 출생년도
    if(birthDay.value==''){
        alert("생년월일을 입력하세요");
        birthDay.focus();
        return false;
    }
    if(!checkBirth.test(birthDay.value)){
      alert("생년월일을 정확하게 입력해주세요.");
      birthDay.focus();
      return false;
    }
  return true; //확인이 완료되었을 때  
}
  
  

  