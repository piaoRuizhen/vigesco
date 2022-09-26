package org.pyj.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.pyj.model.AttachFileDTO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {
	// uploadForm.jsp를 실행하기 위해....
	@RequestMapping(value="/uploadForm",method=RequestMethod.GET)
	public void uploadForm() {
		
	}
	@RequestMapping(value="/uploadFormAction",method=RequestMethod.POST)
	public void uploadFormPost(MultipartFile[] uploadfile) {


		String uploadFolder="C:\\upload";
		//		타입 			변수명	   : 배열명
		for(MultipartFile multipartFile:uploadfile) {	
		System.out.println("사용자가 업로드한 실제 파일명="+multipartFile.getOriginalFilename());
		System.out.println("사용자가 업로드한 실제 용량크기="+multipartFile.getSize());
		//File saveFile=new File(파일업로드경로,파일명)
		File saveFile=new File(uploadFolder,multipartFile.getOriginalFilename());
		
		try {
			multipartFile.transferTo(saveFile);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		} //end for
		
	}
	// uploadAjax.jsp를 실행하기 위해
	@RequestMapping(value="/uploadAjax",method=RequestMethod.GET)
	public void uploadAjax() {
		
	}
	// 현재 날짜를 만들기 위해서 필요한 메소드
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 현재 날짜(오늘날짜) : Sun Dec 17 1995 03:24:00 GMT...
		Date date = new Date();
		
		String str = sdf.format(date); //Sun Dec 17 1995 03:24:00 GMT...-> 1995-10-17 날짜를 바꿔서 str이라는 변수에 저장해라
		
		return str.replace("-", File.separator);
	}
	
	// 사용자가 업로드한 파일이 이미지 타입인지를 검사하는 메소드(이미지 타입: true, 이미지 타입이 아니면 false)
	private boolean checkImageType(File file) { //()안에는 매개변수 파일을 받아와야 하므로 매개변수가 있다
		try {
			// 파일 업로드된 경로의 파일의 유형을 파악(probeContentType)//jpg인지 뭔지
			String contentType=Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false; 
		
	}
	
	@RequestMapping(value="/uploadAjaxAction",produces=MediaType.APPLICATION_JSON_UTF8_VALUE,method=RequestMethod.POST)
	public ResponseEntity<ArrayList<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadfile) {
		
		ArrayList<AttachFileDTO> list = new ArrayList<>(); 
		String uploadFolder="C:\\upload";
		
		//폴더 생성
		File uploadPath = new File(uploadFolder,getFolder());
		System.out.println(uploadPath);
				
		if(uploadPath.exists()==false) { //만들고자 하는 폴더가 없으면(있으면 만들면 안됨)
			uploadPath.mkdirs(); //make directory : 폴더 만든다.
		} // 폴더 생성 end
			
		
		//		타입 			변수명	   : 배열명
		for(MultipartFile multipartFile:uploadfile) {	
			AttachFileDTO attachDTO = new AttachFileDTO();
		System.out.println("사용자가 업로드한 실제 파일명="+multipartFile.getOriginalFilename());
		System.out.println("사용자가 업로드한 실제 용량크기="+multipartFile.getSize());
		//File saveFile=new File(파일업로드경로,파일명)
		//File saveFile=new File(uploadFolder,multipartFile.getOriginalFilename());
		
		String uploadFileName=multipartFile.getOriginalFilename();
		// uploadFileName을 AttachFileDTO에 fileName변수에 저장
		attachDTO.setFileName(uploadFileName);
		
		// UUID 문자열 생성
		UUID uuid=UUID.randomUUID(); //uuid타입인데 문자열로 바꿔줘야 함 그래야 저장 가능
		// UUID 문자열 + "_"+uploadFileName
		uploadFileName=uuid.toString()+"_"+uploadFileName; //toString이 문자열로 바꾸겠다는 거
		
		//getFolder()메소드에 의해 만들어진 폴더를 AttachFileDTO에 uploadPath변수에 저장
		attachDTO.setUploadPath(getFolder());
		// uuid문자열을 AttachFileDTO에 uuid변수에 저장
		attachDTO.setUuid(uuid.toString());
		
		//System.out.println(uploadFileName);
		File saveFile=new File(uploadPath,uploadFileName); //uploadPath은 폴더 뒤에는 본래 파일명		
		
		try {
			multipartFile.transferTo(saveFile);
			if(checkImageType(saveFile)) { //saveFile에 있는 파일이 checkImageType메소드에 의해서 true면,
				attachDTO.setImage(true);
				// 원본 이미지 파일은 그대로 둔 채로, 썸네일을 새로 만들기 위한...
				FileOutputStream thumbnail =new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
				// 썸네일 생성.					 (원본 이미지 복사,	새로운 이미지 생성(UUID_s_파일명),넓이,높이
				Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
				// 메모리에서 썸네일 회수
				thumbnail.close();	
			}
			list.add(attachDTO);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		} //end for
		return new ResponseEntity<>(list,HttpStatus.OK);
	}//uploadAjaxPost end
	
	// 이미지 주소 만들기(localhost:8080/dislay?fileName=경로/파일명)
	@RequestMapping(value="/display",method=RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName) {
		
		File file= new File("C:\\upload\\"+fileName);
		System.out.println("file="+file);
		
		ResponseEntity<byte[]> result=null;
		
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result= new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	// 다운로드 주소 만들기(localhost:8080/download?fileName=경로/파일명)
	// 웹브라우저가 다운로드 할 수 있게끔, application/octet-stream 지정
	@RequestMapping(value="/download",method=RequestMethod.GET,produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> downloadFile(String fileName) {
		Resource resource = new FileSystemResource("C:\\upload\\"+fileName);
		
		String resourceName=resource.getFilename();
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			//다운로드 했을 떄 파일명이 한글 깨짐을 방지
			headers.add("Content-Disposition", "attachment;filename="+new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}
	
}



