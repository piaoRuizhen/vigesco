<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/boardModify.css">
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
	<h1>게시글 수정하기</h1>
	<form action="/board/modify" method="post">
		<table border="1">
			<tr><td>NO.</td><td><input type="hidden" name="bno" value="${modify.bno}">${modify.bno}</td></tr>
			<tr><td>제목</td><td><input type="text" name="title" value="${modify.title}"></td></tr>
			<tr><td>내용</td><td><textarea name="content">${modify.content}</textarea></td></tr>
			<tr class="modify">
				<td colspan="2">
					<input type="submit" value="수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>