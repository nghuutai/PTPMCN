<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Green Product</title>
<meta charset="UTF-8"/>

<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<h3 style="margin:40px 0px;">Bạn đã đặt hàng thành công</h3>
			<a href="/GreenProduct">Tiếp tục mua hàng</a>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>