<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html style=" height: 100% !important">
<head>
<title>Login Admin</title>
<meta charset="UTF-8"/>
<link href="<c:url value="/resources/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Lato:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
</head>
<body style=" height: 100% !important">
<div class="bannerLogin" style=" height: 100% !important">
	<div class="nenden">
		<div class="content3">
			<form action="/GreenProduct/admin" method="post" name="formdangnhap" onsubmit="return Check()">
			  <div class="form-group">
			    <input type="text" class="form-control"name="tenDangNhap" id="exampleFormControlInput1" placeholder="Tên đăng nhập">
			  </div>
			  <div class="form-group">
			    <input type="password" class="form-control" name="matKhau" id="exampleFormControlInput1" placeholder="Mật khẩu">
			  </div>
			  <div class="form-group">
				  	<button type="submit" class="btn btn-primary mb-2" 
				  	style=" width: 50%; margin-left: 25%;">Đăng nhập</button>
			  </div>
			</form>
		 <script>
			 	function Check(){
			 		let user = document.forms["formdangnhap"]["tenDangNhap"].value;
			 		let password = document.forms["formdangnhap"]["matKhau"].value;
			 		if(user === "" && password === "" ){
			 			alert("Vui lòng nhập tên đăng nhập và mật khẩu!");
			 			return false;
			 		}
			 		else if(user === "" ){
			 			alert("Vui lòng nhập tên đăng nhập!");
			 			return false;
			 		}
			 		else if(password === "" ){
			 			alert("Vui lòng nhập mật khẩu!");
			 			return false;
			 		}
			 		return true;
			 	}
			</script>
		</div>
		</div>
	</div>
</body>
</html>		