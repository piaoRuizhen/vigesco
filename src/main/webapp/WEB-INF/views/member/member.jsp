<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">


    <!--jQuery 연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!--jQueryUi 연결 -->
    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

     <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    
    <link rel="stylesheet" href="/resources/css/createAccount.css">
    
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
        <div id="main" class="main-container">
            <div class="box">
                <h2>회원가입</h2>
                <form action="memberWrite" id="form" class="form" name="form" method="post" onsubmit="return validate()">
                    
                    <div class="input-box">
                        <input id="user-id" type="text" name="id" placeholder="아이디">
                    </div>
                    <div class="input-box">
                        <input id="user-pass" type="password" name="password" placeholder="비밀번호">
                    </div>
                    <div class="input-box">
                        <input id="user-pass2" type="password" name="password2" placeholder="비밀번호 재확인">
                    </div>

                    <div class="input-box">
                        <input id="user-name" type="text" name="name" placeholder="이름">
                    </div>

                    <div class="birthday">
                        <h3 class="bir_title">
                            <label for="yy">생년월일</label>
                        </h3>
                            <input type="text" id="birth" name="birth" placeholder="ex)19930305" class="sel" maxlength="8">
                    </div><!--.birthday-->

                    <div class="join_gender">
                        <h3 class="gender_title">
                            <label for="gender">성별</label>
                        </h3>
                        <div class="gender_code">
                            <select name="gender" id="gender" class="sel" aria-label="성별">
                                <option value="남">남자</option>
                                <option value="여">여자</option>
                            </select>
                        </div>
                    </div>
                    <input id="submit" type="submit" name="login" value="가입하기">
                </form>
                <div class="info">
                    <ul>
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div><!--.info-->

            
            </div><!--.box-->
        </div><!--#main-->

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
	                    
	            </div><!--.ft_left-->
                <div class="ft_right">
                    <div class="About">
                        <h3>About</h3>
                        <ul>
                            <li><p><a href="#">-About Vigesco</a></p></li>
                            <li><p><a href="#">-About Menu</a></p></li>
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

    <script src="/resources/js/member.js"></script>

</body>
</html>