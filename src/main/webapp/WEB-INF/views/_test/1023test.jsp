<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>hello</h2>
<div>
	<c:forEach var="product" items="${member }">
		ID:<p>${product.memberId}</p><br>
	    NAME:<p>${product.name}</p><br>
	     <hr>
	</c:forEach>

</div>
</body>
</html>