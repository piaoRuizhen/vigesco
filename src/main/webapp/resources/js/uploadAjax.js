/**
 * 
 */
//파일의 확장자(exe, sh, zip, alz) 업로드 제한
var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
//크기
var maxSize=5242880; // 5MB미만으로 제한
// 파일의 확장자나 크기를 제한하는 기능의 함수선언
function checkExtension(fileName,fileSize){
	if(fileSize>=maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	if(regex.test(fileName)){
		alert("해당 종류의 파일은 업로드 할 수 없습니다.");
		return false;
	}
	return true;
}
//함수선언은 ready밖 함수호출은 클릭할 때 호출하니까(이벤트)ready안에서

$(document).ready(function(){
	var formObj = $("form[role='form']")
	$("#uploadBtn").on("click",function(e){
		e.preventDefault();
		
		//alert("submit clicked")
		var str="";
		$("#uploadResult ul li").each(function(i,obj){
			console.log($(obj))
			
			str+="<input type='text' name='attach["+i+"].fileName' value='"+$(obj).data("filename")+"'>"
			str+="<input type='text' name='attach["+i+"].uploadPath' value='"+$(obj).data("path")+"'>"
			str+="<input type='text' name='attach["+i+"].uuid' value='"+$(obj).data("uuid")+"'>"
			str+="<input type='text' name='attach["+i+"].image' value='"+$(obj).data("image")+"'>"
		})
		formObj.append(str).submit();
	})
	
	
	
	
	//write.jsp에 있는 파일선택 버튼(input[type='file'])의 내용이 바뀌면(change)
	$("input[type='file']").on("change",function(){
		// html의 폼태그와 같은 역할을 하는 FormData 객체
		// FormData는 쉽게 말해서 가상의 <form>태그로 생각.
		// Ajax를 이용하는 파일 업로드는 FormData를 이용해서 필요한 
		// 파라미터를 담아서 전송.
		var formData =new FormData();
		var inputFile=$("input[name='uploadFile']"); //선택자인데 input태그의 name이 uploadFile와 같은것을 선택하라== 속성 선택자
		var files=inputFile[0].files;
		console.log(files);
		
		for(var i=0;i<files.length;i++){
			
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			
			// 파일정보(files[i]를 보내자
			formData.append("uploadfile",files[i]);
		}//end for
		$.ajax({
			type:"post",
			url:"/uploadAjaxAction",
			data:formData,
			processData:false,
			contentType:false,
			success:function(result){
			
				console.log(result);
				var str="";
				$(result).each(function(i,obj){
					// 이미지이면(썸네일을 웹브라우저에 출력) 
					if(obj.image){
						str+="<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-image='"+obj.image+"'"+">" 
						str+="<img src='/display?fileName="+encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName)+"'>" 
						str+="</li>"
					}else{
						//이미지가 아니면(파일명으로 되어 있는 링크를 클릭해서 다운로드 할 수 있도록 처리)
						str+="<li data-path='"+obj.uploadPath+"'data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-image='"+obj.image+"'"+">"
						str+="<a href='/download?fileName="+encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName)+"'>"+obj.fileName+"</a>"
						str+="</li>"
					}

				
				})
				$("#uploadResult ul").html(str);

				
			}
		})
	})
})