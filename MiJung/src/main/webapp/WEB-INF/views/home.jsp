<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<p>주인님 <%=application.getInitParameter("owner")%></p>
<h1>웹경로 ${webPath}</h1>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>