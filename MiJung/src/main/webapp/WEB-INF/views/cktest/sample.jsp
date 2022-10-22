<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${webPath}/ckeditor/ckeditor.js"></script>
<script>
</script>
</head>
<body>
	<form action="">
		<sec:csrfInput/>
	</form>
	<textarea name="nm_ta" id="id_ta"></textarea>
	<script>
	//서버에서 발행된 헤더네임과 토큰갑사 저장
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	
		CKEDITOR.replace("nm_ta",{
			 enterMode : CKEDITOR.ENTER_BR,
			 filebrowserUploadMethod : "form",  // 빠트려면 당황스런 상황
			 filebrowserUploadUrl: "${webPath}/cktest/ckUpload?${_csrf.parameterName}=${_csrf.token}"
		})
	</script>
</body>
</html>