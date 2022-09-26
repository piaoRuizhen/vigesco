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