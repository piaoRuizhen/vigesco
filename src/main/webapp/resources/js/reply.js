/**
 * 
 */

$(document).ready(function(){
	var bno=$("#bno").val();
	//DB select 해서 댓글 목록 리스트를 하는 함수 호출
	list(bno);
	
	// boardDetail.jsp에서 댓글쓰기 버튼을 클릭하면
	$("#addReply").on("click",function(){
		// 댓글 수정버튼은 숨겨라
		$("#modalModBtn").hide();
		// 댓글 삭제 버튼은 숨겨라
		$("#modalRemoveBtn").hide();
		// ReplyDate 라벨과 ReplyDate입력란은 숨겨라
		$("#replydateDiv").hide();
		// Modal함수를 이용하여 modal창을 띄워라 - 근데 이미 댓글 관련 JS해서 넣었으므로 빼도 됨
		//$(".modal").Modal("show");
	})
	// modal창안에 있는 댓글쓰기 버튼을 클릭하면 
	$("#modalWriteBtn").on("click",function(){
		// 사용자가 입력한 댓글내용을 가져오기
		var reply=$("#reply").val();
		// 사용자가 입력한 댓글작성자를 가져오기
		var replyer=$("#replyer").val();
		// DB Insert하는 함수 호출(board_reply에 insert하는 함수를 만들거임)
		//	 변수명 : 값         변수명  : 값		변수명 :값
		add({reply:reply,replyer:replyer,bno:bno});
	})
	
	// 댓글 목록 리스트에서 댓글 내용을 클릭하면 
	$(".replyList").on("click","li",function(){
		
		//사용자가 선택한 댓글번호(rno)를 가져오기.
		var rno=$(this).data("rno");
		
		console.log(rno);
		//댓글목록리스트를 클릭한 후 띄워지는 모달창에 select된 결과 뿌리기 기능을 하는 함수 호출
		// rno번호를 밑에다가 던지게 됨
		get(rno);
		//모달창 안에 있는 rno 입력란에 rno를 넣어라
		$("#rno").val(rno);
		

		// 모달창 안에 있는 댓글쓰기 버튼은 숨겨라
		$("#modalWriteBtn").hide();
		// 모달창 안에 있는 댓글수정버튼은 보여주라 
		$("#modalModBtn").show();
		// 모달창 안에 있는 댓글삭제버튼은 보여주라
		$("#modalRemoveBtn").show();	
		// 모달창 띄우기
		$(".modal").modal("show");
	}) // 댓글 목록 리스트에서 댓글 내용을 클릭하면  end
	
	//모달창안에 있는 댓글 수정 버튼을 클릭하면
	$("#modalModBtn").on("click",function(){
		
		//댓글 번호(rno)값 가져오기
		$("#rno").val();
		//댓글 내용(reply)값 가져오기
		$("#reply").val();
		// 모달창안에 있는 댓글 수정 버튼을 클릭하면, 댓글 내용이 수정되는 update 기능을 하는 함수 호출
		//modify(댓글번호변수:댓글번호값,댓글내용변수:댓글내용값);
		modify({rno:$("#rno").val(),reply:$("#reply").val(),bno:bno});
	})
	// 모달창안에 있는 댓글 삭제 버튼을 클릭하면
	$("#modalRemoveBtn").on("click",function(){
		// 댓글 번호
		var rno=$("#rno").val()
		//모달창안에 있는 댓글 삭제 버튼을 클릭하면 댓글삭제가 되도록 delete를 하는 함수 호출
		remove(rno,bno);
	})
	
	
}) //$(document).ready(function(){ 끝나는 부분
// DB Insert 하는 함수 선언
function add(reply){
	console.log("댓글추가.....")
	console.log(reply);
	//ajax() 를 이용해서 DB에 Insert 하는 것을 작성.
	$.ajax({	// 비동기식으로 통신.
		type:"post",
		url:"/replies/new",
		data:JSON.stringify(reply), //JSON.stringify메소드는 json객체를 String객체로 변환시켜주는 메소드임.
		contentType:"application/json; charset=utf-8", // 보내는 자원의 형식을 명시하기 위해 헤더에 실리는 정보
		success:function(result){
			console.log(result)
			if(result=="success"){
				//alert("insert됨.")
				$(".modal").modal("hide");
				list(reply.bno); //bno값을 받아와야 하니까
			}
		}
	})
}

//DB select 해서 댓글 목록 리스트를 하는 함수 선언
function list(bno){
	console.log("댓글 목록 리스트....")
	console.log(bno);
	//ajax()를 이용해서 DB에 select 하는 것을 작성
	//				url 주소		data		success
	$.getJSON("/replies/list/"+bno+".json",function(data){//
		// select가 정상적으로 실행되고 난 후 처리해야 될 내용들....
		console.log(data)
		var str=""; // 이거는 반복할 필요가 없음 다시 초기화 시키게 되는거므로 이것도 반복되면 0번째 것만 다시 나오므로 반복문에서 빼야함
		for(var i=0; i<data.length;i++){ //자바스크립트는 하나 자바는 int float등 여러가지 
		str+="<li data-rno="+data[i].rno+"><div>";
		str+="<div><strong>"+data[i].replyer+"</strong></div>";
		str+="<div>"+data[i].reply+"</div>"
		str+="</div></li>";
		} //0을 i로 바꾸면 됨
		
		
		$(".replyList").html(str);


	}) // type이 get방식일 때만 사용.
}
	

// 	//댓글목록리스트를 클릭한 후 띄워지는 모달창에 select된 결과 뿌리기 기능을 하는 함수 호출 선언
		// rno 받을 준비 
function get(rno){
	console.log("댓글 내용보기....")
	//ajax이용해서 select작업(getJSON은 select할때만 사용가능)
	// $.getJSON(url주소 ,콜백함수); //rno 던질준비
	$.getJSON("/replies/detail/"+rno+".json",function(data){
		console.log(data);
		// 모달창 안에 있는 reply를 선택한 후 값을 저장해라
		$("#reply").val(data.reply);
		// 모달창 안에 있는 replyer를 선택한 후 값을 저장해라
		$("#replyer").val(data.replyer);
		// 모달창안에 있는 replydate를 선택한 후 숨겨라.
		$("#replydateDiv").hide();
	});
}
// // 모달창안에 있는 댓글 수정 버튼을 클릭하면, 댓글 내용이 수정되는 update 기능을 하는 함수 선언
function modify(reply){
	console.log("댓글 내용수정...");
	console.log(reply);
	//ajax()
	$.ajax({
		type:"put",
		url:"/replies/modify",
		data:JSON.stringify(reply),
		contentType:"application/json; charset=utf-8",
		success:function(result){
			if(result=="success"){
				$(".modal").modal("hide"); //모달창 숨기기
				list(reply.bno); //새로고침
			}
		}
	})
}
// DB delete 하는 함수 선언
function remove(rno,bno){
	console.log("댓글 내용삭제...")
	console.log("댓글번호"+rno)
	console.log("게시물번호"+bno)
	//ajax()
	$.ajax({
		type:"delete",
		url:"/replies/remove/"+rno,
		success:function(result){
			if(result=="success"){
				$(".modal").modal("hide"); //모달창 숨기기
				list(bno); //새로고침
			}
		}
		
	})
	
}