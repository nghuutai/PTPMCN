<%@page import="com.ptpmcn.entity.DanhMuc"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa Danh Mục</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="<c:url value="/recources/style.css" />" rel="stylesheet">
</head>
<body>
<%@ include file="headerAdmin.jsp" %>
	<div class="container">
		<%
			DanhMuc sp = (DanhMuc) request.getAttribute("danhMuc");
		%>
		<div class="form-sanpham">
			<form action="<%= sp.getMaDanhMuc() %>" method="post">
			  <div class="form-group">
			  <label for="exampleFormControlInput1">Mã danh mục</label>
			    <input type="text" class="form-control"name="maDanhMuc" value="<%= sp.getMaDanhMuc() %>" id="exampleFormControlInput1" readonly>
			  </div>
			  <div class="form-group">
			    <label for="exampleFormControlInput1">Tên danh mục</label>
			    <input type="text" class="form-control"name="tenDanhMuc" value="<%= sp.getTenDanhMuc() %>" id="exampleFormControlInput1" placeholder="Nhập tên danh mục">
			  </div>
			  <div class="button2">
			  		<a href="/GreenProduct/qldanhmuc"><button type="button" class="btn btn-primary mb-2" >Quay lại</button></a>
			  		<button type="submit" class="btn btn-primary mb-2" >Lưu</button>
			  </div>
			  
			</form>
			<%
				if((Integer) request.getAttribute("result") == 1) {
			%>
				<div class="alert alert-success" role="alert">
				  Sửa Tên Danh mục thành công!
				</div>
			<%
				}
			%>
		</div>
	</div>

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>