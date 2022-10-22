package com.mijung.sample.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/cktest")
@Slf4j
public class CkEditorController {
	
	@Autowired
	private String uploadPath;
	
	@GetMapping("/sample")
	public void showPage() {
	}
	
	@PostMapping(value="/ckUpload",produces = "text/html;charset=utf-8")
	@ResponseBody
	public String ckUpload2(HttpServletRequest req,
			             HttpServletResponse res,
			             MultipartFile upload) throws Exception {
		
		
		log.info(upload.getOriginalFilename());
		
        
        //아래 코드로 이클립스가 실제로 가져오는 디렉토리 확인
        //window의 mklink명령어를 활용하면 eclipse에서도 확인
        String ress = req.getSession().getServletContext().getRealPath("/resources");
        log.debug("resource:" + ress);
        				
		String fileName = upload.getOriginalFilename();
		
		String ckUploadPath = uploadPath + "/" + "ckUpload" + "/" + fileName;
	    upload.transferTo(new File(ckUploadPath));
				
		String callback = req.getParameter("CKEditorFuncNum");// ckEditor가 보내는 값(보통1)
		
		String fileUrl = req.getContextPath() + "/ckUpload/" + fileName;
		
        /* CKEditor가 원하는 스크립트 문자열을 리턴(아님말공)  */
		String scriptStr = "<script type='text/javascript'>"
				+ "window.parent.CKEDITOR.tools.callFunction("
				+ callback + ",'" + fileUrl+"','파일 업업')"
				+ "</script>";
	
		return scriptStr;
    }
}
