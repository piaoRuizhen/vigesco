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






var sub, user, pass, mainContent, loggedIn;
var loggedIn = document.querySelector('.logged-in')

function _(x) {
  return document.getElementById(x);
}

sub = _('submit');
user = _('user-name');
pass = _('user-pass');
mainContent = _('main');
loggedIn = _('logged-in');

sub.addEventListener('click', login);

function login(event) {
  event.preventDefault();
  var userValue = user.value;
  var passValue = pass.value;
  
  if (userValue.length >= 3 && passValue.length >= 3) {_
      mainContent.classList.add('login-true');
      loggedIn.style.display = 'block';
      loggedIn.innerHTML = '<h2>Welcome, ' + userValue + '</h2>';
   } else {
     alert('Username and Password must contain at least 3 characters.')
   }
}