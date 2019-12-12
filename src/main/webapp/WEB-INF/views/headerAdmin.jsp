<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta charset="UTF-8"/>
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />" ></script>
<script src="<c:url value="/resources/js/megamenu.js" />" ></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
</head>
<body>
	<div class="header_top">
		<div class="container">
			<div class="col-xs-12 header-bottom-left">
				<div class="col-xs-4 logo">
				<h1><a href="."><span>Green</span>Product</a></h1>
			</div>
			<div class="col-xs-7 menu">
	            <ul class="megamenu skyblue">
				<li><a class="color4" href="qldanhmuc">QL DANH MỤC</a></li>				
				<li><a class="color5" href="404.html">QL SẢN PHẨM</a></li>
				<li><a class="color2" href="404.html">QL ĐƠN HÀNG</a></li>
		    	<li><a class="color6" href="contact.html">THỐNG KÊ</a></li>
		  		</ul> 
			</div>
	       <div class="clearfix"></div>
		</div>
	</div>
</body>
</html>