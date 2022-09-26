
//aos 
AOS.init(); 

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




// 슬릭
$('.single-item').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 3000,
    dots: true,
});






// 전체 페이지 세로 pagination
$('.sidebar ul li a').click(function(e) {
  var href = $(this).attr('href');
  
  var targetTop = $(href).offset().top;
      
  $('html').stop().animate({scrollTop:targetTop}, 800);
  page=$(this).html();
  e.preventDefault();
});

function Page__updateIndicatorActive() {
  var scrollTop = $(window).scrollTop();
  
  $($('.row').get().reverse()).each(function(index, node) {
      var $node = $(this);
      var offsetTop = parseInt($node.attr('data-offset-top'));
      console.log($node)
      console.log(scrollTop)
      console.log(offsetTop)
      if ( scrollTop >= offsetTop ) {
          
          $('.sidebar ul li a.active').removeClass('active');
                  
          var currentPageIndex = $node.index();
          // console.log(currentPageIndex-1)
          $('.sidebar ul li a').eq(currentPageIndex-1).addClass('active');
          
          $('html').attr('data-current-page-index', currentPageIndex);
          
          return false;
      }
  });
}

// 각 페이지의 offsetTop 속성을 업데이트
function Page__updateOffsetTop() {
  
  $('.row').each(function(index, node) {
      var $page = $(node);
      var offsetTop = $page.offset().top;
      
      $page.attr('data-offset-top', offsetTop);
  });
  
  // 계산이 바뀌었으니까, 다시 상태 업데이트
  Page__updateIndicatorActive();
}

function Page__init() {
  Page__updateOffsetTop();
}

// 초기화
Page__init();

// 화면이 리사이즈 할 때 마다, offsetTop을 다시계산
$(window).resize(Page__updateOffsetTop);

// 스크롤이 될 때 마다, 인디케이터의 상태를 갱신
$(window).scroll(Page__updateIndicatorActive);

// 푸터에서 사이드바 없애기
$(function() {
  $(window).scroll(function() {
      if ($(this).scrollTop() > 2908) {
          $('.sidebar').fadeOut();
      } else{
          $('.sidebar').fadeIn();
      }
      
  })
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



// swiper
var sliderSelector = '.swiper-container',
    options = {
      init: true,
      loop: true,
      speed:800,
      slidesPerView: 2, // or 'auto'
      spaceBetween: 10,
      centeredSlides : true,
      effect: 'coverflow',
      coverflowEffect: {
        rotate: 50, 
        stretch: 0, 
        depth: 100, 
        modifier: 1, 
        slideShadows : true, 
      },
      grabCursor: true,
      parallax: true,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      breakpoints: {
        1023: {
          slidesPerView: 1,
          spaceBetween: 0
        }
      },
      // Events
      on: {
        imagesReady: function(){
          this.el.classList.remove('loading');
        }
      }
    };
var mySwiper = new Swiper(sliderSelector, options);

// Initialize slider
mySwiper.init();



// row3 progress bar slick 

$(document).ready(function() {
  var $slider = $('.slider');
  var $progressBar = $('.progress');
  var $progressBarLabel = $( '.slider__label' );
  // console.log($slider)
  $slider.on('beforeChange', function(event, slick, currentSlide, nextSlide) {   
    var calc = ( (nextSlide) / (slick.slideCount-1) ) * 100;
    
    $progressBar
      .css('background-size', calc + '% 100%')
      .attr('aria-valuenow', calc );
      
    
    $progressBarLabel.text( calc + '% completed' );
  });
});




$('.bestSeller ul').slick({
  centerMode: true,
  centerPadding: '0px',
  slidesToShow: 4,
  responsive: [
      {
      breakpoint: 768,
      settings: {
          arrows: true,
          centerMode: true,
          centerPadding: '0px',
          slidesToShow: 4
      }
      },
      {
      breakpoint: 480,
      settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '0px',
          slidesToShow: 4
      }
      }
  ]
});



