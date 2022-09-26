<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="loginOutLink" value="${session.id==null ? 'member/login' : 'member/logout'}"/>
<c:set var="loginOut" value="${session.id==null ? '로그인' : '로그아웃'}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">

    <!-- slick -->
    <link rel="stylesheet" href="/resources/slick-1.8.1/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="/resources/slick-1.8.1/slick/slick-theme.css" />
    
    <!--jQuery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!--jQueryUi 연결 -->
    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


     <!--AOS 라이브러리 불러오기-->
     <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
     <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
     <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
 
     <!--swiper cdn-->
     <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
     <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

     <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    <link rel="stylesheet" href="/resources/css/style.css">
    
    <title>Document</title>
</head>
<body>
    <div id="wrap">
        <header id="header">
            <div class="headerIn">
                <div class="gnbBg"></div>
                <h1 class="logo">
                    <a href="/">vigesco</a>
                </h1><!--.logo-->
                <nav class="gnb">
                    <div class="gnb-in">
                        <ul>
                            <li class="gnbB">
                                <a href="#">ABOUT</a>
                                <div class="gnbSub">
                                    <div>
                                        <p><a href="#">About Vigesco</a></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="#">HEALING</a>
                                <div class="gnbSub">
                                    <div>
                                        <p><a href="#">힐링 방법 소개</a></p>
                                        <p><a href="#">명상 음악</a></p>
                                        <p><a href="#">힘 나는 글귀</a></p>
                                        <p><a href="#">책 소개</a></p>
                                        <p><a href="#">힐링 사진</a></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="#">SHOP</a>
                                <div class="gnbSub">
                                    <div>
                                        <p><a href="#">향초&amp;디퓨저</a></p>
                                        <p><a href="#">오르골&amp;음악</a></p>
                                        <p><a href="#">배쓰밤</a></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="/board/list">BOARD</a>
                                <div class="gnbSub">
                                    <div>
                                        <p><a href="#">자유게시판</a></p>
                                        <p><a href="#">QnA방</a></p>
                                        <p><a href="#">스트레스 해소방</a></p>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="#">SUPPORT</a>
                                <div class="gnbSub">
                                    <div>
                                        <p><a href="#">공지사항</a></p>
                                        <p><a href="#">1:1 문의</a></p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                 </div><!--.gnb-in-->
                </nav><!--.gnb-->

                    <ul class="hR">
                        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
                         <li><a href="<c:url value='/member/member'/>">회원가입</a></li>
                        <li class="hR-in">
                            <a href="#" class="arr">마이페이지</a>
                            <div class="myList">
                                <ul>
                                    <li><a href="#">my 등급</a></li>
                                    <li><a href="#">my 포인트</a></li>
                                    <li><a href="#">my 게시글</a></li>
                                    <li><a href="#">my 즐겨찾기</a></li>
                                    <li><a href="#">my 주문내역</a></li>
                                    <li><a href="#">1:1 문의</a></li>
                                </ul>
                            </div><!--myList-->
                        </li>
                    </ul>

            </div><!--.headerIn-->
       	</header><!--#header-->

        <div id="container">
            <div class="sidebar">
                <ul>
                    <li><a href="#row1" id="page1">1</a></li>
                    <li><a href="#row2" id="page2">2</a></li>
                    <li><a href="#row3" id="page3">3</a></li>
                    <li><a href="#row4" id="page4">4</a></li>
                </ul>
            </div>
            <section class="row" id="row1">
                <div class="slider single-item autoplay bgVideo">
                    <div class="bgWrap1"> 
                        <div class="bgVideo1">
                            <p class="bgBlack"></p>
                            <video muted autoplay loop>
                                <source src="/resources/영상/lake_-_40255 (Original).mp4" type="video/mp4">
                            </video>
                        </div><!--.bgVideo1-->
                        <p class="bgText1">무리지어 피어 있는 꽃보다<br>
                                두 셋이서 피어 있는 꽃이<br>
                                도란도란 더 의초로울 때 있다.<br>
                                
                                두 셋이서 피어 있는 꽃보다<br>
                                오직 혼자서 피어있는 꽃이<br>
                                더 당당하고 아름다울 때 있다.<br>
                                
                                너 오늘 혼자 외롭게<br>
                                꽃으로 서 있음을 너무<br>
                                힘들어 하지 말아라.<br>
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나태주 <혼자서>
                        </p>    
                    </div>
                    <div class="bgWrap2">
                        <div class="bgVideo2">
                            <p class="bgBlack"></p>
                            <video muted autoplay loop>
                                <source src="/resources/영상/sunset_-_65102 (Original).mp4" type="video/mp4">
                            </video>
                        </div><!--.bgVideo2-->     
                        <p class="bgText2">바다를 보지 못했다고<br>
                            바다가 사라지지는 않듯이<br>
                            
                            너의 가치를 보지 못했다고<br>
                            너의 가치가 사라지는 것은 아니다.<br>
                            
                            그러니 스스로의 가치를 의심하지 마라.<br>
                            분명히 빛나고 있으니까.<br>
                            <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;박찬위<보이지 않아도 존재한다>
                        </p>   
                    </div><!--.bgWrap2-->
                        <div class="bgWrap3">
                            <div class="bgVideo3">
                                <p class="bgBlack"></p>
                                <video muted autoplay loop>
                                    <source src="/resources/영상/Trees - 95080.mp4" type="video/mp4">
                                </video>
                            </div><!--.bgVideo3-->       
                            <p class="bgText3">삶이 그대를 속일지라도<br>
                                슬퍼하거나 노여워하지 말라.<br>
                                슬픈날을 참고 견디면<br>
                                기쁜 날이 오고야 말리니<br>
                                <br>
                                마음은 미래에 살고<br>
                                현재는 우울한 것<br>
                                모든 것은 순간에 지나가고<br>
                                지나간 것은 다시 그리워지나니<br> 
                                <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;푸시킨<삶이 그대를 속일지라도>
                            </p>   
                        </div><!--.bgWrap3-->
                </div><!--.bgVideo-->
            </section><!--.row1-->
            <section class="row" id="row2">
                <div class="bookBox1">
                    <h1 data-aos="fade-down">책 소개</h1>
                    <h2 data-aos="fade-down">마음이 힐링 되는</h2>
                    <h3 class="bookTitle1" data-aos="fade-left">『더 좋은 곳으로 가자』</h3>
                    <p class="bookText1" data-aos="fade-left"><span>“불행한 아이였다고 해서 불행한 어른이 되란 법은 없다.<br>

                        어찌 됐건 살아남았다면, 어른이 된 후에는<br>
                        
                        자기 삶의 기록을 더 나은 쪽으로 고쳐 쓰는 연습을 해야 한다.”</span><br>

                        ‘공정함’이 세대를 막론하고 가장 민감한 이슈가 된 사회에서,<br>
                        
                        자신에게 주어진 조건이 보잘것없다는 생각이 들 때<br> 
                        
                        우리는 쉽게 세상을 탓하거나 자신의 배경을 책망하게 된다. <br>
                        
                        이 책은 한 단계 성장해나가는 데 꼭 필요한<br>
                        
                        지치거나 포기하지 않고, 보란듯이, 당차게 나아가기 위한 생생한 생활밀착형 매뉴얼을 담았다.
                    </p>
                    <div class="bookBg1"></div>
                    <p class="bookImg1" data-aos="fade-right"><img src="/resources/img/book1.jpg" alt="더 좋은 곳으로 가자"></p>
                </div><!--.bookBox1-->
                <div class="bookBox2">
                    <h3 class="bookTitle2" data-aos="fade-right">『나에게 고맙다』</h3>
                    <p class="bookText2" data-aos="fade-right"><span>“내가 가장 고마워해야 할 사람은 바로 나예요.”</span><br>

                        지금까지 한 번도 스스로에게 ‘고맙다’는 말을 전해보지 못했다면,<br>

                        그동안 고생한 나에게 한 마디 소중한 위로를 건네고 싶다면,<br>

                        전승환 작가가 세심하게 공들여 매만진 《나에게 고맙다》 전면 개정판을 만나보자.<br>

                        북테라피스트 전승환의 따스한 문장들이 그 어떤 위로보다 깊이 마음을 어루만져줄 것이다.<br>
                    </p>
                    <div class="bookBg2"></div>
                    <p class="bookImg2" data-aos="fade-left"><img src="/resources/img/book2.jpg" alt="나에게 고맙다"></p>
                </div><!--.bookBox2-->
                <div class="row2viewMore"><a href="#"><span><img src="/resources/img/icon_plus.png" alt="View More"></span>View More</a></div><!--.viewMore-->
            </section><!--#row2-->

            <section class="row" id="row3">
                <div class="row3In">
                    <h1 data-aos="fade-down">Best Seller</h1>
                    <h2 data-aos="fade-right">마음의 힐링을 도와주는</h2>
                    <div class="bestSeller slider">
                        <ul>
                            <li>
                                <a href="#"><img src="/resources/img/bathBom.jpg" alt="트와일라잇 배쓰밤">
                                    <h3>트와일라잇 버블 배쓰밤</h3>
                                    <p>12,000원</p>
                                </a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/candle.jpg" alt="캔들 라벤더">
                                    <h3>코멧 캔들 라지자 라벤더</h3>
                                    <p>9,500원</p>
                                </a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/bathBom3.jpg" alt="블루 배쓰밤">
                                    <h3>블루 버블 배쓰밤</h3>
                                    <p>13,000원</p>
                                </a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/diffuser.jpg" alt="디퓨저">
                                    <h3>마이달리아 무드등 디퓨저</h3>
                                    <p>24,500원</p>
                                </a>
                            </li>
                            <li>
                                <a href="#"><img src="/resources/img/musicBox.jpg" alt="오르골">
                                    <h3>인생의 회전목마 오르골</h3>
                                    <p>22,500원</p>
                                </a>
                            </li>
                        </ul>
                    </div><!--.bestSeller-->
                    <div class="progress" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                        <span class="slider__label sr-only"> </span>
                    </div><!--.progress-->
                    <div class="viewMore"><a href="#"><span><img src="/resources/img/icon_plus.png" alt="View More"></span>View More</a></div><!--.viewMore-->
                </div><!--.row3In-->
            </section> <!--#row3-->    

            <section class="row" id="row4">
                <div class="row4In">
                    <h1 data-aos="fade-down">COMMUNITY</h1>
                    <h2 data-aos="fade-right">마음이 힐링 되는</h2>
                    <div class="swiper-container loading" data-aos="zoom-in-down">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="content">
                                    <p class="title" data-swiper-parallax="-30%" data-swiper-parallax-scale=".7">Shaun Matthews</p>
                                    <span class="caption" data-swiper-parallax="-20%">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="content">
                                    <p class="title" data-swiper-parallax="-30%" data-swiper-parallax-scale=".7">Alexis Berry</p>
                                    <span class="caption" data-swiper-parallax="-20%">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="content">
                                    <p class="title" data-swiper-parallax="-30%" data-swiper-parallax-scale=".7">Billie	Pierce</p>
                                    <span class="caption" data-swiper-parallax="-20%">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="content">
                                    <p class="title" data-swiper-parallax="-30%" data-swiper-parallax-scale=".7">Trevor	Copeland</p>
                                    <span class="caption" data-swiper-parallax="-20%">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="content">
                                    <p class="title" data-swiper-parallax="-30%" data-swiper-parallax-scale=".7">Bernadette	Newman</p>
                                    <span class="caption" data-swiper-parallax="-20%">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                                </div>
                            </div>
                        </div><!--.swiper-wrapper-->
                        
                        <!-- If we need pagination -->
                        <div class="swiper-pagination"></div>
                        <!-- If we need navigation buttons -->
                        <div class="swiper-button-prev swiper-button-white"></div>
                        <div class="swiper-button-next swiper-button-white"></div>
                    </div><!--.swiper-container loading-->
                    <div class="viewMore"><a href="#"><span><img src="/resources/img/icon_plus.png" alt="View More"></span>View More</a></div><!--.viewMore-->
                </div><!--.row4In-->
            </section><!--#row4-->

        </div><!--#container-->

        <footer id="footer">
            <div class="footerIn">
                    <div class="ft_left">
                            <p class="ft_logo"><img src="/resources/img/vigesco_logo.png" alt=""></p>
                            <div class="ft_sns">
                                <ul>
                                    <li class="ft_yt"><a href="#">유튜브</a></li>
                                    <li class="ft_ins"><a href="#">인스타그램</a></li>
                                    <li class="ft_fb"><a href="#">페이스북</a></li>
                                </ul>
                            </div>
                            <!-- <p class="join"><a href="#">가입하기</a></p> -->
                    </div><!--.ft_left-->
                    <div class="ft_right">
                        <div class="About">
                            <h3>About</h3>
                            <ul>
                                <li><p><a href="#">-About Vigesco</a></p></li>
                            </ul>
                        </div>
                        <div class="Healing">
                            <h3>Healing</h3>
                            <ul>
                                <li><p><a href="#">-힐링 방법 소개</a></p></li>
                                <li><p><a href="#">-명상 음악</a></p></li>
                                <li><p><a href="#">-힘 나는 글귀</a></p></li>
                                <li><p><a href="#">-책 소개</a></p></li>
                                <li><p><a href="#">-힐링 사진</a></p></li>
                            </ul>
                        </div>     
                        <div class="Shop">
                            <h3>Shop</h3>
                            <ul>
                                <li><p><a href="#">-향초&amp;디퓨저</a></p></li>
                                <li><p><a href="#">-오르골&amp;음악</a></p></li>
                                <li><p><a href="#">-배쓰밤</a></p></li>
                            </ul>
                        </div>    
                        <div class="Board">
                            <h3>Board</h3>
                            <ul>
                                <li><p><a href="/board/list">-자유게시판</a></p></li>
                                <li><p><a href="#">-QnA방</a></p></li>
                                <li><p><a href="#">-스트레스 해소방</a></p></li>
                            </ul>
                        </div>    
                    </div><!--.ft_right-->     
            </div><!--.footerIn-->
            <div class="footer_bottom">
                <p>ⓒ2022 ParkYeJin PortFolio</p> 
                </div><!--.footer_bottom-->
        </footer> <!--.footer-->  

        

        <a href="#" id="top_btn">상단으로</a>
    
    </div><!--#wrap-->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>  
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="/resources/slick-1.8.1/slick/slick.js"></script>
    <script src="/resources/js/script.js"></script>
</body>
</html>