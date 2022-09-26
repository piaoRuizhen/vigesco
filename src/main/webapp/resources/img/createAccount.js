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
  
  
  
  //헤더 드롭다운
  $('.gnb-in')
  .mouseover(function(){
      $('.gnb .gnbSub, .gnbBg').stop(true).slideDown();
  })
  .mouseout(function(){
      $('.gnb .gnbSub, .gnbBg').stop(true).slideUp();
  })
  
  // 마이페이지 드롭다운
  $('.hR-in')
  .mouseover(function(){
      $('.myList').stop(true).slideDown();
  })
  .mouseout(function(){
      $('.myList').stop(true).slideUp();
  })
  


// 회원가입 유효성 검사


function validate() {
    let checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;  //Email 유효성 검사 정규식
    let checkPw = /^[a-zA-z0-9]{4,12}$/; // 비밀번호
    let checkId = /^[a-zA-z0-9]{4,12}$/; // 아이디
    let checkName = /^[가-힣]{2,4}$/; //이름
    let checkBirth = /^[0-9]+$/; // 생년월일
    let checkDay = /^3[0,1]$/; // 1~31만 입력가능하게 설정
  
    let userID = document.getElementById("user-id");  //ID
    let userPass = document.getElementById("user-pass");  //PASSWORD
    let userPassC = document.getElementById("user-pass2");  //PASSWORD CHECKING
    let userEmail = document.getElementById("user-email");  //EMAIL
    let name = document.getElementById("user-name");  //NAME
    let birthyy = document.getElementById("yy");
    let birthmm = document.getElementById("mm");
    let birthdd = document.getElementById("dd");
    
  
  
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
  
    //EMAIL 유효성검사
    if(userEmail.value==''){
     alert("이메일을 입력하세요");
     userEmail.focus();
     return false;
    }
    if(!checkEmail.test(userEmail.value)){
      alert("이메일 형식이 잘못되었습니다.");
      userEmail.focus();
      return false;
    }
  
     //name 유효성검사
     if(name.value==''){
       alert("이름을 입력하세요");
       name.focus();
       return false;
     }
  
     if (!checkName.test(name.value)) {
      console.log(name.value)
      alert("이름이 올바르지 않습니다.");
      name.focus();
      return false;
  }
    // 생년월일 유효성검사

    // 출생년도
    if(birthyy.value==''){
        alert("출생년도를 입력하세요");
        birthyy.focus();
        return false;
    }
    if(!checkBirth.test(birthyy.value)){
      alert("숫자만 입력해 주세요.");
      birthyy.focus();
      return false;
    }
    if(birthyy.value >= 2023){
      alert("잘못 입력하셨습니다.")
      return false;
    }

    // 출생월
    if(birthmm.value==''){
      alert("출생월을 선택하세요");
      return false;
    }
    // 출생일
    if(birthdd.value==''){
      alert("출생일을 입력하세요");
      birthdd.focus();
      return false;
    }
    if(!checkBirth.test(birthdd.value)){
      alert("숫자만 입력해 주세요.");
      birthdd.focus();
      return false;
    }
    if(!checkDay.test(birthdd.value)){
      alert("1에서 31까지만 입력가능합니다.")
      return false;
    }
  return true; //확인이 완료되었을 때  
}
  
  