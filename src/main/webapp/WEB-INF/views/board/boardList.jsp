<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../resources/js/list.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/boardList.css">
</head>
<body>
	<div class="container">
		<header id="header">
			 <div class="headerIn">
				 <div class="gnbBg"></div>
				 <h1 class="logo">
				    <a href="/">vigesco</a>
				 </h1><!--.logo-->
			 </div>
		</header>
		<h1>자유 게시판</h1>
		<section id="container">
			<table border="1" class="table table-hover">
				<tr>
					<td>NO</td><td>제목</td><td>작성일</td><td>작성자</td><td>조회수</td>
				</tr>
				
				<!--  for(){} 와 같음 -->
				<c:forEach items="${blist}" var="board">
					<tr>
						<td>${board.bno}</td>
						<td><a href="/board/detail?bno=${board.bno}">${board.title}</a></td>
						<td>${board.regdate}</td>
						<td>${board.writer}</td>
						<td>${board.count}</td>
					</tr>
				</c:forEach>
				<!-- forEach안에다가 글쓰기 버튼 만들면  반복이 되버리니까 안됨. -->
		
			</table>
	
			<form id="searchForm" action="/board/list">
				<select name="type" id="type">
					<option value="" class="total">전체</option>
					<option value="t" ${pageMaker.cri.type eq 't'?'selected':''}>제목</option>
					<option value="w" ${pageMaker.cri.type eq 'w'?'selected':''}>글작성자</option>
					<option value="tw" ${pageMaker.cri.type eq 'tw'?'selected':''}>제목+글작성자</option>
				</select>
				<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}">
				<input type="hidden" id="pagenum" name="pagenum" value="${pageMaker.cri.pagenum}">
				<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
				
				
				<input type="button" id="searchbtn" value="검색">
				<div class="write">
					<!-- null이 아닐때만 보여줘라 -->
					<c:if test="${session  != null}">
						<a href="/board/write">글쓰기</a>
					</c:if>
				</div>
				<div class="col-md-offset-3"> 				 <!-- 1부터 10까지 반복해라 -->
					<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<a href="/board/list?pagenum=${pageMaker.startPage-1}&amount=${pageMaker.cri.amount}">Prev</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="pageNo" href="${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<a href="/board/list?pagenum=${pageMaker.endPage+1}&amount=${pageMaker.cri.amount}">Next</a>
					</c:if>
				</ul>
				</div>
			</form>
		</section>
	</div><!-- .container -->
</body>

</html>