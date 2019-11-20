<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Green Product</title>
<meta charset="UTF-8"/>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
		<h2 style="margin:20px;">Bạn đã đặt hàng thành </h2>
		<div class="col-12">
			<a href="/GreenProduct">Tiếp tục mua hàng</a>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>