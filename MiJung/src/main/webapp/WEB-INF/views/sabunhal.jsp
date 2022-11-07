<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="eachOne" items="${testList }" varStatus="subun">
	<c:if test="${subun.index % 4 == 0 }">
	  	<div style="width:100;background-color:yellow"></div>
		<h1>여기가 첫번째</h1>
	</c:if>
	<c:if test="${subun.index % 4 != 0 }">
		<h1>여기는 두번째,세번째,네번째</h1>
	</c:if>
	
</c:forEach>
</body>
</html>