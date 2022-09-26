/**
 * 
 */
$(document).ready(function(){
	var bno=$("#bno").val();
	console.log(bno)
	$.getJSON("/board/attach",{bno:bno},function(attachList){
		console.log(attachList);
		var str="";
		// select 한 후 boardDetail.jsp에 출력
		$(attachList).each(function(i,attach){
			// 이미지이면(썸네일을 웹브라우저에 출력)
			if(attach.image){
				str+="<li data-path='"+attach.uploadPath+"'data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-image='"+attach.image+"'"+">" 
				str+="<img src='/display?fileName="+encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.fileName)+"'>" 
				str+="</li>"
			}else{ //이미지가 아니면 (파일명으로 되어 있는 링크를 클릭해서 다운로드 할 수 있도록 처리)
				str+="<li data-path='"+attach.uploadPath+"'data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-image='"+attach.image+"'"+">" 
				str+="<a href='/download?fileName="+encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName)+"'>"+attach.fileName+"</a>" 
				str+="</li>"
			}
			console.log(str);
			$("#uploadResult ul").html(str);
			
		})
	})
})