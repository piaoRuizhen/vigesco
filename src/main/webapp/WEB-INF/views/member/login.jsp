<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <link rel="stylesheet" href="/resources/css/login.css">
    
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
            </div><!--.headerIn-->
        </header><!--#header-->

        <!--로그인-->
        <div id="main" class="main-container">
            <div class="box">
                <h2>Login</h2>
                <form action="/member/login" method="post">
                    <div class="input-box">
                        <input id="user-name" type="text" name="id" required="">
                        <label>아이디</label>
                    </div>
                    <div class="input-box">
                        <input id="user-pass" type="password" name="password" required="">
                        <label>비밀번호</label>
                    </div>
                    <input id="submit" type="submit" name="login" value="로그인">
                </form>
                <div class="find_wrap">
                    <ul>
                        <li><a href="#">아이디 찾기</a></li>
                        <li><a href="#">비밀번호 찾기</a></li>
                        <li><a href="/member/member">회원가입</a></li>
                    </ul>
                </div><!--.find_wrap-->
            </div><!--.box-->
        </div><!--#main-->
           
        <footer id="footer">
            <div class="footerIn">
	            <div class="ft_left">
	                    <p class="ft_logo"><img src="/resources/img/vigesco_logo.png" alt="footer_logo"></p>
	                    <div class="ft_sns">
	                        <ul>
	                            <li class="ft_yt"><a href="#">유튜브</a></li>
	                            <li class="ft_ins"><a href="#">인스타그램</a></li>
	                            <li class="ft_fb"><a href="#">페이스북</a></li>
	                        </ul>
	                    </div>           
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
                    <div class="Community">
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
    <script src="/resources/js/login.js"></script>
</body>
</html>