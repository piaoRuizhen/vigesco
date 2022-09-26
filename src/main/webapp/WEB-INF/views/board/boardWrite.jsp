<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">
<script src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/uploadAjax.js"></script>
<link rel="stylesheet" href="/resources/css/boardWrite.css">
</head>
<body>
	<header id="header">
		<div class="headerIn">
			 <div class="gnbBg"></div>
			 <h1 class="logo">
			    <a href="/">vigesco</a>
			 </h1><!--.logo-->
		 </div>
	</header>
	<h1>게시판 글쓰기</h1>
	<form role="form" action="/board/write" method="post">
		<div class="title">
			<input type="text" name="title" placeholder="제목을 입력해 주세요">
			<input type="hidden" name="writer" value="${session.name}">
			<input type="hidden" name="id" value="${session.id}">
		</div>
		<div class="content">
			<textarea name="content" placeholder="내용을 입력해 주세요" cols="30" rows="10"></textarea>
		</div>
		<div>
			<input type="file" name="uploadFile" multiple>
		</div>
		<div>
			<input type="submit" id="uploadBtn" value="글쓰기">
		</div>
		<div id="uploadResult">
			<ul>
		
			</ul>
		</div>
	</form>
</body>
</html>