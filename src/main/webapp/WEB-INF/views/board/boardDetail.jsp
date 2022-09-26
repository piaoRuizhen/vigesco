<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;500;600&display=swap" rel="stylesheet">
<!-- Bootstrap Core CSS -->
<link href="../resources/css/bootstrap.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../resources/css/metisMenu.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../resources/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../resources/css/font-awesome.css" rel="stylesheet" type="text/css">

<!-- jQuery 선언-->
<script src="../resources/js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="../resources/js/bootstrap.js"></script>
<!-- Metis Menu Plugin JavaScript --> 
<script src="../resources/js/metisMenu.js"></script>
<!-- Custom Theme JavaScript -->
<script src="../resources/js/sb-admin-2.js"></script>
<!--  댓글 관련 JS -->
<script src="../resources/js/reply.js"></script>

<!--  파일 첨부 관련 JS -->
<script src="../resources/js/attach.js"></script>
<link rel="stylesheet" href="/resources/css/boardDetail.css">

	<title>boardDetail</title>
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
<div class="form">
	<h1>게시판</h1>
	<table style="margin-left: auto; margin-right: auto;">
		<tr>
			<th width="80">No.</th>
			<th width="400">제목</th>
		</tr>
		<tr>
			<td height="40" align=center>${bdetail.bno}</td>
			<td>&nbsp;${bdetail.title}</td>
		</tr>
		<tr>
			<th colspan="4" height="100">내용</th>
		</tr>
		<tr>
			<td colspan="4" height="auto" valign="top"><br>${bdetail.content}<br></td>
		</tr>
		<tr>
			<th colspan="1" align=center> 첨부파일 </th>
			<td colspan="3" height="60px">
			
				<div id="uploadResult">
								<ul>
									
								</ul>
				</div>
			</td>
		</tr>

	</table>
	<br>
	<div id="UpdateRemove">
		<c:if test="${session  != null}">
			<a href="/board/modify?bno=${bdetail.bno}">수정</a>
			<a href="/board/remove?bno=${bdetail.bno}">삭제</a>
		</c:if>
		<a href="/board/list">목록</a>
	</div>
	<hr>
</div>
	
	<c:if test="${session  != null}">
	   	<button id="addReply" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	        댓글 쓰기
	   	</button>
   	</c:if>
                    <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">댓글 모달창</h4>
                                        </div>
                                        <div class="modal-body">
                                        	<div class="form-group">
	                                            <label>Reply</label>
	                                            <input id="reply" class="form-control" type="text">
	                                            <input id="rno" class="form-control" type="hidden">
	                                            <input id="bno" class="form-control" type="hidden" value="${bdetail.bno}">
	                                         </div>
	                                         <div class="form-group">
	                                            <label>Replyer</label>
	                                            <input id="replyer" class="form-control" type="text" value="${session.id}" readonly>
	                                         </div>
	                                          <div class="form-group" id="replydateDiv">
	                                            <label>ReplyDate</label>
	                                            <input id="replydate" class="form-control" type="text">
	                                         </div>
                                          
                                        </div>
                                        <div class="modal-footer">         
                                            <button type="button" id="modalModBtn" class="btn btn-primary">댓글 수정</button>
                                            <button type="button" id="modalRemoveBtn" class="btn btn-primary">댓글 삭제</button>
                                            <button type="button" id="modalWriteBtn" class="btn btn-primary">댓글 쓰기</button>
                                            <button type="button" id="modalCloseBtn" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
 
 		
                            <div><br><br></div>
                            <ul class="replyList"></ul>
                            

</body>
</html>
